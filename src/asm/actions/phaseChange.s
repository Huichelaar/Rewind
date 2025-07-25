@ Runs immediately before phases are changed.
@ Calls REW_actionPhaseChangeStart, which tracks
@ greyed out units. Also inits phase change sequence.
@ Hooked at 0x15410.
.thumb

push  {r14}

@ Init phase change sequence in rewind buffer.
ldr   r0, =REW_actionPhaseChangeStart
bl    GOTO_R0

@ Vanilla, overwritten by hook.
ldr   r0, =ClearActiveFactionGrayedStates
bl    GOTO_R0
ldr   r0, =RefreshUnitSprites
bl    GOTO_R0

@ Return.
ldr   r0, =0x801541B
GOTO_R0:
bx    r0

@ After this hook, units' values may change, such as:
@ Torch, barrier, status, HP due to poison or healtiles.
@ REW_actionPhaseChangeRecordStatus will note these
@ changes and add them to rewind data.
