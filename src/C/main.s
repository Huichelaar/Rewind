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
	.global	REW_initUI
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_initUI, %function
REW_initUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r4, r0
	movs	r0, #216
	sub	sp, sp, #28
	movs	r1, #3
	ldr	r3, .L2
	lsls	r0, r0, #2
	bl	.L4
	ldr	r5, .L2+4
	ldr	r0, .L2+8
	movs	r1, r5
	ldr	r3, .L2+12
	bl	.L4
	movs	r2, #0
	ldr	r3, .L2+16
	movs	r1, r5
	ldr	r0, .L2+20
	bl	.L4
	movs	r0, r4
	ldr	r5, .L2+24
	movs	r1, #2
	adds	r0, r0, #64
	bl	.L5
	movs	r0, r4
	movs	r1, #2
	adds	r0, r0, #72
	bl	.L5
	add	r0, sp, #16
	movs	r1, #3
	bl	.L5
	movs	r1, #1
	ldr	r7, .L2+28
	add	r0, sp, #16
	bl	.L6
	movs	r0, #225
	ldr	r6, .L2+32
	lsls	r0, r0, #1
	bl	.L7
	ldr	r3, .L2+36
	movs	r1, r0
	add	r0, sp, #16
	bl	.L4
	ldr	r3, .L2+40
	add	r0, sp, #16
	ldr	r1, .L2+44
	bl	.L4
	add	r0, sp, #8
	movs	r1, #4
	bl	.L5
	movs	r1, #1
	add	r0, sp, #8
	bl	.L6
	ldr	r0, .L2+48
	lsls	r0, r0, #16
	lsrs	r0, r0, #16
	bl	.L7
	ldr	r3, .L2+36
	movs	r1, r0
	add	r0, sp, #8
	bl	.L4
	ldr	r3, .L2+40
	add	r0, sp, #8
	ldr	r1, .L2+52
	bl	.L4
	movs	r0, r4
	movs	r1, #15
	adds	r0, r0, #48
	bl	.L5
	movs	r0, r4
	movs	r1, #15
	adds	r0, r0, #56
	bl	.L5
	movs	r5, #0
	ldr	r6, .L2+56
	movs	r3, r5
	movs	r2, r5
	movs	r1, r5
	str	r5, [sp, #4]
	str	r5, [sp]
	ldr	r0, .L2+60
	bl	.L7
	str	r5, [r4, #92]
	str	r0, [r4, #88]
	str	r5, [r4, #96]
	movs	r0, #1
	ldr	r3, .L2+64
	bl	.L4
	add	sp, sp, #28
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
	.word	Text_Display
	.word	gBg0MapBuffer+112
	.word	REW_phaseIndicator
	.word	gBg0MapBuffer+240
	.word	APProc_Create
	.word	REW_phaseAPDef
	.word	EnableBgSyncByIndex
	.size	REW_initUI, .-REW_initUI
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
	ldr	r5, .L25
	ldr	r0, [r0, #88]
	bl	.L5
	ldr	r0, [r4, #96]
	cmp	r0, #0
	beq	.L9
	bl	.L5
.L9:
	ldr	r0, [r4, #92]
	cmp	r0, #0
	beq	.L10
	bl	.L5
.L10:
	ldr	r0, [r4, #80]
	cmp	r0, #0
	beq	.L11
	bl	.L5
.L11:
	ldr	r0, [r4, #84]
	cmp	r0, #0
	beq	.L12
	bl	.L5
.L12:
	@ sp needed
	ldr	r3, .L25+4
	bl	.L4
	ldr	r3, .L25+8
	bl	.L4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L26:
	.align	2
.L25:
	.word	EndProc
	.word	ClearBG0BG1
	.word	UnlockGameLogic
	.size	REW_procEnd, .-REW_procEnd
	.align	1
	.global	REW_clearRewindSeq
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_clearRewindSeq, %function
REW_clearRewindSeq:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #0
	@ sp needed
	strh	r3, [r0, #2]
	bx	lr
	.size	REW_clearRewindSeq, .-REW_clearRewindSeq
	.align	1
	.global	REW_createSeqEntry
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_createSeqEntry, %function
REW_createSeqEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0, #2]
	cmp	r3, #0
	bne	.L29
	adds	r3, r3, #4
	strh	r3, [r0, #2]
.L29:
	@ sp needed
	ldrh	r3, [r0, #2]
	adds	r0, r0, r3
	bx	lr
	.size	REW_createSeqEntry, .-REW_createSeqEntry
	.align	1
	.global	REW_nextSequence
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_nextSequence, %function
REW_nextSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0, #2]
	@ sp needed
	adds	r0, r0, r3
	bx	lr
	.size	REW_nextSequence, .-REW_nextSequence
	.align	1
	.global	REW_prevSequence
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_prevSequence, %function
REW_prevSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	@ sp needed
	subs	r0, r0, r3
	bx	lr
	.size	REW_prevSequence, .-REW_prevSequence
	.align	1
	.global	REW_nextEntry
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_nextEntry, %function
REW_nextEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r2, r0
	ldrh	r0, [r0, #2]
	movs	r1, #3
	movs	r4, r0
	ands	r4, r1
	tst	r0, r1
	beq	.L33
	adds	r3, r0, #4
	subs	r3, r3, r4
	lsls	r0, r3, #16
	lsrs	r0, r0, #16
.L33:
	adds	r0, r2, r0
	@ sp needed
	pop	{r4}
	pop	{r1}
	bx	r1
	.size	REW_nextEntry, .-REW_nextEntry
	.align	1
	.global	REW_prevEntry
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_prevEntry, %function
REW_prevEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	adds	r4, r0, #4
	movs	r0, r4
	movs	r6, r1
	bl	REW_nextEntry
	movs	r5, r0
	cmp	r4, r6
	bne	.L39
	movs	r4, #0
	b	.L37
.L40:
	movs	r0, r5
	bl	REW_nextEntry
	movs	r4, r5
	movs	r5, r0
.L39:
	cmp	r5, r6
	bne	.L40
.L37:
	@ sp needed
	movs	r0, r4
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	.size	REW_prevEntry, .-REW_prevEntry
	.align	1
	.global	REW_lastEntry
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_lastEntry, %function
REW_lastEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	adds	r2, r0, #4
	push	{r4, r5, r6, lr}
	movs	r5, r2
	ldrh	r4, [r0, #2]
	adds	r4, r0, r4
.L43:
	cmp	r5, r4
	bcc	.L44
	@ sp needed
	movs	r0, r2
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L44:
	movs	r0, r5
	bl	REW_nextEntry
	movs	r2, r5
	movs	r5, r0
	b	.L43
	.size	REW_lastEntry, .-REW_lastEntry
	.align	1
	.global	REW_alignSequence
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_alignSequence, %function
REW_alignSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0, #2]
	movs	r2, #3
	movs	r1, r3
	ands	r1, r2
	tst	r3, r2
	beq	.L45
	adds	r3, r3, #4
	subs	r3, r3, r1
	strh	r3, [r0, #2]
.L45:
	@ sp needed
	bx	lr
	.size	REW_alignSequence, .-REW_alignSequence
	.align	1
	.global	REW_isUndoAvailable
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_isUndoAvailable, %function
REW_isUndoAvailable:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r0, [r0]
	@ sp needed
	subs	r3, r0, #1
	sbcs	r0, r0, r3
	bx	lr
	.size	REW_isUndoAvailable, .-REW_isUndoAvailable
	.align	1
	.global	REW_isRedoAvailable
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_isRedoAvailable, %function
REW_isRedoAvailable:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L52
	@ sp needed
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r0, r3
	sbcs	r0, r0, r0
	rsbs	r0, r0, #0
	bx	lr
.L53:
	.align	2
.L52:
	.word	REW_rewindBuffer
	.size	REW_isRedoAvailable, .-REW_isRedoAvailable
	.align	1
	.global	REW_hideRoofedUnits
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_hideRoofedUnits, %function
REW_hideRoofedUnits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r4, #1
	movs	r5, #129
.L56:
	lsls	r0, r4, #24
	ldr	r3, .L64
	lsrs	r0, r0, #24
	bl	.L4
	cmp	r0, #0
	beq	.L55
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L55
	movs	r3, #17
	ldr	r2, .L64+4
	ldr	r1, [r2]
	movs	r2, #16
	ldrsb	r3, [r0, r3]
	lsls	r3, r3, #2
	ldrsb	r2, [r0, r2]
	ldr	r3, [r3, r1]
	ldrb	r3, [r3, r2]
	cmp	r3, #34
	bne	.L55
	ldr	r3, [r0, #12]
	orrs	r3, r5
	str	r3, [r0, #12]
.L55:
	adds	r4, r4, #1
	cmp	r4, #192
	bne	.L56
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L65:
	.align	2
.L64:
	.word	GetUnit
	.word	gMapTerrain
	.size	REW_hideRoofedUnits, .-REW_hideRoofedUnits
	.align	1
	.global	REW_storeCombatData
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_storeCombatData, %function
REW_storeCombatData:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r5, r1
	movs	r7, r0
	sub	sp, sp, #108
	movs	r6, r3
	add	r3, sp, #128
	ldrb	r3, [r3]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	movs	r0, r5
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	movs	r2, #36
	ldr	r3, .L114
	add	r1, sp, #32
	bl	.L4
	movs	r0, #42
	ldrb	r1, [r7, #26]
	ldrb	r3, [r5, #26]
	ldr	r2, [r7, #4]
	subs	r3, r3, r1
	ldrb	r1, [r2, #17]
	subs	r3, r3, r1
	ldr	r1, [r7]
	ldrb	r1, [r1, #19]
	subs	r3, r3, r1
	add	r1, sp, #16
	adds	r1, r1, r0
	strb	r3, [r1]
	ldrb	r1, [r7, #29]
	ldrb	r3, [r5, #29]
	subs	r3, r3, r1
	movs	r1, #45
	ldrb	r2, [r2, #18]
	subs	r3, r3, r2
	add	r2, sp, #16
	adds	r2, r2, r1
	strb	r3, [r2]
	movs	r3, r5
	adds	r3, r3, #82
	ldrb	r3, [r3]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	beq	.L67
	movs	r3, r5
	adds	r3, r3, #81
	ldrb	r3, [r3]
	adds	r3, r3, #12
	add	r2, sp, #32
	lsls	r3, r3, #1
	adds	r3, r2, r3
	movs	r2, r5
	adds	r2, r2, #72
	ldrh	r2, [r2]
	strh	r2, [r3, #6]
.L67:
	movs	r1, #111
	ldrsb	r1, [r5, r1]
	cmp	r1, #0
	blt	.L68
	ldr	r3, .L114+4
	add	r0, sp, #32
	bl	.L4
.L68:
	movs	r2, r5
	add	r4, sp, #32
	adds	r2, r2, #115
	ldrb	r2, [r2]
	ldrb	r3, [r4, #18]
	adds	r3, r3, r2
	movs	r2, r5
	strb	r3, [r4, #18]
	adds	r2, r2, #116
	ldrb	r2, [r2]
	ldrb	r3, [r4, #20]
	adds	r3, r3, r2
	movs	r2, r5
	strb	r3, [r4, #20]
	adds	r2, r2, #117
	ldrb	r2, [r2]
	ldrb	r3, [r4, #21]
	adds	r3, r3, r2
	movs	r2, r5
	strb	r3, [r4, #21]
	adds	r2, r2, #118
	ldrb	r2, [r2]
	ldrb	r3, [r4, #22]
	adds	r3, r3, r2
	movs	r2, r5
	strb	r3, [r4, #22]
	adds	r2, r2, #119
	ldrb	r2, [r2]
	ldrb	r3, [r4, #23]
	adds	r3, r3, r2
	movs	r2, r5
	strb	r3, [r4, #23]
	adds	r2, r2, #120
	ldrb	r2, [r2]
	ldrb	r3, [r4, #24]
	adds	r3, r3, r2
	movs	r2, r5
	strb	r3, [r4, #24]
	adds	r2, r2, #121
	ldrb	r3, [r4, #25]
	ldrb	r2, [r2]
	adds	r3, r3, r2
	movs	r0, r4
	strb	r3, [r4, #25]
	ldr	r3, .L114+8
	bl	.L4
	movs	r0, r5
	ldr	r3, .L114+12
	bl	.L4
	cmp	r0, #0
	ble	.L69
	movs	r3, r5
	adds	r3, r3, #80
	ldrb	r3, [r3]
	adds	r4, r4, r3
	adds	r4, r4, #40
	strb	r0, [r4]
.L69:
	add	r4, sp, #32
	movs	r0, r4
	ldr	r3, .L114+16
	bl	.L4
	ldr	r3, [sp, #136]
	adds	r3, r3, #4
	str	r3, [sp, #4]
	ldrb	r3, [r4, #16]
	movs	r4, #0
	subs	r6, r3, r6
	lsls	r6, r6, #24
	lsrs	r6, r6, #24
	cmp	r6, r4
	beq	.L70
	movs	r3, #16
	ldr	r2, [sp, #136]
	strb	r3, [r2, #4]
	strb	r6, [r2, #5]
	adds	r4, r4, #1
.L70:
	add	r3, sp, #32
	ldrb	r3, [r3, #17]
	ldr	r2, [sp, #12]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L71
	ldr	r1, [sp, #4]
	lsls	r2, r4, #1
	adds	r2, r1, r2
	movs	r1, #17
	strb	r3, [r2, #1]
	strb	r1, [r2]
	adds	r4, r4, #1
.L71:
	movs	r2, #0
	add	r1, sp, #32
.L73:
	ldrb	r3, [r2, r1]
	ldrb	r0, [r7, r2]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L72
	ldr	r6, [sp, #4]
	lsls	r0, r4, #1
	adds	r0, r6, r0
	strb	r2, [r0]
	strb	r3, [r0, #1]
	adds	r4, r4, #1
.L72:
	adds	r2, r2, #1
	cmp	r2, #72
	bne	.L73
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L74
	movs	r3, r5
	adds	r3, r3, #72
	ldrh	r0, [r3]
	ldr	r3, .L114+20
	bl	.L4
	add	r3, sp, #32
	movs	r6, r0
	ldrb	r0, [r3, #28]
	ldr	r3, .L114+24
	bl	.L4
	ldrb	r0, [r0, #6]
	subs	r6, r6, r0
	lsls	r6, r6, #24
	lsrs	r6, r6, #24
	beq	.L74
	ldr	r2, [sp, #4]
	lsls	r3, r4, #1
	adds	r3, r2, r3
	movs	r2, #88
	strb	r6, [r3, #1]
	strb	r2, [r3]
	adds	r4, r4, #1
.L74:
	ldr	r3, [r7]
	ldrb	r0, [r3, #4]
	ldr	r3, .L114+28
	bl	.L4
	subs	r6, r0, #0
	beq	.L75
	movs	r2, #8
	ldr	r3, .L114
	add	r1, sp, #16
	bl	.L4
	movs	r2, #110
	ldrsb	r2, [r5, r2]
	cmp	r2, #0
	beq	.L76
	ldr	r3, [sp, #24]
	str	r3, [sp, #8]
	lsls	r3, r3, #8
	lsrs	r3, r3, #20
	adds	r3, r3, r2
	movs	r2, #250
	lsls	r2, r2, #4
	cmp	r3, r2
	ble	.L77
	movs	r3, r2
.L77:
	ldr	r2, [sp, #24]
	str	r2, [sp, #8]
	ldr	r1, [sp, #8]
	ldr	r2, .L114+32
	lsls	r3, r3, #20
	lsrs	r3, r3, #8
	ands	r2, r1
	orrs	r3, r2
	str	r3, [sp, #24]
.L76:
	ldr	r3, .L114+36
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	beq	.L78
	movs	r2, #250
	add	r3, sp, #16
	ldrh	r3, [r3, #12]
	lsls	r3, r3, #18
	lsrs	r3, r3, #20
	adds	r3, r3, #1
	lsls	r2, r2, #4
	cmp	r3, r2
	ble	.L79
	movs	r3, r2
.L79:
	add	r2, sp, #16
	ldrh	r2, [r2, #12]
	ldr	r1, .L114+40
	lsls	r3, r3, #20
	ands	r2, r1
	lsrs	r3, r3, #18
	orrs	r3, r2
	add	r2, sp, #16
	strh	r3, [r2, #12]
.L78:
	movs	r2, #0
.L81:
	add	r3, sp, #16
	ldrb	r3, [r2, r3]
	ldrb	r1, [r6, r2]
	subs	r3, r3, r1
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L80
	ldr	r0, [sp, #4]
	lsls	r1, r4, #1
	adds	r1, r0, r1
	movs	r0, r2
	adds	r0, r0, #72
	strb	r0, [r1]
	strb	r3, [r1, #1]
	adds	r4, r4, #1
.L80:
	adds	r2, r2, #1
	cmp	r2, #16
	bne	.L81
.L75:
	adds	r4, r4, #2
	ldr	r3, [sp, #136]
	lsls	r4, r4, #17
	lsrs	r4, r4, #16
	strh	r4, [r3, #2]
	ldr	r3, [sp, #132]
	ldrh	r3, [r3, #2]
	cmp	r3, #0
	bne	.L82
	ldr	r2, [sp, #132]
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L82:
	ldr	r3, [sp, #132]
	ldrh	r3, [r3, #2]
	adds	r4, r4, r3
	ldr	r3, [sp, #132]
	movs	r0, r3
	strh	r4, [r3, #2]
	bl	REW_alignSequence
	add	sp, sp, #108
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L115:
	.align	2
.L114:
	.word	CpuSet
	.word	SetUnitStatus
	.word	UnitCheckStatCaps
	.word	GetBattleUnitUpdatedWeaponExp
	.word	UnitRemoveInvalidItems
	.word	GetItemUses
	.word	GetTrap
	.word	BWL_GetEntry
	.word	-16773121
	.word	gBattleTarget
	.word	-16381
	.size	REW_storeCombatData, .-REW_storeCombatData
	.align	1
	.global	REW_actionCombat
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_actionCombat, %function
REW_actionCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r6, .L127
	ldr	r3, .L127+4
	sub	sp, sp, #28
	ldr	r5, .L127+8
	ldrb	r0, [r6, #11]
	ldr	r4, [r3]
	bl	.L5
	ldr	r3, .L127+12
	str	r0, [sp, #16]
	ldrb	r0, [r3, #11]
	bl	.L5
	movs	r7, #2
	movs	r3, #4
	strb	r7, [r4, #4]
	strh	r3, [r4, #2]
	movs	r5, r0
	adds	r0, r4, r3
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #11]
	strb	r3, [r0, #1]
	movs	r3, #19
	ldrsb	r3, [r6, r3]
	cmp	r3, #0
	beq	.L117
	ldr	r2, .L127+16
	ldrh	r2, [r2]
	mov	ip, r2
	ldr	r3, [r6, #12]
	ldr	r1, .L127+20
	orrs	r3, r7
	str	r3, [r6, #12]
	ldrh	r3, [r1]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	str	r3, [sp, #20]
	movs	r2, #8
	mov	r3, ip
	str	r0, [sp, #8]
	str	r4, [sp, #4]
	ldrh	r1, [r1, #2]
	lsls	r1, r1, #24
	asrs	r1, r1, #24
	str	r1, [sp]
	ands	r2, r3
	movs	r1, r6
	ldr	r3, [sp, #20]
	ldr	r0, [sp, #16]
	bl	REW_storeCombatData
	ldr	r3, [r6, #12]
	bics	r3, r7
	str	r3, [r6, #12]
.L117:
	movs	r0, r4
	bl	REW_createSeqEntry
	ldr	r7, .L127+12
	movs	r6, r0
	cmp	r5, #0
	beq	.L118
	movs	r3, #2
	strb	r3, [r0]
	ldrb	r3, [r5, #11]
	strb	r3, [r0, #1]
	movs	r3, #19
	ldrsb	r3, [r7, r3]
	cmp	r3, #0
	beq	.L116
	movs	r3, #16
	movs	r2, #17
	ldrsb	r3, [r5, r3]
	str	r0, [sp, #8]
	str	r4, [sp, #4]
	ldrsb	r2, [r5, r2]
	movs	r1, r7
	str	r2, [sp]
	movs	r0, r5
	movs	r2, #0
	bl	REW_storeCombatData
.L116:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L118:
	movs	r1, #17
	movs	r0, #16
	ldrsb	r1, [r7, r1]
	ldr	r3, .L127+24
	ldrsb	r0, [r7, r0]
	bl	.L4
	movs	r3, #66
	strh	r3, [r6]
	movs	r3, #17
	ldr	r2, .L127+28
	ldr	r1, [r2]
	movs	r2, #16
	ldrsb	r3, [r7, r3]
	lsls	r3, r3, #2
	ldrsb	r2, [r7, r2]
	ldr	r3, [r3, r1]
	ldrb	r3, [r3, r2]
	cmp	r3, #51
	bne	.L120
	subs	r3, r3, #50
	strb	r3, [r6, #1]
.L120:
	ldrb	r3, [r0]
	strb	r3, [r6, #4]
	ldrb	r3, [r0, #1]
	strb	r3, [r6, #5]
	ldrb	r3, [r0, #2]
	strb	r3, [r6, #6]
	ldrb	r2, [r0, #3]
	ldrb	r3, [r7, #19]
	subs	r3, r3, r2
	strb	r3, [r6, #7]
	movs	r3, #8
	strh	r3, [r6, #2]
	ldrh	r3, [r4, #2]
	adds	r3, r3, #8
	movs	r0, r4
	strh	r3, [r4, #2]
	bl	REW_alignSequence
	b	.L116
.L128:
	.align	2
.L127:
	.word	gBattleActor
	.word	REW_curSequence
	.word	GetUnit
	.word	gBattleTarget
	.word	gBattleStats
	.word	gActiveUnitMoveOrigin
	.word	GetTrapAt
	.word	gMapTerrain
	.size	REW_actionCombat, .-REW_actionCombat
	.align	1
	.global	REW_nextPhase
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_nextPhase, %function
REW_nextPhase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r5, r2
	movs	r4, #128
	cmp	r0, #0
	beq	.L130
	subs	r4, r4, #64
	cmp	r0, #128
	beq	.L130
	movs	r4, #0
	ldrb	r3, [r1]
	adds	r3, r3, #1
	strb	r3, [r1]
.L130:
	movs	r0, r4
	ldr	r3, .L135
	bl	.L4
	cmp	r0, #0
	bne	.L131
	movs	r3, #1
	strb	r3, [r5]
.L131:
	@ sp needed
	movs	r0, r4
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L136:
	.align	2
.L135:
	.word	GetPhaseAbleUnitCount
	.size	REW_nextPhase, .-REW_nextPhase
	.align	1
	.global	REW_actionPrePhaseChange
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_actionPrePhaseChange, %function
REW_actionPrePhaseChange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #28
	add	r2, sp, #16
	strb	r3, [r2, #2]
	strb	r3, [r2, #3]
	ldr	r2, .L166
	ldr	r4, [r2]
	str	r3, [sp, #20]
	movs	r1, r4
	ldr	r2, .L166+4
	ldr	r3, .L166+8
	add	r0, sp, #20
	bl	.L4
	ldr	r6, .L166+12
	add	r3, sp, #16
	adds	r2, r3, #3
	adds	r1, r3, #2
	ldrb	r0, [r6, #15]
	bl	REW_nextPhase
	ldr	r3, .L166+16
	str	r0, [sp, #12]
	ldr	r0, [r3]
	bl	REW_createSeqEntry
	movs	r3, #64
	strb	r3, [r0]
	subs	r3, r3, #60
	strh	r3, [r0, #2]
	ldr	r2, [sp, #12]
	ldrb	r3, [r6, #15]
	lsrs	r2, r2, #4
	lsrs	r3, r3, #6
	orrs	r3, r2
	add	r2, sp, #16
	lsls	r3, r3, #24
	ldrb	r2, [r2, #2]
	lsrs	r3, r3, #24
	movs	r5, r0
	strb	r3, [r0, #1]
	cmp	r2, #0
	beq	.L138
	movs	r2, #16
	orrs	r3, r2
	strb	r3, [r0, #1]
.L138:
	add	r3, sp, #16
	ldrb	r3, [r3, #3]
	cmp	r3, #0
	beq	.L139
	movs	r3, #32
	ldrb	r2, [r5, #1]
	orrs	r3, r2
	strb	r3, [r5, #1]
.L139:
	movs	r3, #0
	movs	r6, #1
	str	r3, [sp, #4]
	adds	r4, r4, #32
.L142:
	ldr	r3, .L166+12
	ldrb	r7, [r3, #15]
	ldr	r3, [sp, #12]
	adds	r7, r6, r7
	adds	r3, r3, r6
	lsls	r7, r7, #24
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	lsrs	r7, r7, #24
	str	r3, [sp, #8]
	movs	r0, r7
	ldr	r3, .L166+20
	bl	.L4
	cmp	r0, #0
	beq	.L140
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L140
	movs	r2, #2
	ldr	r3, [r0, #12]
	tst	r3, r2
	beq	.L140
	ldr	r3, [sp, #4]
	adds	r3, r5, r3
	strb	r7, [r3, #4]
	ldrh	r3, [r5, #2]
	adds	r3, r3, #1
	strh	r3, [r5, #2]
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	str	r3, [sp, #4]
.L140:
	ldr	r0, [sp, #8]
	ldr	r3, .L166+20
	bl	.L4
	cmp	r0, #0
	beq	.L141
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L141
	movs	r3, #12
	strb	r3, [r4]
	ldrb	r3, [r0, #12]
	strb	r3, [r4, #1]
	movs	r3, #13
	strb	r3, [r4, #2]
	ldrb	r3, [r0, #13]
	strb	r3, [r4, #3]
	movs	r3, #19
	strb	r3, [r4, #4]
	ldrb	r3, [r0, #19]
	strb	r3, [r4, #5]
	movs	r3, #48
	strb	r3, [r4, #6]
	movs	r3, r0
	adds	r3, r3, #48
	ldrb	r3, [r3]
	strb	r3, [r4, #7]
	movs	r3, #49
	strb	r3, [r4, #8]
	movs	r3, r0
	adds	r3, r3, #49
	ldrb	r3, [r3]
	strb	r3, [r4, #9]
	movs	r3, #50
	strb	r3, [r4, #10]
	movs	r3, r0
	adds	r3, r3, #50
	ldrb	r3, [r3]
	strb	r3, [r4, #11]
	movs	r3, #51
	strb	r3, [r4, #12]
	movs	r3, r0
	adds	r3, r3, #51
	ldrb	r3, [r3]
	strb	r3, [r4, #13]
	movs	r3, #52
	strb	r3, [r4, #14]
	movs	r3, r0
	adds	r3, r3, #52
	ldrb	r3, [r3]
	strb	r3, [r4, #15]
	movs	r3, #53
	strb	r3, [r4, #16]
	movs	r3, r0
	adds	r3, r3, #53
	ldrb	r3, [r3]
	strb	r3, [r4, #17]
	movs	r3, #54
	strb	r3, [r4, #18]
	movs	r3, r0
	adds	r3, r3, #54
	ldrb	r3, [r3]
	strb	r3, [r4, #19]
	movs	r3, #55
	strb	r3, [r4, #20]
	movs	r3, r0
	adds	r3, r3, #55
	ldrb	r3, [r3]
	strb	r3, [r4, #21]
	movs	r3, #56
	strb	r3, [r4, #22]
	movs	r3, r0
	adds	r3, r3, #56
	ldrb	r3, [r3]
	strb	r3, [r4, #23]
	movs	r3, #11
	strb	r3, [r4, #24]
	ldrb	r2, [r0, #11]
	strb	r3, [r4, #26]
	strb	r2, [r4, #25]
	ldrb	r2, [r0, #11]
	strb	r3, [r4, #28]
	strb	r2, [r4, #27]
	ldrb	r2, [r0, #11]
	strb	r3, [r4, #30]
	strb	r2, [r4, #29]
	ldrb	r3, [r0, #11]
	strb	r3, [r4, #31]
.L141:
	adds	r6, r6, #1
	lsls	r6, r6, #24
	lsrs	r6, r6, #24
	adds	r4, r4, #32
	cmp	r6, #64
	bne	.L142
	ldr	r3, .L166+16
	ldr	r0, [r3]
	ldrh	r3, [r0, #2]
	cmp	r3, #0
	bne	.L143
	adds	r3, r3, #4
	strh	r3, [r0, #2]
.L143:
	ldrh	r3, [r0, #2]
	ldrh	r2, [r5, #2]
	adds	r3, r3, r2
	strh	r3, [r0, #2]
	bl	REW_alignSequence
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L167:
	.align	2
.L166:
	.word	REW_rewindBuffer
	.word	16777728
	.word	CpuFastSet
	.word	gChapterData
	.word	REW_curSequence
	.word	GetUnit
	.size	REW_actionPrePhaseChange, .-REW_actionPrePhaseChange
	.align	1
	.global	REW_actionPostPhaseChange
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_actionPostPhaseChange, %function
REW_actionPostPhaseChange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L189
	ldr	r5, [r3]
	sub	sp, sp, #44
	movs	r0, r5
	bl	REW_lastEntry
	ldrh	r3, [r5, #2]
	movs	r4, r0
	cmp	r3, #0
	beq	.L168
	ldrb	r3, [r0]
	cmp	r3, #64
	bne	.L168
	movs	r2, #63
	ldr	r3, .L189+4
	ldr	r3, [r3]
	str	r3, [sp, #24]
	ldrb	r3, [r0, #1]
	lsls	r3, r3, #4
	bics	r3, r2
	movs	r2, #128
	lsls	r3, r3, #24
	lsls	r2, r2, #17
	adds	r2, r3, r2
	lsrs	r2, r2, #24
	str	r2, [sp, #8]
	movs	r2, #252
	lsls	r2, r2, #22
	adds	r3, r3, r2
	lsrs	r3, r3, #24
	str	r3, [sp, #36]
.L170:
	ldr	r3, [sp, #36]
	ldr	r2, [sp, #8]
	cmp	r3, r2
	bge	.L175
	ldr	r3, .L189
	ldr	r0, [r3]
	bl	REW_alignSequence
.L168:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L175:
	ldr	r3, [sp, #8]
	lsls	r7, r3, #24
	lsrs	r7, r7, #24
	movs	r0, r7
	ldr	r3, .L189+8
	bl	.L4
	subs	r6, r0, #0
	beq	.L171
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L171
	ldr	r3, .L189
	ldr	r3, [r3]
	str	r3, [sp, #4]
	movs	r3, #63
	ldr	r2, [sp, #24]
	ands	r3, r7
	lsls	r3, r3, #5
	adds	r2, r2, r3
	str	r2, [sp]
	ldr	r2, [sp, #24]
	adds	r2, r2, #32
	adds	r3, r2, r3
	str	r3, [sp, #32]
	movs	r3, #0
	str	r3, [sp, #16]
.L174:
	ldr	r3, [sp]
	ldrb	r3, [r3]
	ldrb	r5, [r6, r3]
	str	r3, [sp, #20]
	ldr	r3, [sp]
	ldrb	r3, [r3, #1]
	subs	r5, r5, r3
	lsls	r5, r5, #24
	lsrs	r5, r5, #24
	beq	.L172
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L173
	movs	r0, r4
	bl	REW_nextEntry
	movs	r3, #65
	movs	r4, r0
	strb	r3, [r0]
	subs	r3, r3, #61
	strh	r3, [r0, #2]
	strb	r7, [r0, #1]
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #2]
	ldr	r2, [sp, #4]
	adds	r3, r3, #4
	strh	r3, [r2, #2]
	adds	r3, r0, #4
	str	r3, [sp, #28]
	ldr	r3, [sp, #16]
	str	r3, [sp, #12]
.L173:
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #28]
	lsls	r3, r3, #1
	adds	r3, r2, r3
	ldr	r2, [sp, #20]
	strb	r5, [r3, #1]
	strb	r2, [r3]
	ldrh	r3, [r4, #2]
	adds	r3, r3, #2
	strh	r3, [r4, #2]
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #2]
	ldr	r2, [sp, #4]
	adds	r3, r3, #2
	strh	r3, [r2, #2]
	ldr	r3, [sp, #12]
	adds	r3, r3, #1
	str	r3, [sp, #12]
	movs	r3, #1
	str	r3, [sp, #16]
.L172:
	ldr	r3, [sp]
	adds	r3, r3, #2
	str	r3, [sp]
	ldr	r2, [sp]
	ldr	r3, [sp, #32]
	cmp	r3, r2
	bne	.L174
.L171:
	ldr	r3, [sp, #8]
	adds	r3, r3, #1
	str	r3, [sp, #8]
	b	.L170
.L190:
	.align	2
.L189:
	.word	REW_curSequence
	.word	REW_rewindBuffer
	.word	GetUnit
	.size	REW_actionPostPhaseChange, .-REW_actionPostPhaseChange
	.align	1
	.global	REW_findCurSequence
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_findCurSequence, %function
REW_findCurSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L192
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	ldr	r0, .L192+4
	lsls	r3, r3, #20
	lsls	r0, r0, #16
	adds	r4, r4, r3
	lsrs	r0, r0, #16
	ldr	r3, .L192+8
	bl	.L4
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L193:
	.align	2
.L192:
	.word	gSaveBlockDecl
	.word	EMS_CHUNK_REWIND_SEQ
	.word	MS_FindSuspendSaveChunk
	.size	REW_findCurSequence, .-REW_findCurSequence
	.align	1
	.global	REW_clearCurSequence
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_clearCurSequence, %function
REW_clearCurSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #0
	push	{r4, lr}
	ldr	r4, .L195
	@ sp needed
	ldr	r3, [r4]
	strh	r2, [r3]
	strh	r2, [r3, #2]
	bl	REW_findCurSequence
	movs	r2, #4
	movs	r1, r0
	ldr	r3, .L195+4
	movs	r0, r4
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L196:
	.align	2
.L195:
	.word	REW_curSequence
	.word	WriteAndVerifySramFast
	.size	REW_clearCurSequence, .-REW_clearCurSequence
	.align	1
	.global	REW_findRewindBuf
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_findRewindBuf, %function
REW_findRewindBuf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L198
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	ldr	r0, .L198+4
	lsls	r3, r3, #20
	lsls	r0, r0, #16
	adds	r4, r4, r3
	lsrs	r0, r0, #16
	ldr	r3, .L198+8
	bl	.L4
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L199:
	.align	2
.L198:
	.word	gSaveBlockDecl
	.word	EMS_CHUNK_REWIND_BUF
	.word	MS_FindSuspendSaveChunk
	.size	REW_findRewindBuf, .-REW_findRewindBuf
	.align	1
	.global	REW_clearRewindBuf
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_clearRewindBuf, %function
REW_clearRewindBuf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r0, r1, r2, lr}
	str	r3, [sp, #4]
	bl	REW_findRewindBuf
	movs	r2, #4
	movs	r1, r0
	ldr	r3, .L201
	add	r0, sp, #4
	bl	.L4
	add	sp, sp, #12
	@ sp needed
	pop	{r0}
	bx	r0
.L202:
	.align	2
.L201:
	.word	WriteAndVerifySramFast
	.size	REW_clearRewindBuf, .-REW_clearRewindBuf
	.align	1
	.global	REW_cpPhaseChangeSave
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_cpPhaseChangeSave, %function
REW_cpPhaseChangeSave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L208
	movs	r4, r0
	ldrb	r0, [r3, #15]
	ldr	r3, .L208+4
	bl	.L4
	cmp	r0, #0
	beq	.L204
	movs	r2, #2
	ldr	r3, .L208+8
	movs	r0, #3
	strb	r2, [r3, #22]
	ldr	r3, .L208+12
	bl	.L4
.L204:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L208+16
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L209:
	.align	2
.L208:
	.word	gChapterData
	.word	GetPhaseAbleUnitCount
	.word	gActionData
	.word	SaveSuspendedGame
	.word	CpPhase_Init
	.size	REW_cpPhaseChangeSave, .-REW_cpPhaseChangeSave
	.align	1
	.global	REW_loadActiveUnitMoveOrigin
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_loadActiveUnitMoveOrigin, %function
REW_loadActiveUnitMoveOrigin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	ldr	r3, .L211
	movs	r2, r1
	ldr	r3, [r3]
	add	r1, sp, #4
	bl	.L4
	mov	r2, sp
	ldrb	r2, [r2, #4]
	ldr	r3, .L211+4
	lsls	r2, r2, #24
	asrs	r2, r2, #24
	strh	r2, [r3]
	mov	r2, sp
	ldrb	r2, [r2, #5]
	lsls	r2, r2, #24
	asrs	r2, r2, #24
	strh	r2, [r3, #2]
	add	sp, sp, #12
	@ sp needed
	pop	{r0}
	bx	r0
.L212:
	.align	2
.L211:
	.word	ReadSramFast
	.word	gActiveUnitMoveOrigin
	.size	REW_loadActiveUnitMoveOrigin, .-REW_loadActiveUnitMoveOrigin
	.align	1
	.global	REW_saveActiveUnitMoveOrigin
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_saveActiveUnitMoveOrigin, %function
REW_saveActiveUnitMoveOrigin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	mov	r4, sp
	@ sp needed
	ldr	r3, .L214
	movs	r2, r1
	ldrh	r1, [r3]
	strb	r1, [r4, #4]
	ldrh	r3, [r3, #2]
	movs	r1, r0
	strb	r3, [r4, #5]
	add	r0, sp, #4
	ldr	r3, .L214+4
	bl	.L4
	pop	{r0, r1, r4}
	pop	{r0}
	bx	r0
.L215:
	.align	2
.L214:
	.word	gActiveUnitMoveOrigin
	.word	WriteAndVerifySramFast
	.size	REW_saveActiveUnitMoveOrigin, .-REW_saveActiveUnitMoveOrigin
	.align	1
	.global	REW_loadCurSequence
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_loadCurSequence, %function
REW_loadCurSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r3, .L217
	ldr	r1, .L217+4
	ldr	r3, [r3]
	ldr	r1, [r1]
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L218:
	.align	2
.L217:
	.word	ReadSramFast
	.word	REW_curSequence
	.size	REW_loadCurSequence, .-REW_loadCurSequence
	.align	1
	.global	REW_saveCurSequence
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_saveCurSequence, %function
REW_saveCurSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L221
	ldrb	r3, [r3, #22]
	movs	r2, r1
	cmp	r3, #1
	bne	.L219
	ldr	r3, .L221+4
	movs	r1, r0
	ldr	r0, [r3]
	ldr	r3, .L221+8
	bl	.L4
.L219:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L222:
	.align	2
.L221:
	.word	gActionData
	.word	REW_curSequence
	.word	WriteAndVerifySramFast
	.size	REW_saveCurSequence, .-REW_saveCurSequence
	.align	1
	.global	REW_loadRewind
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_loadRewind, %function
REW_loadRewind:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r3, .L224
	ldr	r1, .L224+4
	ldr	r3, [r3]
	ldr	r1, [r1]
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L225:
	.align	2
.L224:
	.word	ReadSramFast
	.word	REW_rewindBuffer
	.size	REW_loadRewind, .-REW_loadRewind
	.align	1
	.global	REW_initProc
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_initProc, %function
REW_initProc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r4, r0
	bl	REW_findRewindBuf
	ldr	r1, .L236
	lsls	r1, r1, #16
	lsrs	r1, r1, #16
	bl	REW_loadRewind
	ldr	r3, .L236+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L227
	movs	r0, r4
	ldr	r3, .L236+8
	bl	.L4
.L226:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L227:
	ldr	r0, [r3, #4]
	movs	r3, #2
	str	r0, [r4, #44]
	adds	r4, r4, #41
	strb	r3, [r4]
	ldrh	r3, [r0]
	cmp	r3, #0
	beq	.L229
	movs	r3, #6
	strb	r3, [r4]
.L229:
	bl	REW_isRedoAvailable
	cmp	r0, #0
	beq	.L226
	movs	r3, #8
	ldrb	r2, [r4]
	orrs	r3, r2
	strb	r3, [r4]
	b	.L226
.L237:
	.align	2
.L236:
	.word	REW_rewindSize
	.word	REW_rewindBuffer
	.word	EndProc
	.size	REW_initProc, .-REW_initProc
	.align	1
	.global	REW_saveRewind
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_saveRewind, %function
REW_saveRewind:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r6, .L248
	str	r0, [sp, #4]
	ldr	r3, [r6]
	ldrh	r3, [r3, #2]
	movs	r5, r1
	cmp	r3, #0
	beq	.L238
	movs	r7, #8
	ldr	r3, .L248+4
	ldrb	r3, [r3, #22]
	bics	r3, r7
	cmp	r3, #1
	beq	.L238
	bl	REW_loadRewind
	ldr	r3, .L248+8
	ldr	r4, [r3]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L240
	ldr	r3, [r4, #4]
	ldrh	r3, [r3, #2]
.L241:
	ldr	r2, [r4]
	adds	r7, r4, r2
	ldr	r1, [r6]
	strh	r3, [r7]
	ldrh	r3, [r1, #2]
	str	r3, [sp]
	strh	r3, [r7, #2]
	ldrh	r2, [r1, #2]
	ldr	r3, .L248+12
	subs	r2, r2, #4
	adds	r1, r1, #4
	adds	r0, r7, #4
	bl	.L4
	ldr	r2, [r4]
	mov	ip, r2
	ldr	r3, [sp]
	add	r3, r3, ip
	movs	r2, r5
	str	r3, [r4]
	movs	r0, r4
	ldr	r3, .L248+16
	str	r7, [r4, #4]
	ldr	r1, [sp, #4]
	bl	.L4
	movs	r2, #0
	ldr	r3, [r6]
	strh	r2, [r3, #2]
.L238:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L240:
	str	r7, [r4]
	b	.L241
.L249:
	.align	2
.L248:
	.word	REW_curSequence
	.word	gActionData
	.word	REW_rewindBuffer
	.word	memcpy
	.word	WriteAndVerifySramFast
	.size	REW_saveRewind, .-REW_saveRewind
	.align	1
	.global	REW_rewindMenuUsability
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_rewindMenuUsability, %function
REW_rewindMenuUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	ldr	r3, .L253
	ldr	r4, [r3]
	bl	REW_findRewindBuf
	movs	r2, #4
	add	r1, sp, #4
	bl	.L255
	ldr	r3, [sp, #4]
	movs	r0, #1
	cmp	r3, #0
	bne	.L251
	adds	r0, r0, #2
.L251:
	@ sp needed
	pop	{r1, r2, r4}
	pop	{r1}
	bx	r1
.L254:
	.align	2
.L253:
	.word	ReadSramFast
	.size	REW_rewindMenuUsability, .-REW_rewindMenuUsability
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
	ldr	r3, .L257
	@ sp needed
	bl	.L4
	ldr	r3, .L257+4
	movs	r1, #3
	ldr	r0, .L257+8
	bl	.L4
	movs	r3, #0
	str	r3, [r0, #80]
	str	r3, [r0, #84]
	movs	r0, #23
	pop	{r4}
	pop	{r1}
	bx	r1
.L258:
	.align	2
.L257:
	.word	LockGameLogic
	.word	ProcStart
	.word	.LANCHOR0
	.size	REW_rewindMenuEffect, .-REW_rewindMenuEffect
	.align	1
	.global	REW_displayActor
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_displayActor, %function
REW_displayActor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r3, .L260
	@ sp needed
	movs	r5, r0
	ldrb	r0, [r1, #1]
	movs	r6, r2
	bl	.L4
	ldr	r3, [r0, #4]
	ldrb	r7, [r3, #4]
	ldr	r3, [r0]
	movs	r4, r0
	ldrh	r0, [r3]
	ldr	r3, .L260+4
	bl	.L4
	ldr	r3, .L260+8
	movs	r1, r0
	movs	r0, r6
	bl	.L4
	movs	r0, r4
	ldr	r3, .L260+12
	bl	.L4
	movs	r1, #0
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	ldr	r4, .L260+16
	movs	r0, r1
	rsbs	r3, r3, #0
	bl	.L255
	movs	r3, #128
	movs	r2, r0
	lsls	r3, r3, #3
	adds	r2, r2, #8
	str	r0, [r5, #80]
	ldr	r1, [r0, #48]
	strh	r3, [r2, #62]
	ldr	r4, .L260+20
	ldrh	r2, [r1, #34]
	ands	r2, r4
	orrs	r3, r2
	movs	r2, r0
	strh	r3, [r1, #34]
	adds	r2, r2, #76
	ldrh	r3, [r2]
	adds	r3, r3, #1
	adds	r3, r3, #255
	strh	r3, [r2]
	ldrh	r3, [r2, #2]
	adds	r3, r3, #129
	adds	r3, r3, #255
	strh	r3, [r2, #2]
	movs	r1, #4
	ldr	r3, .L260+24
	bl	.L4
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L261:
	.align	2
.L260:
	.word	GetUnit
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	GetUnitMapSpritePaletteIndex
	.word	MU_CreateInternal
	.word	-3073
	.word	MU_SetFacing
	.size	REW_displayActor, .-REW_displayActor
	.align	1
	.global	REW_displayTarget
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_displayTarget, %function
REW_displayTarget:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrb	r3, [r1]
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r6, r0
	movs	r4, r2
	cmp	r3, #2
	bne	.L263
	ldrb	r0, [r1, #1]
	ldr	r3, .L269
	bl	.L4
	ldr	r3, [r0, #4]
	ldrb	r7, [r3, #4]
	ldr	r3, [r0]
	movs	r5, r0
	ldrh	r0, [r3]
	ldr	r3, .L269+4
	bl	.L4
	ldr	r3, .L269+8
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r0, r4
	ldr	r3, .L269+12
	bl	.L4
	ldr	r3, .L269+16
	movs	r4, r0
	movs	r0, r5
	bl	.L4
	movs	r1, #0
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	ldr	r5, .L269+20
	movs	r0, r1
	rsbs	r3, r3, #0
	bl	.L5
	movs	r3, #128
	movs	r2, r0
	lsls	r3, r3, #3
	adds	r2, r2, #8
	str	r0, [r6, #84]
	ldr	r1, [r0, #48]
	strh	r3, [r2, #62]
	ldr	r5, .L269+24
	ldrh	r2, [r1, #34]
	ands	r2, r5
	orrs	r3, r2
	movs	r2, r0
	strh	r3, [r1, #34]
	movs	r1, #4
	adds	r2, r2, #76
	ldrh	r3, [r2]
	adds	r4, r4, #43
	adds	r3, r3, #128
	lsls	r4, r4, #4
	adds	r4, r3, r4
	ldrh	r3, [r2, #2]
	adds	r3, r3, #129
	adds	r3, r3, #255
	strh	r3, [r2, #2]
	strh	r4, [r2]
	ldr	r3, .L269+28
.L268:
	bl	.L4
.L262:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L263:
	cmp	r3, #66
	bne	.L262
	ldrb	r2, [r1, #1]
	movs	r0, #51
	ldr	r3, .L269+32
	lsls	r2, r2, #31
	bmi	.L267
	movs	r0, #27
.L267:
	bl	.L4
	ldr	r3, .L269+8
	movs	r1, r0
	movs	r0, r4
	b	.L268
.L270:
	.align	2
.L269:
	.word	GetUnit
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	Text_GetXCursor
	.word	GetUnitMapSpritePaletteIndex
	.word	MU_CreateInternal
	.word	-3073
	.word	MU_SetFacing
	.word	GetTerrainName
	.size	REW_displayTarget, .-REW_displayTarget
	.align	1
	.global	REW_displayCombatVerb
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_displayCombatVerb, %function
REW_displayCombatVerb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r5, r1
	bl	REW_nextEntry
	ldr	r4, .L273
	ldrb	r3, [r0]
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	cmp	r3, #66
	bne	.L272
	ldrb	r2, [r0, #6]
	ldrb	r1, [r0, #5]
	ldr	r3, .L273+4
	ldrb	r0, [r0, #4]
	bl	.L4
	cmp	r0, #0
	bne	.L272
	ldr	r4, .L273+8
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
.L272:
	movs	r0, r4
	@ sp needed
	ldr	r3, .L273+12
	bl	.L4
	ldr	r3, .L273+16
	movs	r1, r0
	movs	r0, r5
	bl	.L4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L274:
	.align	2
.L273:
	.word	REW_combat
	.word	GetSpecificTrapAt
	.word	REW_obstacleDestroyed
	.word	GetStringFromIndex
	.word	Text_DrawString
	.size	REW_displayCombatVerb, .-REW_displayCombatVerb
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.global	__aeabi_uidivmod
	.global	__aeabi_idivmod
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC124:
	.ascii	".\000"
	.text
	.align	1
	.global	REW_refreshUI
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_refreshUI, %function
REW_refreshUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r6, r0
	adds	r6, r6, #41
	ldrb	r3, [r6]
	movs	r5, r0
	lsls	r3, r3, #30
	bpl	.L276
	movs	r4, r0
	ldr	r3, .L320
	ldrh	r7, [r3, #16]
	adds	r4, r4, #64
	lsls	r3, r7, #31
	bpl	.L278
	adds	r4, r4, #8
.L278:
	movs	r0, r4
	ldr	r3, .L320+4
	bl	.L4
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L320+8
	bl	.L4
	cmp	r7, #9
	bgt	.L279
	movs	r1, #6
	movs	r0, r4
	ldr	r3, .L320+12
	bl	.L4
	movs	r1, r7
.L317:
	movs	r0, r4
	ldr	r3, .L320+16
	bl	.L4
.L280:
	ldr	r3, .L320+20
	movs	r0, r4
	ldr	r1, .L320+24
	bl	.L4
	movs	r2, #2
	ldrb	r3, [r6]
	bics	r3, r2
	strb	r3, [r6]
.L276:
	ldrb	r1, [r6]
	lsls	r3, r1, #31
	bpl	.L281
	ldr	r3, .L320
	ldrb	r3, [r3, #15]
	cmp	r3, #64
	beq	.L298
	subs	r3, r3, #128
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	lsls	r3, r3, #12
.L282:
	ldr	r2, [r5, #88]
	ldr	r0, [r2, #80]
	ldrh	r2, [r0, #34]
	lsls	r2, r2, #20
	lsrs	r2, r2, #20
	orrs	r3, r2
	strh	r3, [r0, #34]
	movs	r3, #1
	bics	r1, r3
	strb	r1, [r6]
.L281:
	ldrb	r2, [r6]
	movs	r3, #4
	movs	r4, r2
	ldr	r1, [r5, #92]
	ands	r4, r3
	tst	r2, r3
	beq	.L283
	cmp	r1, #0
	bne	.L284
	movs	r3, r1
	movs	r2, r1
	str	r1, [sp, #4]
	str	r1, [sp]
	ldr	r0, .L320+28
	ldr	r4, .L320+32
	bl	.L255
	str	r0, [r5, #92]
.L284:
	ldrb	r2, [r6]
	movs	r3, #8
	movs	r4, r2
	ldr	r1, [r5, #96]
	ands	r4, r3
	tst	r2, r3
	beq	.L285
	cmp	r1, #0
	bne	.L286
	movs	r3, r1
	movs	r2, r1
	str	r1, [sp, #4]
	str	r1, [sp]
	ldr	r0, .L320+36
	ldr	r4, .L320+32
	bl	.L255
	str	r0, [r5, #96]
.L286:
	movs	r4, #0
	ldr	r3, .L320+40
	bl	.L4
	str	r4, [r5, #80]
	str	r4, [r5, #84]
.L287:
	ldr	r3, .L320+44
	lsls	r0, r4, #6
	adds	r0, r0, r3
	movs	r2, #48
	movs	r1, #0
	ldr	r3, .L320+48
	adds	r4, r4, #1
	bl	.L4
	cmp	r4, #20
	bne	.L287
	movs	r4, r5
	movs	r3, #16
	ldrb	r2, [r6]
	adds	r4, r4, #48
	tst	r2, r3
	beq	.L289
	adds	r4, r4, #8
.L289:
	eors	r3, r2
	strb	r3, [r6]
	movs	r0, r4
	ldr	r3, .L320+4
	bl	.L4
	ldr	r3, .L320+52
	movs	r1, #2
	movs	r0, r4
	bl	.L4
	ldr	r3, [r5, #44]
	adds	r6, r3, #4
.L290:
	ldrb	r3, [r6]
	cmp	r3, #2
	beq	.L295
	cmp	r3, #64
	beq	.L296
	movs	r0, r6
	bl	REW_nextEntry
	movs	r6, r0
	b	.L290
.L279:
	cmp	r7, #99
	bgt	.L280
	ldr	r3, .L320+56
	movs	r1, #10
	movs	r0, r7
	bl	.L4
	ldr	r3, .L320+16
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r1, #16
	movs	r0, r4
	ldr	r3, .L320+12
	bl	.L4
	movs	r0, r7
	ldr	r3, .L320+60
	movs	r1, #10
	bl	.L4
	b	.L317
.L298:
	movs	r3, #128
	lsls	r3, r3, #6
	b	.L282
.L283:
	cmp	r1, #0
	beq	.L284
	movs	r0, r1
	ldr	r3, .L320+64
	bl	.L4
	str	r4, [r5, #92]
	b	.L284
.L285:
	cmp	r1, #0
	beq	.L286
	movs	r0, r1
	ldr	r3, .L320+64
	bl	.L4
	str	r4, [r5, #96]
	b	.L286
.L295:
	movs	r2, r4
	movs	r1, r6
	movs	r0, r5
	bl	REW_displayActor
	movs	r1, r4
	movs	r0, r6
	bl	REW_displayCombatVerb
	movs	r0, r6
	bl	REW_nextEntry
	movs	r2, r4
	movs	r1, r0
	movs	r0, r5
	bl	REW_displayTarget
	ldr	r1, .L320+68
	movs	r0, r4
	ldr	r3, .L320+72
	bl	.L4
	ldr	r1, .L320+76
.L319:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L320+20
	bl	.L4
	movs	r0, #0
	ldr	r3, .L320+80
	bl	.L4
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L296:
	ldr	r3, .L320
	ldrb	r2, [r3, #15]
	ldr	r7, .L320+84
	ldr	r6, .L320+88
	ldr	r5, .L320+92
	ldr	r0, .L320+96
	cmp	r2, #0
	beq	.L318
	ldr	r3, .L320+12
	cmp	r2, #128
	beq	.L293
	movs	r1, #4
	movs	r0, r4
	bl	.L4
	ldr	r0, .L320+100
	b	.L318
.L293:
	movs	r1, #1
	movs	r0, r4
	bl	.L4
	ldr	r0, .L320+104
.L318:
	lsls	r0, r0, #16
	lsrs	r0, r0, #16
	bl	.L6
	movs	r1, r0
	movs	r0, r4
	bl	.L7
	movs	r1, r5
	b	.L319
.L321:
	.align	2
.L320:
	.word	gChapterData
	.word	Text_Clear
	.word	Text_SetColorId
	.word	Text_Advance
	.word	Text_DrawNumber
	.word	Text_Display
	.word	gBg0MapBuffer+118
	.word	REW_upArrowAPDef
	.word	APProc_Create
	.word	REW_downArrowAPDef
	.word	MU_EndAll
	.word	gBg0MapBuffer
	.word	memset
	.word	Text_SetXCursor
	.word	__aeabi_idiv
	.word	__aeabi_idivmod
	.word	EndProc
	.word	.LC124
	.word	Text_DrawChar
	.word	gBg0MapBuffer+138
	.word	EnableBgSyncByIndex
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	gBg0MapBuffer+140
	.word	REW_phaseBlue
	.word	REW_phaseGreen
	.word	REW_phaseRed
	.size	REW_refreshUI, .-REW_refreshUI
	.align	1
	.global	REW_undo
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_undo, %function
REW_undo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #20
	movs	r7, r0
	bl	REW_lastEntry
.L362:
	movs	r4, r0
.L323:
	cmp	r4, #0
	bne	.L340
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L340:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L324
	bhi	.L325
	cmp	r3, #2
	beq	.L324
	cmp	r3, #64
	beq	.L326
.L327:
	movs	r1, r4
	movs	r0, r7
	bl	REW_prevEntry
	b	.L362
.L325:
	cmp	r3, #66
	bne	.L327
	ldrb	r2, [r4, #6]
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L363
	bl	.L4
	subs	r5, r0, #0
	beq	.L333
	ldrb	r3, [r0, #3]
	ldrb	r2, [r4, #7]
	subs	r3, r3, r2
	strb	r3, [r0, #3]
	b	.L327
.L326:
	ldrb	r2, [r4, #1]
	ldr	r3, .L363+4
	lsls	r1, r2, #6
	strb	r1, [r3, #15]
	movs	r1, #16
	tst	r2, r1
	beq	.L329
	ldrh	r2, [r3, #16]
	subs	r2, r2, #1
	strh	r2, [r3, #16]
.L329:
	movs	r5, r4
.L330:
	ldrh	r3, [r4, #2]
	subs	r3, r3, #4
	subs	r2, r5, r4
	cmp	r3, r2
	ble	.L327
	ldrb	r0, [r5, #4]
	ldr	r3, .L363+8
	bl	.L4
	cmp	r0, #0
	beq	.L331
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L331
	movs	r3, #2
	ldr	r2, [r0, #12]
	orrs	r3, r2
	str	r3, [r0, #12]
.L331:
	adds	r5, r5, #1
	b	.L330
.L333:
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L363+12
	bl	.L4
	lsls	r0, r0, #16
	movs	r2, r5
	movs	r1, r5
	ldr	r3, .L363+16
	lsrs	r0, r0, #16
	bl	.L4
	ldrb	r3, [r4, #7]
	ldrb	r2, [r4, #6]
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r5, .L363+20
	rsbs	r3, r3, #0
	bl	.L5
	b	.L327
.L324:
	ldrb	r0, [r4, #1]
	ldr	r3, .L363+8
	bl	.L4
	subs	r5, r0, #0
	beq	.L323
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L323
	movs	r3, #16
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #8]
	movs	r3, #17
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #12]
	movs	r3, #0
	str	r3, [sp, #4]
	adds	r6, r4, #4
.L335:
	ldrh	r2, [r4, #2]
	subs	r2, r2, #4
	lsrs	r3, r2, #31
	adds	r3, r3, r2
	ldr	r2, [sp, #4]
	asrs	r3, r3, #1
	cmp	r3, r2
	bgt	.L339
	ldr	r2, .L363+24
	ldr	r3, [sp, #12]
	ldr	r1, [r2]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	movs	r1, #0
	ldr	r0, [sp, #8]
	strb	r1, [r3, r0]
	movs	r3, #17
	ldr	r1, [r2]
	movs	r2, #16
	ldrsb	r3, [r5, r3]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	ldrsb	r2, [r5, r2]
	ldrb	r1, [r5, #11]
	strb	r1, [r3, r2]
	b	.L327
.L339:
	ldrb	r3, [r6]
	cmp	r3, #71
	bhi	.L336
	ldrb	r2, [r5, r3]
	ldrb	r1, [r6, #1]
	subs	r2, r2, r1
	strb	r2, [r5, r3]
.L337:
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	str	r3, [sp, #4]
	adds	r6, r6, #2
	b	.L335
.L336:
	cmp	r3, #87
	bhi	.L338
	ldr	r3, [r5]
	ldrb	r0, [r3, #4]
	ldr	r3, .L363+28
	bl	.L4
	ldrb	r3, [r6]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r6, #1]
	subs	r2, r2, r1
	strb	r2, [r0, r3]
	b	.L337
.L338:
	cmp	r3, #88
	bne	.L337
	ldr	r3, .L363+32
	ldrb	r0, [r5, #28]
	bl	.L4
	ldrb	r2, [r6, #1]
	ldrb	r3, [r0, #6]
	subs	r3, r3, r2
	strb	r3, [r0, #6]
	b	.L337
.L364:
	.align	2
.L363:
	.word	GetSpecificTrapAt
	.word	gChapterData
	.word	GetUnit
	.word	GetMapChangesIdAt
	.word	UntriggerMapChange
	.word	AddTrap
	.word	gMapUnit
	.word	BWL_GetEntry
	.word	GetTrap
	.size	REW_undo, .-REW_undo
	.align	1
	.global	REW_redo
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_redo, %function
REW_redo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldrh	r3, [r0, #2]
	sub	sp, sp, #20
	adds	r3, r0, r3
	str	r3, [sp, #12]
	adds	r4, r0, #4
.L366:
	ldr	r3, [sp, #12]
	cmp	r4, r3
	bcc	.L383
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L383:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L367
	bhi	.L368
	cmp	r3, #2
	beq	.L367
	cmp	r3, #64
	beq	.L369
.L370:
	movs	r0, r4
	bl	REW_nextEntry
	movs	r4, r0
	b	.L366
.L368:
	cmp	r3, #66
	bne	.L370
	ldr	r3, .L405
	ldrb	r2, [r4, #6]
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	bl	.L4
	ldrb	r3, [r4, #7]
	ldrb	r5, [r0, #3]
	adds	r5, r5, r3
	lsls	r5, r5, #24
	lsrs	r5, r5, #24
	strb	r5, [r0, #3]
	bne	.L370
	ldr	r3, .L405+4
	bl	.L4
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L405+8
	bl	.L4
	lsls	r0, r0, #16
	movs	r2, r5
	movs	r1, r5
	ldr	r3, .L405+12
	lsrs	r0, r0, #16
	bl	.L4
	b	.L370
.L369:
	movs	r0, #63
	ldrb	r1, [r4, #1]
	ldr	r3, .L405+16
	lsls	r2, r1, #4
	bics	r2, r0
	strb	r2, [r3, #15]
	movs	r2, #16
	tst	r1, r2
	beq	.L372
	ldrh	r2, [r3, #16]
	adds	r2, r2, #1
	strh	r2, [r3, #16]
.L372:
	movs	r5, r4
	movs	r6, #66
.L373:
	ldrh	r3, [r4, #2]
	subs	r3, r3, #4
	subs	r2, r5, r4
	cmp	r3, r2
	ble	.L370
	ldrb	r0, [r5, #4]
	ldr	r3, .L405+20
	bl	.L4
	cmp	r0, #0
	beq	.L374
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L374
	ldr	r3, [r0, #12]
	bics	r3, r6
	str	r3, [r0, #12]
.L374:
	adds	r5, r5, #1
	b	.L373
.L367:
	ldrb	r0, [r4, #1]
	ldr	r3, .L405+20
	bl	.L4
	subs	r5, r0, #0
	beq	.L366
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L366
	movs	r3, #16
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #4]
	movs	r3, #17
	movs	r7, #0
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #8]
	adds	r6, r4, #4
.L378:
	ldrh	r2, [r4, #2]
	subs	r2, r2, #4
	lsrs	r3, r2, #31
	adds	r3, r3, r2
	asrs	r3, r3, #1
	cmp	r3, r7
	bgt	.L382
	ldr	r2, .L405+24
	ldr	r3, [sp, #8]
	ldr	r1, [r2]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	movs	r1, #0
	ldr	r0, [sp, #4]
	strb	r1, [r3, r0]
	movs	r3, #17
	ldr	r1, [r2]
	movs	r2, #16
	ldrsb	r3, [r5, r3]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	ldrsb	r2, [r5, r2]
	ldrb	r1, [r5, #11]
	strb	r1, [r3, r2]
	b	.L370
.L382:
	ldrb	r3, [r6]
	cmp	r3, #71
	bhi	.L379
	ldrb	r2, [r5, r3]
	ldrb	r1, [r6, #1]
	adds	r2, r2, r1
	strb	r2, [r5, r3]
.L380:
	adds	r7, r7, #1
	adds	r6, r6, #2
	b	.L378
.L379:
	cmp	r3, #87
	bhi	.L381
	ldr	r3, [r5]
	ldrb	r0, [r3, #4]
	ldr	r3, .L405+28
	bl	.L4
	ldrb	r3, [r6]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r6, #1]
	adds	r2, r2, r1
	strb	r2, [r0, r3]
	b	.L380
.L381:
	cmp	r3, #88
	bne	.L380
	ldr	r3, .L405+32
	ldrb	r0, [r5, #28]
	bl	.L4
	ldrb	r2, [r6, #1]
	ldrb	r3, [r0, #6]
	adds	r3, r3, r2
	strb	r3, [r0, #6]
	b	.L380
.L406:
	.align	2
.L405:
	.word	GetSpecificTrapAt
	.word	RemoveTrap
	.word	GetMapChangesIdAt
	.word	TriggerMapChanges
	.word	gChapterData
	.word	GetUnit
	.word	gMapUnit
	.word	BWL_GetEntry
	.word	GetTrap
	.size	REW_redo, .-REW_redo
	.align	1
	.global	REW_handleInput
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_handleInput, %function
REW_handleInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r6, .L431
	ldrh	r3, [r6, #16]
	ldrb	r7, [r6, #15]
	str	r3, [sp, #4]
	ldr	r3, .L431+4
	ldrh	r3, [r3, #6]
	movs	r4, r0
	lsls	r2, r3, #25
	bpl	.L408
	movs	r5, r0
	adds	r5, r5, #41
	ldrb	r2, [r5]
	lsls	r2, r2, #29
	bpl	.L408
	movs	r3, r6
	adds	r3, r3, #65
	ldrb	r3, [r3]
	lsls	r3, r3, #30
	bmi	.L409
	movs	r0, #102
	ldr	r3, .L431+8
	bl	.L4
.L409:
	ldr	r0, [r4, #44]
	bl	REW_undo
	ldrb	r3, [r6, #15]
	cmp	r3, r7
	beq	.L410
	movs	r3, #1
	ldrb	r2, [r5]
	orrs	r3, r2
	strb	r3, [r5]
.L410:
	ldrh	r3, [r6, #16]
	ldr	r2, [sp, #4]
	cmp	r3, r2
	beq	.L411
	movs	r3, #2
	ldrb	r2, [r5]
	orrs	r3, r2
	strb	r3, [r5]
.L411:
	ldr	r3, [r4, #44]
	ldrh	r2, [r3]
	subs	r3, r3, r2
	str	r3, [r4, #44]
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L412
	movs	r2, #4
	ldrb	r3, [r5]
	bics	r3, r2
	strb	r3, [r5]
.L412:
	movs	r3, #8
	ldrb	r2, [r5]
.L430:
	orrs	r3, r2
	strb	r3, [r5]
	movs	r0, r4
	bl	REW_refreshUI
	ldr	r3, .L431+12
	bl	.L4
.L407:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L408:
	lsls	r3, r3, #24
	bpl	.L407
	movs	r5, r4
	adds	r5, r5, #41
	ldrb	r3, [r5]
	lsls	r3, r3, #28
	bpl	.L407
	movs	r3, r6
	adds	r3, r3, #65
	ldrb	r3, [r3]
	lsls	r3, r3, #30
	bmi	.L414
	movs	r0, #102
	ldr	r3, .L431+8
	bl	.L4
.L414:
	ldr	r0, [r4, #44]
	ldrh	r3, [r0, #2]
	adds	r0, r0, r3
	str	r0, [r4, #44]
	bl	REW_redo
	ldrb	r3, [r6, #15]
	cmp	r3, r7
	beq	.L415
	movs	r3, #1
	ldrb	r2, [r5]
	orrs	r3, r2
	strb	r3, [r5]
.L415:
	ldrh	r3, [r6, #16]
	ldr	r2, [sp, #4]
	cmp	r3, r2
	beq	.L416
	movs	r3, #2
	ldrb	r2, [r5]
	orrs	r3, r2
	strb	r3, [r5]
.L416:
	ldr	r0, [r4, #44]
	bl	REW_isRedoAvailable
	cmp	r0, #0
	bne	.L417
	movs	r2, #8
	ldrb	r3, [r5]
	bics	r3, r2
	strb	r3, [r5]
.L417:
	movs	r3, #4
	ldrb	r2, [r5]
	b	.L430
.L432:
	.align	2
.L431:
	.word	gChapterData
	.word	gKeyState
	.word	m4aSongNumStart
	.word	SMS_UpdateFromGameData
	.size	REW_handleInput, .-REW_handleInput
	.global	REW_procScr
	.section	.rodata.str1.1
.LC158:
	.ascii	"REW_proc\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	REW_procScr, %object
	.size	REW_procScr, 96
REW_procScr:
	.short	1
	.short	0
	.word	.LC158
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	Text_InitFont
	.short	2
	.short	0
	.word	REW_initProc
	.short	2
	.short	0
	.word	REW_initUI
	.short	2
	.short	0
	.word	REW_refreshUI
	.short	11
	.short	1
	.word	0
	.short	3
	.short	0
	.word	REW_handleInput
	.short	11
	.short	2
	.word	0
	.short	11
	.short	3
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
.L255:
	bx	r4
.L5:
	bx	r5
.L7:
	bx	r6
.L6:
	bx	r7
