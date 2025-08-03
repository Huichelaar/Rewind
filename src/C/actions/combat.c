#include <stdio.h>
#include "combat.h"

// Undo combat where target is obstacle (snag or wall).
void REW_undoObstacleCombat(struct REW_RewindEntry* entry) {
  struct Trap* trapData = (struct Trap*)entry->data;
  struct Trap* trap = GetTypedTrapAt(trapData->xPos, trapData->yPos, trapData->type);
  
  if (trap != NULL) {
    
    // Obstacle was not destroyed.
    // Update HP.
    trap->extra -= trapData->extra;
  } else {
    
    // Obstacle was destroyed.
    // Undo map change.
    int mapChangeID = GetMapChangeIdAt(trapData->xPos, trapData->yPos);
    UntriggerMapChange(mapChangeID, 0, NULL);
    
    // Add obstacle back as trap.
    AddTrap(trapData->xPos, trapData->yPos, trapData->type, 0 - trapData->extra);
  }
}

// Redo combat where target is obstacle (snag or wall).
void REW_redoObstacleCombat(struct REW_RewindEntry* entry) {
  struct Trap* trapData = (struct Trap*)entry->data;
  struct Trap* trap = GetTypedTrapAt(trapData->xPos, trapData->yPos, trapData->type);
  
  // Update obstacle HP.
  trap->extra += trapData->extra;
  
  if (trap->extra == 0) {
    
    // Obstacle was destroyed.
    // Remove obstacle.
    RemoveTrap(trap);
    
    // Redo map change.
    int mapChangeID = GetMapChangeIdAt(trapData->xPos, trapData->yPos);
    TriggerMapChanges(mapChangeID, 0, NULL);
  }
}

// Undo generic combat action.
void REW_undoCombat(struct REW_RewindEntry* entry) {
  struct Unit* unit = GetUnit(entry->flags);
  struct Unit* supporterUnit;
  struct Trap* trap;
  struct REW_UnitChangeData* unitChangeData = (struct REW_UnitChangeData*)entry->data;
  u8* unitArr;
  int i, unitSupporterCount, unitSupporterIndex;
  int changeCount = entry->size - REW_ENTRY_BASESIZE;
  
  // Check if unit died.
  if (entry->flags == REW_UNITDIED_CLEARED) {
    // Unit died and got cleared.
    
    // Re-load unit.
    unit = GetFreeUnit(((struct REW_UnitDefData*)entry->data)->allegiance << 6);
    
    // Store index, as it'll be cleared.
    i = unit->index;
    
    // Load unit from unitDefData.
    REW_loadUnit(unit, (struct REW_UnitDefData*)entry->data);
    
    // Re-set index, as it got cleared.
    unit->index = i;
    
    // Also set exp to -1 as clear-on-death units don't gain exp.
    unit->exp = 0xFF;
    
    // Data after REW_UnitDefData is REW_UnitChangeData.
    unitChangeData = (struct REW_UnitChangeData*)(entry->data + REW_ENTRY_UNITDEFDATA_SIZE);
    
    // REW_UnitDefData are not unitChangeData, so remove from changeCount.
    changeCount -= REW_ENTRY_UNITDEFDATA_SIZE;
    
  } else if ((entry->flags & REW_UNITDIED_NOCLEAR) == REW_UNITDIED_NOCLEAR) {
    
    // Unit died but did not get cleared.
    unit = GetUnit(entry->flags & ~REW_UNITDIED_NOCLEAR);
      
    // Re-set supports.
    unitSupporterCount = GetUnitSupporterCount(unit);
    for (i = 0; i < unitSupporterCount; i++) {
      
      supporterUnit = GetUnitSupporterUnit(unit, i);
      if (!supporterUnit)
        continue;
      
      unitSupporterIndex = GetUnitSupporterNum(supporterUnit, unit->pCharacterData->number);
      supporterUnit->supports[unitSupporterIndex] = entry->data[i];
      unit->supports[i] = entry->data[i];   // Main unit's supports also got cleared.
    }
    
    // Data after supports is REW_UnitChangeData.
    unitChangeData = (struct REW_UnitChangeData*)(entry->data + unitSupporterCount);
    
    // support array is not unitChangeData, so remove from changeCount.
    changeCount -= unitSupporterCount;
  } else if (!UNIT_IS_VALID(unit)) {
    
    // Could not find unit.
    return;
  }
  
  s8 xPost = unit->xPos;
  s8 yPost = unit->yPos;
  changeCount /= 2;         // Change is offs and diff, so size / 2.
  
  // Undo changes applied to unit due to combat.
  unitArr = (u8*)unit;
  for (int i = 0; i < changeCount; i++) {
    
    if (unitChangeData[i].offs < REW_UNITSIZE) {
      
      // If unit is riding ballista, alter relevant trap struct.
      if (unitChangeData[i].offs == REW_UNITOFFS_BALLISTA_ID) {
        unit->ballistaIndex = 0;    // Sometimes ballista-index is not cleared on unit-death.

        trap = GetTrap((unitArr[unitChangeData[i].offs] - unitChangeData[i].diff) & 0xFF);
        SetBallistaOccupied(trap);
        trap->xPos = unit->xPos;
        trap->yPos = unit->yPos;
      }
      
      // Undo generic changes applied to unit due to combat.
      unitArr[unitChangeData[i].offs] -= unitChangeData[i].diff;
    
    } else if (unitChangeData[i].offs < (REW_UNITOFFS_BWL + REW_BWLSIZE)) {
      
      // Undo BWL-data change.
      ((u8*)GetPidStats(unit->pCharacterData->number))[unitChangeData[i].offs - REW_UNITOFFS_BWL] -= unitChangeData[i].diff;
    
    } else if (unitChangeData[i].offs == REW_UNITOFFS_BALLISTA_USES) {
      
      // Undo/Incr. ballista uses.
      GetTrap(unit->ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES] -= unitChangeData[i].diff;
    }
  }
  
  // Move unit back to their position before they entered combat.
  // If unit died this ends up clearing and then setting the same location.
  gBmMapUnit[yPost][xPost] = 0;
  gBmMapUnit[unit->yPos][unit->xPos] = unit->index;
}

