#ifndef LOADUNIT_H
#define LOADUNIT_H
#include "gbafe.h"
#include "../internal.h"

void REW_undoLoadUnit(struct REW_RewindEntry* entry);
void REW_redoLoadUnit(struct REW_RewindEntry* entry);

void REW_conseqInitUnit(struct Unit* unit, struct UnitDefinition* unitDef);
void REW_conseqFinalizeUnits();

#endif // LOADUNIT_H