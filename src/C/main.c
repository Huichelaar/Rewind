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
struct REW_RewindEntry* REW_createSeqEntry(struct REW_RewindSequence* sequence) {
  
  // 4 is size of .sizePrev and .size attributes of REW_curSequence.
  u32 addr = (u32)sequence + sequence->size + 4;
  return (struct REW_RewindEntry*)addr;
}

// Given a rewind-entry, return the next entry of the sequence.
struct REW_RewindEntry* REW_nextEntry(struct REW_RewindEntry* rewindEntry) {
  u16 size = (*(u16*)&rewindEntry->data + 2);
  int align = size & 3;
  
  // Pad out size until it's word aligned;
  // Entries are always word-aligned.
  if (align)
    size += 4 - align;
   
  // Add 8 to account for attributes other than variably-sized data.
  return (struct REW_RewindEntry*)((u32)rewindEntry + 8 + size);
}

// Given a rewind-sequence, return the next sequence of the buffer.
struct REW_RewindSequence* REW_nextSequence(struct REW_RewindSequence* sequence) {
  return (struct REW_RewindSequence*)((u32)(sequence) + 
         (u32)sequence->size +
         4);
}

// Given a rewind-sequence, return the previous sequence of the buffer.
struct REW_RewindSequence* REW_prevSequence(struct REW_RewindSequence* sequence) {
  return (struct REW_RewindSequence*)((u32)(sequence) - 
         (u32)sequence->sizePrev -
         4);
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
void REW_seqPhaseChange() {
  int i, unitID;
  u8 nextPhase, turnIncr = 0, skip = false;
  struct REW_RewindEntry* rewindEntry;
  struct REW_RewindPhaseChangeData* phaseChangeData;
  
  // Create new entry.
  nextPhase = REW_nextPhase(gChapterData.currentPhase, &turnIncr, &skip);
  rewindEntry = REW_createSeqEntry(REW_curSequence);
  rewindEntry->diffType = REW_SEQUENCE_PHASECHANGE;
  
  phaseChangeData = (struct REW_RewindPhaseChangeData*)rewindEntry->data;
  phaseChangeData->flags = 0;
  if (turnIncr) { phaseChangeData->flags |= REW_PHASECHANGE_TURNINCR; }
  if (skip) { phaseChangeData->flags |= REW_PHASECHANGE_SKIPPHASE; }
  phaseChangeData->phasePre = gChapterData.currentPhase;
  phaseChangeData->phasePost = nextPhase;
  
  // Track greyed out units prior to phase change.
  i = 0;
  for (unitID = gChapterData.currentPhase + 1; unitID < gChapterData.currentPhase + 0x40; unitID++) {
    struct Unit* unit = GetUnit(unitID);
    
    if (UNIT_IS_VALID(unit) && (unit->state & (US_UNSELECTABLE))) {
      phaseChangeData->unitIDs[i] = unitID;
      i++;
    }
  }
  phaseChangeData->size = i + 3;
  REW_curSequence->size += 13 + i;
  REW_alignSequence(REW_curSequence);
}

// Store unit's changes resulting from combat.
// REW_RewindEntry.data[] takes this form:
//  - First two bytes form an unsigned short indicating size of data (including this short) in bytes.
//  - Remaining bytes form pairs of:
//    - byte offset. Apply diff to Unit + this offset.
//    - byte diff. Subtract diff from offset when undoing, add when redoing.
void REW_storeCombatData(struct Unit* unit, struct BattleUnit* bu, struct REW_RewindSequence* rewindSeq, struct REW_RewindEntry* rewindEntry) {
  struct Unit buCopy;
  u8* unitPre = (u8*)unit;
  u8* unitPost = (u8*)&buCopy;
  u8 unitsize = 0x48;
  u8 diff = 0;
  int i;
  int changeIdx = 0;
  
  // Apply corrections first. Based on UpdateUnitFromBattle, 0x802C1EC.
  CpuCopy16(bu, &buCopy, unitsize);
  
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
  for (i = 0; i < UNIT_ITEM_COUNT; ++i)
    buCopy.items[i] = bu->unit.items[i];
  UnitRemoveInvalidItems(&buCopy);
  
  // Now store changes of unit.
  struct REW_RewindCombatData* combatData = (struct REW_RewindCombatData*)rewindEntry->data;
  for (i = 0; i < unitsize; i++) {
    diff = unitPost[i] - unitPre[i];
    if (diff) {
      combatData->changes[changeIdx].offs = i;
      combatData->changes[changeIdx].diff = diff;
      changeIdx += 1;
    }
  }
  
  // Ballista changes. BattleApplyBallistaUpdates, 0x802C300.
  if (gBattleStats.config & BATTLE_CONFIG_BALLISTA) {
    diff = GetItemUses(bu->weapon) - GetTrap(buCopy.ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES];
    if (diff) {
      combatData->changes[changeIdx].offs = i;
      combatData->changes[changeIdx].diff = diff;
      changeIdx += 1;
    }
  }
  
  // BWL changes. TODO
  
  // Set entry's size.
  // Each change consists of two params, offs & diff, 
  // thus we multiply changeIdx by 2.
  combatData->size = changeIdx * 2;       // We don't include size of size attr, merely data attr.
  
  // Increase rewind sequence's size accordingly.
  // Each change consists of two params, offs & diff, 
  // thus we multiply changeIdx by 2.
  rewindSeq->size += 2 + changeIdx * 2;
  REW_alignSequence(rewindSeq);
}

// Store changes resulting from a combat action.
void REW_recordActionCombat() {
  struct REW_RewindSequence* rewindSeq = REW_curSequence;
  struct REW_RewindEntry* rewindEntry;
  struct Unit* actor  = GetUnit(gBattleActor.unit.index);
  struct Unit* target = GetUnit(gBattleTarget.unit.index);
  
  // Clear rewind sequence.
  REW_clearRewindSeq(rewindSeq);
  
  // Actor.
  rewindEntry = REW_createSeqEntry(rewindSeq);
  rewindEntry->diffType = UNIT_ACTION_COMBAT;
  rewindEntry->eventID = 0;
  rewindEntry->flags = 0;     //  TODO Incorporate deaths and/or other flags.
  rewindEntry->xPrev = (s8)gActiveUnitMoveOrigin.x;
  rewindEntry->yPrev = (s8)gActiveUnitMoveOrigin.y;
  rewindEntry->xCur = actor->xPos;    
  rewindEntry->yCur = actor->yPos;
  rewindSeq->size += 8;
  
  if (gBattleActor.unit.curHP == 0) {
    // TODO handle death.
    //  - TryRemoveUnitFromBallista
    //  - Item drop
    //  - Rescue drop
    //  - Dead enemies get cleared from Unit* array.
    ;
  } else {
    REW_storeCombatData(actor, &gBattleActor, rewindSeq, rewindEntry);
  }
  
  // Target.
  rewindEntry = REW_createSeqEntry(rewindSeq);
  rewindEntry->diffType = UNIT_ACTION_COMBAT;
  rewindEntry->eventID = 0;
  rewindEntry->flags = 0;     //  TODO Incorporate deaths and/or other flags.
  rewindEntry->xPrev = target->xPos;
  rewindEntry->yPrev = target->yPos;
  rewindEntry->xCur = target->xPos;
  rewindEntry->yCur = target->yPos;
  rewindSeq->size += 8;
  
  if (target) {
    if (gBattleTarget.unit.curHP == 0) {
      // TODO handle death.
      //  - TryRemoveUnitFromBallista
      //  - Item drop
      //  - Rescue drop
      //  - Dead enemies get cleared from Unit* array.
      ;
    } else {
      REW_storeCombatData(target, &gBattleTarget, rewindSeq, rewindEntry);
    }
  } else  {
    // TODO obstacle
    ;
  }
}