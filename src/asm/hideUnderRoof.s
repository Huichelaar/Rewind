@ When (un)triggering mapchanges
@ hide units under roofs again.
@ Hooked at 0xBB2C and 0xBB7C.
@ r4 contains return address.
.thumb

@ Vanilla, overwritten by hook.
ldr   r0, =RefreshTerrainBmMap
bl    GOTO_R0

@ This hides units under roofs again.
bl    REW_hideRoofedUnits

@ Vanilla, overwritten by hook.
ldr   r0, =UpdateRoofedUnits
bl    GOTO_R0
ldr   r0, =RenderBmMap
bl    GOTO_R0

return:
mov   r0, r4
add   r0, #0x9

GOTO_R0:
bx    r0
