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
  struct Unit* unit = GetUnit(entry->flags);     // TODO this doesn't work if unit died.
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
      ((u8*)GetPidStats(unit->pCharacterData->number))[unitChangeData[i].offs - REW_UNITOFFS_BWL] -= unitChangeData[i].diff;
    
    } else if (unitChangeData[i].offs == REW_UNITOFFS_BALLISTA) {
      
      // Undo/Incr. ballista uses.
      GetTrap(unit->ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES] -= unitChangeData[i].diff;
    }
  }
  
  // Move unit back to their position before they entered combat.
  // TODO, if unit died...
  gBmMapUnit[yPost][xPost] = 0;
  gBmMapUnit[unit->yPos][unit->xPos] = unit->index;
}

// Redo generic combat action.
void REW_redoCombat(struct REW_RewindEntry* entry) {
  struct Unit* unit = GetUnit(entry->flags);
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
      ((u8*)GetPidStats(unit->pCharacterData->number))[unitChangeData[i].offs - REW_UNITOFFS_BWL] += unitChangeData[i].diff;
    
    } else if (unitChangeData[i].offs == REW_UNITOFFS_BALLISTA) {
      
      // Redo/Decr. ballista uses.
      GetTrap(unit->ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES] += unitChangeData[i].diff;
    }
  }
  
  // Move unit back to their position after they finished combat.
  // TODO, clear unit if they died.
  gBmMapUnit[yPrev][xPrev] = 0;
  gBmMapUnit[unit->yPos][unit->xPos] = unit->index;
}

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
                         int ballista,
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
                             int ballista,
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
  struct UnitDefinition unitDef;
  struct REW_UnitDefData* unitDefData = (struct REW_UnitDefData*)rewindEntry->data;
  u8* supports = (u8*)rewindEntry->data;
  struct REW_UnitChangeData* unitChangeData;
  
  // Confirm unit that died will be cleared from UnitArrray.
  // Based on UnitKill, 080183FC.
  if ((UNIT_FACTION(unit) == FACTION_BLUE) && (!UNIT_IS_PHANTOM(unit))) {
    
    // Unit won't get cleared.
    rewindEntry->flags = REW_UNITDIED_NOCLEAR;
    
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

    // Apply these changes, which will be applied once unit dies, to the referenceUnit.
    referenceUnit.state |= US_DEAD | US_HIDDEN;
    
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
    
    // Build unitDefinition out of unitDefData.
    // TODO make separate function.
    unitDef.charIndex =       unitDefData->charIndex;
    unitDef.classIndex =      unitDefData->classIndex;
    unitDef.leaderCharIndex = 0;
    unitDef.autolevel =       0;
    unitDef.allegiance =      unitDefData->allegiance;
    unitDef.level =           unitDefData->level;
    unitDef.xPosition =       unitDefData->xPosition;
    unitDef.yPosition =       unitDefData->yPosition;
    unitDef.genMonster =      0;
    unitDef.itemDrop =        unitDefData->itemDrop;
    unitDef.unk_05_7 =        0;
    unitDef.extraData =       0;
    unitDef.redaCount =       0;
    unitDef.redas =           NULL;
    for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; i++) { unitDef.items[i] = 0; }
    for (i = 0; i < UDEF_AIIDX_MAX; i++) { unitDef.ai[i] = 0; }
    
    // Clear unit.
    CpuFill32(0, &referenceUnit, REW_UNITSIZE);
    
    // Load unit from unitDefinition.
    UnitInitFromDefinition(&referenceUnit, &unitDef);
    
    // Copy over differences we don't want to track.
    referenceUnit.exp = 0xFF;               // non-blue and phantom units don't gain exp.
    referenceUnit.index = unit->index;      // Don't alter unit index in gUnitArray.
                                            // Unit might be loaded in different slot, that's okay.
    referenceUnit.pMapSpriteHandle = unit->pMapSpriteHandle;   // Need a new one when reloading.
    
    // Set unitChangeData to after unitDefData
    unitChangeData = (struct REW_UnitChangeData*)((u32)unitDefData + (u32)REW_ENTRY_UNITDEFDATA_BASESIZE);
    
    // Set initial entry size.
    rewindEntry->size = REW_ENTRY_BASESIZE +
                        REW_ENTRY_UNITDEFDATA_BASESIZE +
                        REW_ENTRY_UNITCHANGEDATA_BASESIZE;
  }
  
  // Now store changes of unit.
  //  - Generic changes.
  u8* unit1 = (u8*)unit;
  u8* unit2 = (u8*)&referenceUnit;

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
    //  - PidStatsRecordBattleRes, record win if actor is blue.
    //  - TryRemoveUnitFromBallista
    //  - Item drop
    //  - Rescue drop
    //  - Dead enemies get cleared from Unit* array.
    
    REW_storeCombatDataDead(actor,
                            &gBattleActor,
                            gBattleStats.config & BATTLE_CONFIG_BALLISTA,
                            (s8)gActiveUnitMoveOrigin.x,
                            (s8)gActiveUnitMoveOrigin.y,
                            rewindSeq,
                            rewindEntry);
    
  } else {
    
    // Set this here to store this change which will happen post-battle.
    gBattleActor.unit.state |= US_UNSELECTABLE;
    
    REW_storeCombatData(actor,
                        &gBattleActor,
                        gBattleStats.config & BATTLE_CONFIG_BALLISTA,
                        (s8)gActiveUnitMoveOrigin.x,
                        (s8)gActiveUnitMoveOrigin.y,
                        rewindSeq,
                        rewindEntry);
    
    // Unset this again.
    gBattleActor.unit.state &= ~US_UNSELECTABLE;
  }
  
  // Target.
  rewindEntry = REW_createSeqEntry(rewindSeq);
  
  if (target) {
    rewindEntry->diffType = UNIT_ACTION_COMBAT;   //  TODO Incorporate deaths and/or other flags.
    
    if (gBattleTarget.unit.curHP == 0) {
      // TODO handle death.
      //  - PidStatsRecordBattleRes, record loss if target is blue.
      //  - TryRemoveUnitFromBallista
      //  - Item drop
      //  - Rescue drop
      //  - Dead enemies get cleared from Unit* array.
      
      REW_storeCombatDataDead(target,
                              &gBattleTarget,
                              false,                // FIXME, could target not be in ballista?
                              target->xPos,
                              target->yPos,
                              rewindSeq,
                              rewindEntry);
                         
    } else {
      
      REW_storeCombatData(target,
                          &gBattleTarget,
                          false,                   // FIXME, could target not be in ballista?
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