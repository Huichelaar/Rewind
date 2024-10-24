@ Hook for REW_recordActionCombat.
@ Hooked at 0x32330.
.thumb

@ call REW_recordActionCombat.
ldr   r2, =REW_recordActionCombat
bl    GOTO_R2

@ Vanilla, overwritten by hook.
ldr   r0, =gProc_Battle
mov   r1, r7
ldr   r2, =ProcStartBlocking
bl    GOTO_R2

@ Return.
ldr   r2, =0x8032339
GOTO_R2:
bx    r2
