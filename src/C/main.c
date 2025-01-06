#include <stdio.h>
#include "main.h"
#include "internal.c"
#include "actions/actions.c"
#include "conseqs/conseqs.c"
#include "save/save.c"
#include "menu.c"

// Loop backwards over all entries of given sequence and undo effects.
void REW_undo(struct REW_RewindSequence* sequence) {
  struct REW_RewindEntry* entry = REW_lastEntry(sequence);
  
  while(entry != NULL) {
    switch(entry->diffType) {
      
      // Phase change.
      case REW_ACTION_PHASECHANGE:
        REW_undoPhaseChange(entry);
        break;
      
      // Breaking an obstacle.
      case REW_ACTION_BREAK:
        REW_undoObstacleCombat(entry);
        break;
      
      // Generic unit changes.
      case REW_CONSEQ_UNITCHANGE:
      
      // Combat.
      case UNIT_ACTION_COMBAT:
        REW_undoCombat(entry);
        break;
      
      case REW_CONSEQ_UNITLOAD_INIT:
      case REW_CONSEQ_UNITLOAD_FINAL:
        REW_undoLoadUnit(entry);
        break;
      
      default:
        break;
    }
    entry = REW_prevEntry(sequence, entry);
  }
}

void REW_redo(struct REW_RewindSequence* sequence) {
  struct REW_RewindEntry* entry = sequence->entry;
  
  // Loop over all entries of given sequence.
  while(entry != NULL) {
    switch(entry->diffType) {
      
      // Phase change.
      case REW_ACTION_PHASECHANGE:
        REW_redoPhaseChange(entry);
        break;
      
      // Breaking an obstacle.
      case REW_ACTION_BREAK:
        REW_redoObstacleCombat(entry);
        break;
      
      // Generic unit changes.
      case REW_CONSEQ_UNITCHANGE:
      
      // Combat.
      case UNIT_ACTION_COMBAT:
        REW_redoCombat(entry);
        break;
      
      case REW_CONSEQ_UNITLOAD_INIT:
      case REW_CONSEQ_UNITLOAD_FINAL:
        REW_redoLoadUnit(entry);
        break;
      
      default:
        break;
    }
    entry = REW_nextEntry(sequence, entry);
  }
}