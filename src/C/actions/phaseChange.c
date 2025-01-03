#include <stdio.h>
#include "phaseChange.h"

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
  u8 agnosticUnitID, unitIDCurrFaction, unitIDNextFaction;
  u8* unit;
  struct Unit* unit2;
  int counter = 0;
  u8 nextPhase, turnIncr = 0, skip = false;
  struct REW_RewindEntry* entry;
  u8* phaseChangeBuffer = (u8*)REW_rewindBuffer;    // Tracks all units' changes
  
  // Empty phaseChangeBuffer.
  CpuFastFill(0, phaseChangeBuffer, 0x20 * 0x40);
  
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
  
  // Track unit stats that might change during phase change.
  for (agnosticUnitID = 1; agnosticUnitID < 0x40; agnosticUnitID++) {
    unitIDCurrFaction = agnosticUnitID + gChapterData.currentPhase;
    unitIDNextFaction = agnosticUnitID + nextPhase;
    
    // Track current phase unit if they performed action during their phase.
    unit2 = GetUnit(unitIDCurrFaction);
    if (UNIT_IS_VALID(unit2)) {
      if (unit2->state & US_UNSELECTABLE) {
        entry->data[counter] = unitIDCurrFaction;
        entry->size++;
        counter++;
      }
    }
    
    // Track next phase's units' changes due to phasechange.
    unit2 = GetUnit(unitIDNextFaction);
    if (!UNIT_IS_VALID(unit2))
      continue;
    unit = (u8*)unit2;
    
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
  
  // Set sequence sizes.
  if (REW_curSequence->size == 0) { REW_curSequence->size = REW_SEQUENCE_BASESIZE; }
  REW_curSequence->size += entry->size;
  REW_alignSequence(REW_curSequence);
}

// Fill up phase change sequence in rewind buffer
// with stats that changed during phase change.
void REW_actionPostPhaseChange() {
  struct REW_RewindEntry* entry = REW_lastEntry(REW_curSequence);
  u8* phaseChangeBuffer = (u8*)REW_rewindBuffer;    // Tracks all units' changes
  u8 faction, diff;
  int unitID, i, j, offs, newEntry;
  
  // Last entry in rewind sequence has to be a phaseChange entry.
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