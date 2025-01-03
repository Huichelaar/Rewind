#include <stdio.h>
#include "menu.h"

// Command is usable if there's at least one sequence in rewind buffer.
u8 REW_rewindMenuUsability(MenuCommandDefinition* command, u8 commandId) {
  u32 size;
  
  // Confirm whether there's data in the rewind-buffer or not.
  ReadSramFast(REW_findRewindBuf(), &size, 4);   // Read size of rewindbuffer.

  if (size == 0)
    return MCA_NONUSABLE;
  return MCA_USABLE;
}

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
  PROC_CALL_ROUTINE(REW_initUI),
  PROC_CALL_ROUTINE(REW_refreshUI),
  
  // Main loop
  PROC_LABEL(1),
  PROC_LOOP_ROUTINE(REW_handleInput),
  
  // B-press: Cancel rewind.
  PROC_LABEL(2),
  //PROC_CALL_ROUTINE(REW_cancelRewind),
  
  // A-press: Confirm rewind.
  PROC_LABEL(3),
  PROC_CALL_ROUTINE(REW_procEnd),
  PROC_END
};

// Set-up last sequence as current.
void REW_initProc(struct REW_ProcState* proc) {
  
  // Load rewindBuffer into RAM.
  REW_loadRewind(REW_findRewindBuf(), (u16)(u32)(&REW_rewindSize));
  
  // We shouldn't be able to get here,
  // but end proc if rewind buffer is empty.
  if (REW_rewindBuffer->size <= 0) {
    EndProc((Proc*)proc);
    return;
  }
  
  // Init current sequence.
  proc->curSequence = REW_rewindBuffer->end;
  
  // Init flags.
  proc->flags = REW_REFRESH_TURN;
  if (REW_isUndoAvailable(proc->curSequence)) { proc->flags |= REW_UNDO_AVAILABLE; }
  if (REW_isRedoAvailable(proc->curSequence)) { proc->flags |= REW_REDO_AVAILABLE; }
}

// Draws actor (left unit) name & starts MU.
void REW_displayActor(struct REW_ProcState* proc, struct REW_RewindEntry* rewindEntry, TextHandle* sequenceDesc) {
  Unit* unit = GetUnit(rewindEntry->flags);
  u16 name = unit->pCharacterData->nameTextId;
  u8 class = unit->pClassData->number;
  Text_DrawString(sequenceDesc, GetStringFromIndex(name));     // Draw actor's name.
  
  proc->muActor = MU_CreateInternal(0, 0, class, -1, GetUnitMapSpritePaletteIndex(unit));
  proc->muActor->objPriorityBits = 0x400;                 // Priority 1;
  proc->muActor->pAPHandle->tileBase &= 0xF3FF;           // Draw sprite
  proc->muActor->pAPHandle->tileBase |= 0x0400;           // over UI.    
  proc->muActor->xSubPosition += 256;                     // Adjust x position.
  proc->muActor->ySubPosition += 384;                     // Adjust y position.
  MU_SetFacing(proc->muActor, MU_FACING_SELECTED);
}

// Draws target (right unit) name & starts MU.
// If obstacle, draw obstacle name.
void REW_displayTarget(struct REW_ProcState* proc, struct REW_RewindEntry* rewindEntry, TextHandle* sequenceDesc) {
  if (rewindEntry->diffType == UNIT_ACTION_COMBAT) {
    // Unit.
    Unit* unit = GetUnit(rewindEntry->flags);
    u16 name = unit->pCharacterData->nameTextId;
    u8 class = unit->pClassData->number;
    Text_DrawString(sequenceDesc, GetStringFromIndex(name));     // Draw target's name.
    int targetX = (Text_GetXCursor(sequenceDesc) + 43) << 4;
    
    proc->muTarget = MU_CreateInternal(0, 0, class, -1, GetUnitMapSpritePaletteIndex(unit));
    proc->muTarget->objPriorityBits = 0x400;                // Priority 1;
    proc->muTarget->pAPHandle->tileBase &= 0xF3FF;          // Draw sprite
    proc->muTarget->pAPHandle->tileBase |= 0x0400;          // over UI.   
    proc->muTarget->xSubPosition += 128 + targetX;          // Adjust x position.
    proc->muTarget->ySubPosition += 384;                    // Adjust y position.
    MU_SetFacing(proc->muTarget, MU_FACING_SELECTED);
  } else if (rewindEntry->diffType == REW_ACTION_BREAK) {
    // Obstacle.
    char* name = (rewindEntry->flags & REW_OBSTACLE_SNAG) ? GetTerrainName(REW_SNAG_ID) : GetTerrainName(REW_WALL_ID);
    Text_DrawString(sequenceDesc, name);    // Draw target's name.
  }
}