// Redo generic combat action.
void REW_redoCombat(struct REW_RewindEntry* entry) {
  struct Unit* unit = GetUnit(entry->flags);
  struct Trap* trap;
  struct REW_UnitChangeData* unitChangeData = (struct REW_UnitChangeData*)entry->data;
  struct REW_UnitDefData* unitDefData = (struct REW_UnitDefData*)entry->data;
  u8* unitArr;
  int unitSupporterCount;
  int changeCount = entry->size - REW_ENTRY_BASESIZE;
  
  // Check if unit died.
  if (entry->flags == REW_UNITDIED_CLEARED) {
    // Unit died and got cleared.
    
    // Clear unit.
    unit = GetUnit(gBmMapUnit[unitDefData->yPosition][unitDefData->xPosition]);
    if (unit != NULL) {
      
      // Mark unit slot as available.
      unit->pCharacterData = NULL;
    }
    
    // Data after REW_UnitDefData is REW_UnitChangeData.
    unitChangeData = (struct REW_UnitChangeData*)(entry->data + REW_ENTRY_UNITDEFDATA_SIZE);
    
    // REW_UnitDefData are not unitChangeData, so remove from changeCount.
    changeCount -= REW_ENTRY_UNITDEFDATA_SIZE;
    
  } else if ((entry->flags & REW_UNITDIED_NOCLEAR) == REW_UNITDIED_NOCLEAR) {
    // Unit died but did not get cleared.
    
    unit = GetUnit(entry->flags & ~REW_UNITDIED_NOCLEAR);
    
    // Clear supports.
    InitUnitsupports(unit);
    
    // Data after supports is REW_UnitChangeData.
    unitSupporterCount = GetUnitSupporterCount(unit);
    unitChangeData = (struct REW_UnitChangeData*)(entry->data + unitSupporterCount);
    
    // support array is not unitChangeData, so remove from changeCount.
    changeCount -= unitSupporterCount;
  } else if (!UNIT_IS_VALID(unit)) {
    
    // Could not find unit.
    return;
  }
  
  s8 xPrev = unit->xPos;
  s8 yPrev = unit->yPos;
  changeCount /= 2;         // Change is offs and diff, so size / 2.
  
  // Redo changes applied to unit due to combat.
  unitArr = (u8*)unit;
  for (int i = 0; i < changeCount; i++) {
    
    if (unitChangeData[i].offs < REW_UNITSIZE) {
      
      // If unit is riding ballista, alter relevant trap struct.
      if (unitChangeData[i].offs == REW_UNITOFFS_BALLISTA_ID) {
        trap = GetTrap(unit->ballistaIndex);
        
        if (GetUnitCurrentHp(unit) == 0)
          ClearBallistaOccupied(trap);
        
        trap->xPos = unit->xPos;
        trap->yPos = unit->yPos;
      }
      
      // Redo generic changes applied to unit due to combat.
      unitArr[unitChangeData[i].offs] += unitChangeData[i].diff;
      
    } else if (unitChangeData[i].offs < (REW_UNITOFFS_BWL + REW_BWLSIZE)) {
      
      // Redo BWL-data change.
      ((u8*)GetPidStats(unit->pCharacterData->number))[unitChangeData[i].offs - REW_UNITOFFS_BWL] += unitChangeData[i].diff;
    
    } else if (unitChangeData[i].offs == REW_UNITOFFS_BALLISTA_USES) {
      
      // Redo/Decr. ballista uses.
      GetTrap(unit->ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES] += unitChangeData[i].diff;
    }
  }
  
  // Move unit back to their position after they finished combat.
  // If unit died this ends up setting and then clearing the same location.
  gBmMapUnit[unit->yPos][unit->xPos] = unit->index;
  gBmMapUnit[yPrev][xPrev] = 0;
}

