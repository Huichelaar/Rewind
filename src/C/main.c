#include <stdio.h>
#include "main.h"
#include "menu/menu.c"
#include "save/save.c"

// Clears given rewind sequence by setting size value to 0.
void REW_clearRewindSeq(struct REW_RewindSequence* sequence) {
  sequence->size = 0;
}

// 'creates' a new rewindEntry by returning the
//  address of the end of the given sequence.
struct REW_RewindEntry* REW_createSeqEntry(struct REW_RewindSequence* seq) {
  
  // Set sequence size to base size if sequence is empty.
  if (seq->size == 0) { seq->size = REW_SEQUENCE_BASESIZE; }
  
  // 4 is size of .sizePrev and .size attributes of REW_curSequence.
  u32 addr = (u32)seq + seq->size;
  return (struct REW_RewindEntry*)addr;
}

// Given a rewind-sequence, return the next sequence of the buffer.
struct REW_RewindSequence* REW_nextSequence(struct REW_RewindSequence* sequence) {
  return (struct REW_RewindSequence*)((u32)(sequence) + 
         (u32)sequence->size);
}

// Given a rewind-sequence, return the previous sequence of the buffer.
struct REW_RewindSequence* REW_prevSequence(struct REW_RewindSequence* sequence) {
  return (struct REW_RewindSequence*)((u32)(sequence) - 
         (u32)sequence->sizePrev);
}

// Given a rewind-entry, return the next entry of the sequence.
struct REW_RewindEntry* REW_nextEntry(struct REW_RewindEntry* entry) {
  u16 size = entry->size;
  int align = size & 3;
  
  // Pad out size until it's word aligned;
  // Entries are always word-aligned.
  if (align)
    size += 4 - align;
   
  // Add REW_ENTRY_BASESIZE to account for attributes other than variably-sized data.
  return (struct REW_RewindEntry*)((u32)entry + size);
}

// Given a rewind-sequence and an entry, find the preceding entry in this sequence.
struct REW_RewindEntry* REW_prevEntry(struct REW_RewindSequence* seq, struct REW_RewindEntry* entry) {
  struct REW_RewindEntry* prev = seq->entry;
  struct REW_RewindEntry* cur = REW_nextEntry(prev);
  
  // Return NULL if there is no previous entry.
  if (prev == entry)
    return NULL;
  
  // Find current entry.
  while (cur != entry) {
    prev = cur;
    cur = REW_nextEntry(cur);
  }
  
  // Return previous entry.
  return prev;
}

// Given a rewind-sequence, return the last entry of the sequence.
struct REW_RewindEntry* REW_lastEntry(struct REW_RewindSequence* seq) {
  struct REW_RewindEntry* prev = seq->entry;
  struct REW_RewindEntry* cur = seq->entry;
  u32 nextSeq = (u32)REW_nextSequence(seq);
  
  // Find final entry.
  while ((u32)cur < nextSeq) {
    prev = cur;
    cur = REW_nextEntry(cur);
  }
  
  // Return final entry.
  return prev;
}

// Make sure the rewind sequence's size is a multiple of 4.
// We do this to ensure the next entry is word-aligned.
void REW_alignSequence(struct REW_RewindSequence* sequence) {
  int align = sequence->size & 3;
  if (align)
    sequence->size += 4 - align;
}

// Given phase, determine next phase.
// Also increment turn if phase change would do so.
// Also indicate if next phase is skipped.
u8 REW_nextPhase(u8 phase, u8* turn, u8* skip) {
  u8 nextPhase = FACTION_BLUE;
  
  switch(phase) {
    case FACTION_BLUE:
      nextPhase = FACTION_RED;
      break;
    case FACTION_RED:
      nextPhase = FACTION_GREEN;
      break;
    case FACTION_GREEN:
    default:
      *turn += 1;
  }
  
  if (GetPhaseAbleUnitCount(nextPhase) == 0)
    *skip = true;
  
  return nextPhase;
}

