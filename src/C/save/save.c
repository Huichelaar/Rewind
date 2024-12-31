#include <stdio.h>
#include "save.h"

// Find address of current sequence in save data.
void* REW_findCurSequence() {

  //void* const source = GetSaveSourceAddress(SAVE_BLOCK_SUSPEND);  // Doesn't work when no active suspend.
  void* const source = (void*)(0xE000000 + gSaveBlockDecl[SAVE_BLOCK_SUSPEND * 2]);
  const struct SaveChunkDecl* chunk = MS_FindSuspendSaveChunk((u16)(u32)(&EMS_CHUNK_REWIND_SEQ));
  
  return (void*)(source + chunk->offset);
}

// Clear current sequence buffer,
// by setting size values to 0.
// Executes at the start of a chapter.
void REW_clearCurSequence() {
  REW_curSequence->sizePrev = 0;
  REW_curSequence->size = 0;
  WriteAndVerifySramFast(&REW_curSequence, REW_findCurSequence(), 4);
}

// Find address of rewindBuffer in save data.
void* REW_findRewindBuf() {
  
  //void* const source = GetSaveSourceAddress(SAVE_BLOCK_SUSPEND);  // Doesn't work when no active suspend.
  void* const source = (void*)(0xE000000 + gSaveBlockDecl[SAVE_BLOCK_SUSPEND * 2]);
  const struct SaveChunkDecl* chunk = MS_FindSuspendSaveChunk((u16)(u32)(&EMS_CHUNK_REWIND_BUF));
  
  return (void*)(source + chunk->offset);
}

// Clear the rewind buffer, by setting size val to 0.
// Executes at the start of a chapter.
void REW_clearRewindBuf() {
  u32 val = 0;
  WriteAndVerifySramFast(&val, REW_findRewindBuf(), 4);
}

// Save non-player phase changes.
// Replaces proc call to CpPhase_Init at
// 0x5A7F10, hence why we call CpPhase_Init.
void REW_cpPhaseChangeSave(Proc* proc) {
  
  // Save only if phase is not skipped.
  if (GetPhaseAbleUnitCount(gChapterData.currentPhase) > 0) {
    gActionData.suspendPointType = SUSPEND_POINT_CPPHASE;
    SaveSuspendedGame(SAVE_BLOCK_SUSPEND);
  }
  
  // This function call was overwritten by inline
  // insertion of the REW_cpPhaseChangeSave call
  CpPhase_Init(proc);
}

// Load active unit's position before acting.
// We need this so we can track where unit
// was before undertaking action.
void REW_loadActiveUnitMoveOrigin(void* src, u32 size) {
  s8 moveOrigin[2];
  
  ReadSramFast(src, moveOrigin, size);
  
  gActiveUnitMoveOrigin.x = (s16)moveOrigin[0];
  gActiveUnitMoveOrigin.y = (s16)moveOrigin[1];
}

// Save active unit's position before acting.
// Vanilla doesn't do this as the data is
// no longer needed when an action has been
// confirmed and the game saves.
void REW_saveActiveUnitMoveOrigin(void* dest, u32 size) {
  s8 moveOrigin[2];
  
  moveOrigin[0] = (s8)gActiveUnitMoveOrigin.x;
  moveOrigin[1] = (s8)gActiveUnitMoveOrigin.y;
  
  WriteAndVerifySramFast(moveOrigin, dest, size);
}

// Load sequence from save to REW_curSequence.
// TODO, remove this if it seems superfluous.
// Atm, this gets called when loading from suspend and nowhere else.
void REW_loadCurSequence(void* src, u32 size) {
  ReadSramFast(src, (void*)REW_curSequence, size);
}

// Save partial actions during partial action suspend.
// Partial action saves happen for example when the
// game suspend-saves when a battle happens, before the battle ends.
// We need to save the data in the REW_curSequence buffer.
void REW_saveCurSequence(void* dest, u32 size) {
  
  if (gActionData.suspendPointType != SUSPEND_POINT_DURINGACTION)
    return;
  
  WriteAndVerifySramFast((void*)REW_curSequence, dest, size);
}

// Load rewind data from save into REW_rewindBuffer.
void REW_loadRewind(void* src, u32 size) {
  ReadSramFast(src, (void*)REW_rewindBuffer, size);
}

// Update saved rewind data.
// dest is ptr to SRAM which contains rewind data.
void REW_saveRewind(void* dest, u32 size) {
  u32 prevSeqSize = 0;
  struct REW_RewindSequence* newSeq;
  
  // Skip if there's no new rewind sequence to append.
  if (REW_curSequence->size == 0)
    return;
  
  // Don't update rewind data during action
  // or during phasechange
  if (gActionData.suspendPointType == SUSPEND_POINT_DURINGACTION ||
      gActionData.suspendPointType == SUSPEND_POINT_PHASECHANGE)
    return;
  
  // Load existing rewind data into buffer.
  REW_loadRewind(dest, size);
  
  if (REW_rewindBuffer->size != 0) {
    // Buffer contains at least one sequence.
    prevSeqSize = REW_rewindBuffer->end->size;
  } else {
    // Buffer is empty, initialize size.
    REW_rewindBuffer->size = REW_BUFFER_BASESIZE;
  }
  
  // Create new sequence at the end of rewindBuffer.
  // Copy REW_curSequence to it.
  newSeq = (struct REW_RewindSequence*)((u32)REW_rewindBuffer + REW_rewindBuffer->size);
  newSeq->sizePrev = prevSeqSize;
  newSeq->size = REW_curSequence->size;
  memcpy((void*)&newSeq->entry[0], (void*)&REW_curSequence->entry[0], REW_curSequence->size - REW_SEQUENCE_BASESIZE);
  
  // Adjust REW_rewindBuffer params.
  REW_rewindBuffer->size += newSeq->size;
  REW_rewindBuffer->end = newSeq;
  
  // Save the data.
  WriteAndVerifySramFast((void*)REW_rewindBuffer, dest, size);
  
  // Clear current rewind sequence to avoid writing it again.
  REW_clearRewindSeq(REW_curSequence);
}