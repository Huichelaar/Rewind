#ifndef SAVE_H
#define SAVE_H
#include "gbafe.h"

void REW_loadActiveUnitMoveOrigin(void* src, u32 size);
void REW_saveActiveUnitMoveOrigin(void* dest, u32 size);
void REW_loadCurSequence(void* src, u32 size);
void REW_saveCurSequence(void* dest, u32 size);
void REW_loadRewind(void* src, u32 size);
void REW_saveRewind(void* dest, u32 size);

#endif // SAVE_H