// Returns updated version of what bu's BWL data would be after battle.
struct UnitUsageStats REW_applyBWLChanges(struct BattleUnit* bu) {
  struct UnitUsageStats* bwlPre = GetPidStats(bu->unit.pCharacterData->number);
  struct UnitUsageStats bwlPost;
  int bwlVal, battleMapType;
  
  // No BWL? We're done here.
  if (bwlPre == NULL)
    return bwlPost;
  
  // Make a copy of BWL and alter it to reflect situation post-combat.
  CpuCopy16(bwlPre, &bwlPost, REW_BWLSIZE);
  
  // Is target an obstacle? No BWL changes for you.
  if (!gBattleTarget.unit.index)
    return bwlPost;
  
  // expGain.
  // NPC and enemy expGain is tracked,
  // granted they don't gain exp in vanilla.
  if (bu->expGain) {
    bwlVal = bwlPost.expGained + bu->expGain;
    if (bwlVal > 4000)
      bwlVal = 4000;
    bwlPost.expGained = bwlVal;
  }
  
  // battleAmt.
  // Only allies are tracked.
  if (FACTION_BLUE == UNIT_FACTION(&bu->unit)) {
    bwlVal = bwlPost.battleAmt + 1;
    if (bwlVal > 4000)
      bwlVal = 4000;
    bwlPost.battleAmt = bwlVal;
  }
  
  // lossAmt.
  // Vanilla doesn't rewind lossAmt even when
  // restarting the chapter a unit died in.
  // To be consistent with that spirit, we also don't rewind
  // lossAmt even when the player rewinds to before the unit died.
  
  // deathSkirm, deathLoc, deathTurn, killerPid, deathCause.
  // We do track and rewind these though.
  // Based on PidStatsRecordDefeatInfo, 0x80A4684.
  // NPC and enemies defeats are also tracked if they have BWL
  // as evidenced from KillUnitOnCombatDeath, 08032728.
  if (((gBattleActor.unit.index == bu->unit.index) &&
       (GetUnitCurrentHp(&gBattleActor.unit) == 0)) ||
      ((gBattleTarget.unit.index == bu->unit.index) &&
       (GetUnitCurrentHp(&gBattleTarget.unit) == 0))) {      // Unit was killed.
    
    battleMapType = GetBattleMapKind();
  
    switch (battleMapType) {
      case BATTLEMAP_KIND_SKIRMISH:
        bwlPost.deathSkirm = true;
        bwlPost.deathLoc = gGMData.units[0].location;
        break;

      case BATTLEMAP_KIND_STORY:
      case BATTLEMAP_KIND_DUNGEON:
      default:
        bwlPost.deathSkirm = false;
        bwlPost.deathLoc = gPlaySt.chapterIndex;
        break;
    }
    
    bwlPost.deathTurn = gPlaySt.chapterTurnNumber;
    bwlPost.killerPid = gBattleActor.unit.index == bu->unit.index ?
                        gBattleTarget.unit.pCharacterData->number :
                        gBattleActor.unit.pCharacterData->number;
    bwlPost.deathCause = DEFEAT_CAUSE_COMBAT;
  }
  