void REW_displayCombatVerb(struct REW_RewindEntry* entry, TextHandle* sequenceDesc) {
  u16 textID = TEXTID(REW_combat);
  struct REW_RewindEntry* nextEntry = REW_nextEntry(entry);
  
  if (nextEntry->diffType == REW_ACTION_BREAK) {
    Trap* trap = (Trap*)nextEntry->data;
    trap = GetSpecificTrapAt(trap->xPosition, trap->yPosition, trap->type);
    if (trap == NULL)
      textID = TEXTID(REW_obstacleDestroyed);
  } else {
    if (false)        // TODO check if actor was killed.
      ;
    else if (false)   // TODO check if target was killed.
      ;
  }
  Text_DrawString(sequenceDesc, GetStringFromIndex(textID));
}

// Initialize UI, draw box, turn text, phase text.
void REW_initUI(struct REW_ProcState* proc) {
  TextHandle phaseText, turnText;
  
  // Put arrow gfx in OBJ VRAM.
  UnpackUiVArrowGfx(0x360, 3);
  
  // Draw info window.
  Decompress(&REW_menuTSA, gGenericBuffer);
  BgMap_ApplyTsa(gBg1MapBuffer, gGenericBuffer, 0);

  // Init Turn number display text.
  Text_InitClear(&proc->turnNumberText, 2);
  Text_InitClear(&proc->turnNumberTextAlt, 2);
  
  // Draw "Turn".
  Text_InitClear(&turnText, 3);
  Text_SetXCursor(&turnText, 1);
  Text_DrawString(&turnText, GetStringFromIndex(0x1C2));
  Text_Display(&turnText, TILEMAP_LOCATED(gBg0MapBuffer, 24, 1));
  
  // Draw "Phase".
  Text_InitClear(&phaseText, 4);
  Text_SetXCursor(&phaseText, 1);
  Text_DrawString(&phaseText, GetStringFromIndex(TEXTID(REW_phaseIndicator)));
  Text_Display(&phaseText, TILEMAP_LOCATED(gBg0MapBuffer, 24, 3));
  
  // Init action text.
  Text_InitClear(&proc->sequenceDesc, 15);
  Text_InitClear(&proc->sequenceDescAlt, 15);
  
  // Draw phase indicator.
  proc->phaseAPProc = (struct APProc*)APProc_Create(&REW_phaseAPDef, 0, 0, 0, 0, 0);
  
  // Clear up & down arrow AP proc pointers.
  proc->upArrowAPProc = NULL;
  proc->downArrowAPProc = NULL;
  
  EnableBgSyncByIndex(1);
}

// Refresh UI, draw action text, turncount, phase indicator,
// moving map sprites, arrows.
void REW_refreshUI(struct REW_ProcState* proc) {
  int turn, actionNotFound;
  u16 pal;
  struct REW_RewindEntry* rewindEntry;
  TextHandle* sequenceDesc, *turnNumberText;
  
  // Refresh turn number.
  if (proc->flags & REW_REFRESH_TURN) {
    turn = gChapterData.turnNumber;
    turnNumberText = turn & 1 ? &proc->turnNumberTextAlt : &proc->turnNumberText;
    
    Text_Clear(turnNumberText);
    Text_SetColorId(turnNumberText, 2);    // Blue colour for turn number.
    
    if (turn < 10) {
      // One-digit number.
      Text_Advance(turnNumberText, 6);
      Text_DrawNumber(turnNumberText, turn);
    } else if (turn < 100) {
      // Two-digit number.
      Text_DrawNumber(turnNumberText, turn / 10);
      Text_Advance(turnNumberText, 16);
      Text_DrawNumber(turnNumberText, turn % 10);
    } // We're not drawing three+ digit numbers. Because.
    Text_Display(turnNumberText, TILEMAP_LOCATED(gBg0MapBuffer, 27, 1));
    proc->flags &= ~REW_REFRESH_TURN;
  }
  
  // Refresh phase indicator.
  if (proc->flags & REW_REFRESH_PHASE) {
    pal = 0;                                            // Ally.
    if (gChapterData.currentPhase == FACTION_GREEN)
      pal = 0x2000;                                     // Other.
    else if (gChapterData.currentPhase == FACTION_RED)
      pal = 0x1000;                                     // Enemy.
    
    proc->phaseAPProc->pHandle->tileBase &= 0x0FFF;
    proc->phaseAPProc->pHandle->tileBase |= pal;
    proc->flags &= ~REW_REFRESH_PHASE;
  }
  
  // Draw or remove up arrow.
  if ((proc->flags & REW_UNDO_AVAILABLE) && (proc->upArrowAPProc == NULL))
    proc->upArrowAPProc = (struct APProc*)APProc_Create(&REW_upArrowAPDef, 0, 0, 0, 0, 0);
  else if (!(proc->flags & REW_UNDO_AVAILABLE) && (proc->upArrowAPProc != NULL)) {
    EndProc((Proc*)proc->upArrowAPProc);
    proc->upArrowAPProc = NULL;
  }
  
  // Draw or remove down arrow.
  if ((proc->flags & REW_REDO_AVAILABLE) && (proc->downArrowAPProc == NULL))
    proc->downArrowAPProc = (struct APProc*)APProc_Create(&REW_downArrowAPDef, 0, 0, 0, 0, 0);
  else if (!(proc->flags & REW_REDO_AVAILABLE) && (proc->downArrowAPProc != NULL)) {
    EndProc((Proc*)proc->downArrowAPProc);
    proc->downArrowAPProc = NULL;
  }
  
  // Clear potential MUs.
  MU_EndAll();
  proc->muActor = NULL;
  proc->muTarget = NULL;
  
  // Draw action text.
  // TODO, this should become a switch for every action possible.
  // Maybe put this part in a separate routine as it could get huge.
  
  // Clear buffered screen entries.
  for (int y = 0; y < 20; y++) {
    for (int x = 0; x < 24; x++) {
      gBg0MapBuffer[y * 0x20 + x] = 0;
    }
  }
  
  // Alternate texthandles to minimize text flickering.
  sequenceDesc = proc->flags & REW_ALTERNATE_TEXT ? &proc->sequenceDescAlt : &proc->sequenceDesc;
  proc->flags ^= REW_ALTERNATE_TEXT;
  
  Text_Clear(sequenceDesc);
  Text_SetXCursor(sequenceDesc, 2);
  actionNotFound = true;
  rewindEntry = proc->curSequence->entry;
  while (actionNotFound) {
    switch (rewindEntry->diffType) {
      case UNIT_ACTION_COMBAT:
        actionNotFound = false;
        
        REW_displayActor(proc, rewindEntry, sequenceDesc);
        REW_displayCombatVerb(rewindEntry, sequenceDesc);
        REW_displayTarget(proc, REW_nextEntry(rewindEntry), sequenceDesc);
        Text_DrawChar(sequenceDesc, ".");                                      // Period.
        Text_Display(sequenceDesc, TILEMAP_LOCATED(gBg0MapBuffer, 5, 2));
        break;
      case REW_ACTION_PHASECHANGE:
        actionNotFound = false;
        
        switch (gChapterData.currentPhase) {
          case FACTION_BLUE:
            Text_DrawString(sequenceDesc, GetStringFromIndex(TEXTID(REW_phaseBlue)));
            Text_Display(sequenceDesc, TILEMAP_LOCATED(gBg0MapBuffer, 6, 2));
            break;
          case FACTION_RED:
            Text_Advance(sequenceDesc, 1);
            Text_DrawString(sequenceDesc, GetStringFromIndex(TEXTID(REW_phaseRed)));
            Text_Display(sequenceDesc, TILEMAP_LOCATED(gBg0MapBuffer, 6, 2));
            break;
          case FACTION_GREEN:
          default:
            Text_Advance(sequenceDesc, 4);
            Text_DrawString(sequenceDesc, GetStringFromIndex(TEXTID(REW_phaseGreen)));
            Text_Display(sequenceDesc, TILEMAP_LOCATED(gBg0MapBuffer, 6, 2));
        }
        break;
      default:
        rewindEntry = REW_nextEntry(rewindEntry);
    }
  }
  EnableBgSyncByIndex(0);
}

