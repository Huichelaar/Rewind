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
	.align	1
	.global	REW_procEnd
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_procEnd, %function
REW_procEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L2
	@ sp needed
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L3:
	.align	2
.L2:
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
	ldr	r3, .L6
	@ sp needed
	bl	.L4
	ldr	r3, .L6+4
	bl	.L4
	movs	r1, #3
	ldr	r0, .L6+8
	ldr	r3, .L6+12
	bl	.L4
	movs	r0, #23
	pop	{r4}
	pop	{r1}
	bx	r1
.L7:
	.align	2
.L6:
	.word	Text_ResetTileAllocation
	.word	LockGameLogic
	.word	.LANCHOR0
	.word	ProcStart
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
	@ link register save eliminated.
	ldr	r3, .L11
	ldr	r2, [r3]
	ldr	r3, [r2]
	adds	r3, r2, r3
	movs	r0, r3
	ldr	r1, [r2, #4]
	adds	r0, r0, #8
	cmp	r1, #0
	beq	.L9
	str	r0, [r1, #4]
.L9:
	@ sp needed
	str	r1, [r3, #8]
	movs	r3, #0
	str	r3, [r0, #4]
	str	r0, [r2, #4]
	bx	lr
.L12:
	.align	2
.L11:
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
	ldr	r3, .L33
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
	beq	.L14
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
.L14:
	movs	r1, #111
	ldrsb	r1, [r4, r1]
	cmp	r1, #0
	blt	.L15
	ldr	r3, .L33+4
	add	r0, sp, #8
	bl	.L4
.L15:
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
	ldr	r3, .L33+8
	bl	.L4
	movs	r0, r4
	ldr	r3, .L33+12
	bl	.L4
	cmp	r0, #0
	ble	.L16
	movs	r3, r4
	adds	r3, r3, #80
	ldrb	r3, [r3]
	add	r2, sp, #8
	adds	r3, r3, r2
	adds	r3, r3, #40
	strb	r0, [r3]
.L16:
	movs	r1, r4
	movs	r0, #30
	add	r3, sp, #8
	movs	r2, #10
	adds	r1, r1, #30
	adds	r0, r0, r3
	ldr	r3, .L33+16
	bl	.L4
	ldr	r3, .L33+20
	add	r0, sp, #8
	bl	.L4
	movs	r5, #2
	movs	r6, #0
.L18:
	add	r3, sp, #8
	ldrb	r3, [r3, r6]
	ldrb	r2, [r7, r6]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L17
	ldr	r2, [sp, #4]
	adds	r2, r2, r5
	strb	r6, [r2, #12]
	strb	r3, [r2, #13]
	adds	r5, r5, #2
.L17:
	adds	r6, r6, #1
	cmp	r6, #72
	bne	.L18
	ldr	r3, .L33+24
	ldrh	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L19
	adds	r4, r4, #72
	ldrh	r0, [r4]
	ldr	r3, .L33+28
	bl	.L4
	add	r3, sp, #8
	movs	r4, r0
	ldrb	r0, [r3, #28]
	ldr	r3, .L33+32
	bl	.L4
	ldrb	r0, [r0, #6]
	subs	r0, r4, r0
	lsls	r0, r0, #24
	lsrs	r0, r0, #24
	beq	.L19
	ldr	r3, [sp, #4]
	adds	r3, r3, r5
	strb	r6, [r3, #12]
	strb	r0, [r3, #13]
	adds	r5, r5, #2
.L19:
	ldr	r3, [sp, #4]
	lsls	r0, r5, #16
	lsrs	r0, r0, #16
	strh	r0, [r3, #12]
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L34:
	.align	2
.L33:
	.word	CpuSet
	.word	SetUnitStatus
	.word	UnitCheckStatCaps
	.word	GetBattleUnitUpdatedWeaponExp
	.word	memcpy
	.word	UnitRemoveInvalidItems
	.word	gBattleStats
	.word	GetItemUses
	.word	GetTrap
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
	ldr	r7, .L44
	ldr	r4, .L44+4
	ldrb	r0, [r7, #11]
	bl	.L46
	ldr	r5, .L44+8
	movs	r6, r0
	ldrb	r0, [r5, #11]
	bl	.L46
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
	beq	.L36
	movs	r1, r7
	movs	r0, r6
	bl	REW_storeCombatEntry
.L36:
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
	beq	.L35
	movs	r1, r5
	movs	r0, r4
	bl	REW_storeCombatEntry
.L35:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L45:
	.align	2
.L44:
	.word	gBattleActor
	.word	GetUnit
	.word	gBattleTarget
	.size	REW_recordActionCombat, .-REW_recordActionCombat
	.global	REW_procScr
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC18:
	.ascii	"REW_proc\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	REW_procScr, %object
	.size	REW_procScr, 32
REW_procScr:
	.short	1
	.short	0
	.word	.LC18
	.short	14
	.short	120
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
.L46:
	bx	r4