  // winAmt.
  // Only allies are tracked.
  if (FACTION_BLUE == UNIT_FACTION(&bu->unit)) {
    if (((gBattleActor.unit.index == bu->unit.index) &&
         (GetUnitCurrentHp(&gBattleTarget.unit) == 0)) ||
        ((gBattleTarget.unit.index == bu->unit.index) &&
         (GetUnitCurrentHp(&gBattleActor.unit) == 0))) {       // Unit killed someone.
      
      if (bwlPost.winAmt < 1000)
        bwlPost.winAmt++;
    }
  }
  
  return bwlPost;
}

// Store unit's changes resulting from combat which unit survived.
//
// REW_RewindEntry.data[] is an
// array of REW_UnitChangeData which are byte-pairs of the form:
//  - byte offset. Apply diff to Unit + this offset.
//  - byte diff. Subtract diff from offset when undoing, add when redoing.
void REW_storeCombatData(struct Unit* unit,
                         struct BattleUnit* bu,
                         u32 postCombatStateMask,
                         s8 xPrev,
                         s8 yPrev,
                         struct REW_RewindSequence* rewindSeq,
                         struct REW_RewindEntry* rewindEntry) {
  struct Unit buCopy;
  struct UnitUsageStats* bwlPre;
  struct UnitUsageStats bwlPost;
  u8* unitPre = (u8*)unit;
  u8* unitPost = (u8*)&buCopy;
  u8 diff;
  int i;
  int changeIdx = 0;
  
  // Unit survived, indicate by setting flags to unitID.
  rewindEntry->flags = unit->index;
  
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
  
  //  - unitState postCombat.
  buCopy.state |= postCombatStateMask;
  
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
  
  //  - BWL changes.
  bwlPre = GetPidStats(bu->unit.pCharacterData->number);
  if (bwlPre != NULL) {
    bwlPost = REW_applyBWLChanges(bu);
    
    for (i = 0; i < REW_BWLSIZE; i++) {
      diff = ((u8*)(&bwlPost))[i] - ((u8*)bwlPre)[i];
      if (diff) {
        unitChangeData[changeIdx].offs = REW_UNITOFFS_BWL + i;
        unitChangeData[changeIdx].diff = diff;
        changeIdx += 1;
      }
    }
  }
  
  //  - Ballista uses. BattleApplyBallistaUpdates, 0x802C300.
  if (buCopy.ballistaIndex != 0 && bu->weapon != 0) {
    diff = GetItemUses(bu->weapon) - GetTrap(buCopy.ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES];
    if (diff) {
      unitChangeData[changeIdx].offs = REW_UNITOFFS_BALLISTA_USES;
      unitChangeData[changeIdx].diff = diff;
      changeIdx += 1;
    }
  }
  
  // Set entry and corresponding sequence sizes.
  rewindEntry->size = REW_ENTRY_BASESIZE + REW_ENTRY_UNITCHANGEDATA_BASESIZE + changeIdx * 2;
  if (rewindSeq->size == 0) { rewindSeq->size = REW_SEQUENCE_BASESIZE; }
  rewindSeq->size += rewindEntry->size;
  REW_alignSequence(rewindSeq);
}

