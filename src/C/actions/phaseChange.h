#ifndef PHASECHANGE_H
#define PHASECHANGE_H
#include "gbafe.h"
#include "../internal.h"

void REW_undoPhaseChange(struct REW_RewindEntry* entry);
void REW_redoPhaseChange(struct REW_RewindEntry* entry);

u8 REW_nextPhase(u8 phase, u8* turn, u8* skip);
void REW_actionPhaseChangeStart();
void REW_actionPhaseChangeSuppports();
void REW_actionPhaseChangeTrackStatus();
void REW_actionPhaseChangeRecordStatus();

#endif // PHASECHANGE_H