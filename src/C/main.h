#ifndef MAIN_H
#define MAIN_H
#include "gbafe.h"
#include "internal.h"

// Custom.
void REW_undo(struct REW_RewindSequence* sequence);
void REW_redo(struct REW_RewindSequence* sequence);

// Vanilla.
const extern void TriggerMapChanges(u16 id, s8 flag, Proc* parent);  // 0x800BAF8
const extern void UntriggerMapChange(u16 id, s8 flag, Proc* parent);  // 0x800BB48
extern int GetMapChangesIdAt(int x, int y);  // 0x802E531

#pragma pack(1)
// ^ This solves an issue with alignment.
// Idk why exactly, but I got it from here:
// https://stackoverflow.com/a/24888194
// Maybe it's related to running GCC on Windows.
struct UnitUsageStats {
  /* 000 */ unsigned lossAmt     : 8;
  /* 008 */ unsigned favval      : 16;
  /* 024 */ unsigned actAmt      : 8;
  /* 032 */ unsigned statViewAmt : 8;
  /* 040 */ unsigned deathLoc    : 6;
  /* 046 */ unsigned deathTurn   : 10;
  /* 056 */ unsigned deployAmt   : 6;
  /* 062 */ unsigned moveAmt     : 10;
  /* 072 */ unsigned deathCause  : 4;
  /* 076 */ unsigned expGained   : 12;
  /* 088 */ unsigned winAmt      : 10;
  /* 098 */ unsigned battleAmt   : 12;
  /* 110 */ unsigned killerPid   : 9;
  /* 119 */ unsigned deathSkirm  : 1;
  /* 120 */ unsigned pad         : 8;
};
#pragma pack()
extern struct UnitUsageStats* BWL_GetEntry(u8 pid);  // 0x80A4CFC

#endif // MAIN_H