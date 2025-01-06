#include <stdio.h>
#include "phaseChange.h"

// Undo phase change action.
void REW_undoPhaseChange(struct REW_RewindEntry* entry) {
  Unit* unit;
  
  // Set phase to phase prior to phase change.
  gChapterData.currentPhase = (entry->flags & REW_PHASE_PRE_MASK) << 6;
  
  // Decrement turn counter.
  if (entry->flags & REW_PHASECHANGE_TURNINCR)
    gChapterData.turnNumber--;
  
  // Set relevant units to unavailable.
  for (int i = 0; i < entry->size - REW_ENTRY_BASESIZE; i++) {
    unit = GetUnit(entry->data[i]);
    
    if (UNIT_IS_VALID(unit))
      unit->state |= US_UNSELECTABLE;
  }
}

// Redo phase change action.
void REW_redoPhaseChange(struct REW_RewindEntry* entry) {
  Unit* unit;
  
  // Set phase to phase after phase change.
  gChapterData.currentPhase = (entry->flags & REW_PHASE_POST_MASK) << 4;
  
  // Increment turn counter.
  if (entry->flags & REW_PHASECHANGE_TURNINCR)
    gChapterData.turnNumber++;
  
  // Set relevant units to available.
  for (int i = 0; i < entry->size - REW_ENTRY_BASESIZE; i++) {
    unit = GetUnit(entry->data[i]);
    
    if (UNIT_IS_VALID(unit))
      unit->state &= ~(US_UNSELECTABLE | US_HAS_MOVED);
  }
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

// Start phase change sequence.
// Track greyed out units.
void REW_actionPhaseChangeStart() {
  u8 nextPhase, turnIncr = 0, skip = false;
  int counter = 0, unitID, unitIDCurrFaction;
  struct Unit* unit;
  struct REW_RewindEntry* entry;
  
  // Create new entry.
  nextPhase = REW_nextPhase(gChapterData.currentPhase, &turnIncr, &skip);
  entry = REW_createSeqEntry(REW_curSequence);
  entry->diffType = REW_ACTION_PHASECHANGE;
  entry->size = REW_ENTRY_BASESIZE + REW_ENTRY_PHASECHANGEDATA_BASESIZE;
  
  // Setup flags.
  entry->flags = 0;
  entry->flags |= (gChapterData.currentPhase >> 6);
  entry->flags |= (nextPhase >> 4);
  if (turnIncr) { entry->flags |= REW_PHASECHANGE_TURNINCR; }
  if (skip) { entry->flags |= REW_PHASECHANGE_SKIPPHASE; }
  
  // Track current phase unit if they performed action during their phase.
  for (unitID = 1; unitID < 0x40; unitID++) {
    unitIDCurrFaction = unitID + gChapterData.currentPhase;
    
    // Track current phase unit if they performed action during their phase.
    unit = GetUnit(unitIDCurrFaction);
    if (UNIT_IS_VALID(unit)) {
      if (unit->state & US_UNSELECTABLE) {
        entry->data[counter] = unitIDCurrFaction;
        entry->size++;
        counter++;
      }
    }
  }
  
  // Set sequence size.
  REW_curSequence->size += entry->size;
  REW_alignSequence(REW_curSequence);
}

// Track support exp gains.
// Mimics ProcessTurnSupportExp 0x8028434,
// but adds exp gains to rewind data.
void REW_actionPhaseChangeSuppports() {
  int i, j, jMax, k, exp;
  struct REW_RewindEntry* entry;
  struct REW_UnitChangeData* unitChangeData;

  if (gChapterData.turnNumber == 1)
    return;

  if (gChapterData.chapterStateBits & 0x80)   // PLAY_FLAG_EXTRA_MAP
    return;

  for (i = 1; i < 0x40; i++) {
    struct Unit* unit = GetUnit(i);

    if (!UNIT_IS_VALID(unit))
      continue;

    if (unit->state & US_UNAVAILABLE)
      continue;

    if (GetUnitTotalSupportLevel(unit) >= REW_MAX_SIMULTANEOUS_SUPPORT_COUNT)
      continue;
    
    // Track support exp gains, if unit gets any.
    entry = REW_createSeqEntry(REW_curSequence);
    entry->size = REW_ENTRY_BASESIZE;
    unitChangeData = (struct REW_UnitChangeData*)entry->data;
    k = 0;
    jMax = GetROMUnitSupportCount(unit);
    for (j = 0; j < jMax; j++) {
      struct Unit* other = GetUnitSupportingUnit(unit, j);

      if (!other)
        continue;

      if (other->state & US_UNAVAILABLE)
        continue;

      if (UNIT_FACTION(other) != FACTION_BLUE)
        continue;

      switch (RECT_DISTANCE(unit->xPos, unit->yPos, other->xPos, other->yPos)) {
        case 0:
          if (!(unit->rescueOtherUnit == other->index))
            continue;
          break;

        case 1:
          if ((unit->state & US_RESCUED) || (other->state & US_RESCUED))
            continue;
          break;

        default:
          continue;
      }

      if (GetUnitTotalSupportLevel(other) < REW_MAX_SIMULTANEOUS_SUPPORT_COUNT) {
        exp = unit->supports[j];
        UnitGainSupportExp(unit, j);
        exp = unit->supports[j] - exp;
        
        // Add support gain to unit change data.
        if (exp) {
          unitChangeData[k].offs = 0x32 + j;
          unitChangeData[k].diff = exp;
          entry->size += 2;
          k++;
        }
      }
    }
    
    // If any support exp was gained, add entry to rewind data.
    if (entry->size > REW_ENTRY_BASESIZE) {
      entry->diffType = REW_CONSEQ_UNITCHANGE;
      entry->flags = i;
      REW_curSequence->size += entry->size;
      REW_alignSequence(REW_curSequence);
    }
  }
}

// Track:
//  - Status (unit can recover from status),
//  - HP (unit can lose health due to poison,
//        or gain health due to healtile),
// Doesn't track BWL Favoritism.
void REW_actionPhaseChangeTrackStatus() {
  u8* unit;
  struct Unit* unit2;
  const int unitIDEnd = gChapterData.currentPhase + 0x40;
  u8* phaseChangeBuffer = (u8*)REW_rewindBuffer;    // Tracks all units' changes
  
  // Empty phaseChangeBuffer.
  CpuFastFill(0, phaseChangeBuffer, REW_PHASECHANGEBUFFER_ENTRYSIZE * 0x40);
  
  // Track unit stats that might change during phase change.
  for (int unitID = gChapterData.currentPhase + 1; unitID < unitIDEnd; unitID++) {
    unit2 = GetUnit(unitID);
    if (!UNIT_IS_VALID(unit2))
      continue;
    unit = (u8*)unit2;
    
    // Track unit hp change (healtiles, poison & gorgon egg hatching can change HP).
    phaseChangeBuffer[unitID * REW_PHASECHANGEBUFFER_ENTRYSIZE + 0] = 0x13;
    phaseChangeBuffer[unitID * REW_PHASECHANGEBUFFER_ENTRYSIZE + 1] = unit[0x13];
    
    // Track status, torch barrier.
    phaseChangeBuffer[unitID * REW_PHASECHANGEBUFFER_ENTRYSIZE + 2] = 0x30;
    phaseChangeBuffer[unitID * REW_PHASECHANGEBUFFER_ENTRYSIZE + 3] = unit[0x30];
    phaseChangeBuffer[unitID * REW_PHASECHANGEBUFFER_ENTRYSIZE + 4] = 0x31;
    phaseChangeBuffer[unitID * REW_PHASECHANGEBUFFER_ENTRYSIZE + 5] = unit[0x31];
    
    // Fill leftover space with unit index as this value shouldn't change.
    phaseChangeBuffer[unitID * REW_PHASECHANGEBUFFER_ENTRYSIZE + 6] = 0xB;
    phaseChangeBuffer[unitID * REW_PHASECHANGEBUFFER_ENTRYSIZE + 7] = unit[0xB];
    
    // We don't track BWL-favoritism.
  }
  
  // Call to REW_actionPhaseChangeTrackStatus replaced
  // the call to this function, so we call it here.
  TickActiveFactionTurn();
}

// Add rewind entries for values tracked in
// REW_actionPhaseChangeTrackStatus if these
// values changed.
void REW_actionPhaseChangeRecordStatus() {
  int i, j, diff, offs;
  u8* unit;
  struct Unit* unit2;
  struct REW_RewindEntry* entry;
  struct REW_UnitChangeData* unitChangeData;
  const int unitIDEnd = gChapterData.currentPhase + 0x40;
  u8* phaseChangeBuffer = (u8*)REW_rewindBuffer;    // Tracks all units' changes
  
  // Add changed unit stats to rewind data.
  for (int unitID = gChapterData.currentPhase + 1; unitID < unitIDEnd; unitID++) {
    unit2 = GetUnit(unitID);
    if (!UNIT_IS_VALID(unit2))
      continue;
    unit = (u8*)unit2;
    
    // Add changed unit data to new rewind entry.
    entry = REW_createSeqEntry(REW_curSequence);
    entry->size = REW_ENTRY_BASESIZE;
    unitChangeData = (struct REW_UnitChangeData*)entry->data;
    j = 0;
    for (i = 0; i < REW_PHASECHANGEBUFFER_ENTRYSIZE; i += 2) {
      offs = unitID * REW_PHASECHANGEBUFFER_ENTRYSIZE + i;
      diff = unit[phaseChangeBuffer[offs]] - phaseChangeBuffer[offs + 1];
      
      if (diff) {
        unitChangeData[j].offs = phaseChangeBuffer[offs];
        unitChangeData[j].diff = diff;
        entry->size += 2;
        j++;
      }
    }
    
    // If any unit data changed, add entry to rewind data.
    if (entry->size > REW_ENTRY_BASESIZE) {
      entry->diffType = REW_CONSEQ_UNITCHANGE;
      entry->flags = unitID;
      REW_curSequence->size += entry->size;
      REW_alignSequence(REW_curSequence);
    }
  }
}