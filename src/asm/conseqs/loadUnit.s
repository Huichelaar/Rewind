.thumb

@ Hook for REW_conseqInitUnit call.
@ Hooked immediately before unit is loaded.
@ Hooked at 0xF770.
.global REW_hookLoadUnit
REW_hookLoadUnit:

@ Vanilla, overwritten by hook.
ldr   r3, =LoadUnit
bl    GOTO_R3
mov   r5, r0
cmp   r4, #0x1
bne   L1
  @ Cutscene unit, return.
  ldr   r1, =0x800F77B
  bx    r1
L1:

@ Not a cutscene unit. Track unit.
@mov  r0, r5      @ Unit*
mov   r1, r6      @ UnitDefinition*
bl    REW_conseqInitUnit

@ Return
ldr   r1, =0x800F7FB
bx    r1
GOTO_R3:
bx    r3


@ Hook for REW_conseqFinalizeUnits call.
@ Hooked after units have stopped moving,
@ following their REDAs.
@ Hooked at 0xFF44.
.global REW_hookEnun
REW_hookEnun:

@ Finalize units' positions in rewinddata.
bl    REW_conseqFinalizeUnits

@ Vanilla, overwritten by hook.
ldr   r3, =RefreshEntityBmMaps
bl    GOTO_R3
ldr   r3, =RefreshUnitSprites
bl    GOTO_R3
ldr   r3, =RenderBmMap
bl    GOTO_R3

@ Return.
ldr   r0, =0x800FF4F
bx    r0
