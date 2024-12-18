#ifndef MENU_H
#define MENU_H
#include "gbafe.h"

// Macros.
#define TEXTID(textEntry) (u16)(u32)&textEntry        // For use with non-vanilla text.

// Vanilla.
struct APProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 _pad[0x50-0x29];
    /* 50 */ APHandle* pHandle;
    /* 54 */ u32 xPosition;
    /* 58 */ u32 yPosition;
};

const extern void UnpackUiVArrowGfx(int chr, int pal);  // 0x80B53BC 

// Functions & structs.
u8 REW_rewindMenuEffect(struct MenuProc* menu, struct MenuCommandProc* menuItem);

struct REW_ProcState {
	/* 00 */ PROC_HEADER;
	/* 29 */ u8 pad29[3];
  /* 2C */ struct REW_RewindSequence* curSequence;
  /* 30 */ TextHandle sequenceDesc;
  /* 38 */ TextHandle phaseText;
  /* 40 */ TextHandle turnText;
  /* 48 */ MoveUnitProc* muActor;
  /* 4C */ MoveUnitProc* muTarget;
  /* 50 */ struct APProc* phaseAPProc;
  /* 54 */ struct APProc* upArrowAPProc;
  /* 58 */ struct APProc* downArrowAPProc;
};
const ProcInstruction REW_procScr[];
void REW_initProc(struct REW_ProcState* proc);
void REW_displayActor(struct REW_ProcState* proc, struct REW_RewindEntry* rewindEntry);
void REW_displayTarget(struct REW_ProcState* proc, struct REW_RewindEntry* rewindEntry);
void REW_drawUI(struct REW_ProcState* proc);
void REW_handleInput(struct REW_ProcState* proc);
int REW_rewind(struct REW_ProcState* proc, s16 steps);
void REW_cancelRewind(struct REW_ProcState* proc);
void REW_procEnd(struct REW_ProcState* proc);

// Data.
const extern void* REW_menuTSA;                       // UI TSA.
const extern void* REW_phaseAPDef;                    // Phase icon AP Definition.
const extern void* REW_upArrowAPDef;                  // Up arrow AP Definition.
const extern void* REW_downArrowAPDef;                // Down arrow AP Definition.
const extern u16 REW_combat, REW_phase;               // Text entries.

// Temp. TODO, remove when done with testing.
extern struct REW_RewindBuffer REW_tempRewindBuf;

#endif // MENU_H