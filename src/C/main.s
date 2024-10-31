	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC24:
	.ascii	".\000"
	.text
	.align	1
	.global	REW_drawSomeText
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_drawSomeText, %function
REW_drawSomeText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r7, r0
	movs	r0, #216
	sub	sp, sp, #20
	movs	r1, #3
	ldr	r3, .L2
	lsls	r0, r0, #2
	bl	.L4
	ldr	r4, .L2+4
	ldr	r0, .L2+8
	movs	r1, r4
	ldr	r3, .L2+12
	bl	.L4
	movs	r1, r4
	movs	r4, r7
	movs	r2, #0
	adds	r4, r4, #60
	ldr	r3, .L2+16
	ldr	r0, .L2+20
	bl	.L4
	ldr	r6, .L2+24
	movs	r0, r4
	movs	r1, #5
	bl	.L5
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L2+28
	bl	.L4
	movs	r0, #225
	ldr	r3, .L2+32
	lsls	r0, r0, #1
	bl	.L4
	ldr	r3, .L2+36
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L2+40
	bl	.L4
	movs	r1, #8
	movs	r0, r4
	ldr	r3, .L2+44
	bl	.L4
	movs	r0, r4
	movs	r1, #2
	ldr	r3, .L2+48
	bl	.L4
	movs	r0, r4
	ldr	r3, .L2+52
	subs	r4, r4, #8
	ldr	r1, .L2+56
	bl	.L4
	movs	r0, r4
	movs	r1, #4
	bl	.L5
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L2+28
	bl	.L4
	ldr	r0, .L2+60
	lsls	r0, r0, #16
	ldr	r3, .L2+32
	lsrs	r0, r0, #16
	bl	.L4
	ldr	r3, .L2+36
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r0, r4
	movs	r4, #0
	ldr	r1, .L2+64
	ldr	r3, .L2+52
	bl	.L4
	ldr	r5, .L2+68
	movs	r3, r4
	movs	r2, r4
	movs	r1, r4
	str	r4, [sp, #4]
	str	r4, [sp]
	ldr	r0, .L2+72
	bl	.L6
	movs	r3, r4
	movs	r2, r4
	movs	r1, r4
	str	r0, [r7, #76]
	str	r4, [sp, #4]
	str	r4, [sp]
	ldr	r0, .L2+76
	bl	.L6
	movs	r2, r4
	movs	r3, r4
	movs	r1, r4
	str	r0, [r7, #80]
	str	r4, [sp, #4]
	str	r4, [sp]
	ldr	r0, .L2+80
	bl	.L6
	movs	r5, r7
	adds	r5, r5, #44
	str	r0, [r7, #84]
	movs	r1, #15
	movs	r0, r5
	bl	.L5
	movs	r1, #2
	movs	r0, r5
	ldr	r3, .L2+28
	bl	.L4
	ldr	r3, .L2+32
	movs	r0, #2
	bl	.L4
	ldr	r3, .L2+36
	movs	r1, r0
	movs	r0, r5
	bl	.L4
	ldr	r6, .L2+84
	movs	r0, r5
	movs	r1, r6
	ldr	r3, .L2+52
	bl	.L4
	movs	r0, r5
	ldr	r3, .L2+88
	bl	.L4
	movs	r1, #2
	movs	r0, r5
	ldr	r3, .L2+28
	bl	.L4
	ldr	r3, .L2+32
	ldr	r0, .L2+92
	bl	.L4
	ldr	r3, .L2+36
	movs	r1, r0
	movs	r0, r5
	bl	.L4
	ldr	r0, .L2+96
	lsls	r0, r0, #16
	ldr	r3, .L2+32
	lsrs	r0, r0, #16
	bl	.L4
	ldr	r3, .L2+36
	movs	r1, r0
	movs	r0, r5
	bl	.L4
	ldr	r3, .L2+32
	ldr	r0, .L2+100
	bl	.L4
	ldr	r3, .L2+36
	movs	r1, r0
	movs	r0, r5
	bl	.L4
	movs	r0, r5
	ldr	r1, .L2+104
	ldr	r3, .L2+108
	bl	.L4
	movs	r1, r6
	movs	r0, r5
	ldr	r3, .L2+52
	bl	.L4
	movs	r3, #12
	movs	r1, r4
	str	r3, [sp]
	movs	r2, #102
	movs	r0, r4
	ldr	r6, .L2+112
	subs	r3, r3, #13
	bl	.L5
	movs	r6, #128
	movs	r3, r0
	lsls	r6, r6, #3
	adds	r3, r3, #8
	str	r0, [r7, #68]
	ldr	r2, [r0, #48]
	strh	r6, [r3, #62]
	ldr	r1, .L2+116
	ldrh	r3, [r2, #34]
	ands	r3, r1
	orrs	r3, r6
	strh	r3, [r2, #34]
	movs	r2, r0
	adds	r2, r2, #76
	ldrh	r3, [r2]
	adds	r3, r3, #1
	adds	r3, r3, #255
	strh	r3, [r2]
	ldrh	r3, [r2, #2]
	adds	r3, r3, #129
	adds	r3, r3, #255
	strh	r3, [r2, #2]
	movs	r1, #1
	ldr	r3, .L2+120
	bl	.L4
	movs	r0, r5
	ldr	r3, .L2+124
	bl	.L4
	movs	r3, #13
	movs	r1, r4
	str	r0, [sp, #12]
	str	r3, [sp]
	movs	r2, #102
	movs	r0, r4
	ldr	r5, .L2+112
	subs	r3, r3, #14
	bl	.L6
	movs	r3, r0
	adds	r3, r3, #8
	str	r0, [r7, #72]
	ldr	r2, [r0, #48]
	strh	r6, [r3, #62]
	ldr	r1, .L2+116
	ldrh	r3, [r2, #34]
	ands	r3, r1
	orrs	r3, r6
	strh	r3, [r2, #34]
	movs	r2, r0
	ldr	r5, [sp, #12]
	adds	r2, r2, #76
	ldrh	r3, [r2]
	adds	r5, r5, #43
	adds	r3, r3, #128
	lsls	r5, r5, #4
	adds	r5, r5, r3
	ldrh	r3, [r2, #2]
	adds	r3, r3, #129
	adds	r3, r3, #255
	strh	r3, [r2, #2]
	movs	r1, r4
	strh	r5, [r2]
	ldr	r3, .L2+120
	bl	.L4
	movs	r0, #3
	ldr	r3, .L2+128
	bl	.L4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L3:
	.align	2
.L2:
	.word	UnpackUiVArrowGfx
	.word	gGenericBuffer
	.word	REW_menuTSA
	.word	Decompress
	.word	BgMap_ApplyTsa
	.word	gBg1MapBuffer
	.word	Text_InitClear
	.word	Text_SetXCursor
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	Text_SetColorId
	.word	Text_Advance
	.word	Text_DrawNumber
	.word	Text_Display
	.word	gBg0MapBuffer+112
	.word	REW_phase
	.word	gBg0MapBuffer+240
	.word	APProc_Create
	.word	REW_phaseAPDef
	.word	REW_upArrowAPDef
	.word	REW_downArrowAPDef
	.word	gBg0MapBuffer+138
	.word	Text_Clear
	.word	530
	.word	REW_combat
	.word	589
	.word	.LC24
	.word	Text_DrawChar
	.word	MU_CreateInternal
	.word	-3073
	.word	MU_SetFacing
	.word	Text_GetXCursor
	.word	EnableBgSyncByMask
	.size	REW_drawSomeText, .-REW_drawSomeText
	.align	1
	.global	REW_procEnd
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_procEnd, %function
REW_procEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r4, r0
	ldr	r5, .L24
	ldr	r0, [r0, #76]
	bl	.L6
	ldr	r0, [r4, #84]
	cmp	r0, #0
	beq	.L8
	bl	.L6
.L8:
	ldr	r0, [r4, #80]
	cmp	r0, #0
	beq	.L9
	bl	.L6
.L9:
	ldr	r0, [r4, #68]
	cmp	r0, #0
	beq	.L10
	bl	.L6
.L10:
	ldr	r0, [r4, #72]
	cmp	r0, #0
	beq	.L11
	bl	.L6
.L11:
	@ sp needed
	ldr	r3, .L24+4
	bl	.L4
	ldr	r3, .L24+8
	bl	.L4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L25:
	.align	2
.L24:
	.word	EndProc
	.word	ClearBG0BG1
	.word	UnlockGameLogic
	.size	REW_procEnd, .-REW_procEnd
	.align	1
	.global	REW_rewindMenuEffect
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_rewindMenuEffect, %function
REW_rewindMenuEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L27
	@ sp needed
	bl	.L4
	ldr	r3, .L27+4
	movs	r1, #3
	ldr	r0, .L27+8
	bl	.L4
	movs	r3, #0
	str	r3, [r0, #68]
	str	r3, [r0, #72]
	movs	r0, #23
	pop	{r4}
	pop	{r1}
	bx	r1
.L28:
	.align	2
.L27:
	.word	LockGameLogic
	.word	ProcStart
	.word	.LANCHOR0
	.size	REW_rewindMenuEffect, .-REW_rewindMenuEffect
	.align	1
	.global	REW_createBufferEntry
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_createBufferEntry, %function
REW_createBufferEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L32
	ldr	r3, [r3]
	ldr	r2, [r3]
	push	{r4, lr}
	adds	r4, r3, r2
	movs	r0, r4
	ldr	r1, [r3, #4]
	adds	r0, r0, #8
	cmp	r1, #0
	beq	.L30
	str	r0, [r1, #4]
.L30:
	@ sp needed
	str	r1, [r4, #8]
	movs	r1, #0
	adds	r2, r2, #12
	str	r1, [r0, #4]
	str	r0, [r3, #4]
	str	r2, [r3]
	pop	{r4}
	pop	{r1}
	bx	r1
.L33:
	.align	2
.L32:
	.word	REW_rewindBufferSmall
	.size	REW_createBufferEntry, .-REW_createBufferEntry
	.align	1
	.global	REW_storeCombatEntry
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_storeCombatEntry, %function
REW_storeCombatEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r4, r1
	movs	r7, r0
	sub	sp, sp, #84
	str	r2, [sp, #4]
	ldr	r3, .L57
	movs	r2, #36
	add	r1, sp, #8
	movs	r0, r4
	bl	.L4
	ldrb	r1, [r7, #26]
	ldrb	r3, [r4, #26]
	ldr	r2, [r7, #4]
	subs	r3, r3, r1
	ldrb	r1, [r2, #17]
	subs	r3, r3, r1
	ldr	r1, [r7]
	ldrb	r1, [r1, #19]
	subs	r3, r3, r1
	add	r1, sp, #8
	strb	r3, [r1, #26]
	ldrb	r3, [r4, #29]
	ldrb	r1, [r7, #29]
	ldrb	r2, [r2, #18]
	subs	r3, r3, r1
	subs	r3, r3, r2
	add	r2, sp, #8
	strb	r3, [r2, #29]
	movs	r3, r4
	adds	r3, r3, #82
	ldrb	r3, [r3]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	beq	.L35
	movs	r3, r4
	adds	r3, r3, #81
	ldrb	r3, [r3]
	adds	r3, r3, #12
	lsls	r3, r3, #1
	adds	r3, r3, r2
	movs	r2, r4
	adds	r2, r2, #72
	ldrh	r2, [r2]
	strh	r2, [r3, #6]
.L35:
	movs	r1, #111
	ldrsb	r1, [r4, r1]
	cmp	r1, #0
	blt	.L36
	ldr	r3, .L57+4
	add	r0, sp, #8
	bl	.L4
.L36:
	movs	r2, r4
	add	r3, sp, #8
	adds	r2, r2, #115
	ldrb	r3, [r3, #18]
	ldrb	r2, [r2]
	adds	r3, r3, r2
	add	r2, sp, #8
	strb	r3, [r2, #18]
	ldrb	r3, [r2, #20]
	movs	r2, r4
	adds	r2, r2, #116
	ldrb	r2, [r2]
	adds	r3, r3, r2
	add	r2, sp, #8
	strb	r3, [r2, #20]
	ldrb	r3, [r2, #21]
	movs	r2, r4
	adds	r2, r2, #117
	ldrb	r2, [r2]
	adds	r3, r3, r2
	add	r2, sp, #8
	strb	r3, [r2, #21]
	ldrb	r3, [r2, #22]
	movs	r2, r4
	adds	r2, r2, #118
	ldrb	r2, [r2]
	adds	r3, r3, r2
	add	r2, sp, #8
	strb	r3, [r2, #22]
	ldrb	r3, [r2, #23]
	movs	r2, r4
	adds	r2, r2, #119
	ldrb	r2, [r2]
	adds	r3, r3, r2
	add	r2, sp, #8
	strb	r3, [r2, #23]
	ldrb	r3, [r2, #24]
	movs	r2, r4
	adds	r2, r2, #120
	ldrb	r2, [r2]
	adds	r3, r3, r2
	add	r2, sp, #8
	strb	r3, [r2, #24]
	ldrb	r3, [r2, #25]
	movs	r2, r4
	adds	r2, r2, #121
	ldrb	r2, [r2]
	adds	r3, r3, r2
	add	r2, sp, #8
	movs	r0, r2
	strb	r3, [r2, #25]
	ldr	r3, .L57+8
	bl	.L4
	movs	r0, r4
	ldr	r3, .L57+12
	bl	.L4
	cmp	r0, #0
	ble	.L37
	movs	r3, r4
	adds	r3, r3, #80
	ldrb	r3, [r3]
	add	r2, sp, #8
	adds	r3, r3, r2
	adds	r3, r3, #40
	strb	r0, [r3]
.L37:
	movs	r1, r4
	movs	r0, #30
	add	r3, sp, #8
	movs	r2, #10
	adds	r1, r1, #30
	adds	r0, r0, r3
	ldr	r3, .L57+16
	bl	.L4
	ldr	r3, .L57+20
	add	r0, sp, #8
	bl	.L4
	movs	r5, #2
	movs	r6, #0
.L39:
	add	r3, sp, #8
	ldrb	r3, [r3, r6]
	ldrb	r2, [r7, r6]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L38
	ldr	r2, [sp, #4]
	adds	r2, r2, r5
	strb	r6, [r2, #12]
	strb	r3, [r2, #13]
	adds	r5, r5, #2
.L38:
	adds	r6, r6, #1
	cmp	r6, #72
	bne	.L39
	ldr	r3, .L57+24
	ldrh	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L40
	adds	r4, r4, #72
	ldrh	r0, [r4]
	ldr	r3, .L57+28
	bl	.L4
	add	r3, sp, #8
	movs	r4, r0
	ldrb	r0, [r3, #28]
	ldr	r3, .L57+32
	bl	.L4
	ldrb	r0, [r0, #6]
	subs	r0, r4, r0
	lsls	r0, r0, #24
	lsrs	r0, r0, #24
	beq	.L40
	ldr	r3, [sp, #4]
	adds	r3, r3, r5
	strb	r6, [r3, #12]
	strb	r0, [r3, #13]
	adds	r5, r5, #2
.L40:
	ldr	r3, [sp, #4]
	strh	r5, [r3, #12]
	ldr	r3, .L57+36
	ldr	r3, [r3]
	ldr	r2, [r3]
	adds	r5, r5, r2
	movs	r1, r5
	movs	r2, #3
	ands	r1, r2
	tst	r5, r2
	bne	.L41
.L56:
	str	r5, [r3]
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L41:
	adds	r5, r5, #4
	subs	r5, r5, r1
	b	.L56
.L58:
	.align	2
.L57:
	.word	CpuSet
	.word	SetUnitStatus
	.word	UnitCheckStatCaps
	.word	GetBattleUnitUpdatedWeaponExp
	.word	memcpy
	.word	UnitRemoveInvalidItems
	.word	gBattleStats
	.word	GetItemUses
	.word	GetTrap
	.word	REW_rewindBufferSmall
	.size	REW_storeCombatEntry, .-REW_storeCombatEntry
	.align	1
	.global	REW_recordActionCombat
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_recordActionCombat, %function
REW_recordActionCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r7, .L68
	ldr	r4, .L68+4
	ldrb	r0, [r7, #11]
	bl	.L70
	ldr	r5, .L68+8
	movs	r6, r0
	ldrb	r0, [r5, #11]
	bl	.L70
	movs	r4, r0
	bl	REW_createBufferEntry
	movs	r3, #2
	strh	r3, [r0, #8]
	ldrb	r3, [r6, #16]
	strb	r3, [r0, #10]
	ldrb	r3, [r6, #17]
	strb	r3, [r0, #11]
	movs	r3, #19
	ldrsb	r3, [r6, r3]
	movs	r2, r0
	cmp	r3, #0
	beq	.L60
	movs	r1, r7
	movs	r0, r6
	bl	REW_storeCombatEntry
.L60:
	bl	REW_createBufferEntry
	movs	r3, #2
	strh	r3, [r0, #8]
	ldrb	r3, [r4, #16]
	strb	r3, [r0, #10]
	ldrb	r3, [r4, #17]
	strb	r3, [r0, #11]
	movs	r3, #19
	ldrsb	r3, [r4, r3]
	movs	r2, r0
	cmp	r3, #0
	beq	.L59
	movs	r1, r5
	movs	r0, r4
	bl	REW_storeCombatEntry
.L59:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L69:
	.align	2
.L68:
	.word	gBattleActor
	.word	GetUnit
	.word	gBattleTarget
	.size	REW_recordActionCombat, .-REW_recordActionCombat
	.global	REW_procScr
	.section	.rodata.str1.1
.LC51:
	.ascii	"REW_proc\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	REW_procScr, %object
	.size	REW_procScr, 56
REW_procScr:
	.short	1
	.short	0
	.word	.LC51
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	Text_InitFont
	.short	2
	.short	0
	.word	REW_drawSomeText
	.short	14
	.short	600
	.word	0
	.short	2
	.short	0
	.word	REW_procEnd
	.short	0
	.short	0
	.word	0
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.text
	.code 16
	.align	1
.L4:
	bx	r3
.L70:
	bx	r4
.L6:
	bx	r5
.L5:
	bx	r6
