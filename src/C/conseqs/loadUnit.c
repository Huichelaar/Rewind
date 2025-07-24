#include <stdio.h>
#include "loadUnit.h"

// Undo load unit consequence.
void REW_undoLoadUnit(struct REW_RewindEntry* entry) {
  struct Unit* unit = GetUnit(entry->flags);
  
  // If unit doesn't exist, ignore.
  if (!UNIT_IS_VALID(unit))
    return;
  
  ClearUnit(unit);
}

// Redo load unit consequence.
void REW_redoLoadUnit(struct REW_RewindEntry* entry) {
  LoadUnit((struct UnitDefinition*)entry->data);
}

// Add loaded unit to rewind sequence.
void REW_conseqInitUnit(struct Unit* unit, struct UnitDefinition* unitDef) {
  // Don't add consequence if sequence is empty.
  if (REW_curSequence->size == 0)
    return;
  
  // If unit doesn't exist, ignore.
  if (!UNIT_IS_VALID(unit))
    return;
  
  // Setup rewind entry.
  struct REW_RewindEntry* entry = REW_createSeqEntry(REW_curSequence);
  entry->diffType = REW_CONSEQ_UNITLOAD_INIT;
  entry->flags = unit->index;
  entry->size = REW_ENTRY_BASESIZE + REW_UNITDEFSIZE;
  
  // Setup unit definition data.
  struct UnitDefinition* unitDefData = (struct UnitDefinition*)entry->data;
  CpuCopy16(unitDef, unitDefData, REW_UNITDEFSIZE);
  unitDefData->xPosition = unit->xPos;
  unitDefData->yPosition = unit->yPos;
  
  // Add entry's size to sequence's size.
  REW_curSequence->size += entry->size;
  REW_alignSequence(REW_curSequence);
}

// Finalize loaded units' positions in rewind sequence.
void REW_conseqFinalizeUnits() {
  struct Unit* unit;
  struct UnitDefinition* unitDefData;
  struct REW_RewindEntry* entry = REW_curSequence->entry;
  
  // Ignore if sequence is empty.
  if (REW_curSequence->size == 0)
    return;
  
  while (entry != NULL) {
    if (entry->diffType == REW_CONSEQ_UNITLOAD_INIT) {
      unit = GetUnit(entry->flags);
      if (UNIT_IS_VALID(unit)) {
        entry->diffType = REW_CONSEQ_UNITLOAD_FINAL;
        
        unitDefData = (struct UnitDefinition*)entry->data;
        unitDefData->xPosition = unit->xPos;
        unitDefData->yPosition = unit->yPos;
        unitDefData->redaCount = 0;
        unitDefData->redas = NULL;
      }
    }
    entry = REW_nextEntry(REW_curSequence, entry);
  }
}