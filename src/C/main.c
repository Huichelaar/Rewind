#include <stdio.h>
#include "main.h"

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
u16 REW_recordCombatUnit(struct Unit* unit, struct BattleUnit* bu, struct REW_RewindEntry* rewindEntry, u16 offs) {
  struct Unit buCopy;
  u8* unitPre = (u8*)unit;
  u8* unitPost = (u8*)&buCopy;
  u8 unitsize = 0x48;
  u8 diff = 0;
  int i, j = offs;
  
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
      rewindEntry->data[j] = i;
      rewindEntry->data[j+1] = diff;
      j += 2;
    }
  }
  
  // Ballista changes. BattleApplyBallistaUpdates, 0x802C300.
  if (gBattleStats.config & BATTLE_CONFIG_BALLISTA) {
    diff = GetItemUses(bu->weapon) - GetTrap(buCopy.ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMUSES];
    if (diff) {
      rewindEntry->data[j] = i;
      rewindEntry->data[j+1] = diff;
      j += 2;
    }
  }
  
  // BWL changes. TODO
  
  return j;
}

// Store changes resulting from a combat action.
void REW_recordActionCombat() {
  u16 offs = 0;
  struct REW_RewindEntry* rewindEntry = REW_createBufferEntry();
  struct Unit* actor  = GetUnit(gBattleActor.unit.index);
  struct Unit* target = GetUnit(gBattleTarget.unit.index);
  
  rewindEntry->unitActionType = UNIT_ACTION_COMBAT;
  rewindEntry->extraParam[0] = 0;   // TODO Incorporate deaths
  rewindEntry->extraParam[1] = 0;   // and/or other flags.
  rewindEntry->extraParam[2] = 0;   // ^.
  
  if (actor->curHP == 0) {
    // TODO handle death.
      //  - TryRemoveUnitFromBallista
      //  - Item drop
      //  - Rescue drop
    ;
  } else {
    offs = REW_recordCombatUnit(actor, &gBattleActor, rewindEntry, offs);
  }
  
  if (target) {
    if (target->curHP == 0) {
      // TODO handle death.
      //  - TryRemoveUnitFromBallista
      //  - Item drop
      //  - Rescue drop
      ;
    } else {
      offs = REW_recordCombatUnit(target, &gBattleTarget, rewindEntry, offs);
    }
  } else  {
    // TODO obstacle
    ;
  }
}