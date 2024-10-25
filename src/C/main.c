#include <stdio.h>
#include "main.h"
#include "menu/menu.c"

// Create a new RewindEntry, append it to the end of small buffer.
// NOTE: this routine doesn't update the rewind buffer's size
// variable, this needs to updated separately.
struct REW_RewindEntry* REW_createBufferEntry() {
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
  
  return rewindEntry;
}

// Store unit's changes resulting from combat.
// REW_RewindEntry.data[] takes this form:
//  - First two bytes form an unsigned short indicating size of data (including this short) in bytes.
//  - Remaining bytes form pairs of:
//    - byte offset. Apply diff to Unit + this offset.
//    - byte diff. Subtract diff from offset when undoing, add when redoing.
u16 REW_storeCombatEntry(struct Unit* unit, struct BattleUnit* bu, struct REW_RewindEntry* rewindEntry) {
  struct Unit buCopy;
  u8* unitPre = (u8*)unit;
  u8* unitPost = (u8*)&buCopy;
  u8 unitsize = 0x48;
  u8 diff = 0;
  int i;
  int offs = 2;
  
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
  for (i = 0; i < unitsize; i++) {
    diff = unitPost[i] - unitPre[i];
    if (diff) {
      rewindEntry->data[offs] = i;
      rewindEntry->data[offs+1] = diff;
      offs += 2;
    }
  }
  
  // Ballista changes. BattleApplyBallistaUpdates, 0x802C300.
  if (gBattleStats.config & BATTLE_CONFIG_BALLISTA) {
    diff = GetItemUses(bu->weapon) - GetTrap(buCopy.ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES];
    if (diff) {
      rewindEntry->data[offs] = i;
      rewindEntry->data[offs+1] = diff;
      offs += 2;
    }
  }
  
  // BWL changes. TODO
  
  *(u16*)rewindEntry->data = offs;
  
  return offs;
}

// Store changes resulting from a combat action.
void REW_recordActionCombat() {
  struct REW_RewindEntry* rewindEntry;
  struct Unit* actor  = GetUnit(gBattleActor.unit.index);
  struct Unit* target = GetUnit(gBattleTarget.unit.index);
  
  // Actor.
  rewindEntry = REW_createBufferEntry();
  rewindEntry->diffType = UNIT_ACTION_COMBAT;
  rewindEntry->extraParam = 0;      // TODO Incorporate deaths
  rewindEntry->x = actor->xPos;     // and/or other flags.
  rewindEntry->y = actor->yPos;
  
  if (actor->curHP == 0) {
    // TODO handle death.
      //  - TryRemoveUnitFromBallista
      //  - Item drop
      //  - Rescue drop
    ;
  } else {
    REW_storeCombatEntry(actor, &gBattleActor, rewindEntry);
  }
  
  // Target.
  rewindEntry = REW_createBufferEntry();
  rewindEntry->diffType = UNIT_ACTION_COMBAT;
  rewindEntry->extraParam = 0;      // TODO Incorporate deaths
  rewindEntry->x = target->xPos;    // and/or other flags.
  rewindEntry->y = target->yPos;
  
  if (target) {
    if (target->curHP == 0) {
      // TODO handle death.
      //  - TryRemoveUnitFromBallista
      //  - Item drop
      //  - Rescue drop
      ;
    } else {
      REW_storeCombatEntry(target, &gBattleTarget, rewindEntry);
    }
  } else  {
    // TODO obstacle
    ;
  }
}