.thumb

@ Saves details about obtained item from
@ - looting enemy that just died or
@ - opening a chest.
@
@ This hook covers cases where the unit's inventory is not full.
@
@ Args:
@   r0, r4: Unit*
@   r1, r5: item
@   r2, r6: Proc*
@
@ Hooked at 0x1E0A4.
.global REW_hookLootChestReceive1
REW_hookLootChestReceive1:

@ Vanilla, attempt to add item to unit's inventory.
ldr   r3, =UnitAddItem
bl    GOTO_R3

lsl   r0, #0x18
cmp   r0, #0x0
beq   L1

  @ Item was added to unit's inventory.
  @ Track this in rewind data.
  mov   r0, #0x7                @ REW_ITEM_INVENTORYNOTFULL.
  ldr   r3, =REW_itemObtained
  bl    GOTO_R3
  
  @ Return.
  ldr   r3, =0x801E129
  bx    r3

@ Inventory is full, we'll track changes after player
@ decides which item to send to convoy/discard.
L1:
ldr   r3, =0x801E0AD

GOTO_R3:
bx    r3

@ Saves details about obtained item from
@ - looting enemy that just died or
@ - opening a chest.
@
@ This hook covers cases where the unit's inventory is full
@ and they're sending a different item to convoy.
@
@ Args:
@   r1: MenuItemProc*
@ Hooked at 0x1E188.
.global REW_hookLootChestReceive2
REW_hookLootChestReceive2:
push  {r4-r5, r14}
mov   r4, r1

@ Different item was sent to convoy.
@ Track this in rewind data.
mov   r0, #0x8                  @ REW_ITEM_CONVOY_DIFFERENTITEM.
mov   r1, #0x3C
ldsb  r1, [r4, r1]              @ MenuItemProc->itemNumber.
ldr   r3, =REW_itemObtained
bl    GOTO_R3

@ Vanilla, overwritten by hook.
ldr   r5, =gActiveUnit
ldr   r1, [r5]

@ Return.
ldr   r3, =0x801E191
bx    r3

@ Saves details about obtained item from
@ - looting enemy that just died or
@ - opening a chest.
@
@ This hook covers cases where the unit's inventory is full
@ and they're sending the obtained item to convoy.
@
@ Hooked at ~0x1E1DC.
.global REW_hookLootChestReceive3
REW_hookLootChestReceive3:
push  {r4, r14}

@ Obtained item was sent to convoy.
@ Track this in rewind data.
mov   r0, #0xD                  @ REW_ITEM_CONVOY_OBTAINEDITEM.
mov   r1, #0x5
ldr   r3, =REW_itemObtained
bl    GOTO_R3

@ Vanilla, overwritten by hook.
ldr   r4, =gBmSt
ldrh  r0, [r4, #0x2C]
ldr   r3, =AddItemToConvoy
ldr   r1, =0x801E1E7
mov   r14, r1
bx    r3

@ Saves details about obtained item from
@ - looting enemy that just died or
@ - opening a chest.
@
@ This hook covers cases where the unit's inventory is full
@ and they're discarding a different item from the one they just obtained.
@
@ Args:
@   r0: inventorySlot.
@
@ Hooked at 0x1E2B4.
.global REW_hookLootChestReceive4
REW_hookLootChestReceive4:

@ Track item that got discarded.
mov   r1, r0
mov   r0, #0x0                  @ REW_ITEM_DISCARD_DIFFERENTITEM
ldr   r3, =REW_itemObtained
bl    GOTO_R3

@ Vanilla, overwritten by hook.
ldr   r4, =gActiveUnit
ldr   r0, [r4]
ldrh  r1, [r1, #0x8]
ldr   r2, =0x801E2BD
mov   r14, r2
ldr   r3, =UnitRemoveItem
bx    r3
