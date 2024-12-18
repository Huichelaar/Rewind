#ifndef MAIN_H
#define MAIN_H
#include "gbafe.h"

// Rewind entry. Action or consequence of action.
struct REW_RewindEntry {
  /* 00 */ u8 diffType;                     // Can be actionID or other identifiers.
  /* 01 */ u8 eventID;
  /* 02 */ u16 flags;                       // Additional flags.
  /* 04 */ s8 xPrev;                        // X-Coordinate prior to movement.
  /* 05 */ s8 yPrev;
  /* 06 */ s8 xCur;                         // X-Coordinate after movement.
  /* 07 */ s8 yCur;
  /* 08 */ u8 data[];                       // Structure & size depends on diffType.
};

// Rewind sequence. Action + consequences.
struct REW_RewindSequence {
  // These size attrs are used to walk through rewind sequences.
  /* 00 */ u16 sizePrev;                    // Size of preceding sequence.
  /* 02 */ u16 size;                        // Size of this sequence.
  /* 04 */ struct REW_RewindEntry entry[];  // Array of RewindEntries.
};

// Rewind buffer. Contains RewindSequences.
struct REW_RewindBuffer {
  /* 00 */ u32 size;                        // Consumed space in bytes.
  /* 04 */ struct REW_RewindSequence* end;  // Ptr to last/latest rewind entry.
  /* 08 */ struct REW_RewindSequence start; // First rewind entry.
};

// data stored in RewindEntry.data.
// Combat rewind entry.
struct REW_RewindCombatData {
  /* 00 */ u16 size;                        // Size of array following this var.
  /* 02 */ struct Changes {
    /* 00 */ u8 offs;                       // Offset of changed attribute (HP, exp, etc.)
    /* 01 */ u8 diff;                       // Difference of attribute pre-combat vs post-combat.
  } changes[];                              // Size varies based on how many attributes were changed.
};

extern struct REW_RewindBuffer* REW_rewindBuffer;
extern struct REW_RewindSequence* REW_curSequence;

void REW_clearRewindSeq(struct REW_RewindSequence* sequence);
struct REW_RewindEntry* REW_createSeqEntry(struct REW_RewindSequence* sequence);
struct REW_RewindEntry* REW_nextEntry(struct REW_RewindEntry* rewindEntry);
void REW_storeCombatData(struct Unit* unit, struct BattleUnit* bu, struct REW_RewindSequence* rewindSeq, struct REW_RewindEntry* rewindEntry);
void REW_recordActionCombat();

extern int GetBattleUnitUpdatedWeaponExp(struct BattleUnit* bu);  // 0x802C0B4

#endif // MAIN_H