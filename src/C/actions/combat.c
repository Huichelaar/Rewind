#include <stdio.h>
#include "combat.h"

// Undo combat where target is obstacle (snag or wall).
void REW_undoObstacleCombat(struct REW_RewindEntry* entry) {
  Trap* trapData = (Trap*)entry->data;
  Trap* trap = GetSpecificTrapAt(trapData->xPosition, trapData->yPosition, trapData->type);
  
  if (trap != NULL) {
    
    // Obstacle was not destroyed.
    // Update HP.
    trap->data[0] -= trapData->data[0];
  } else {
    
    // Obstacle was destroyed.
    // Undo map change.
    int mapChangeID = GetMapChangesIdAt(trapData->xPosition, trapData->yPosition);
    UntriggerMapChange(mapChangeID, 0, NULL);
    
    // Add obstacle back as trap.
    AddTrap(trapData->xPosition, trapData->yPosition, trapData->type, 0 - trapData->data[0]);
  }
}

// Redo combat where target is obstacle (snag or wall).
void REW_redoObstacleCombat(struct REW_RewindEntry* entry) {
  Trap* trapData = (Trap*)entry->data;
  Trap* trap = GetSpecificTrapAt(trapData->xPosition, trapData->yPosition, trapData->type);
  
  // Update obstacle HP.
  trap->data[0] += trapData->data[0];
  
  if (trap->data[0] == 0) {
    
    // Obstacle was destroyed.
    // Remove obstacle.
    RemoveTrap(trap);
    
    // Redo map change.
    int mapChangeID = GetMapChangesIdAt(trapData->xPosition, trapData->yPosition);
    TriggerMapChanges(mapChangeID, 0, NULL);
  }
}

// Undo generic combat action.
void REW_undoCombat(struct REW_RewindEntry* entry) {
  Unit* unit = GetUnit(entry->flags);     // TODO this doesn't work if unit died.
  struct REW_UnitChangeData* unitChangeData = (struct REW_UnitChangeData*)entry->data;
  
  // Ignore if we can't find unit.
  if (!UNIT_IS_VALID(unit))
    return;
  
  s8 xPost = unit->xPos;
  s8 yPost = unit->yPos;
  
  // Undo changes applied to unit due to combat.
  // TODO interpret x and y as absolute vals if unit died.
  for (int i = 0; i < ((entry->size - REW_ENTRY_BASESIZE) / 2); i++) {
    
    if (unitChangeData[i].offs < REW_UNITSIZE) {
      
      // Undo generic changes applied to unit due to combat.
      *(u8*)((u32)unit + unitChangeData[i].offs) -= unitChangeData[i].diff;
    
    } else if (unitChangeData[i].offs < (REW_UNITOFFS_BWL + REW_BWLSIZE)) {
      
      // Undo BWL-data change.
      ((u8*)BWL_GetEntry(unit->pCharacterData->number))[unitChangeData[i].offs - REW_UNITOFFS_BWL] -= unitChangeData[i].diff;
    
    } else if (unitChangeData[i].offs == REW_UNITOFFS_BALLISTA) {
      
      // Undo/Incr. ballista uses.
      GetTrap(unit->ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES] -= unitChangeData[i].diff;
    }
  }
  
  // Move unit back to their position before they entered combat.
  // TODO, if unit died...
  gMapUnit[yPost][xPost] = 0;
  gMapUnit[unit->yPos][unit->xPos] = unit->index;
}

// Redo generic combat action.
void REW_redoCombat(struct REW_RewindEntry* entry) {
  Unit* unit = GetUnit(entry->flags);
  struct REW_UnitChangeData* unitChangeData = (struct REW_UnitChangeData*)entry->data;
  
  // Ignore if we can't find unit.
  if (!UNIT_IS_VALID(unit))
    return;
  
  s8 xPrev = unit->xPos;
  s8 yPrev = unit->yPos;
  
  // Redo changes applied to unit due to combat.
  // TODO interpret x and y as absolute vals if unit died.
  for (int i = 0; i < ((entry->size - REW_ENTRY_BASESIZE) / 2); i++) {
    
    if (unitChangeData[i].offs < REW_UNITSIZE) {
      
      // Redo generic changes applied to unit due to combat.
      *(u8*)((u32)unit + unitChangeData[i].offs) += unitChangeData[i].diff;
      
    } else if (unitChangeData[i].offs < (REW_UNITOFFS_BWL + REW_BWLSIZE)) {
      
      // Redo BWL-data change.
      ((u8*)BWL_GetEntry(unit->pCharacterData->number))[unitChangeData[i].offs - REW_UNITOFFS_BWL] += unitChangeData[i].diff;
    
    } else if (unitChangeData[i].offs == REW_UNITOFFS_BALLISTA) {
      
      // Redo/Decr. ballista uses.
      GetTrap(unit->ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES] += unitChangeData[i].diff;
    }
  }
  
  // Move unit back to their position after they finished combat.
  // TODO, clear unit if they died.
  gMapUnit[yPrev][xPrev] = 0;
  gMapUnit[unit->yPos][unit->xPos] = unit->index;
}

