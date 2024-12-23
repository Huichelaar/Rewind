@ Runs when phases are changed.
@ Calls REW_seqPhaseChange, which sets up
@ phase change sequence in rewind buffer.
@ Hooked at 0x15410.
.thumb

push  {r14}

@ Set up phase change sequence in rewind buffer.
ldr   r0, =REW_seqPhaseChange
bl    GOTO_R0

@ Vanilla, overwritten by hook.
ldr   r0, =ClearActiveFactionGrayedStates
bl    GOTO_R0
ldr   r0, =SMS_UpdateFromGameData
bl    GOTO_R0

ldr   r0, =0x801541B
GOTO_R0:
bx    r0
