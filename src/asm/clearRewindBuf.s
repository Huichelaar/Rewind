@ Clear the rewind buffer.
@ The rewind buffer is stored in (suspend) save data,
@ so we navigate EMS to find the save chunk.
.thumb

push  {r4, r14}
sub   sp, #0x4

@ Search for rewindbuffer savechunk.
ldr   r0, =gSuspendSaveChunks-0x10
ldr   r1, =REW_SaveRewindBuf
ldr   r2, =0xFFFF

loop:
  add   r0, #0x10

  @ Return if we reach end of suspend save chunks.
  ldrh  r3, [r0]
  cmp   r3, r2
  beq   return
    @ Iterate if we haven't found rewind buffer save chunk.
    ldr   r3, [r0, #0x4]
    cmp   r3, r1
    bne   loop
      @ Found the save chunk,
      @ now clear it.
      
      @ Determine rewind buffer exact location.
      ldrh  r0, [r0]        @ Relative location of rewind buffer in suspend save.
      add   r0, #0xD4       @ Suspend save offset in save data.
      ldr   r1, =0xE000000  @ Save data memory block.
      @ add   r4, r0, r1      @ Absolute location of rewind buffer.
      add   r1, r0          @ Target.
      
      @ Fill temp-buffer with zeroes.
      @ I realised too late that I only need
      @ to clear size element of buffer,
      @ not the entire buffer.
      @ Keeping this code, should this ever change.
      @ mov   r0, #0x0
      @ str   r0, [sp]
      @ mov   r0, sp                        @ Source.
      @ ldr   r1, =REW_rewindBufferLarge
      @ lsl   r1, #0x5
      @ lsr   r1, #0x5                      @ Target.
      @ ldr   r2, =REW_rewindBufferSize
      @ lsl   r2, #0x5
      @ lsr   r2, #0x7
      @ ldr   r3, =0x01000000               @ Fill with [r0].
      @ orr   r2, r3                        @ Size.
      @ swi   #0xC                          @ CpuFastSet.
      
      @ Move temp-buffer contents to rewind buffer.
      @ ldr   r0, =REW_rewindBufferLarge
      @ lsl   r0, #0x5
      @ lsr   r0, #0x5                      @ Source.
      @ mov   r1, r4                        @ Target.
      @ ldr   r2, =REW_rewindBufferSize
      @ lsl   r2, #0x5
      @ lsr   r2, #0x5                      @ Size.
      @ ldr   r3, =WriteAndVerifySramFast
      @ bl    GOTO_R3
      
      @ Set buffer size to 0.
      mov   r0, #0x0
      str   r0, [sp]
      mov   r0, sp                        @ Source.
      mov   r2, #0x4                      @ Size.
      ldr   r3, =WriteAndVerifySramFast
      bl    GOTO_R3

return:
add   sp, #0x4
pop   {r4}
pop   {r0}
bx    r0
GOTO_R3:
bx    r3