// Store unit's changes resulting from combat.
// REW_RewindEntry.data[] is an
// array of byte-pairs of the form:
//  - byte offset. Apply diff to Unit + this offset.
//  - byte diff. Subtract diff from offset when undoing, add when redoing.
void REW_storeCombatData(struct Unit* unit,
                         struct BattleUnit* bu,
                         int ballista,
                         s8 xPrev,
                         s8 yPrev,
                         struct REW_RewindSequence* rewindSeq,
                         struct REW_RewindEntry* rewindEntry) {
  struct Unit buCopy;
  u8* unitPre = (u8*)unit;
  u8* unitPost = (u8*)&buCopy;
  struct UnitUsageStats *bwlPre;
  struct UnitUsageStats bwlPost;
  u8 diff = 0;
  int i, bwlVal;
  int changeIdx = 0;
  
  // Apply corrections first. Based on UpdateUnitFromBattle, 0x802C1EC.
  CpuCopy16(bu, &buCopy, REW_UNITSIZE);
  
  //  - ConBonus & movBonus are actually con & mov for battle unit.
  buCopy.conBonus = bu->unit.conBonus - UNIT_CON(unit);
  buCopy.movBonus = bu->unit.movBonus - UNIT_MOV(unit);
  
  //  - Weapon slot index. From BattleApplyUnitUpdates, 0x802C028.
  if (bu->canCounter)
    buCopy.items[bu->weaponSlotIndex] = bu->weapon;
  
  //  - Newly applied/removed status.
  if (bu->statusOut >= 0)
    SetUnitStatus(&buCopy, bu->statusOut);
  
  //  - Statups due to lvlup. Also run UnitCheckStatCaps.
  buCopy.maxHP += bu->changeHP;
  buCopy.pow   += bu->changePow;
  buCopy.skl   += bu->changeSkl;
  buCopy.spd   += bu->changeSpd;
  buCopy.def   += bu->changeDef;
  buCopy.res   += bu->changeRes;
  buCopy.lck   += bu->changeLck;
  UnitCheckStatCaps(&buCopy);
  
  //  - Weapon proficiency.
  i = GetBattleUnitUpdatedWeaponExp(bu);
  if (i > 0)
    buCopy.ranks[bu->weaponType] = i;

  //  - Item re-ordering.
  UnitRemoveInvalidItems(&buCopy);
  
  // Now store changes of unit.
  struct REW_UnitChangeData* unitChangeData = (struct REW_UnitChangeData*)rewindEntry->data;
  
  //  - Position changes.
  diff = buCopy.xPos - xPrev;
  if (diff) {
    unitChangeData[changeIdx].offs = 0x10;
    unitChangeData[changeIdx].diff = diff;
    changeIdx += 1;
  }
  diff = buCopy.yPos - yPrev;
  if (diff) {
    unitChangeData[changeIdx].offs = 0x11;
    unitChangeData[changeIdx].diff = diff;
    changeIdx += 1;
  }
  
  //  - Generic changes.
  for (i = 0; i < REW_UNITSIZE; i++) {
    diff = unitPost[i] - unitPre[i];
    if (diff) {
      unitChangeData[changeIdx].offs = i;
      unitChangeData[changeIdx].diff = diff;
      changeIdx += 1;
    }
  }
  
  //  - Ballista changes. BattleApplyBallistaUpdates, 0x802C300.
  if (ballista) {
    diff = GetItemUses(bu->weapon) - GetTrap(buCopy.ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES];
    if (diff) {
      unitChangeData[changeIdx].offs = REW_UNITOFFS_BALLISTA;
      unitChangeData[changeIdx].diff = diff;
      changeIdx += 1;
    }
  }
  
  //  - BWL changes.
  bwlPre = BWL_GetEntry(unit->pCharacterData->number);
  if (bwlPre != NULL) {
    CpuCopy16(bwlPre, &bwlPost, REW_BWLSIZE);
    
    // Exp.
    if (bu->expGain) {
      bwlVal = bwlPost.expGained + bu->expGain;
      if (bwlVal > 4000)
        bwlVal = 4000;
      bwlPost.expGained = bwlVal;
    }
    
    // Don't apply if target is obstacle.
    if (gBattleTarget.unit.index) {
      
      // PidStatsAddBattleAmt(unit)
      bwlVal = bwlPost.battleAmt + 1;
      if (bwlVal > 4000)
        bwlVal = 4000;
      bwlPost.battleAmt = bwlVal;
    }
    
    for (int i = 0; i < REW_BWLSIZE; i++) {
      diff = ((u8*)(&bwlPost))[i] - ((u8*)bwlPre)[i];
      if (diff) {
        unitChangeData[changeIdx].offs = REW_UNITOFFS_BWL + i;
        unitChangeData[changeIdx].diff = diff;
        changeIdx += 1;
      }
    }
  }
  
  // Set entry and corresponding sequence sizes.
  rewindEntry->size = REW_ENTRY_BASESIZE + REW_ENTRY_UNITCHANGEDATA_BASESIZE + changeIdx * 2;
  if (rewindSeq->size == 0) { rewindSeq->size = REW_SEQUENCE_BASESIZE; }
  rewindSeq->size += rewindEntry->size;
  REW_alignSequence(rewindSeq);
}

