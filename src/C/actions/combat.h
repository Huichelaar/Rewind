#ifndef COMBAT_H
#define COMBAT_H
#include "gbafe.h"
#include "../internal.h"

// Custom.
void REW_storeCombatData(struct Unit* unit,
                         struct BattleUnit* bu,
                         int ballista,
                         s8 xPrev,
                         s8 yPrev,
                         struct REW_RewindSequence* rewindSeq,
                         struct REW_RewindEntry* rewindEntry);
void REW_actionCombat();

// Vanilla.
extern int GetBattleUnitUpdatedWeaponExp(struct BattleUnit* bu);  // 0x802C0B4

#endif // COMBAT_H