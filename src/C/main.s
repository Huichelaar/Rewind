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
	.global	REW_createBufferEntry
	.arch armv4t
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
	ldr	r3, .L4
	ldr	r2, [r3]
	ldr	r3, [r2]
	adds	r3, r2, r3
	movs	r0, r3
	ldr	r1, [r2, #4]
	adds	r0, r0, #8
	cmp	r1, #0
	beq	.L2
	str	r0, [r1, #4]
.L2:
	@ sp needed
	str	r1, [r3, #8]
	movs	r3, #0
	str	r3, [r0, #4]
	str	r0, [r2, #4]
	bx	lr
.L5:
	.align	2
.L4:
	.word	REW_rewindBufferSmall
	.size	REW_createBufferEntry, .-REW_createBufferEntry
	.align	1
	.global	REW_recordCombatUnit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_recordCombatUnit, %function
REW_recordCombatUnit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r4, r1
	movs	r7, r0
	sub	sp, sp, #84
	str	r2, [sp, #4]
	add	r1, sp, #8
	movs	r2, #36
	movs	r5, r3
	movs	r0, r4
	ldr	r3, .L26
	bl	.L28
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
	beq	.L7
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
.L7:
	movs	r1, #111
	ldrsb	r1, [r4, r1]
	cmp	r1, #0
	blt	.L8
	ldr	r3, .L26+4
	add	r0, sp, #8
	bl	.L28
.L8:
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
	ldr	r3, .L26+8
	bl	.L28
	movs	r0, r4
	ldr	r3, .L26+12
	bl	.L28
	cmp	r0, #0
	ble	.L9
	movs	r3, r4
	adds	r3, r3, #80
	ldrb	r3, [r3]
	add	r2, sp, #8
	adds	r3, r3, r2
	adds	r3, r3, #40
	strb	r0, [r3]
.L9:
	movs	r1, r4
	movs	r0, #30
	add	r3, sp, #8
	movs	r2, #10
	adds	r1, r1, #30
	adds	r0, r0, r3
	ldr	r3, .L26+16
	bl	.L28
	ldr	r3, .L26+20
	add	r0, sp, #8
	bl	.L28
	movs	r6, #0
.L11:
	add	r3, sp, #8
	ldrb	r3, [r6, r3]
	ldrb	r2, [r7, r6]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L10
	ldr	r2, [sp, #4]
	adds	r2, r2, r5
	strb	r6, [r2, #12]
	strb	r3, [r2, #13]
	adds	r5, r5, #2
.L10:
	adds	r6, r6, #1
	cmp	r6, #72
	bne	.L11
	ldr	r3, .L26+24
	ldrh	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L12
	adds	r4, r4, #72
	ldrh	r0, [r4]
	ldr	r3, .L26+28
	bl	.L28
	add	r3, sp, #8
	movs	r4, r0
	ldrb	r0, [r3, #28]
	ldr	r3, .L26+32
	bl	.L28
	ldrb	r0, [r0, #6]
	subs	r0, r4, r0
	lsls	r0, r0, #24
	lsrs	r0, r0, #24
	beq	.L12
	ldr	r3, [sp, #4]
	adds	r2, r3, r5
	strb	r6, [r2, #12]
	strb	r0, [r2, #13]
	adds	r5, r5, #2
.L12:
	lsls	r0, r5, #16
	lsrs	r0, r0, #16
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L27:
	.align	2
.L26:
	.word	CpuSet
	.word	SetUnitStatus
	.word	UnitCheckStatCaps
	.word	GetBattleUnitUpdatedWeaponExp
	.word	memcpy
	.word	UnitRemoveInvalidItems
	.word	gBattleStats
	.word	GetItemUses
	.word	GetTrap
	.size	REW_recordCombatUnit, .-REW_recordCombatUnit
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
	bl	REW_createBufferEntry
	ldr	r3, .L40
	ldr	r4, .L40+4
	movs	r5, r0
	ldrb	r0, [r3, #11]
	bl	.L42
	ldr	r7, .L40+8
	movs	r6, r0
	ldrb	r0, [r7, #11]
	bl	.L42
	movs	r3, #2
	movs	r2, #19
	str	r3, [r5, #8]
	movs	r3, #0
	ldrsb	r2, [r6, r2]
	movs	r4, r0
	cmp	r2, r3
	beq	.L30
	movs	r2, r5
	movs	r0, r6
	ldr	r1, .L40
	bl	REW_recordCombatUnit
	movs	r3, r0
.L30:
	cmp	r4, #0
	beq	.L29
	movs	r2, #19
	ldrsb	r2, [r4, r2]
	cmp	r2, #0
	beq	.L29
	movs	r2, r5
	movs	r1, r7
	movs	r0, r4
	bl	REW_recordCombatUnit
.L29:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L41:
	.align	2
.L40:
	.word	gBattleActor
	.word	GetUnit
	.word	gBattleTarget
	.size	REW_recordActionCombat, .-REW_recordActionCombat
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.code 16
	.align	1
.L28:
	bx	r3
.L42:
	bx	r4
