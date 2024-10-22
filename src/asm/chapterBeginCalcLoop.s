@ Calcloop for executing things
@ immediately prior to chapter begin.
@ Hooked in gProc_BMapMain script at:
@ 0x59A23C.
.thumb

push  {r4, r14}
ldr   r4, =REW_chapterBeginCalcLoopEntries

loop:
  ldr   r3, [r4]
  cmp   r3, #0x0
  beq   return      @ Return if we walked through all loop entries.
    bl  GOTO_R3
    add r4, #0x4
    b   loop

return:
pop   {r4}
pop   {r0}
bx    r0
GOTO_R3:
bx    r3
