#include <stdio.h>
#include "menu.h"

u8 REW_rewindMenuEffect(struct MenuProc* menu, struct MenuCommandProc* menuItem) {
  LockGameLogic();
  
  // Start rewind proc and initialize some params.
  struct REW_ProcState* proc = (struct REW_ProcState*)ProcStart(REW_procScr, ROOT_PROC_3);
  proc->muActor = NULL;
  proc->muTarget = NULL;

  return ME_DISABLE | ME_END | ME_PLAY_BEEP | ME_CLEAR_GFX;
}

const struct ProcInstruction REW_procScr[] = {
  PROC_SET_NAME("REW_proc"),
  PROC_YIELD,
  PROC_CALL_ROUTINE(Text_InitFont),
  PROC_CALL_ROUTINE(REW_initProc),
  
  // Main loop
  PROC_LABEL(1),
  PROC_CALL_ROUTINE(REW_drawUI),
  PROC_LOOP_ROUTINE(REW_handleInput),
  
  // Down-press: rewind action.
  PROC_CALL_ROUTINE_ARG(REW_rewind, 1),
  PROC_GOTO(1),
  
  // Up-press: undo rewind action.
  PROC_CALL_ROUTINE_ARG(REW_rewind, -1),
  PROC_GOTO(1),
  
  // B-press: Cancel rewind.
  PROC_LABEL(2),
  PROC_CALL_ROUTINE(REW_cancelRewind),
  
  // A-press: Confirm rewind.
  PROC_LABEL(3),
  PROC_CALL_ROUTINE(REW_procEnd),
  PROC_END
};

// Set-up last sequence as current.
void REW_initProc(struct REW_ProcState* proc) {
  
  // We shouldn't be able to get here,
  // but end proc if rewind buffer is empty.
  if (REW_tempRewindBuf.size <= 0) {
    EndProc((Proc*)proc);
    return;
  }
  
  proc->curSequence = REW_tempRewindBuf.end;
}

// Draws actor (left unit) name & starts MU.
void REW_displayActor(struct REW_ProcState* proc, struct REW_RewindEntry* rewindEntry) {
  Unit* unit = GetUnit(gMapUnit[rewindEntry->yCur][rewindEntry->xCur]);
  u16 name = unit->pCharacterData->nameTextId;
  u8 class = unit->pClassData->number;
  Text_DrawString(&proc->sequenceDesc, GetStringFromIndex(name));     // Draw actor's name.
  
  proc->muActor = MU_CreateInternal(0, 0, class, -1, 0xC);
  proc->muActor->objPriorityBits = 0x400;                 // Priority 1;
  proc->muActor->pAPHandle->tileBase &= 0xF3FF;           // Draw sprite
  proc->muActor->pAPHandle->tileBase |= 0x0400;           // over UI.    
  proc->muActor->xSubPosition += 256;                     // Adjust x position.
  proc->muActor->ySubPosition += 384;                     // Adjust y position.
  MU_SetFacing(proc->muActor, MU_FACING_SELECTED);
}

// Draws target (right unit) name & starts MU.
void REW_displayTarget(struct REW_ProcState* proc, struct REW_RewindEntry* rewindEntry) {
  Unit* unit = GetUnit(gMapUnit[rewindEntry->yCur][rewindEntry->xCur]);
  u16 name = unit->pCharacterData->nameTextId;
  u8 class = unit->pClassData->number;
  Text_DrawString(&proc->sequenceDesc, GetStringFromIndex(name));     // Draw target's name.
  
  int targetX = (Text_GetXCursor(&proc->sequenceDesc) + 43) << 4;
  
  proc->muTarget = MU_CreateInternal(0, 0, class, -1, 0xD);
  proc->muTarget->objPriorityBits = 0x400;                // Priority 1;
  proc->muTarget->pAPHandle->tileBase &= 0xF3FF;          // Draw sprite
  proc->muTarget->pAPHandle->tileBase |= 0x0400;          // over UI.   
  proc->muTarget->xSubPosition += 128 + targetX;          // Adjust x position.
  proc->muTarget->ySubPosition += 384;                    // Adjust y position.
  MU_SetFacing(proc->muTarget, MU_FACING_SELECTED);
}

