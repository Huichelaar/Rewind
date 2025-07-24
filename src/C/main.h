#ifndef MAIN_H
#define MAIN_H
#include "gbafe.h"
#include "internal.h"

// Custom.
void REW_undo(struct REW_RewindSequence* sequence);
void REW_redo(struct REW_RewindSequence* sequence);

#endif // MAIN_H