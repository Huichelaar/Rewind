#ifndef ITEM_H
#define ITEM_H
#include "gbafe.h"
#include "../internal.h"

enum {
  
  // Types of item drops.
  REW_ITEM_INVENTORYNOTFULL =      7,
  REW_ITEM_CONVOY_DIFFERENTITEM =  8,
  REW_ITEM_CONVOY_OBTAINEDITEM =   13,
  REW_ITEM_DISCARD_DIFFERENTITEM = 0,
  
};

void REW_undoItemObtained(struct REW_RewindSequence* sequence, struct REW_RewindEntry* entry);
void REW_redoItemObtained(struct REW_RewindSequence* sequence, struct REW_RewindEntry* entry);
void REW_itemObtained(u8 kind, s8 inventorySlot);

#endif // LOADUNIT_H