// Draws UI and text of rewind sequence.
// TODO, draw UI & text such that they don't cover active unit.
void REW_drawUI(struct REW_ProcState* proc) {
  
  // Put arrow gfx in OBJ VRAM.
  UnpackUiVArrowGfx(0x360, 3);
  
  // Draw info window.
  Decompress(&REW_menuTSA, gGenericBuffer);
  BgMap_ApplyTsa(gBg1MapBuffer, gGenericBuffer, 0);
  //Text_ResetTileAllocation();   // This allows us to overwrite previous text.
  
  // Draw "Turn".
  Text_InitClear(&proc->turnText, 5);       // Defaults colour to white.
  Text_SetXCursor(&proc->turnText, 2);
  Text_DrawString(&proc->turnText, GetStringFromIndex(0x1C2));
  Text_SetColorId(&proc->turnText, 2);
  int turn = gChapterData.turnNumber;
  if (turn < 10) {
    // One-digit number.
    Text_Advance(&proc->turnText, 8);
    Text_DrawNumber(&proc->turnText, turn);
  } else if (turn < 100) {
    // Two-digit number.
    Text_Advance(&proc->turnText, 2);
    Text_DrawNumber(&proc->turnText, turn);
  } // We're not drawing three+ digit numbers. Because.
  Text_Display(&proc->turnText, TILEMAP_LOCATED(gBg0MapBuffer, 24, 1));
  
  // Draw "Phase".
  Text_InitClear(&proc->phaseText, 4);      // Defaults colour to white.
  Text_SetXCursor(&proc->phaseText, 2);
  Text_DrawString(&proc->phaseText, GetStringFromIndex(TEXTID(REW_phase)));
  Text_Display(&proc->phaseText, TILEMAP_LOCATED(gBg0MapBuffer, 24, 3));
  
  // Phase symbol AP.
  u16 pal = 0;                                  // Ally.
  if (gChapterData.currentPhase == 0x40)        // Neutral.
    pal = 0x2000;
  else if (gChapterData.currentPhase == 0x80)   // Enemy.
    pal = 0x1000;
  proc->phaseAPProc = (struct APProc*)APProc_Create(&REW_phaseAPDef, 0, 0, pal, 0, 0);
  
  // Arrow symbols' AP.
  proc->upArrowAPProc = (struct APProc*)APProc_Create(&REW_upArrowAPDef, 0, 0, 0, 0, 0);
  proc->downArrowAPProc = (struct APProc*)APProc_Create(&REW_downArrowAPDef, 0, 0, 0, 0, 0);
  
  // Draw action.
  Text_InitClear(&proc->sequenceDesc, 15);  // Defaults colour to white.
  Text_SetXCursor(&proc->sequenceDesc, 2);
  
  // Temp. This is here as reminder to me, so I know how to replace text.
  //Text_DrawString(&proc->sequenceDesc, GetStringFromIndex(0x002));
  //Text_Display(&proc->sequenceDesc, TILEMAP_LOCATED(gBg0MapBuffer, 5, 2));
  //Text_Clear(&proc->sequenceDesc);
  //Text_SetXCursor(&proc->sequenceDesc, 2);
  
  // TODO, this should become a switch for every action possible.
  // Maybe put this part in a separate routine as it could get huge.
  int actionNotFound = true;
  struct REW_RewindEntry* rewindEntry = proc->curSequence->entry;
  while (actionNotFound) {
    switch (rewindEntry->diffType) {
      case UNIT_ACTION_COMBAT:
        actionNotFound = false;
        
        REW_displayActor(proc, rewindEntry);
        Text_DrawString(&proc->sequenceDesc, GetStringFromIndex(TEXTID(REW_combat))); // " attacked ".
        REW_displayTarget(proc, REW_nextEntry(rewindEntry));
        Text_DrawChar(&proc->sequenceDesc, ".");                                      // Period.
        Text_Display(&proc->sequenceDesc, TILEMAP_LOCATED(gBg0MapBuffer, 5, 2));
        break;
      default:
        rewindEntry = REW_nextEntry(rewindEntry);
    }
  }
  
  /*
  //Text_Clear(&text);
  
  DrawTextInline(NULL,
                 TILEMAP_LOCATED(gBg0MapBuffer, 0, 0),
                 0,
                 1,
                 4,
                 GetStringFromIndex(0x3));
  */
  
  EnableBgSyncByMask(0x3);
  
  //Text_Clear(struct TextHandle*)
  //DrawTextInline(struct TextHandle*, u16* bg, int color, int xStart, int tileWidth, const char* cstring)
}

// Wait for key-input.
void REW_handleInput(struct REW_ProcState* proc) {
  // TODO
}

// Rewind actions. steps argument determines how many actions
// are to be rewound. If steps is negative, then re-do actions.
// E.g. -2 means, re-do two actions, +3 means, rewind 3 actions.
int REW_rewind(struct REW_ProcState* proc, s16 steps) {
  // TODO
  
  return 1;     // Needs to return not 0 in order for proc to not yield.
}

// Re-do all actions.
void REW_cancelRewind(struct REW_ProcState* proc) {
  // TODO, determine how many steps to re-do and call REW_rewind.
}

// Clear BGs, APs & MUs.
void REW_procEnd(struct REW_ProcState* proc) {
  
  // End APs.
  EndProc((Proc*)proc->phaseAPProc);
  if (proc->downArrowAPProc)
    EndProc((Proc*)proc->downArrowAPProc);
  if (proc->upArrowAPProc)
    EndProc((Proc*)proc->upArrowAPProc);
  
  // End any MUs.
  if (proc->muActor)
    EndProc((Proc*)proc->muActor);
  if (proc->muTarget)
    EndProc((Proc*)proc->muTarget);
  
  ClearBG0BG1();
  UnlockGameLogic();
}