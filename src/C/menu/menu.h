#ifndef MENU_H
#define MENU_H
#include "gbafe.h"

u8 REW_rewindMenuEffect(struct MenuProc* menu, struct MenuCommandProc* menuItem);

struct REW_ProcState {
	/* 00 */ PROC_HEADER;
	/* 29 */ u8 pad29[3];
  /* 2C */ u32 pad2C;
};
const ProcInstruction REW_procScr[];
void REW_procEnd(struct REW_ProcState* proc);

#endif // MENU_H