// Store unit's changes resulting from combat in which the unit died.
// We re-load the unit and track all the data that differs
// from the current unit before they get cleared.
//
// REW_RewindEntry.data[] contains
//  - an instance of REW_UnitDeathData. This will form
//    the unitDefinition from which unit will be loaded.
//  - an array of REW_UnitChangeData. This will track the data
//    that differs between loaded unit and unit to be cleared.
void REW_storeCombatDataDead(struct Unit* unit,
                             struct BattleUnit* bu,
                             u32 postCombatStateMask,
                             s8 xPrev,
                             s8 yPrev,
                             struct REW_RewindSequence* rewindSeq,
                             struct REW_RewindEntry* rewindEntry) {
  struct UnitUsageStats* bwlPre;
  struct UnitUsageStats bwlPost;
  int i, unitSupporterIndex, unitSupporterCount;
  int changeIdx = 0;
  u8 diff;
  struct Unit referenceUnit;
  struct Unit* supporterUnit;
  struct REW_UnitDefData* unitDefData = (struct REW_UnitDefData*)rewindEntry->data;
  u8* supports = (u8*)rewindEntry->data;
  struct REW_UnitChangeData* unitChangeData;
  
  // Confirm unit that died will be cleared from UnitArrray.
  // Based on UnitKill, 080183FC.
  if ((UNIT_FACTION(unit) == FACTION_BLUE) && (!UNIT_IS_PHANTOM(unit))) {
    
    // Unit won't get cleared.
    rewindEntry->flags = unit->index | REW_UNITDIED_NOCLEAR;
    
    // Track supports. These will be cleared post-death.
    unitSupporterCount = GetUnitSupporterCount(unit);
    for (i = 0; i < unitSupporterCount; i++) {
      
      supporterUnit = GetUnitSupporterUnit(unit, i);
      if (!supporterUnit)
        continue;
      
      unitSupporterIndex = GetUnitSupporterNum(supporterUnit, unit->pCharacterData->number);
      supports[i] = supporterUnit->supports[unitSupporterIndex];
    }
    
    // Copy unit.
    CpuCopy32(unit, &referenceUnit, REW_UNITSIZE);

    // Apply these changes, which will be applied postcombat, to the referenceUnit.
    referenceUnit.state |= postCombatStateMask;
    
    // Remove ballista if unit is riding one.
    referenceUnit.state &= ~US_IN_BALLISTA;
    referenceUnit.ballistaIndex = 0;
    
    // Set unitChangeData to be after supports.
    unitChangeData = (struct REW_UnitChangeData*)((u32)supports + unitSupporterCount);
    
    // Set initial entry size.
    rewindEntry->size = REW_ENTRY_BASESIZE +
                        unitSupporterCount +
                        REW_ENTRY_UNITCHANGEDATA_BASESIZE;
    
  } else {
    
    // Unit will get cleared.
    rewindEntry->flags = REW_UNITDIED_CLEARED;
    
    // Build unitDefData.
    unitDefData->charIndex =          unit->pCharacterData->number;
    unitDefData->classIndex =         unit->pClassData->number;
    unitDefData->itemDrop =           ((unit->state / US_DROP_ITEM) & 1);
    unitDefData->allegiance =         (unit->index) >> 6;
    unitDefData->level =              unit->level & 0x1F;
    unitDefData->xPosition =          xPrev;
    unitDefData->yPosition =          yPrev;
    
    // Load unit from unitDefData.
    REW_loadUnit(&referenceUnit, unitDefData);
    
    // Copy over differences we don't want to track.
    referenceUnit.exp = 0xFF;               // non-blue and phantom units don't gain exp.
    referenceUnit.index = unit->index;      // Don't alter unit index in gUnitArray.
                                            // Unit might be loaded in different slot, that's okay.
    referenceUnit.pMapSpriteHandle = unit->pMapSpriteHandle;   // Need a new one when reloading.
    
    // Set unitChangeData to after unitDefData
    unitChangeData = (struct REW_UnitChangeData*)((u32)unitDefData + (u32)REW_ENTRY_UNITDEFDATA_SIZE);
    
    // Set initial entry size.
    rewindEntry->size = REW_ENTRY_BASESIZE +
                        REW_ENTRY_UNITDEFDATA_SIZE +
                        REW_ENTRY_UNITCHANGEDATA_BASESIZE;
  }
  
  // Now store changes of unit.
  //  - Generic changes.
  u8* unit1 = (u8*)&referenceUnit;
  u8* unit2 = (u8*)unit;

  for (i = 0; i < REW_UNITSIZE; i++) {
    diff = unit1[i] - unit2[i];
    
    if (diff) {
      unitChangeData[changeIdx].offs = i;
      unitChangeData[changeIdx].diff = diff;
      changeIdx += 1;
    }
  }
  
  //  - BWL changes.
  bwlPre = GetPidStats(unit->pCharacterData->number);
  if (bwlPre != NULL) {
    bwlPost = REW_applyBWLChanges(bu);
    
    for (i = 0; i < REW_BWLSIZE; i++) {
      diff = ((u8*)(&bwlPost))[i] - ((u8*)bwlPre)[i];
      if (diff) {
        unitChangeData[changeIdx].offs = REW_UNITOFFS_BWL + i;
        unitChangeData[changeIdx].diff = diff;
        changeIdx += 1;
      }
    }
  }
  
  //  - Ballista uses. BattleApplyBallistaUpdates, 0x802C300.
  if (unit->ballistaIndex != 0 && bu->weapon != 0) {
    diff = GetItemUses(bu->weapon) - GetTrap(unit->ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES];
    if (diff) {
      unitChangeData[changeIdx].offs = REW_UNITOFFS_BALLISTA_USES;
      unitChangeData[changeIdx].diff = diff;
      changeIdx += 1;
    }
  }
  
  // Finish setting entry size and set corresponding sequence size.
  rewindEntry->size += changeIdx * 2;
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
  
  if (gBattleActor.unit.curHP == 0) {
    // TODO handle death.
    //  -- PidStatsRecordBattleRes, record win if actor is blue.
    //  -- Dead enemies get cleared from Unit* array.
    //  -- TryRemoveUnitFromBallista
    //  - Item drop
    //  - Rescue drop

    // Unset this value. Unit isn't hidden before combat,
    // but is hidden right now due to MU taking the place of standingSprite.
    // Unit will also be hidden post-combat (due to dying), so we need to
    // unset this bit to track that difference.
    actor->state &= ~US_HIDDEN;

    REW_storeCombatDataDead(actor,
                            &gBattleActor,
                            US_HIDDEN | US_UNSELECTABLE | US_DEAD,
                            (s8)gActiveUnitMoveOrigin.x,
                            (s8)gActiveUnitMoveOrigin.y,
                            rewindSeq,
                            rewindEntry);
    
    // Re-set this value.
    actor->state |= US_HIDDEN;
    
  } else {
    REW_storeCombatData(actor,
                        &gBattleActor,
                        US_HIDDEN | US_UNSELECTABLE,
                        (s8)gActiveUnitMoveOrigin.x,
                        (s8)gActiveUnitMoveOrigin.y,
                        rewindSeq,
                        rewindEntry);
  }
  
  // Target.
  rewindEntry = REW_createSeqEntry(rewindSeq);
  
  if (target) {
    rewindEntry->diffType = UNIT_ACTION_COMBAT;   //  TODO Incorporate deaths and/or other flags.
    
    if (gBattleTarget.unit.curHP == 0) {
      // TODO handle death.
      //  -- PidStatsRecordBattleRes, record loss if target is blue.
      //  -- Dead enemies get cleared from Unit* array.
      //  -- TryRemoveUnitFromBallista
      //  - Item drop
      //  - Rescue drop
      
      REW_storeCombatDataDead(target,
                              &gBattleTarget,
                              US_HIDDEN | US_DEAD,
                              target->xPos,
                              target->yPos,
                              rewindSeq,
                              rewindEntry);
    } else {
      REW_storeCombatData(target,
                          &gBattleTarget,
                          0,
                          target->xPos,
                          target->yPos,
                          rewindSeq,
                          rewindEntry);
    }
  } else  {
    // Obstacle.
    struct Trap* trap = GetTrapAt(gBattleTarget.unit.xPos, gBattleTarget.unit.yPos);
    
    rewindEntry->diffType = REW_ACTION_BREAK;   // Snags & walls.
    rewindEntry->flags = 0;
    
    // If terrain is wall, do nothing, if snag, orr 1 with flags.
    if (gBmMapTerrain[gBattleTarget.unit.yPos][gBattleTarget.unit.xPos] == REW_SNAG_ID)
      rewindEntry->flags |= REW_OBSTACLE_SNAG;
    
    rewindEntry->size = REW_ENTRY_BASESIZE;
    
    struct Trap* trapData = (struct Trap*)rewindEntry->data;
    trapData->xPos = trap->xPos;
    trapData->yPos = trap->yPos;
    trapData->type = trap->type;
    trapData->extra = gBattleTarget.unit.curHP - trap->extra;
    
    rewindEntry->size += REW_ENTRY_OBSTACLE_BASESIZE;
    rewindSeq->size += rewindEntry->size;
    REW_alignSequence(rewindSeq);
  }
}