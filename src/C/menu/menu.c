#include <stdio.h>
#include "menu.h"

u8 REW_rewindMenuEffect(struct MenuProc* menu, struct MenuCommandProc* menuItem) {
  
  // Seems superfluous.
  /*
  if (menuItem->availability != MENU_ENABLED)
    return 0;
  */

  Text_ResetTileAllocation();
  LockGameLogic();
  ProcStart(REW_procScr, ROOT_PROC_3);

  return ME_DISABLE | ME_END | ME_PLAY_BEEP | ME_CLEAR_GFX;
}

const struct ProcInstruction REW_procScr[] = {
  PROC_SET_NAME("REW_proc"),
  PROC_SLEEP(120),
  PROC_CALL_ROUTINE(REW_procEnd),
  PROC_END
};

void REW_procEnd(struct REW_ProcState* proc) {
  UnlockGameLogic();
}