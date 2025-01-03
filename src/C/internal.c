#include <stdio.h>
#include "internal.h"

// Clears given rewind sequence by setting size value to 0.
void REW_clearRewindSeq(struct REW_RewindSequence* sequence) {
  sequence->size = 0;
}

// 'creates' a new rewindEntry by returning the
//  address of the end of the given sequence.
struct REW_RewindEntry* REW_createSeqEntry(struct REW_RewindSequence* seq) {
  
  // Set sequence size to base size if sequence is empty.
  if (seq->size == 0) { seq->size = REW_SEQUENCE_BASESIZE; }
  
  // 4 is size of .sizePrev and .size attributes of REW_curSequence.
  u32 addr = (u32)seq + seq->size;
  return (struct REW_RewindEntry*)addr;
}

// Given a rewind-sequence, return the next sequence of the buffer.
struct REW_RewindSequence* REW_nextSequence(struct REW_RewindSequence* sequence) {
  return (struct REW_RewindSequence*)((u32)(sequence) + 
         (u32)sequence->size);
}

// Given a rewind-sequence, return the previous sequence of the buffer.
struct REW_RewindSequence* REW_prevSequence(struct REW_RewindSequence* sequence) {
  return (struct REW_RewindSequence*)((u32)(sequence) - 
         (u32)sequence->sizePrev);
}

// Given a rewind-entry, return the next entry of the sequence.
struct REW_RewindEntry* REW_nextEntry(struct REW_RewindEntry* entry) {
  u16 size = entry->size;
  int align = size & 3;
  
  // Pad out size until it's word aligned;
  // Entries are always word-aligned.
  if (align)
    size += 4 - align;
   
  // Add REW_ENTRY_BASESIZE to account for attributes other than variably-sized data.
  return (struct REW_RewindEntry*)((u32)entry + size);
}

// Given a rewind-sequence and an entry, find the preceding entry in this sequence.
struct REW_RewindEntry* REW_prevEntry(struct REW_RewindSequence* seq, struct REW_RewindEntry* entry) {
  struct REW_RewindEntry* prev = seq->entry;
  struct REW_RewindEntry* cur = REW_nextEntry(prev);
  
  // Return NULL if there is no previous entry.
  if (prev == entry)
    return NULL;
  
  // Find current entry.
  while (cur != entry) {
    prev = cur;
    cur = REW_nextEntry(cur);
  }
  
  // Return previous entry.
  return prev;
}

// Given a rewind-sequence, return the last entry of the sequence.
struct REW_RewindEntry* REW_lastEntry(struct REW_RewindSequence* seq) {
  struct REW_RewindEntry* prev = seq->entry;
  struct REW_RewindEntry* cur = seq->entry;
  u32 nextSeq = (u32)REW_nextSequence(seq);
  
  // Find final entry.
  while ((u32)cur < nextSeq) {
    prev = cur;
    cur = REW_nextEntry(cur);
  }
  
  // Return final entry.
  return prev;
}

// Make sure the rewind sequence's size is a multiple of 4.
// We do this to ensure the next entry is word-aligned.
void REW_alignSequence(struct REW_RewindSequence* sequence) {
  int align = sequence->size & 3;
  if (align)
    sequence->size += 4 - align;
}

int REW_isUndoAvailable(struct REW_RewindSequence* sequence) {
  if (!sequence->sizePrev)
    return false;
  return true;
}

int REW_isRedoAvailable(struct REW_RewindSequence* sequence) {
  if (REW_rewindBuffer->end <= sequence)
    return false;
  return true;
}

// Need to hide units again if we:
//  - undo a de-roofing.
//  - redo a roofing.
void REW_hideRoofedUnits() {

  for (int i = 1; i < 0xC0; i++) {
    Unit* unit = GetUnit(i);
    if (!UNIT_IS_VALID(unit))
      continue;
    
    if (gMapTerrain[unit->yPos][unit->xPos] == REW_ROOF_ID) {
      unit->state |= US_UNDER_A_ROOF | US_HIDDEN;
    }
  }
}