// Set up phase change sequence in rewind buffer.
// Track stats that might change due to phase change.
void REW_actionPrePhaseChange() {
  int unitID;
  u8 nextPhase, turnIncr = 0, skip = false;
  struct REW_RewindEntry* rewindEntry;
  u8* phaseChangeBuffer = (u8*)REW_rewindBuffer;    // Tracks all units' changes
  
  // Empty phaseChangeBuffer.
  CpuFastFill(0, phaseChangeBuffer, 0x20 * 0x40);
  
  // Create new entry.
  nextPhase = REW_nextPhase(gChapterData.currentPhase, &turnIncr, &skip);
  rewindEntry = REW_createSeqEntry(REW_curSequence);
  rewindEntry->diffType = REW_ACTION_PHASECHANGE;
  
  // Setup flags.
  rewindEntry->flags = 0;
  rewindEntry->flags |= (gChapterData.currentPhase >> 6);
  rewindEntry->flags |= (nextPhase >> 4);
  if (turnIncr) { rewindEntry->flags |= REW_PHASECHANGE_TURNINCR; }
  if (skip) { rewindEntry->flags |= REW_PHASECHANGE_SKIPPHASE; }
  
  // Track unit stats that might change during phase change.
  for (unitID = nextPhase + 1; unitID < nextPhase + 0x40; unitID++) {
    
    // Ignore unit if they aren't valid.
    struct Unit* unit2 = GetUnit(unitID);
    if (!UNIT_IS_VALID(unit2))
      continue;
    
    u8* unit = (u8*)unit2;
    u8 agnosticUnitID = unitID & 0x3F;      // Remove faction to use ID as array index.
    
    // Track unitstate changes, mainly for US_UNSELECTABLE, US_HAS_MOVED, US_HAS_MOVED_AI.
    phaseChangeBuffer[agnosticUnitID * 0x20 + 0] = 0xC;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 1] = unit[0xC];
    phaseChangeBuffer[agnosticUnitID * 0x20 + 2] = 0xD;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 3] = unit[0xD];
    
    // Track unit hp change (healtiles, poison & gorgon egg hatching can change HP).
    phaseChangeBuffer[agnosticUnitID * 0x20 + 4] = 0x13;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 5] = unit[0x13];
    
    // Track status, torch barrier.
    phaseChangeBuffer[agnosticUnitID * 0x20 + 6] = 0x30;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 7] = unit[0x30];
    phaseChangeBuffer[agnosticUnitID * 0x20 + 8] = 0x31;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 9] = unit[0x31];
    
    // Track supports. These can change during phase change.
    phaseChangeBuffer[agnosticUnitID * 0x20 + 10] = 0x32;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 11] = unit[0x32];
    phaseChangeBuffer[agnosticUnitID * 0x20 + 12] = 0x33;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 13] = unit[0x33];
    phaseChangeBuffer[agnosticUnitID * 0x20 + 14] = 0x34;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 15] = unit[0x34];
    phaseChangeBuffer[agnosticUnitID * 0x20 + 16] = 0x35;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 17] = unit[0x35];
    phaseChangeBuffer[agnosticUnitID * 0x20 + 18] = 0x36;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 19] = unit[0x36];
    phaseChangeBuffer[agnosticUnitID * 0x20 + 20] = 0x37;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 21] = unit[0x37];
    phaseChangeBuffer[agnosticUnitID * 0x20 + 22] = 0x38;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 23] = unit[0x38];
    
    // TODO handle BWL here as well.
    // ClearActiveFactionGrayedStates does something with BWL after all.
    // Room for four more byte changes before having to upgrade RAM.
    // Fill with index for now.
    phaseChangeBuffer[agnosticUnitID * 0x20 + 24] = 0xB;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 25] = unit[0xB];
    phaseChangeBuffer[agnosticUnitID * 0x20 + 26] = 0xB;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 27] = unit[0xB];
    phaseChangeBuffer[agnosticUnitID * 0x20 + 28] = 0xB;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 29] = unit[0xB];
    phaseChangeBuffer[agnosticUnitID * 0x20 + 30] = 0xB;
    phaseChangeBuffer[agnosticUnitID * 0x20 + 31] = unit[0xB];
  }
  
  // Set entry and corresponding sequence sizes.
  rewindEntry->size = REW_ENTRY_BASESIZE + REW_ENTRY_PHASECHANGEDATA_BASESIZE;
  if (REW_curSequence->size == 0) { REW_curSequence->size = REW_SEQUENCE_BASESIZE; }
  REW_curSequence->size += rewindEntry->size;
  REW_alignSequence(REW_curSequence);
}

// Fill up phase change sequence in rewind buffer
// with stats that changed during phase change.
void REW_actionPostPhaseChange() {
  struct REW_RewindEntry* entry = REW_curSequence->entry;
  u8* phaseChangeBuffer = (u8*)REW_rewindBuffer;    // Tracks all units' changes
  u8 faction, diff;
  int unitID, i, j, offs, newEntry;
  
  // First entry in rewind sequence has to be a phaseChange entry.
  if ((REW_curSequence->size == 0) ||
      (entry->diffType != REW_ACTION_PHASECHANGE))
    return;
  
  faction = (entry->flags & REW_PHASE_POST_MASK) << 4;
  for (unitID = faction + 1; unitID < faction + 0x40; unitID++) {
    
    // Ignore unit if they aren't valid.
    struct Unit* unit2 = GetUnit(unitID);
    if (!UNIT_IS_VALID(unit2))
      continue;
    
    // Store changes if unit underwent any.
    u8* unit = (u8*)unit2;
    u8 agnosticUnitID = unitID & 0x3F;      // Remove faction to use ID as array index.
    newEntry = false;                       // Flag tracking if we still need to make new entry.
    struct REW_UnitChangeData* unitChangeData;
    for (i = 0; i < 0x20; i += 2) {
      offs =              phaseChangeBuffer[agnosticUnitID * 0x20 + i];
      diff = unit[offs] - phaseChangeBuffer[agnosticUnitID * 0x20 + i + 1];
      
      // Unit underwent a change.
      if (diff) {
        
        // Create new entry if we hadn't yet.
        if (!newEntry) {
          newEntry = true;
          entry = REW_nextEntry(entry);
          entry->diffType = REW_CONSEQ_UNITCHANGE;
          entry->flags = unitID;
          entry->size = REW_ENTRY_BASESIZE;
          REW_curSequence->size += REW_ENTRY_BASESIZE;
          unitChangeData = (struct REW_UnitChangeData*)entry->data;
          j = 0;
        }
        
        // Store unit change in rewind data.
        unitChangeData[j].offs = offs;
        unitChangeData[j].diff = diff;
        entry->size += 2;
        REW_curSequence->size += 2;
        j++;
      }
    }
  }
  REW_alignSequence(REW_curSequence);
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