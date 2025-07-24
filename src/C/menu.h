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
u8 REW_rewindMenuUsability(struct MenuItemDef* command, u8 commandId);
u8 REW_rewindMenuEffect(struct MenuProc* menu, struct MenuItemProc* menuItem);
int REW_isUndoAvailable(struct REW_RewindSequence* sequence);
int REW_isRedoAvailable(struct REW_RewindSequence* sequence);

struct REW_ProcState {
	/* 00 */ PROC_HEADER;
  /* 29 */ u8 flags;
	/* 2A */ u8 pad2A[2];
  /* 2C */ struct REW_RewindSequence* curSequence;
  /* 30 */ struct Text sequenceDesc;
  /* 38 */ struct Text sequenceDescAlt;
  /* 40 */ struct Text turnNumberText;
  /* 48 */ struct Text turnNumberTextAlt;
  /* 50 */ struct MuProc* muActor;
  /* 54 */ struct MuProc* muTarget;
  /* 58 */ struct APProc* phaseAPProc;
  /* 5C */ struct APProc* upArrowAPProc;
  /* 60 */ struct APProc* downArrowAPProc;
};
const struct ProcCmd REW_procScr[];
void REW_initProc(struct REW_ProcState* proc);
void REW_handleInput(struct REW_ProcState* proc);
void REW_displayActor(struct REW_ProcState* proc, struct REW_RewindEntry* rewindEntry, struct Text* sequenceDesc);
void REW_displayTarget(struct REW_ProcState* proc, struct REW_RewindEntry* rewindEntry, struct Text* sequenceDesc);
void REW_displayCombatVerb(struct REW_RewindSequence* seq, struct REW_RewindEntry* entry, struct Text* sequenceDesc);
void REW_initUI(struct REW_ProcState* proc);
void REW_refreshUI(struct REW_ProcState* proc);
void REW_procEnd(struct REW_ProcState* proc);

// Data.
extern const u16*  REW_rewindSize;                    // Size of rewindBuffer.
extern const void* REW_menuTSA;                       // UI TSA.
extern const void* REW_phaseAPDef;                    // Phase icon AP Definition.
extern const void* REW_upArrowAPDef;                  // Up arrow AP Definition.
extern const void* REW_downArrowAPDef;                // Down arrow AP Definition.
extern const u16 REW_combat, REW_phaseIndicator,      // Text entries.
REW_phaseBlue, REW_phaseRed, REW_phaseGreen,
REW_obstacleDestroyed;

#endif // MENU_H