// Store changes resulting from a combat action.
void REW_actionCombat() {
  struct REW_RewindSequence* rewindSeq = REW_curSequence;
  struct REW_RewindEntry* rewindEntry;
  struct Unit* actor  = GetUnit(gBattleActor.unit.index);
  struct Unit* target = GetUnit(gBattleTarget.unit.index);
  
  // Clear rewind sequence.
  REW_clearRewindSeq(rewindSeq);
  
  // Actor.
  rewindEntry = REW_createSeqEntry(rewindSeq);
  rewindEntry->diffType = UNIT_ACTION_COMBAT;   //  TODO Incorporate deaths and/or other flags.
  rewindEntry->flags = actor->index;
  
  if (gBattleActor.unit.curHP == 0) {
    // TODO handle death.
    //  - PidStatsRecordBattleRes, record win if actor is blue.
    //  - TryRemoveUnitFromBallista
    //  - Item drop
    //  - Rescue drop
    //  - Dead enemies get cleared from Unit* array.
    ;
  } else {
    
    // Set these here to store this change which will happen post-battle.
    gBattleActor.unit.state |= US_UNSELECTABLE;
    
    REW_storeCombatData(actor,
                        &gBattleActor,
                        gBattleStats.config & BATTLE_CONFIG_BALLISTA,
                        (s8)gActiveUnitMoveOrigin.x,
                        (s8)gActiveUnitMoveOrigin.y,
                        rewindSeq,
                        rewindEntry);
    
    // Unset them again.
    gBattleActor.unit.state &= ~US_UNSELECTABLE;
  }
  
  // Target.
  rewindEntry = REW_createSeqEntry(rewindSeq);
  
  if (target) {
    rewindEntry->diffType = UNIT_ACTION_COMBAT;   //  TODO Incorporate deaths and/or other flags.
    rewindEntry->flags = target->index;
    if (gBattleTarget.unit.curHP == 0) {
      // TODO handle death.
      //  - PidStatsRecordBattleRes, record loss if target is blue.
      //  - TryRemoveUnitFromBallista
      //  - Item drop
      //  - Rescue drop
      //  - Dead enemies get cleared from Unit* array.
      ;
    } else {
      REW_storeCombatData(target,
                          &gBattleTarget,
                          false,
                          target->xPos,
                          target->yPos,
                          rewindSeq,
                          rewindEntry);
    }
  } else  {
    // Obstacle.
    Trap* trap = GetTrapAt(gBattleTarget.unit.xPos, gBattleTarget.unit.yPos);
    
    rewindEntry->diffType = REW_ACTION_BREAK;   // Snags & walls.
    rewindEntry->flags = 0;
    
    // If terrain is wall, do nothing, if snag, orr 1 with flags.
    if (gMapTerrain[gBattleTarget.unit.yPos][gBattleTarget.unit.xPos] == REW_SNAG_ID)
      rewindEntry->flags |= REW_OBSTACLE_SNAG;
    
    rewindEntry->size = REW_ENTRY_BASESIZE;
    
    Trap* trapData = (Trap*)rewindEntry->data;
    trapData->xPosition = trap->xPosition;
    trapData->yPosition = trap->yPosition;
    trapData->type = trap->type;
    trapData->data[0] = gBattleTarget.unit.curHP - trap->data[0];
    
    rewindEntry->size += REW_ENTRY_OBSTACLE_BASESIZE;
    rewindSeq->size += rewindEntry->size;
    REW_alignSequence(rewindSeq);
  }
}