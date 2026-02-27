#include <stdio.h>
#include "item.h"

/*
// Undo item obtained consequence.
void REW_undoItemObtained(struct REW_RewindSequence* sequence, struct REW_RewindEntry* entry) {
  struct REW_RewindEntry* unitRewindEntry = sequence->entry[0];
  
  
  while (!REW_isUnitAction(unitRewindEntry->diffType)) {
    
    unitRewindEntry = REW_nextEntry(sequence, unitRewindEntry);
  
  }
  
  
  switch(entry->flags) {
    
    case REW_ITEM_INVENTORYNOTFULL:
      
      break;
    
    case REW_ITEM_CONVOY_DIFFERENTITEM:
      
      break;
    
    case REW_ITEM_CONVOY_OBTAINEDITEM:
      
      break;
    
    case REW_ITEM_DISCARD_DIFFERENTITEM:
      
      break;
    
    default:
  }
  
}

// Redo item obtained consequence.
void REW_redoItemObtained(struct REW_RewindSequence* sequence, struct REW_RewindEntry* entry) {
  
}

// Tracks item obtained through
//  - looting defeated enemy,
//  - looting a chest,
//  - stealing from an enemy.
// argument kind determines how the item was obtained
// and what action should be taken.
void REW_itemObtained(u8 kind, s8 inventorySlot) {
  struct REW_RewindSequence* rewindSeq = REW_curSequence;
  struct REW_RewindEntry* rewindEntry = REW_createSeqEntry(rewindSeq);
  
  // Setup rewindEntry.
  rewindEntry->diffType = REW_CONSEQ_ITEMOBTAINED;
  rewindEntry->size = REW_SEQUENCE_BASESIZE;
  
  switch(kind) {
    
    // Inventory not full, nothing discarded/sent to convoy.
    case REW_ITEM_INVENTORYNOTFULL:
      
      // Setup flags.
      rewindEntry->flags = REW_ITEM_INVENTORYNOTFULL;
      
      break;
    
    // Inventory full, send different item to convoy.
    case REW_ITEM_CONVOY_DIFFERENTITEM:
      
      // Setup flags.
      rewindEntry->flags = (u8)inventorySlot;
      rewindEntry->flags |= REW_ITEM_CONVOY_DIFFERENTITEM;
      
      // Save item.
      ((u16*)(rewindEntry->data))[0] = gActiveUnit->items[inventorySlot];
      
      // Add item size to rewindEntry's size.
      rewindEntry->size += 2;
      break;
    
    // Inventory full, send obtained item to convoy.
    case REW_ITEM_CONVOY_OBTAINEDITEM:
      
      // Setup flags.
      rewindEntry->flags = (u8)inventorySlot;
      rewindEntry->flags |= REW_ITEM_CONVOY_OBTAINEDITEM;
      
      break;
    
    case REW_ITEM_DISCARD_DIFFERENTITEM:
      
      // Setup flags.
      rewindEntry->flags = (u8)inventorySlot;
      rewindEntry->flags |= REW_ITEM_DISCARD_DIFFERENTITEM;
      
      // Save item.
      ((u16*)(rewindEntry->data))[0] = gActiveUnit->items[inventorySlot];
      
      // Add item size to rewindEntry's size.
      rewindEntry->size += 2;
      
      break;
    
    // Shouldn't trigger the default.
    default:
    
      // Don't save the rewindEntry.
      return;
  }
  
  rewindSeq->size += rewindEntry->size;
  REW_alignSequence(rewindSeq);
}
*/