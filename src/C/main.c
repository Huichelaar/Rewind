#include <stdio.h>
#include "main.h"
#include "internal.c"
#include "actions/combat.c"
#include "actions/phaseChange.c"
#include "save/save.c"
#include "menu.c"

void REW_undo(struct REW_RewindSequence* sequence) {
  struct REW_RewindEntry* entry = REW_lastEntry(sequence);
  Unit* unit = NULL;
  s8 xPost, yPost;
  
  // Loop backwards over all entries of given sequence.
  while(entry != NULL) {
  
    switch(entry->diffType) {
      
      // Phase change.
      case REW_ACTION_PHASECHANGE:
        
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
        break;
      
      // Breaking an obstacle.
      case REW_ACTION_BREAK:
        ;
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
        break;
      
      // Generic unit changes.
      case REW_CONSEQ_UNITCHANGE:
      
      // Combat.
      case UNIT_ACTION_COMBAT:
        unit = GetUnit(entry->flags);     // TODO this doesn't work if unit died.
        struct REW_UnitChangeData* unitChangeData = (struct REW_UnitChangeData*)entry->data;
        
        // Ignore if we can't find unit.
        if (!UNIT_IS_VALID(unit))
          continue;
        
        xPost = unit->xPos;
        yPost = unit->yPos;
        
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
      
      default:
        break;
    }
    entry = REW_prevEntry(sequence, entry);
  }
}

void REW_redo(struct REW_RewindSequence* sequence) {
  struct REW_RewindEntry* entry = sequence->entry;
  u32 end = (u32)REW_nextSequence(sequence);
  Unit* unit = NULL;
  s8 xPrev, yPrev;
  
  // Loop over all entries of given sequence.
  while((u32)entry < end) {
    
    switch(entry->diffType) {
      
      // Phase change.
      case REW_ACTION_PHASECHANGE:
        
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
        break;
      
      // Breaking an obstacle.
      case REW_ACTION_BREAK:
        ;
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
        break;
      
      // Generic unit changes.
      case REW_CONSEQ_UNITCHANGE:
      
      // Combat.
      case UNIT_ACTION_COMBAT:
        unit = GetUnit(entry->flags);
        struct REW_UnitChangeData* unitChangeData = (struct REW_UnitChangeData*)entry->data;
        
        // Ignore if we can't find unit.
        if (!UNIT_IS_VALID(unit))
          continue;
        
        xPrev = unit->xPos;
        yPrev = unit->yPos;
        
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
      
      default:
        break;
    }
    entry = REW_nextEntry(entry);
  }
}