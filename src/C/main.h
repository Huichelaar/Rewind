#ifndef MAIN_H
#define MAIN_H
#include "gbafe.h"

enum {
  // Vanilla.
  // Sizes of structs.
  REW_UNITSIZE = 0x48,
  REW_BWLSIZE = 0x10,
  REW_TRAPSIZE = 0x8,

  // Terrain IDs.
  REW_SNAG_ID = 0x33,
  REW_WALL_ID = 0x1B,
  REW_ROOF_ID = 0x22,
  
  // Other.
  REW_TRAP_MAX_COUNT = 64,
  
  // Entry & data sizes. Keep having to change these
  // so I made them into an enum.
  REW_BUFFER_BASESIZE = 8,
  REW_SEQUENCE_BASESIZE = 4,
  REW_ENTRY_BASESIZE = 4,
  REW_ENTRY_PHASECHANGEDATA_BASESIZE = 0,
  REW_ENTRY_UNITCHANGEDATA_BASESIZE = 0,
  REW_ENTRY_OBSTACLE_BASESIZE = 4,
  
  // diffTypes. First 0x3F values are reserved for actions,
  // such as UNIT_ACTION_COMBAT as given in FEClib's action.h.
  REW_ACTION_PHASECHANGE =  0x40,
  REW_CONSEQ_UNITCHANGE =   0x41,
  REW_ACTION_BREAK = 0x42,
  
  // REW_RewindPhaseChangeData.flags.
  REW_PHASE_PRE_ALLY =    0x0,
  REW_PHASE_PRE_NPC =     0x1,
  REW_PHASE_PRE_ENEMY =   0x2,
  REW_PHASE_PRE_MASK =    0x3,
  REW_PHASE_POST_ALLY =   0x0,
  REW_PHASE_POST_NPC =    0x4,
  REW_PHASE_POST_ENEMY =  0x8,
  REW_PHASE_POST_MASK =   0xC,
  REW_PHASECHANGE_TURNINCR =  0x10,
  REW_PHASECHANGE_SKIPPHASE = 0x20,
  
  // Obstacle flags.
  REW_OBSTACLE_SNAG = 0x1,

  // Additional 'unit' changes.
  REW_UNITOFFS_BWL = 0x48,
  REW_UNITOFFS_BALLISTA = REW_UNITOFFS_BWL + REW_BWLSIZE,
};

// Rewind entry. Action or consequence of action.
struct REW_RewindEntry {
  /* 00 */ u8 diffType;                     // Can be actionID or other identifiers.
  /* 01 */ u8 flags;                        // Can be just about anything depending on diffType.
  /* 02 */ u16 size;                        // Size of entry.
  /* 04 */ u8 data[];                       // Structure depends on diffType.
};

// Rewind sequence. Action + consequences.
struct REW_RewindSequence {
  // These size attrs are used to walk through rewind sequences.
  /* 00 */ u16 sizePrev;                    // Size of preceding sequence.
  /* 02 */ u16 size;                        // Size of this sequence.
  /* 04 */ struct REW_RewindEntry entry[];  // Array of RewindEntries.
};
extern struct REW_RewindSequence* REW_curSequence;

// Rewind buffer. Contains RewindSequences.
struct REW_RewindBuffer {
  /* 00 */ u32 size;                        // Consumed space in bytes.
  /* 04 */ struct REW_RewindSequence* end;  // Ptr to last/latest rewind entry.
  /* 08 */ struct REW_RewindSequence start; // First rewind entry.
};
extern struct REW_RewindBuffer* REW_rewindBuffer;

// Rewind entry data.
struct REW_UnitChangeData {
  /* 00 */ u8 offs;                       // Offset of changed attribute (HP, exp, etc.)
  /* 01 */ u8 diff;                       // Difference of attribute pre-combat vs post-combat.
};                                        // Size varies based on how many attributes were changed.

void REW_clearRewindSeq(struct REW_RewindSequence* sequence);
struct REW_RewindEntry* REW_createSeqEntry(struct REW_RewindSequence* seq);
struct REW_RewindSequence* REW_nextSequence(struct REW_RewindSequence* sequence);
struct REW_RewindSequence* REW_prevSequence(struct REW_RewindSequence* sequence);
struct REW_RewindEntry* REW_nextEntry(struct REW_RewindEntry* entry);
struct REW_RewindEntry* REW_prevEntry(struct REW_RewindSequence* seq, struct REW_RewindEntry* entry);
struct REW_RewindEntry* REW_lastEntry(struct REW_RewindSequence* seq);
void REW_alignSequence(struct REW_RewindSequence* sequence);

// Actions.
u8 REW_nextPhase(u8 phase, u8* turn, u8* skip);
void REW_actionPrePhaseChange();
void REW_actionPostPhaseChange();
void REW_storeCombatData(struct Unit* unit, struct BattleUnit* bu, int ballista, s8 xPrev, s8 yPrev, struct REW_RewindSequence* rewindSeq, struct REW_RewindEntry* rewindEntry);
void REW_actionCombat();

// Consequences.
// TODO

// Vanilla.
extern void TriggerMapChanges(u16 id, s8 flag, Proc* parent);   // 0x800BAF8
extern void UntriggerMapChange(u16 id, s8 flag, Proc* parent);  // 0x800BB48
extern void BattleApplyExpGains(); // 0x802B92D
extern int GetBattleUnitUpdatedWeaponExp(struct BattleUnit* bu);  // 0x802C0B4
extern int GetMapChangesIdAt(int x, int y);  // 0x802E531

#define TRAP_INDEX(aTrap) ((aTrap) - GetTrap(0))

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