.thumb

@ Runs immediately before phases are changed.
@ Calls REW_actionPrePhaseChange, which tracks
@ units' values which may change due to phase change.
@ Hooked at 0x15410.
.global REW_hookPrePhaseChange
REW_hookPrePhaseChange:
push  {r14}

@ Init phase change sequence in rewind buffer.
ldr   r0, =REW_actionPrePhaseChange
bl    GOTO_R0

@ Vanilla, overwritten by hook.
ldr   r0, =ClearActiveFactionGrayedStates
bl    GOTO_R0
ldr   r0, =SMS_UpdateFromGameData
bl    GOTO_R0

@ Return.
ldr   r0, =0x801541B
GOTO_R0:
bx    r0


@ In-between these two hooks units' values may change.
@ Torch, barrier, status, HP due to poison or healtiles.


@ Runs immediately after phases are changed.
@ Calls REW_actionPostPhaseChange, which fills up
@ phase change entry in rewind buffer.
@ Hooked at 0x15450.
.global REW_hookPostPhaseChange
REW_hookPostPhaseChange:

push  {r4, r14}
mov   r4, r0

@ Finalize phase change sequence in rewind buffer.
ldr   r0, =REW_actionPostPhaseChange
bl    GOTO_R0

@ Vanilla, overwritten by hook.
ldr   r0, =gChapterData
ldrb  r0, [r0, #0xF]

@ Return.
ldr   r1, =0x8015459
bx    r1
