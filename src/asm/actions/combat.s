@ Hook for REW_actionCombat.
@ Hooked at 0x2A2C8.
.thumb

@ Vanilla, overwritten by hook.
mov   r0, #0xB
ldsb  r0, [r4, r0]
cmp   r0, #0x0
beq   L1
  ldr   r0, =BattleApplyExpGains
  bl    GOTO_R0

@ call REW_actionCombat.
L1:
ldr   r0, =REW_actionCombat
bl    GOTO_R0

@ Vanilla, overwritten by hook.
mov   r0, #0xB
ldsb  r0, [r4, r0]
cmp   r0, #0x0
beq   return
  ldr   r0, =0x802A2D5
  bx    r0

return:
pop   {r4-r7}
pop   {r0}
GOTO_R0:
bx    r0
