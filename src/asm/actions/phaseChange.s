@ Runs immediately before traps are decayed
@ and phases are changed.
@ Calls REW_actionPhaseChangeStart, which tracks
@ greyed out units. Also inits phase change sequence.
@ Hooked at 0x154C8.
.thumb

push  {r4, r14}
mov   r4, r0

@ Init phase change sequence in rewind buffer.
ldr   r2, =REW_actionPhaseChangeStart
bl    GOTO_R2

@ Vanilla, overwritten by hook.
mov   r1, r4
pop   {r4}
ldr   r0, =gPlaySt
ldrb  r0, [r0, #0xF]

@ Return.
ldr   r2, =0x80154D1
GOTO_R2:
bx    r2

@ After this hook, units' values may change, such as:
@ Torch, barrier, status, HP due to poison or healtiles.
@ REW_actionPhaseChangeRecordStatus will note these
@ changes and add them to rewind data.
