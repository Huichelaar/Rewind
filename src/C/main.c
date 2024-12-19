#include <stdio.h>
#include "main.h"
#include "menu/menu.c"
#include "save/save.c"


/*
// Create a new RewindEntry, append it to the end of small buffer.
// NOTE: this routine doesn't update the rewind buffer's size
// variable, this needs to updated separately.
struct REW_RewindEntry* REW_createBufferEntry() {
  
  // 8 is size of .size and .end ptr attributes of RewindBuffer.
  u32 addr = (u32)REW_rewindBufferSmall + REW_rewindBufferSmall->size + 8;
  struct REW_RewindEntry* rewindEntry = (struct REW_RewindEntry*)addr;
  
  if (REW_rewindBufferSmall->end != NULL) {
    REW_rewindBufferSmall->end->next = rewindEntry;
    rewindEntry->prev = REW_rewindBufferSmall->end;
  } else {
    rewindEntry->prev = NULL;
  }
  rewindEntry->next = NULL;
  REW_rewindBufferSmall->end = rewindEntry;
  REW_rewindBufferSmall->size += 12;    // 12 is size of entry minus the data.
  
  return rewindEntry;
}
*/

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
  u16 size = (*(u16*)&rewindEntry->data + 1) * 2;
  int align = size & 3;
  
  // Pad out size until it's word aligned;
  // Entries are always word-aligned.
  if (align)
    size += 4 - align;
   
  // Add 8 to account for attributes other than variably-sized data.
  return (struct REW_RewindEntry*)((u32)rewindEntry + 8 + size);
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
  int changeIdx = 0, align;
  
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
  combatData->size = changeIdx;       // We don't include size of size attr, merely data attr.
  
  // Increase rewind sequence's size accordingly.
  // Each change consists of two params, offs & diff, 
  // thus we multiply changeIdx by 2.
  rewindSeq->size += 2 + changeIdx * 2;
  
  // Make sure the rewind entry's size is a multiple of 4.
  // We do this to ensure the next entry is word-aligned.
  align = rewindSeq->size & 3;
  if (align)
    rewindSeq->size += 4 - align;
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
      ;
    } else {
      REW_storeCombatData(target, &gBattleTarget, rewindSeq, rewindEntry);
    }
  } else  {
    // TODO obstacle
    ;
  }
}