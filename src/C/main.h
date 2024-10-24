#ifndef MAIN_H
#define MAIN_H
#include "gbafe.h"

// Rewind entry.
struct REW_RewindEntry {
  /* 00 */ struct REW_RewindEntry* prev;    // Doubly-linked list.
  /* 04 */ struct REW_RewindEntry* next;    // ^.
  /* 08 */ u8 unitActionType;               // As used by action struct + 0x11, 0x203A958 + 0x11.
  /* 09 */ u8 extraParam[3];                // Further parameters used to identify structure of data.
  /* 0C */ u8 data[];                       // Structure & size depends on unitActionType & actionParam.
};

// Rewind buffer.
struct REW_RewindBuffer {
  /* 00 */ u32 size;                        // Consumed space in bytes.
  /* 04 */ struct REW_RewindEntry* end;     // Ptr to last/latest rewind entry.
  /* 08 */ struct REW_RewindEntry start;    // First rewind entry.
};

// Combat rewind entry.
struct REW_RewindCombat {
  /* 00 */ u8 offs;                         // Offset of changed attribute (HP, exp, etc.).
  /* 01 */ u8 diff[];                       // Difference of attribute pre-combat vs post-combat.
};

extern struct REW_RewindBuffer* REW_rewindBufferLarge;
extern struct REW_RewindBuffer* REW_rewindBufferSmall;

struct REW_RewindEntry* REW_createBufferEntry();
u16 REW_recordCombatUnit(struct Unit* unit, struct BattleUnit* bu, struct REW_RewindEntry* rewindEntry, u16 offs);
void REW_recordActionCombat();

extern int GetBattleUnitUpdatedWeaponExp(struct BattleUnit* bu);  // 0x802C0B4

#endif // MAIN_H