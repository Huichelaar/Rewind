#ifndef PHASECHANGE_H
#define PHASECHANGE_H
#include "gbafe.h"
#include "../internal.h"

u8 REW_nextPhase(u8 phase, u8* turn, u8* skip);
void REW_actionPrePhaseChange();
void REW_actionPostPhaseChange();

#endif // PHASECHANGE_H