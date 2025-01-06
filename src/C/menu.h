#ifndef MENU_H
#define MENU_H
#include "gbafe.h"
#include "internal.h"
#include "main.h"
#include "save/save.h"

// Macros.
#define TEXTID(textEntry) (u16)(u32)&textEntry        // For use with non-vanilla text.

// enums
enum {
  REW_REFRESH_PHASE = 1,
  REW_REFRESH_TURN = 2,
  REW_UNDO_AVAILABLE = 4,
  REW_REDO_AVAILABLE = 8,
  REW_ALTERNATE_TEXT = 16
};

// Functions & structs.
u8 REW_rewindMenuUsability(MenuCommandDefinition* command, u8 commandId);
u8 REW_rewindMenuEffect(struct MenuProc* menu, struct MenuCommandProc* menuItem);
int REW_isUndoAvailable(struct REW_RewindSequence* sequence);
int REW_isRedoAvailable(struct REW_RewindSequence* sequence);

struct REW_ProcState {
	/* 00 */ PROC_HEADER;
  /* 29 */ u8 flags;
	/* 2A */ u8 pad2A[2];
  /* 2C */ struct REW_RewindSequence* curSequence;
  /* 30 */ TextHandle sequenceDesc;
  /* 38 */ TextHandle sequenceDescAlt;
  /* 40 */ TextHandle turnNumberText;
  /* 48 */ TextHandle turnNumberTextAlt;
  /* 50 */ MoveUnitProc* muActor;
  /* 54 */ MoveUnitProc* muTarget;
  /* 58 */ struct APProc* phaseAPProc;
  /* 5C */ struct APProc* upArrowAPProc;
  /* 60 */ struct APProc* downArrowAPProc;
};
const ProcInstruction REW_procScr[];
void REW_initProc(struct REW_ProcState* proc);
void REW_handleInput(struct REW_ProcState* proc);
void REW_displayActor(struct REW_ProcState* proc, struct REW_RewindEntry* rewindEntry, TextHandle* sequenceDesc);
void REW_displayTarget(struct REW_ProcState* proc, struct REW_RewindEntry* rewindEntry, TextHandle* sequenceDesc);
void REW_displayCombatVerb(struct REW_RewindSequence* seq, struct REW_RewindEntry* entry, TextHandle* sequenceDesc);
void REW_initUI(struct REW_ProcState* proc);
void REW_refreshUI(struct REW_ProcState* proc);
void REW_procEnd(struct REW_ProcState* proc);

// Data.
const extern u16*  REW_rewindSize;                    // Size of rewindBuffer.
const extern void* REW_menuTSA;                       // UI TSA.
const extern void* REW_phaseAPDef;                    // Phase icon AP Definition.
const extern void* REW_upArrowAPDef;                  // Up arrow AP Definition.
const extern void* REW_downArrowAPDef;                // Down arrow AP Definition.
const extern u16 REW_combat, REW_phaseIndicator,      // Text entries.
REW_phaseBlue, REW_phaseRed, REW_phaseGreen,
REW_obstacleDestroyed;

// Vanilla.
struct APProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 _pad[0x50-0x29];
    /* 50 */ APHandle* pHandle;
    /* 54 */ u32 xPosition;
    /* 58 */ u32 yPosition;
};

const extern void UnpackUiVArrowGfx(int chr, int pal);  // 0x80B53BC
const extern void triggerMapChanges(u16 id, s8 flag, Proc* parent);  // 0x800BAF8
const extern void UntriggerMapChange(u16 id, s8 flag, Proc* parent);  // 0x800BB48

#endif // MENU_H