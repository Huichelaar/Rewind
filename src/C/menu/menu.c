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
  PROC_CALL_ROUTINE(REW_drawSomeText),
  PROC_SLEEP(600),
  PROC_CALL_ROUTINE(REW_procEnd),
  PROC_END
};

void REW_drawSomeText(struct REW_ProcState* proc) {
  int dispX = 8;      // Given in pixels.
  int dispY = 24;     // Given in pixels.
  
  // Put arrow gfx in OBJ VRAM.
  UnpackUiVArrowGfx(0x360, 3);
  
  // Draw info window.
  Decompress(&REW_menuTSA, gGenericBuffer);
  BgMap_ApplyTsa(gBg1MapBuffer, gGenericBuffer, 0);
  //Text_ResetTileAllocation();   // This allows us to overwrite previous text.
  
  // Draw "Turn".
  Text_InitClear(&proc->turnText, 5);       // Defaults colour to white.
  //Text_SetColorId(&proc->turnText, 0);
  Text_SetXCursor(&proc->turnText, 2);
  Text_DrawString(&proc->turnText, GetStringFromIndex(0x1C2));
  
  Text_SetColorId(&proc->turnText, 2);
  Text_Advance(&proc->turnText, 8);
  Text_DrawNumber(&proc->turnText, 2);
  
  Text_Display(&proc->turnText, TILEMAP_LOCATED(gBg0MapBuffer, 24, 1));
  
  // Draw "Phase".
  Text_InitClear(&proc->phaseText, 4);      // Defaults colour to white.
  //Text_SetColorId(&proc->phaseText, 0);
  Text_SetXCursor(&proc->phaseText, 2);
  Text_DrawString(&proc->phaseText, GetStringFromIndex(TEXTID(REW_phase)));
  Text_Display(&proc->phaseText, TILEMAP_LOCATED(gBg0MapBuffer, 24, 3));
  
  // AP.
  proc->phaseAPProc = (struct APProc*)APProc_Create(&REW_phaseAPDef, 0, 0, 0, 0, 0);
  proc->upArrowAPProc = (struct APProc*)APProc_Create(&REW_upArrowAPDef, 0, 0, 0, 0, 0);
  proc->downArrowAPProc = (struct APProc*)APProc_Create(&REW_downArrowAPDef, 0, 0, 0, 0, 0);
  
  // Draw action.
  Text_InitClear(&proc->sequenceDesc, 15);  // Defaults colour to white.
  //Text_SetColorId(&proc->sequenceDesc, 0);
  Text_SetXCursor(&proc->sequenceDesc, 2);
  
  // TODO Draw actor's MU mapsprite here, consider its height & width.
  // Increase width if we also draw a tombstone indicating unit death.
  //Text_Advance(&proc->sequenceDesc, 32);                                        // Move past actor's MU.
  
  // Temp. This is here as reminder to me, so I know how to replace text.
  Text_DrawString(&proc->sequenceDesc, GetStringFromIndex(0x002));
  Text_Display(&proc->sequenceDesc, TILEMAP_LOCATED(gBg0MapBuffer, 5, (dispY - 8) >> 3));
  Text_Clear(&proc->sequenceDesc);
  Text_SetXCursor(&proc->sequenceDesc, 2);
  
  Text_DrawString(&proc->sequenceDesc, GetStringFromIndex(0x212));              // Draw actor's name.
  Text_DrawString(&proc->sequenceDesc, GetStringFromIndex(TEXTID(REW_combat))); // " attacked " string
  Text_DrawString(&proc->sequenceDesc, GetStringFromIndex(0x24D));              // Draw target's name.
  Text_DrawChar(&proc->sequenceDesc, ".");                                      // Period.

  Text_Display(&proc->sequenceDesc, TILEMAP_LOCATED(gBg0MapBuffer, 5, (dispY - 8) >> 3));
  
  proc->muActor = MU_CreateInternal(0, 0, 0x66, -1, 0xC);
  proc->muActor->objPriorityBits = 0x400;                 // Priority 1;
  proc->muActor->pAPHandle->tileBase &= 0xF3FF;           // Draw sprite
  proc->muActor->pAPHandle->tileBase |= 0x0400;           // over UI.    
  proc->muActor->xSubPosition += (dispX << 4) + 0x80;     // Adjust x position.
  proc->muActor->ySubPosition += dispY << 4;              // Adjust y position.
  MU_SetFacing(proc->muActor, MU_FACING_RIGHT);
  
  int targetX = (Text_GetXCursor(&proc->sequenceDesc) + 43) << 4;
  
  proc->muTarget = MU_CreateInternal(0, 0, 0x66, -1, 0xD);
  proc->muTarget->objPriorityBits = 0x400;                // Priority 1;
  proc->muTarget->pAPHandle->tileBase &= 0xF3FF;          // Draw sprite
  proc->muTarget->pAPHandle->tileBase |= 0x0400;          // over UI.   
  proc->muTarget->xSubPosition += (dispX << 4) + targetX; // Adjust x position.
  proc->muTarget->ySubPosition += dispY << 4;             // Adjust y position.
  MU_SetFacing(proc->muTarget, MU_FACING_LEFT);
  
  //Text_Clear(&text);
  /*
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


/*
const struct ProcInstruction CRE_credits_Proc[] = {
  PROC_SET_NAME("CRE_credits"),
  PROC_CALL_ROUTINE(CRE_init),
  
    PROC_LABEL(0),                              // CRE_segmentEnd jumps to this for next segment.
    PROC_CALL_ROUTINE(CRE_segmentTitleInit),
    PROC_YIELD,
    PROC_CALL_ROUTINE(CRE_segmentInit),
    PROC_YIELD,

    PROC_CALL_ROUTINE_ARG(NewFadeOut, 0x4),
    PROC_WHILE_ROUTINE(FadeOutExists),
      PROC_LABEL(1),                            // keylistener skips to this when skipping segment.
      PROC_CALL_ROUTINE(CRE_segmentEnd),
  
  PROC_CALL_ROUTINE(CRE_end),
  PROC_SLEEP(16),
  PROC_END
};
*/