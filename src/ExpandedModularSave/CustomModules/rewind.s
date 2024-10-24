@ Load & save rewind buffer.
.thumb

.global REW_SaveRewindBuf
.type   REW_SaveRewindBuf, function
REW_SaveRewindBuf:
@ arguments:
@ - r0 = target address (SRAM).
@ - r1 = target max size. We calculate actual size,
@        so we don't need this.

push  {r4, r14}
mov   r4, r0    @ Target address (SRAM).

@ Skip if suspend-save is during phasechange.
ldr   r2, =gActionData
ldrb  r2, [r2, #0x16]     @ Suspend type.
cmp   r2, #0x9            @ SUSPEND_POINT_PHASECHANGE.
beq   return

@ Skip if there's no new rewind data to append.
ldr   r2, =REW_rewindBufferSmall
ldr   r2, [r2]
ldr   r2, [r2]
cmp   r2, #0x0
ble   return

  @ First, load rewind data into buffer.
  ldr   r3, =REW_LoadRewindBuf
  bl    GOTO_R3

  @ Append new rewind data.
  ldr   r0, =REW_rewindBufferLarge
  ldr   r0, [r0]
  ldr   r1, [r0]  @ Offset of end of existing rewind data.
  add   r1, r0    @ Target.
  ldr   r0, =REW_rewindBufferSmall
  ldr   r0, [r0]
  ldr   r2, [r0]  @ Size of new rewind data.
  add   r0, #0x4  @ Source.

  loop:
    ldmia r0!, {r3}
    stmia r1!, {r3}
    sub   r2, #0x4
    cmp   r2, #0x0
    bgt   loop

  @ Adjust offset of end of existing rewind data.
  ldr   r0, =REW_rewindBufferLarge
  ldr   r0, [r0]  @ Source address.
  ldr   r1, [r0]
  ldr   r2, =REW_rewindBufferSmall
  ldr   r2, [r2]
  ldr   r2, [r2]
  add   r2, r1
  str   r2, [r0]  @ Target size.

  @ Save complete rewind data.
  mov   r1, r4    @ Target address (SRAM).
  ldr   r3, =WriteAndVerifySramFast
  bl    GOTO_R3

return:
pop   {r4}
pop   {r0}
bx    r0


.global REW_LoadRewindBuf
.type   REW_LoadRewindBuf, function
REW_LoadRewindBuf:
@ arguments:
@ - r0 = source address (SRAM).
@ - r1 = source size.
@ We don't need to do anything after the function call
@ so we just don't bother making it return here at all.

@ implied       @ ReadSramFast arg r0 = source address.
mov   r2, r1    @ ReadSramFast arg r2 = size.
ldr   r1, =REW_rewindBufferLarge
ldr   r1, [r1]  @ ReadSramFast arg r1 = target address.
ldr   r3, =ReadSramFast
ldr   r3, [r3]
GOTO_R3:
bx    r3
