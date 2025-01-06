#ifndef COMBAT_H
#define COMBAT_H
#include "gbafe.h"
#include "../internal.h"

// Custom.
void REW_undoObstacleCombat(struct REW_RewindEntry* entry);
void REW_redoObstacleCombat(struct REW_RewindEntry* entry);
void REW_undoCombat(struct REW_RewindEntry* entry);
void REW_redoCombat(struct REW_RewindEntry* entry);

void REW_storeCombatData(struct Unit* unit,
                         struct BattleUnit* bu,
                         int ballista,
                         s8 xPrev,
                         s8 yPrev,
                         struct REW_RewindSequence* rewindSeq,
                         struct REW_RewindEntry* rewindEntry);
void REW_actionCombat();

// Vanilla.
const extern void TriggerMapChanges(u16 id, s8 flag, Proc* parent);   // 0x800BAF8
const extern void UntriggerMapChange(u16 id, s8 flag, Proc* parent);  // 0x800BB48
extern int GetBattleUnitUpdatedWeaponExp(struct BattleUnit* bu);      // 0x802C0B4
extern int GetMapChangesIdAt(int x, int y);                           // 0x802E531


#endif // COMBAT_H