// Wait for key-input.
void REW_handleInput(struct REW_ProcState* proc) {
  int phase = gChapterData.currentPhase;
  int turn = gChapterData.turnNumber;
  
  // Up-press: rewind/undo action.
  if ((gKeyState.repeatedKeys & KEY_DPAD_UP) && (proc->flags & REW_UNDO_AVAILABLE)) {
    PlaySfx(0x66);
    
    // Undo action.
    REW_undo(proc->curSequence);
    
    // Update flags tracking if phase or turn display
    // needs to refresh.
    if (phase != gChapterData.currentPhase)
      proc->flags |= REW_REFRESH_PHASE;
    if (turn != gChapterData.turnNumber)
      proc->flags |= REW_REFRESH_TURN;
    
    // Set previous sequence as current sequence.
    proc->curSequence = REW_prevSequence(proc->curSequence);
    
    // Update flags tracking if another undo is available.
    if (!REW_isUndoAvailable(proc->curSequence)) { proc->flags &= ~REW_UNDO_AVAILABLE; }
    proc->flags |= REW_REDO_AVAILABLE;
    
    // Draw previous sequence.
    REW_refreshUI(proc);
    
    // Refresh standing map sprites.
    SMS_UpdateFromGameData();
  } // Down-press: redo action.
  else if ((gKeyState.repeatedKeys & KEY_DPAD_DOWN) && (proc->flags & REW_REDO_AVAILABLE)) {
    PlaySfx(0x66);
    
    // Set next sequence as current sequence.
    proc->curSequence = REW_nextSequence(proc->curSequence);
    
    // Redo action.
    REW_redo(proc->curSequence);
    
    // Update flags tracking if phase or turn display
    // needs to refresh.
    if (phase != gChapterData.currentPhase)
      proc->flags |= REW_REFRESH_PHASE;
    if (turn != gChapterData.turnNumber)
      proc->flags |= REW_REFRESH_TURN;
    
    // Update flags tracking if another redo is available.
    if (!REW_isRedoAvailable(proc->curSequence)) { proc->flags &= ~REW_REDO_AVAILABLE; }
    proc->flags |= REW_UNDO_AVAILABLE;
    
    // Draw next sequence.
    REW_refreshUI(proc);
    
    // Refresh standing map sprites.
    SMS_UpdateFromGameData();
  }
  // TODO other buttons.
  
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