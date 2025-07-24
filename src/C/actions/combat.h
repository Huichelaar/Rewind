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


#endif // COMBAT_H