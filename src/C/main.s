	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	1
	.p2align 2,,3
	.global	REW_initUI
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_initUI, %function
REW_initUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r10
	mov	r7, r9
	mov	r6, r8
	movs	r4, r0
	movs	r0, #216
	push	{r6, r7, lr}
	movs	r1, #3
	sub	sp, sp, #24
	ldr	r3, .L3
	lsls	r0, r0, #2
	bl	.L5
	ldr	r5, .L3+4
	ldr	r0, .L3+8
	movs	r1, r5
	ldr	r3, .L3+12
	bl	.L5
	movs	r2, #0
	ldr	r3, .L3+16
	movs	r1, r5
	ldr	r0, .L3+20
	bl	.L5
	movs	r0, r4
	ldr	r5, .L3+24
	movs	r1, #2
	adds	r0, r0, #64
	bl	.L6
	movs	r0, r4
	movs	r1, #2
	adds	r0, r0, #72
	bl	.L6
	add	r0, sp, #16
	movs	r1, #3
	bl	.L6
	ldr	r3, .L3+28
	movs	r1, #1
	add	r0, sp, #16
	mov	r10, r3
	bl	.L5
	movs	r0, #225
	ldr	r3, .L3+32
	lsls	r0, r0, #1
	mov	r9, r3
	bl	.L5
	ldr	r3, .L3+36
	movs	r1, r0
	add	r0, sp, #16
	mov	r8, r3
	bl	.L5
	ldr	r6, .L3+40
	ldr	r7, .L3+44
	movs	r1, r6
	add	r0, sp, #16
	bl	.L7
	add	r0, sp, #8
	movs	r1, #4
	bl	.L6
	movs	r1, #1
	add	r0, sp, #8
	bl	.L8
	ldr	r0, .L3+48
	lsls	r0, r0, #16
	lsrs	r0, r0, #16
	bl	.L9
	movs	r1, r0
	add	r0, sp, #8
	bl	.L10
	movs	r1, r6
	add	r0, sp, #8
	adds	r1, r1, #128
	bl	.L7
	movs	r0, r4
	movs	r1, #15
	adds	r0, r0, #48
	bl	.L6
	movs	r0, r4
	movs	r1, #15
	adds	r0, r0, #56
	bl	.L6
	movs	r5, #0
	movs	r2, #0
	movs	r1, #0
	movs	r3, #0
	str	r5, [sp, #4]
	str	r5, [sp]
	ldr	r6, .L3+52
	ldr	r0, .L3+56
	bl	.L11
	str	r5, [r4, #92]
	str	r0, [r4, #88]
	str	r5, [r4, #96]
	movs	r0, #1
	ldr	r3, .L3+60
	bl	.L5
	add	sp, sp, #24
	@ sp needed
	pop	{r5, r6, r7}
	mov	r10, r7
	mov	r9, r6
	mov	r8, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L4:
	.align	2
.L3:
	.word	UnpackUiVArrowGfx
	.word	gGenericBuffer
	.word	REW_menuTSA
	.word	Decompress
	.word	CallARM_FillTileRect
	.word	gBG1TilemapBuffer
	.word	InitText
	.word	Text_SetCursor
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	gBG0TilemapBuffer+112
	.word	PutText
	.word	REW_phaseIndicator
	.word	APProc_Create
	.word	REW_phaseAPDef
	.word	BG_EnableSync
	.size	REW_initUI, .-REW_initUI
	.align	1
	.p2align 2,,3
	.global	REW_procEnd
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_procEnd, %function
REW_procEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r4, r0
	ldr	r5, .L29
	ldr	r0, [r0, #88]
	bl	.L6
	ldr	r0, [r4, #96]
	cmp	r0, #0
	beq	.L13
	bl	.L6
.L13:
	ldr	r0, [r4, #92]
	cmp	r0, #0
	beq	.L14
	bl	.L6
.L14:
	ldr	r0, [r4, #80]
	cmp	r0, #0
	beq	.L15
	bl	.L6
.L15:
	ldr	r0, [r4, #84]
	cmp	r0, #0
	beq	.L16
	bl	.L6
.L16:
	@ sp needed
	ldr	r3, .L29+4
	bl	.L5
	ldr	r3, .L29+8
	bl	.L5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L30:
	.align	2
.L29:
	.word	Proc_End
	.word	ClearBg0Bg1
	.word	UnlockGame
	.size	REW_procEnd, .-REW_procEnd
	.align	1
	.p2align 2,,3
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_getUnitID.part.0, %function
REW_getUnitID.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r1, r1, #2
	lsls	r1, r1, #16
	push	{r4, r5, r6, r7, lr}
	lsrs	r6, r1, #16
	cmp	r1, #0
	beq	.L38
	movs	r1, #2
	movs	r2, #0
	rsbs	r1, r1, #0
	mov	ip, r2
	movs	r7, #0
	movs	r5, #0
	movs	r4, #0
	adds	r3, r0, #2
	subs	r1, r1, r0
	b	.L37
.L33:
	cmp	r2, #17
	beq	.L35
	movs	r2, r4
	ands	r2, r5
.L34:
	cmp	r2, #0
	bne	.L40
.L36:
	adds	r3, r3, #2
	adds	r2, r1, r3
	cmp	r6, r2
	ble	.L40
.L37:
	ldrb	r2, [r3]
	cmp	r2, #16
	bne	.L33
	movs	r7, #1
	movs	r2, r5
	movs	r4, #1
	ldrsb	r7, [r3, r7]
	cmp	r2, #0
	beq	.L36
.L40:
	mov	r3, ip
.L32:
	@ sp needed
	movs	r2, #1
	ldrsb	r2, [r0, r2]
	adds	r3, r2, r3
	ldr	r2, .L41
	ldr	r1, [r2]
	movs	r2, #0
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	ldrsb	r2, [r0, r2]
	adds	r3, r3, r7
	ldrb	r0, [r3, r2]
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L35:
	movs	r2, #1
	ldrsb	r2, [r3, r2]
	movs	r5, #1
	mov	ip, r2
	movs	r2, r4
	b	.L34
.L38:
	movs	r7, #0
	movs	r3, #0
	b	.L32
.L42:
	.align	2
.L41:
	.word	gBmMapUnit
	.size	REW_getUnitID.part.0, .-REW_getUnitID.part.0
	.align	1
	.p2align 2,,3
	.global	REW_initProc
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_initProc, %function
REW_initProc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L50
	push	{r4, r5, r6, lr}
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r3, .L50+4
	lsls	r3, r3, #16
	movs	r5, r0
	lsrs	r0, r3, #16
	ldr	r3, .L50+8
	add	r4, r4, ip
	bl	.L5
	ldr	r2, .L50+12
	ldr	r6, .L50+16
	ldrh	r0, [r0]
	ldr	r3, .L50+20
	lsls	r2, r2, #16
	ldr	r3, [r3]
	lsrs	r2, r2, #16
	ldr	r1, [r6]
	adds	r0, r4, r0
	bl	.L5
	ldr	r3, [r6]
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L49
	movs	r2, #41
	movs	r1, #2
	ldr	r3, [r3, #4]
	str	r3, [r5, #44]
	strb	r1, [r5, r2]
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L43
	movs	r3, #6
	strb	r3, [r5, r2]
.L43:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L49:
	movs	r0, r5
	ldr	r3, .L50+24
	bl	.L5
	b	.L43
.L51:
	.align	2
.L50:
	.word	gSaveBlockDecl
	.word	EMS_CHUNK_REWIND_BUF
	.word	MS_FindSuspendSaveChunk
	.word	REW_rewindSize
	.word	REW_rewindBuffer
	.word	ReadSramFast
	.word	Proc_End
	.size	REW_initProc, .-REW_initProc
	.align	1
	.p2align 2,,3
	.global	REW_clearRewindSeq
	.syntax unified
	.code	16
	.thumb_func
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
	.p2align 2,,3
	.global	REW_createSeqEntry
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_createSeqEntry, %function
REW_createSeqEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0, #2]
	cmp	r3, #0
	bne	.L55
	adds	r3, r3, #4
	strh	r3, [r0, #2]
.L55:
	@ sp needed
	adds	r0, r0, r3
	bx	lr
	.size	REW_createSeqEntry, .-REW_createSeqEntry
	.align	1
	.p2align 2,,3
	.global	REW_nextSequence
	.syntax unified
	.code	16
	.thumb_func
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
	.p2align 2,,3
	.global	REW_prevSequence
	.syntax unified
	.code	16
	.thumb_func
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
	.p2align 2,,3
	.global	REW_nextEntry
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_nextEntry, %function
REW_nextEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r0
	movs	r0, #3
	push	{r4, lr}
	movs	r4, r0
	ldrh	r2, [r1, #2]
	ands	r4, r2
	tst	r0, r2
	beq	.L59
	adds	r2, r2, #4
	subs	r2, r2, r4
	lsls	r2, r2, #16
	lsrs	r2, r2, #16
.L59:
	adds	r0, r1, r2
	ldrh	r2, [r3, #2]
	@ sp needed
	adds	r3, r3, r2
	cmp	r0, r3
	sbcs	r3, r3, r3
	ands	r0, r3
	pop	{r4}
	pop	{r1}
	bx	r1
	.size	REW_nextEntry, .-REW_nextEntry
	.align	1
	.p2align 2,,3
	.global	REW_prevEntry
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_prevEntry, %function
REW_prevEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	movs	r4, #3
	movs	r5, r4
	movs	r2, r0
	adds	r3, r0, #4
	ldrh	r0, [r0, #6]
	ands	r5, r0
	tst	r4, r0
	beq	.L66
	adds	r0, r0, #4
	subs	r0, r0, r5
	lsls	r0, r0, #16
	lsrs	r0, r0, #16
.L66:
	ldrh	r4, [r2, #2]
	adds	r0, r3, r0
	adds	r2, r2, r4
	cmp	r0, r2
	sbcs	r4, r4, r4
	ands	r0, r4
	cmp	r3, r1
	beq	.L73
	cmp	r1, r0
	beq	.L74
	movs	r4, #3
	b	.L71
.L75:
	movs	r0, r3
.L71:
	movs	r5, r4
	ldrh	r3, [r0, #2]
	ands	r5, r3
	tst	r4, r3
	beq	.L69
	adds	r3, r3, #4
	subs	r3, r3, r5
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L69:
	adds	r3, r0, r3
	cmp	r3, r2
	sbcs	r5, r5, r5
	ands	r3, r5
	cmp	r1, r3
	bne	.L75
.L65:
	@ sp needed
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L74:
	movs	r0, r3
	b	.L65
.L73:
	movs	r0, #0
	b	.L65
	.size	REW_prevEntry, .-REW_prevEntry
	.align	1
	.p2align 2,,3
	.global	REW_lastEntry
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_lastEntry, %function
REW_lastEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #3
	movs	r1, r0
	push	{r4, lr}
	movs	r4, r2
	ldrh	r3, [r1, #2]
	adds	r0, r0, #4
	adds	r1, r1, r3
	ldrh	r3, [r0, #2]
	ands	r4, r3
	tst	r2, r3
	beq	.L83
.L91:
	adds	r3, r3, #4
	subs	r3, r3, r4
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L83:
	adds	r3, r0, r3
	cmp	r3, r1
	bcs	.L82
.L92:
	cmp	r3, #0
	beq	.L82
	movs	r0, r3
	movs	r4, r2
	ldrh	r3, [r0, #2]
	ands	r4, r3
	tst	r2, r3
	bne	.L91
	adds	r3, r0, r3
	cmp	r3, r1
	bcc	.L92
.L82:
	@ sp needed
	pop	{r4}
	pop	{r1}
	bx	r1
	.size	REW_lastEntry, .-REW_lastEntry
	.align	1
	.p2align 2,,3
	.global	REW_alignSequence
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_alignSequence, %function
REW_alignSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r2, #3
	movs	r1, r2
	ldrh	r3, [r0, #2]
	ands	r1, r3
	tst	r2, r3
	beq	.L93
	adds	r3, r3, #4
	subs	r3, r3, r1
	strh	r3, [r0, #2]
.L93:
	@ sp needed
	bx	lr
	.size	REW_alignSequence, .-REW_alignSequence
	.align	1
	.p2align 2,,3
	.global	REW_isUndoAvailable
	.syntax unified
	.code	16
	.thumb_func
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
	.p2align 2,,3
	.global	REW_isRedoAvailable
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_isRedoAvailable, %function
REW_isRedoAvailable:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L100
	@ sp needed
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r0, r3
	sbcs	r0, r0, r0
	rsbs	r0, r0, #0
	bx	lr
.L101:
	.align	2
.L100:
	.word	REW_rewindBuffer
	.size	REW_isRedoAvailable, .-REW_isRedoAvailable
	.align	1
	.p2align 2,,3
	.global	REW_isUnitAction
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_isUnitAction, %function
REW_isUnitAction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	@ sp needed
	bx	lr
	.size	REW_isUnitAction, .-REW_isUnitAction
	.align	1
	.p2align 2,,3
	.global	REW_getCoordinateDifference
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_getCoordinateDifference, %function
REW_getCoordinateDifference:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r4, #0
	strb	r4, [r2]
	strb	r4, [r3]
	cmp	r1, #0
	beq	.L103
	movs	r7, #0
	movs	r6, #0
	b	.L110
.L106:
	cmp	r5, #17
	beq	.L108
	movs	r5, r6
	ands	r5, r7
.L107:
	cmp	r5, #0
	bne	.L103
	adds	r4, r4, #2
	adds	r0, r0, #2
	cmp	r1, r4
	ble	.L103
.L110:
	ldrb	r5, [r0]
	cmp	r5, #16
	bne	.L106
	ldrb	r5, [r0, #1]
	strb	r5, [r2]
	ldrb	r5, [r0]
	cmp	r5, #17
	beq	.L113
	movs	r5, r7
	movs	r6, #1
	b	.L107
.L108:
	ldrb	r5, [r0, #1]
	movs	r7, #1
	strb	r5, [r3]
	movs	r5, r6
	b	.L107
.L113:
	ldrb	r2, [r0, #1]
	strb	r2, [r3]
.L103:
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	.size	REW_getCoordinateDifference, .-REW_getCoordinateDifference
	.align	1
	.p2align 2,,3
	.global	REW_getUnitID
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_getUnitID, %function
REW_getUnitID:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r0
	push	{r4, lr}
	cmp	r2, #0
	beq	.L118
	movs	r0, #0
	cmp	r2, #1
	beq	.L119
.L116:
	@ sp needed
	pop	{r4}
	pop	{r1}
	bx	r1
.L118:
	bl	REW_getUnitID.part.0
	b	.L116
.L119:
	movs	r2, #1
	ldr	r1, .L120
	ldrsb	r2, [r3, r2]
	ldr	r1, [r1]
	ldrb	r3, [r3]
	lsls	r2, r2, #2
	ldr	r2, [r2, r1]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	ldrb	r0, [r2, r3]
	b	.L116
.L121:
	.align	2
.L120:
	.word	gBmMapUnit
	.size	REW_getUnitID, .-REW_getUnitID
	.align	1
	.p2align 2,,3
	.global	REW_hideRoofedUnits
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_hideRoofedUnits, %function
REW_hideRoofedUnits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r4, #1
	movs	r7, #129
	ldr	r5, .L132
	ldr	r6, .L132+4
.L124:
	movs	r0, r4
	bl	.L6
	cmp	r0, #0
	beq	.L123
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L123
	movs	r3, #17
	movs	r2, #16
	ldrsb	r3, [r0, r3]
	ldr	r1, [r6]
	lsls	r3, r3, #2
	ldrsb	r2, [r0, r2]
	ldr	r3, [r3, r1]
	ldrb	r3, [r3, r2]
	cmp	r3, #34
	bne	.L123
	ldr	r3, [r0, #12]
	orrs	r3, r7
	str	r3, [r0, #12]
.L123:
	adds	r4, r4, #1
	cmp	r4, #192
	bne	.L124
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L133:
	.align	2
.L132:
	.word	GetUnit
	.word	gBmMapTerrain
	.size	REW_hideRoofedUnits, .-REW_hideRoofedUnits
	.align	1
	.p2align 2,,3
	.global	REW_loadUnit
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_loadUnit, %function
REW_loadUnit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r5, r0
	sub	sp, sp, #24
	ldrb	r0, [r1]
	add	r4, sp, #4
	strb	r0, [r4]
	ldrb	r0, [r1, #1]
	strb	r0, [r4, #1]
	movs	r0, #1
	ldrb	r1, [r1, #2]
	ands	r0, r1
	lsrs	r6, r1, #3
	lsls	r1, r1, #29
	lsrs	r1, r1, #30
	lsls	r6, r6, #11
	lsls	r1, r1, #9
	orrs	r1, r6
	strh	r1, [r4, #2]
	movs	r1, #63
	ands	r3, r1
	lsls	r3, r3, #6
	ands	r1, r2
	orrs	r3, r1
	movs	r1, #128
	ldr	r2, [sp, #8]
	lsls	r0, r0, #13
	lsls	r1, r1, #7
	ands	r2, r1
	orrs	r3, r0
	orrs	r3, r2
	str	r3, [sp, #8]
	movs	r3, #0
	movs	r1, r5
	mov	r0, sp
	str	r3, [sp, #12]
	str	r3, [sp, #16]
	str	r3, [sp, #20]
	str	r3, [sp]
	ldr	r2, .L135
	ldr	r3, .L135+4
	bl	.L5
	movs	r1, r4
	movs	r0, r5
	ldr	r3, .L135+8
	bl	.L5
	ldrb	r3, [r4, #3]
	lsls	r3, r3, #29
	lsrs	r3, r3, #30
	lsls	r3, r3, #6
	strb	r3, [r5, #11]
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L136:
	.align	2
.L135:
	.word	83886098
	.word	CpuSet
	.word	UnitInitFromDefinition
	.size	REW_loadUnit, .-REW_loadUnit
	.align	1
	.p2align 2,,3
	.global	REW_undoObstacleCombat
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_undoObstacleCombat, %function
REW_undoObstacleCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L140
	movs	r4, r0
	ldrb	r2, [r0, #6]
	ldrb	r1, [r0, #5]
	ldrb	r0, [r0, #4]
	bl	.L5
	cmp	r0, #0
	beq	.L138
	ldrb	r3, [r0, #3]
	ldrb	r2, [r4, #7]
	subs	r3, r3, r2
	strb	r3, [r0, #3]
.L137:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L138:
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L140+4
	bl	.L5
	lsls	r0, r0, #16
	movs	r2, #0
	movs	r1, #0
	ldr	r3, .L140+8
	lsrs	r0, r0, #16
	bl	.L5
	ldrb	r3, [r4, #7]
	ldrb	r2, [r4, #6]
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	rsbs	r3, r3, #0
	ldr	r4, .L140+12
	bl	.L142
	b	.L137
.L141:
	.align	2
.L140:
	.word	GetTypedTrapAt
	.word	GetMapChangeIdAt
	.word	UntriggerMapChange
	.word	AddTrap
	.size	REW_undoObstacleCombat, .-REW_undoObstacleCombat
	.align	1
	.p2align 2,,3
	.global	REW_redoObstacleCombat
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_redoObstacleCombat, %function
REW_redoObstacleCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L146
	ldrb	r2, [r0, #6]
	movs	r4, r0
	ldrb	r1, [r0, #5]
	ldrb	r0, [r0, #4]
	bl	.L5
	ldrb	r2, [r4, #7]
	ldrb	r3, [r0, #3]
	adds	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	strb	r3, [r0, #3]
	beq	.L145
.L143:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L145:
	ldr	r3, .L146+4
	bl	.L5
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L146+8
	bl	.L5
	lsls	r0, r0, #16
	movs	r2, #0
	movs	r1, #0
	ldr	r3, .L146+12
	lsrs	r0, r0, #16
	bl	.L5
	b	.L143
.L147:
	.align	2
.L146:
	.word	GetTypedTrapAt
	.word	RemoveTrap
	.word	GetMapChangeIdAt
	.word	TriggerMapChanges
	.size	REW_redoObstacleCombat, .-REW_redoObstacleCombat
	.align	1
	.p2align 2,,3
	.global	REW_undoCombat
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_undoCombat, %function
REW_undoCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r6, r9
	mov	r7, r10
	mov	r5, r8
	mov	lr, fp
	push	{r5, r6, r7, lr}
	ldrh	r7, [r0, #2]
	subs	r3, r7, #6
	mov	r8, r3
	ldrb	r3, [r0, #1]
	movs	r6, r0
	mov	r9, r3
	sub	sp, sp, #12
	cmp	r3, #255
	bne	.LCB1026
	b	.L182	@long jump
.LCB1026:
	movs	r3, #63
	mov	r2, r9
	bics	r2, r3
	cmp	r2, #192
	bne	.LCB1033
	b	.L183	@long jump
.LCB1033:
	subs	r7, r7, #4
	adds	r5, r0, #4
	lsls	r1, r7, #16
	lsrs	r1, r1, #16
	movs	r0, r5
	bl	REW_getUnitID.part.0
	ldr	r3, .L188
	bl	.L5
	subs	r4, r0, #0
	beq	.L148
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L148
.L181:
	movs	r3, #17
	ldrsb	r3, [r4, r3]
	str	r3, [sp, #4]
	movs	r3, #16
	ldrsb	r3, [r4, r3]
	mov	r10, r3
.L150:
	mov	r3, r8
	lsrs	r3, r3, #31
	add	r3, r3, r8
	asrs	r7, r3, #1
	mov	r3, r8
	movs	r6, #0
	adds	r5, r5, #2
	cmp	r3, #1
	ble	.L164
	ldr	r3, .L188+4
	mov	r8, r3
	b	.L163
.L185:
	cmp	r3, #28
	beq	.L184
.L160:
	ldrb	r2, [r4, r3]
	ldrb	r1, [r5, #1]
	subs	r2, r2, r1
	strb	r2, [r4, r3]
.L161:
	adds	r6, r6, #1
	adds	r5, r5, #2
	cmp	r7, r6
	ble	.L164
.L163:
	ldrb	r3, [r5]
	cmp	r3, #71
	bls	.L185
	cmp	r3, #87
	bls	.L186
	cmp	r3, #88
	bne	.L161
	ldr	r3, .L188+8
	ldrb	r0, [r4, #28]
	bl	.L5
	ldrb	r2, [r5, #1]
	ldrb	r3, [r0, #6]
	adds	r6, r6, #1
	subs	r3, r3, r2
	strb	r3, [r0, #6]
	adds	r5, r5, #2
	cmp	r7, r6
	bgt	.L163
.L164:
	ldr	r1, [sp, #4]
	mov	r0, r10
	lsls	r7, r1, #2
	movs	r1, #0
	ldr	r2, .L188+12
	ldr	r3, [r2]
	ldr	r3, [r7, r3]
	strb	r1, [r3, r0]
	movs	r3, #17
	ldr	r1, [r2]
	movs	r2, #16
	ldrsb	r3, [r4, r3]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	ldrsb	r2, [r4, r2]
	ldrb	r1, [r4, #11]
	strb	r1, [r3, r2]
.L148:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L186:
	ldr	r3, [r4]
	ldrb	r0, [r3, #4]
	bl	.L10
	ldrb	r3, [r5]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r5, #1]
	subs	r2, r2, r1
	strb	r2, [r0, r3]
	b	.L161
.L184:
	movs	r3, #0
	ldrb	r0, [r5, #1]
	rsbs	r0, r0, #0
	lsls	r0, r0, #24
	strb	r3, [r4, #28]
	lsrs	r0, r0, #24
	ldr	r3, .L188+8
	bl	.L5
	mov	fp, r0
	ldr	r3, .L188+16
	bl	.L5
	mov	r2, fp
	ldrb	r3, [r4, #16]
	strb	r3, [r2]
	ldrb	r3, [r4, #17]
	strb	r3, [r2, #1]
	ldrb	r3, [r5]
	b	.L160
.L183:
	mov	r0, r9
	ldr	r3, .L188
	bics	r0, r2
	bl	.L5
	subs	r4, r0, #0
	beq	.L148
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L148
	ldr	r3, .L188+20
	bl	.L5
	mov	r9, r0
	cmp	r0, #0
	ble	.L187
	ldr	r3, .L188+24
	mov	r10, r3
	ldr	r3, .L188+28
	mov	fp, r3
	movs	r3, #50
	mov	ip, r3
	add	ip, ip, r4
	mov	r3, ip
	movs	r7, #0
	str	r3, [sp, #4]
	adds	r6, r6, #4
.L155:
	movs	r1, r7
	movs	r0, r4
	bl	.L8
	subs	r5, r0, #0
	beq	.L156
	ldr	r3, [r4]
	ldrb	r1, [r3, #4]
	bl	.L190
	ldrb	r3, [r6, r7]
	ldr	r2, [sp, #4]
	adds	r5, r5, r0
	adds	r5, r5, #50
	strb	r3, [r5]
	strb	r3, [r2, r7]
.L156:
	adds	r7, r7, #1
	cmp	r9, r7
	bne	.L155
.L157:
	mov	r3, r9
	adds	r5, r6, r3
	ldrsb	r3, [r6, r3]
	strb	r3, [r4, #16]
	mov	r10, r3
	movs	r3, #1
	ldrsb	r3, [r5, r3]
	mov	r2, r9
	str	r3, [sp, #4]
	strb	r3, [r4, #17]
	mov	r3, r8
	subs	r3, r3, r2
	mov	r8, r3
	b	.L150
.L182:
	ldrb	r0, [r0, #6]
	lsls	r0, r0, #29
	lsrs	r0, r0, #30
	ldr	r3, .L188+32
	lsls	r0, r0, #6
	bl	.L5
	movs	r3, #11
	ldrsb	r3, [r0, r3]
	movs	r2, #7
	mov	r8, r3
	movs	r3, #8
	ldrsb	r2, [r6, r2]
	ldrsb	r3, [r6, r3]
	adds	r1, r6, #4
	movs	r4, r0
	bl	REW_loadUnit
	mov	r3, r8
	strb	r3, [r4, #11]
	mov	r3, r9
	strb	r3, [r4, #9]
	movs	r3, #9
	rsbs	r3, r3, #0
	mov	r8, r3
	adds	r5, r6, #7
	add	r8, r8, r7
	b	.L181
.L187:
	adds	r6, r6, #4
	b	.L157
.L189:
	.align	2
.L188:
	.word	GetUnit
	.word	GetPidStats
	.word	GetTrap
	.word	gBmMapUnit
	.word	SetBallistaOccupied
	.word	GetUnitSupporterCount
	.word	GetUnitSupporterUnit
	.word	GetUnitSupporterNum
	.word	GetFreeUnit
	.size	REW_undoCombat, .-REW_undoCombat
	.align	1
	.p2align 2,,3
	.global	REW_redoCombat
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_redoCombat, %function
REW_redoCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, r10
	mov	r5, r8
	mov	lr, fp
	mov	r6, r9
	push	{r5, r6, r7, lr}
	movs	r5, r0
	ldrh	r7, [r0, #2]
	ldrb	r0, [r0, #1]
	sub	sp, sp, #12
	subs	r4, r7, #6
	cmp	r0, #255
	bne	.LCB1309
	b	.L220	@long jump
.LCB1309:
	movs	r3, #63
	movs	r2, r0
	bics	r2, r3
	cmp	r2, #192
	bne	.LCB1316
	b	.L221	@long jump
.LCB1316:
	movs	r3, #5
	ldr	r2, .L227
	ldr	r1, [r2]
	mov	r9, r2
	movs	r2, #4
	ldrsb	r3, [r5, r3]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	ldrsb	r2, [r5, r2]
	ldrb	r0, [r3, r2]
	ldr	r3, .L227+4
	bl	.L5
	subs	r6, r0, #0
	beq	.L191
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L191
	adds	r3, r5, #4
	mov	r8, r3
.L194:
	movs	r3, #16
	ldrsb	r3, [r6, r3]
	str	r3, [sp, #4]
	movs	r3, #17
	lsrs	r7, r4, #31
	ldrsb	r3, [r6, r3]
	adds	r7, r7, r4
	mov	r10, r3
	asrs	r7, r7, #1
	cmp	r4, #1
	bgt	.LCB1349
	b	.L206	@long jump
.LCB1349:
	mov	r4, r8
	ldr	r3, .L227+8
	movs	r5, #0
	mov	fp, r3
	adds	r4, r4, #2
	b	.L205
.L224:
	cmp	r3, #28
	beq	.L222
.L201:
	ldrb	r2, [r6, r3]
	ldrb	r1, [r4, #1]
	adds	r2, r2, r1
	strb	r2, [r6, r3]
.L203:
	adds	r5, r5, #1
	adds	r4, r4, #2
	cmp	r7, r5
	ble	.L223
.L205:
	ldrb	r3, [r4]
	cmp	r3, #71
	bls	.L224
	cmp	r3, #87
	bls	.L225
	cmp	r3, #88
	bne	.L203
	ldr	r3, .L227+12
	ldrb	r0, [r6, #28]
	bl	.L5
	ldrb	r2, [r4, #1]
	ldrb	r3, [r0, #6]
	adds	r5, r5, #1
	adds	r3, r3, r2
	strb	r3, [r0, #6]
	adds	r4, r4, #2
	cmp	r7, r5
	bgt	.L205
.L223:
	movs	r3, #17
	movs	r1, #16
	ldrsb	r3, [r6, r3]
	ldrsb	r1, [r6, r1]
.L199:
	mov	r2, r9
	ldr	r2, [r2]
	lsls	r3, r3, #2
	ldr	r3, [r3, r2]
	ldrb	r2, [r6, #11]
	strb	r2, [r3, r1]
	mov	r3, r9
	ldr	r2, [r3]
	mov	r3, r10
	lsls	r3, r3, #2
	ldr	r3, [r3, r2]
	movs	r2, #0
	ldr	r1, [sp, #4]
	strb	r2, [r3, r1]
.L191:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L225:
	ldr	r3, [r6]
	ldrb	r0, [r3, #4]
	bl	.L190
	ldrb	r3, [r4]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r4, #1]
	adds	r2, r2, r1
	strb	r2, [r0, r3]
	b	.L203
.L222:
	ldr	r3, .L227+12
	ldrb	r0, [r6, #28]
	bl	.L5
	ldr	r3, .L227+16
	mov	r8, r0
	movs	r0, r6
	bl	.L5
	cmp	r0, #0
	beq	.L226
.L202:
	mov	r2, r8
	ldrb	r3, [r6, #16]
	strb	r3, [r2]
	ldrb	r3, [r6, #17]
	strb	r3, [r2, #1]
	ldrb	r3, [r4]
	b	.L201
.L221:
	ldr	r3, .L227+4
	bics	r0, r2
	bl	.L5
	subs	r6, r0, #0
	beq	.L191
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L191
	ldr	r3, .L227+20
	bl	.L5
	adds	r5, r5, #4
	ldr	r3, .L227+24
	movs	r0, r6
	bl	.L5
	mov	r8, r5
	ldr	r3, .L227
	add	r8, r8, r0
	mov	r9, r3
	subs	r4, r4, r0
	b	.L194
.L220:
	adds	r3, r5, #7
	mov	r8, r3
	movs	r3, #8
	ldr	r2, .L227
	ldr	r1, [r2]
	mov	r9, r2
	movs	r2, #7
	ldrsb	r3, [r5, r3]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	ldrsb	r2, [r5, r2]
	ldrb	r0, [r3, r2]
	ldr	r3, .L227+4
	bl	.L5
	subs	r6, r0, #0
	beq	.L193
	movs	r3, #0
	str	r3, [r0]
.L193:
	movs	r4, r7
	subs	r4, r4, #9
	b	.L194
.L226:
	mov	r0, r8
	ldr	r3, .L227+28
	bl	.L5
	b	.L202
.L206:
	ldr	r1, [sp, #4]
	b	.L199
.L228:
	.align	2
.L227:
	.word	gBmMapUnit
	.word	GetUnit
	.word	GetPidStats
	.word	GetTrap
	.word	GetUnitCurrentHp
	.word	InitUnitsupports
	.word	GetUnitSupporterCount
	.word	ClearBallistaOccupied
	.size	REW_redoCombat, .-REW_redoCombat
	.align	1
	.p2align 2,,3
	.global	REW_applyBWLChanges
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_applyBWLChanges, %function
REW_applyBWLChanges:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r9
	mov	r7, r8
	push	{r7, lr}
	ldr	r3, [r1]
	sub	sp, sp, #20
	movs	r5, r0
	ldrb	r0, [r3, #4]
	ldr	r3, .L279
	movs	r6, r1
	bl	.L5
	mov	r4, sp
	cmp	r0, #0
	beq	.L231
	movs	r2, #8
	mov	r1, sp
	ldr	r3, .L279+4
	bl	.L5
	movs	r2, #11
	ldr	r7, .L279+8
	ldrsb	r2, [r7, r2]
	cmp	r2, #0
	beq	.L231
	movs	r3, #110
	ldrsb	r1, [r6, r3]
	cmp	r1, #0
	beq	.L232
	ldr	r3, [sp, #8]
	lsls	r3, r3, #8
	lsrs	r3, r3, #20
	adds	r3, r3, r1
	movs	r1, #250
	lsls	r1, r1, #4
	cmp	r3, r1
	bgt	.L273
.L233:
	ldr	r1, [r4, #8]
	ldr	r0, .L279+12
	lsls	r3, r3, #20
	lsrs	r3, r3, #8
	ands	r1, r0
	orrs	r3, r1
	str	r3, [r4, #8]
.L232:
	movs	r1, #11
	movs	r3, #192
	ldrsb	r1, [r6, r1]
	tst	r3, r1
	beq	.L234
	ldr	r3, .L279+16
	mov	r8, r3
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	cmp	r3, r1
	beq	.L235
	cmp	r2, r1
	bne	.LCB1608
	b	.L272	@long jump
.LCB1608:
.L231:
	movs	r3, r5
	ldmia	r4!, {r0, r1, r2}
	stmia	r3!, {r0, r1, r2}
	movs	r0, r5
	ldr	r2, [r4]
	str	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L234:
	movs	r0, #250
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #18
	lsrs	r3, r3, #20
	adds	r3, r3, #1
	lsls	r0, r0, #4
	cmp	r3, r0
	bgt	.L274
.L238:
	lsls	r3, r3, #20
	lsrs	r3, r3, #18
	mov	r8, r3
	ldrh	r0, [r4, #12]
	ldr	r3, .L279+20
	ands	r0, r3
	mov	r3, r8
	orrs	r3, r0
	strh	r3, [r4, #12]
	ldr	r3, .L279+16
	mov	r8, r3
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	cmp	r3, r1
	beq	.L235
	cmp	r2, r1
	beq	.L272
.L246:
	mov	r3, r8
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	cmp	r3, r1
	bne	.LCB1666
	b	.L275	@long jump
.LCB1666:
.L247:
	movs	r3, #11
	ldrsb	r3, [r7, r3]
	cmp	r3, r1
	bne	.L231
	mov	r0, r8
	ldr	r3, .L279+24
	bl	.L5
	cmp	r0, #0
	bne	.L231
.L250:
	movs	r1, #3
	movs	r3, r1
	ldrb	r2, [r4, #12]
	ldrb	r0, [r4, #11]
	ands	r3, r2
	lsls	r3, r3, #8
	orrs	r3, r0
	movs	r0, #250
	lsls	r0, r0, #2
	cmp	r3, r0
	bcs	.L231
	adds	r3, r3, #1
	strb	r3, [r4, #11]
	lsrs	r3, r3, #8
	ands	r3, r1
	bics	r2, r1
	orrs	r2, r3
	strb	r2, [r4, #12]
	b	.L231
.L273:
	movs	r3, r1
	b	.L233
.L274:
	movs	r3, r0
	b	.L238
.L235:
	ldr	r3, .L279+24
	mov	r0, r8
	mov	r9, r3
	bl	.L5
	cmp	r0, #0
	bne	.L276
.L240:
	ldr	r3, .L279+28
	bl	.L5
	cmp	r0, #2
	beq	.L277
	movs	r2, #63
	ldr	r3, .L279+32
	ldrb	r1, [r3, #14]
	ands	r2, r1
	movs	r1, #0
.L243:
	ldrh	r3, [r3, #16]
	lsls	r3, r3, #22
	lsls	r2, r2, #8
	lsrs	r3, r3, #8
	orrs	r3, r2
	ldr	r0, .L279+36
	ldr	r2, [sp, #4]
	ands	r2, r0
	orrs	r3, r2
	str	r3, [sp, #4]
	movs	r3, #127
	ldrb	r2, [r4, #14]
	lsls	r1, r1, #7
	ands	r3, r2
	orrs	r3, r1
	strb	r3, [r4, #14]
	mov	r3, r8
	movs	r1, #11
	ldrb	r3, [r3, #11]
	ldrsb	r1, [r6, r1]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	cmp	r3, r1
	beq	.L278
	mov	r3, r8
	ldr	r3, [r3]
	ldrb	r0, [r3, #4]
.L245:
	movs	r2, #3
	ands	r2, r0
	lsls	r3, r2, #6
	mov	r9, r3
	ldrb	r3, [r4, #13]
	mov	ip, r3
	movs	r3, #63
	mov	r2, ip
	ands	r3, r2
	mov	r2, r9
	orrs	r3, r2
	movs	r2, #127
	strb	r3, [r4, #13]
	ldrb	r3, [r4, #14]
	lsrs	r0, r0, #2
	bics	r3, r2
	orrs	r3, r0
	strb	r3, [r4, #14]
	ldrb	r3, [r4, #9]
	subs	r2, r2, #112
	bics	r3, r2
	movs	r2, #2
	orrs	r3, r2
	strb	r3, [r4, #9]
.L241:
	movs	r3, #192
	tst	r3, r1
	beq	.LCB1813
	b	.L231	@long jump
.LCB1813:
	b	.L246
.L272:
	ldr	r3, .L279+24
	mov	r9, r3
.L236:
	movs	r0, r7
	bl	.L9
	cmp	r0, #0
	beq	.L240
	movs	r1, #11
	ldrsb	r1, [r6, r1]
	b	.L241
.L276:
	movs	r1, #11
	movs	r3, #11
	ldrsb	r1, [r6, r1]
	ldrsb	r3, [r7, r3]
	cmp	r3, r1
	bne	.L241
	b	.L236
.L275:
	movs	r0, r7
	ldr	r3, .L279+24
	bl	.L5
	cmp	r0, #0
	bne	.LCB1848
	b	.L250	@long jump
.LCB1848:
	movs	r1, #11
	ldrsb	r1, [r6, r1]
	b	.L247
.L278:
	ldr	r3, [r7]
	ldrb	r0, [r3, #4]
	b	.L245
.L277:
	movs	r2, #63
	ldr	r3, .L279+40
	ldrb	r3, [r3, #17]
	movs	r1, #1
	ands	r2, r3
	ldr	r3, .L279+32
	b	.L243
.L280:
	.align	2
.L279:
	.word	GetPidStats
	.word	CpuSet
	.word	gBattleTarget
	.word	-16773121
	.word	gBattleActor
	.word	-16381
	.word	GetUnitCurrentHp
	.word	GetBattleMapKind
	.word	gPlaySt
	.word	-16776961
	.word	gGMData
	.size	REW_applyBWLChanges, .-REW_applyBWLChanges
	.align	1
	.p2align 2,,3
	.global	REW_storeCombatData
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_storeCombatData, %function
REW_storeCombatData:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r10
	mov	r7, r9
	mov	r6, r8
	mov	r8, r1
	push	{r6, r7, lr}
	sub	sp, sp, #88
	movs	r4, r3
	add	r3, sp, #120
	ldrb	r3, [r3]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	ldr	r6, [sp, #128]
	mov	r9, r3
	ldrb	r3, [r0, #11]
	add	r7, sp, #16
	movs	r5, r0
	movs	r1, r7
	strb	r3, [r6, #1]
	mov	r10, r2
	ldr	r3, .L327
	movs	r2, #36
	mov	r0, r8
	bl	.L5
	mov	r3, r8
	ldrb	r1, [r5, #26]
	ldrb	r3, [r3, #26]
	ldr	r2, [r5, #4]
	subs	r3, r3, r1
	ldrb	r1, [r2, #17]
	subs	r3, r3, r1
	ldr	r1, [r5]
	ldrb	r1, [r1, #19]
	subs	r3, r3, r1
	strb	r3, [r7, #26]
	mov	r3, r8
	ldrb	r1, [r5, #29]
	ldrb	r3, [r3, #29]
	ldrb	r2, [r2, #18]
	subs	r3, r3, r1
	subs	r3, r3, r2
	strb	r3, [r7, #29]
	mov	r2, r8
	movs	r3, #82
	ldrsb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L282
	movs	r3, #81
	mov	r1, r8
	ldrb	r3, [r2, r3]
	movs	r2, #72
	adds	r3, r3, #12
	ldrh	r2, [r1, r2]
	lsls	r3, r3, #1
	adds	r3, r7, r3
	strh	r2, [r3, #6]
.L282:
	movs	r3, #111
	mov	r2, r8
	ldrsb	r1, [r2, r3]
	cmp	r1, #0
	blt	.L283
	movs	r0, r7
	ldr	r3, .L327+4
	bl	.L5
.L283:
	mov	r1, r8
	movs	r2, #115
	ldrb	r3, [r7, #18]
	ldrb	r2, [r1, r2]
	adds	r3, r3, r2
	ldr	r1, [sp, #36]
	strb	r3, [r7, #18]
	mov	r3, r8
	movs	r0, r1
	ldr	r3, [r3, #116]
	ldr	r2, .L327+8
	ands	r0, r2
	ands	r2, r3
	eors	r3, r1
	ldr	r1, .L327+12
	adds	r2, r0, r2
	ands	r3, r1
	eors	r3, r2
	mov	r1, r8
	movs	r2, #120
	str	r3, [sp, #36]
	ldrb	r2, [r1, r2]
	ldrb	r3, [r7, #24]
	adds	r3, r3, r2
	movs	r2, #121
	strb	r3, [r7, #24]
	ldrb	r3, [r7, #25]
	ldrb	r2, [r1, r2]
	adds	r3, r3, r2
	movs	r0, r7
	strb	r3, [r7, #25]
	ldr	r3, .L327+16
	bl	.L5
	mov	r0, r8
	ldr	r3, .L327+20
	bl	.L5
	cmp	r0, #0
	ble	.L284
	movs	r3, #80
	mov	r2, r8
	ldrb	r3, [r2, r3]
	adds	r3, r7, r3
	adds	r3, r3, #40
	strb	r0, [r3]
.L284:
	ldr	r3, .L327+24
	movs	r0, r7
	bl	.L5
	mov	r2, r10
	ldr	r3, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	mov	r3, r9
	strb	r4, [r6, #4]
	strb	r3, [r6, #5]
	ldrb	r3, [r7, #16]
	subs	r3, r3, r4
	lsls	r3, r3, #24
	movs	r4, #0
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L285
	movs	r3, #16
	strb	r2, [r6, #7]
	strb	r3, [r6, #6]
	adds	r4, r4, #1
.L285:
	mov	r2, r9
	ldrb	r3, [r7, #17]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L286
	movs	r1, #17
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r1, [r3, #6]
	strb	r2, [r3, #7]
	adds	r4, r4, #1
.L286:
	movs	r1, r7
	movs	r2, #0
.L288:
	ldrb	r0, [r5, r2]
	ldrb	r3, [r1]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r0, r3, #24
	cmp	r3, #0
	beq	.L287
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r2, [r3, #6]
	strb	r0, [r3, #7]
	adds	r4, r4, #1
.L287:
	adds	r2, r2, #1
	adds	r1, r1, #1
	cmp	r2, #72
	bne	.L288
	mov	r3, r8
	ldr	r3, [r3]
	ldrb	r0, [r3, #4]
	ldr	r3, .L327+28
	bl	.L5
	mov	r9, r0
	cmp	r0, #0
	beq	.L289
	mov	r1, r8
	mov	r0, sp
	bl	REW_applyBWLChanges
	mov	r1, r9
	mov	r3, sp
	subs	r1, r1, #1
	movs	r2, #1
	mov	r9, r1
	subs	r5, r3, #1
.L291:
	mov	r1, r9
	ldrb	r3, [r5, r2]
	ldrb	r0, [r1, r2]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r0, r3, #24
	cmp	r3, #0
	beq	.L290
	movs	r1, #71
	mov	ip, r1
	add	ip, ip, r2
	mov	r1, ip
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r1, [r3, #6]
	strb	r0, [r3, #7]
	adds	r4, r4, #1
.L290:
	adds	r2, r2, #1
	cmp	r2, #17
	bne	.L291
.L289:
	ldrb	r3, [r7, #28]
	cmp	r3, #0
	beq	.L294
	movs	r3, #72
	mov	r2, r8
	ldrh	r0, [r2, r3]
	cmp	r0, #0
	bne	.L326
.L294:
	adds	r4, r4, #3
	lsls	r3, r4, #17
	lsrs	r3, r3, #16
	strh	r3, [r6, #2]
	ldr	r2, [sp, #124]
	ldrh	r2, [r2, #2]
	cmp	r2, #0
	bne	.L295
	adds	r2, r2, #4
.L295:
	adds	r3, r3, r2
	movs	r2, #3
	movs	r1, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r1, r3
	tst	r2, r3
	beq	.L296
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L296:
	ldr	r2, [sp, #124]
	strh	r3, [r2, #2]
	add	sp, sp, #88
	@ sp needed
	pop	{r5, r6, r7}
	mov	r10, r7
	mov	r9, r6
	mov	r8, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L326:
	ldr	r3, .L327+32
	bl	.L5
	ldr	r3, .L327+36
	movs	r5, r0
	ldrb	r0, [r7, #28]
	bl	.L5
	ldrb	r3, [r0, #6]
	subs	r3, r5, r3
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L294
	movs	r1, #88
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r1, [r3, #6]
	strb	r2, [r3, #7]
	adds	r4, r4, #1
	b	.L294
.L328:
	.align	2
.L327:
	.word	CpuSet
	.word	SetUnitStatus
	.word	2139062143
	.word	-2139062144
	.word	UnitCheckStatCaps
	.word	GetBattleUnitUpdatedWeaponExp
	.word	UnitRemoveInvalidItems
	.word	GetPidStats
	.word	GetItemUses
	.word	GetTrap
	.size	REW_storeCombatData, .-REW_storeCombatData
	.align	1
	.p2align 2,,3
	.global	REW_storeCombatDataDead
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_storeCombatDataDead, %function
REW_storeCombatDataDead:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r6, r9
	mov	r7, r10
	mov	lr, fp
	mov	r5, r8
	push	{r5, r6, r7, lr}
	sub	sp, sp, #108
	str	r2, [sp, #12]
	movs	r2, #192
	str	r3, [sp, #4]
	add	r3, sp, #144
	ldrb	r3, [r3]
	ldr	r7, [sp, #152]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	str	r3, [sp, #8]
	adds	r3, r7, #4
	mov	r9, r3
	movs	r3, #11
	movs	r6, r2
	str	r1, [sp]
	ldr	r1, [r0, #4]
	ldrsb	r3, [r0, r3]
	movs	r4, r0
	ldrb	r1, [r1, #4]
	ands	r6, r3
	tst	r2, r3
	bne	.L330
	cmp	r1, #81
	beq	.LCB2234
	b	.L373	@long jump
.LCB2234:
.L330:
	movs	r2, #255
	strb	r2, [r7, #1]
	mov	r8, r2
	mov	r2, r9
	ldr	r0, [sp, #4]
	adds	r5, r2, #3
	strb	r0, [r2, #3]
	ldr	r2, [sp, #8]
	strb	r2, [r5, #1]
	ldr	r2, [r4]
	ldrb	r2, [r2, #4]
	strb	r2, [r7, #4]
	movs	r2, #6
	asrs	r3, r3, #5
	ands	r3, r2
	ldr	r2, [r4, #12]
	strb	r1, [r7, #5]
	lsls	r2, r2, #19
	lsrs	r2, r2, #31
	orrs	r3, r2
	ldrb	r2, [r4, #8]
	lsls	r2, r2, #3
	orrs	r3, r2
	strb	r3, [r7, #6]
	movs	r2, #16
	movs	r3, #17
	add	r6, sp, #32
	ldrsb	r3, [r4, r3]
	mov	r1, r9
	movs	r0, r6
	ldrsb	r2, [r4, r2]
	bl	REW_loadUnit
	mov	r3, r8
	strb	r3, [r6, #9]
	ldrb	r3, [r4, #11]
	strb	r3, [r6, #11]
	ldr	r3, [r4, #60]
	str	r3, [sp, #92]
	movs	r3, #7
.L332:
	movs	r1, r6
	movs	r2, #0
	movs	r6, #0
	strh	r3, [r7, #2]
.L336:
	ldrb	r0, [r4, r2]
	ldrb	r3, [r1]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r0, r3, #24
	cmp	r3, #0
	beq	.L335
	lsls	r3, r6, #1
	adds	r3, r5, r3
	strb	r2, [r3, #2]
	strb	r0, [r3, #3]
	adds	r6, r6, #1
.L335:
	adds	r2, r2, #1
	adds	r1, r1, #1
	cmp	r2, #72
	bne	.L336
	ldr	r3, [r4]
	ldrb	r0, [r3, #4]
	ldr	r3, .L375
	bl	.L5
	mov	r8, r0
	cmp	r0, #0
	beq	.L337
	ldr	r1, [sp]
	add	r0, sp, #16
	bl	REW_applyBWLChanges
	mov	r0, r8
	subs	r0, r0, #1
	mov	ip, r4
	movs	r2, #1
	mov	r8, r7
	movs	r4, r0
	add	r3, sp, #16
	subs	r1, r3, #1
.L339:
	ldrb	r0, [r4, r2]
	ldrb	r3, [r1, r2]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r0, r3, #24
	cmp	r3, #0
	beq	.L338
	movs	r7, r2
	lsls	r3, r6, #1
	adds	r3, r5, r3
	adds	r7, r7, #71
	strb	r7, [r3, #2]
	strb	r0, [r3, #3]
	adds	r6, r6, #1
.L338:
	adds	r2, r2, #1
	cmp	r2, #17
	bne	.L339
	mov	r4, ip
	mov	r7, r8
.L337:
	ldrb	r3, [r4, #28]
	cmp	r3, #0
	beq	.L342
	movs	r3, #72
	ldr	r2, [sp]
	ldrh	r0, [r2, r3]
	cmp	r0, #0
	bne	.L374
.L342:
	ldrh	r3, [r7, #2]
	lsls	r6, r6, #1
	adds	r3, r3, r6
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	strh	r3, [r7, #2]
	ldr	r2, [sp, #148]
	ldrh	r2, [r2, #2]
	cmp	r2, #0
	bne	.L343
	adds	r2, r2, #4
.L343:
	adds	r3, r3, r2
	movs	r2, #3
	movs	r1, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r1, r3
	tst	r2, r3
	beq	.L344
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L344:
	ldr	r2, [sp, #148]
	strh	r3, [r2, #2]
	add	sp, sp, #108
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L373:
	subs	r2, r2, #1
	subs	r2, r2, #255
	orrs	r3, r2
	strb	r3, [r7, #1]
	ldr	r3, .L375+4
	bl	.L5
	mov	r8, r0
	cmp	r0, #0
	ble	.L334
	ldr	r3, .L375+8
	mov	r10, r3
	ldr	r3, .L375+12
	str	r7, [sp, #152]
	mov	fp, r3
	ldr	r3, [sp, #152]
	movs	r7, r0
	mov	r8, r3
.L331:
	movs	r1, r6
	movs	r0, r4
	bl	.L8
	subs	r5, r0, #0
	beq	.L333
	ldr	r3, [r4]
	ldrb	r1, [r3, #4]
	bl	.L190
	mov	r2, r9
	adds	r5, r5, r0
	adds	r5, r5, #50
	ldrb	r3, [r5]
	strb	r3, [r2, r6]
.L333:
	adds	r6, r6, #1
	cmp	r7, r6
	bne	.L331
	mov	r3, r8
	mov	r8, r7
	movs	r7, r3
	str	r3, [sp, #152]
.L334:
	mov	r5, r9
	ldr	r3, [sp, #4]
	add	r5, r5, r8
	strb	r3, [r5]
	ldr	r3, [sp, #8]
	add	r6, sp, #32
	strb	r3, [r5, #1]
	ldr	r2, .L375+16
	ldr	r3, .L375+20
	movs	r1, r6
	movs	r0, r4
	bl	.L5
	ldr	r3, [r6, #12]
	ldr	r2, [sp, #12]
	orrs	r2, r3
	movs	r3, r2
	ldr	r2, .L375+24
	ands	r3, r2
	str	r3, [r6, #12]
	movs	r3, #0
	strb	r3, [r6, #28]
	mov	r3, r8
	adds	r3, r3, #6
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	b	.L332
.L374:
	ldr	r3, .L375+28
	bl	.L5
	mov	r8, r0
	ldr	r3, .L375+32
	ldrb	r0, [r4, #28]
	bl	.L5
	mov	r2, r8
	ldrb	r3, [r0, #6]
	subs	r3, r2, r3
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	bne	.LCB2490
	b	.L342	@long jump
.LCB2490:
	lsls	r3, r6, #1
	adds	r5, r5, r3
	movs	r3, #88
	strb	r2, [r5, #3]
	strb	r3, [r5, #2]
	adds	r6, r6, #1
	b	.L342
.L376:
	.align	2
.L375:
	.word	GetPidStats
	.word	GetUnitSupporterCount
	.word	GetUnitSupporterUnit
	.word	GetUnitSupporterNum
	.word	67108882
	.word	CpuSet
	.word	-2049
	.word	GetItemUses
	.word	GetTrap
	.size	REW_storeCombatDataDead, .-REW_storeCombatDataDead
	.align	1
	.p2align 2,,3
	.global	REW_actionCombat
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_actionCombat, %function
REW_actionCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r10
	mov	r7, r9
	mov	r6, r8
	movs	r0, #11
	push	{r6, r7, lr}
	ldr	r3, .L389
	ldr	r4, [r3]
	ldr	r3, .L389+4
	ldr	r5, .L389+8
	ldrsb	r0, [r3, r0]
	sub	sp, sp, #16
	mov	r9, r3
	bl	.L6
	movs	r6, r0
	movs	r0, #11
	ldr	r3, .L389+12
	ldrsb	r0, [r3, r0]
	mov	r8, r3
	bl	.L6
	movs	r3, #4
	strh	r3, [r4, #2]
	subs	r3, r3, #2
	strb	r3, [r4, #4]
	mov	r1, r9
	movs	r3, #0
	ldr	r2, .L389+16
	ldrb	r1, [r1, #19]
	ldrsb	r3, [r2, r3]
	ldrb	r2, [r2, #2]
	lsls	r1, r1, #24
	lsls	r2, r2, #24
	movs	r5, r0
	adds	r7, r4, #4
	asrs	r2, r2, #24
	asrs	r1, r1, #24
	bne	.L378
	movs	r0, #1
	mov	r10, r0
	ldr	r1, [r6, #12]
	bics	r1, r0
	str	r1, [r6, #12]
	movs	r0, r6
	str	r2, [sp]
	mov	r1, r9
	movs	r2, #7
	str	r7, [sp, #8]
	str	r4, [sp, #4]
	bl	REW_storeCombatDataDead
	mov	r2, r10
	ldr	r3, [r6, #12]
	orrs	r3, r2
	str	r3, [r6, #12]
	ldrh	r3, [r4, #2]
	cmp	r3, #0
	beq	.L380
.L387:
	adds	r7, r4, r3
	cmp	r5, #0
	beq	.L382
.L388:
	movs	r3, #2
	mov	r2, r8
	movs	r1, #17
	strb	r3, [r7]
	movs	r3, #16
	ldrb	r2, [r2, #19]
	ldrsb	r1, [r5, r1]
	lsls	r2, r2, #24
	ldrsb	r3, [r5, r3]
	asrs	r2, r2, #24
	str	r7, [sp, #8]
	str	r4, [sp, #4]
	str	r1, [sp]
	beq	.L386
	movs	r2, #0
	mov	r1, r8
	movs	r0, r5
	bl	REW_storeCombatData
.L377:
	add	sp, sp, #16
	@ sp needed
	pop	{r5, r6, r7}
	mov	r10, r7
	mov	r9, r6
	mov	r8, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L378:
	str	r2, [sp]
	mov	r1, r9
	movs	r2, #3
	movs	r0, r6
	str	r7, [sp, #8]
	str	r4, [sp, #4]
	bl	REW_storeCombatData
	ldrh	r3, [r4, #2]
	cmp	r3, #0
	bne	.L387
.L380:
	movs	r3, #4
	strh	r3, [r4, #2]
	cmp	r5, #0
	bne	.L388
.L382:
	mov	r3, r8
	movs	r1, #17
	movs	r0, #16
	ldrsb	r1, [r3, r1]
	ldrsb	r0, [r3, r0]
	ldr	r3, .L389+20
	bl	.L5
	movs	r3, #65
	strh	r3, [r7]
	mov	r3, r8
	ldr	r2, .L389+24
	ldr	r1, [r2]
	mov	r2, r8
	ldrb	r3, [r3, #17]
	lsls	r3, r3, #24
	ldrb	r2, [r2, #16]
	asrs	r3, r3, #24
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	lsls	r2, r2, #24
	asrs	r2, r2, #24
	ldrb	r3, [r3, r2]
	subs	r3, r3, #51
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	strb	r3, [r7, #1]
	ldrb	r3, [r0]
	strb	r3, [r7, #4]
	ldrb	r3, [r0, #1]
	strb	r3, [r7, #5]
	ldrb	r3, [r0, #2]
	strb	r3, [r7, #6]
	mov	r3, r8
	ldrb	r2, [r0, #3]
	ldrb	r3, [r3, #19]
	subs	r3, r3, r2
	strb	r3, [r7, #7]
	movs	r3, #8
	movs	r1, #3
	strh	r3, [r7, #2]
	ldrh	r2, [r4, #2]
	movs	r3, r2
	movs	r0, r1
	adds	r3, r3, #8
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r0, r3
	tst	r1, r3
	bne	.L385
	strh	r3, [r4, #2]
	b	.L377
.L386:
	mov	r1, r8
	movs	r0, r5
	adds	r2, r2, #5
	bl	REW_storeCombatDataDead
	b	.L377
.L385:
	adds	r2, r2, #12
	subs	r2, r2, r0
	strh	r2, [r4, #2]
	b	.L377
.L390:
	.align	2
.L389:
	.word	REW_curSequence
	.word	gBattleActor
	.word	GetUnit
	.word	gBattleTarget
	.word	gActiveUnitMoveOrigin
	.word	GetTrapAt
	.word	gBmMapTerrain
	.size	REW_actionCombat, .-REW_actionCombat
	.align	1
	.p2align 2,,3
	.global	REW_undoPhaseChange
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_undoPhaseChange, %function
REW_undoPhaseChange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r8
	push	{lr}
	ldrb	r3, [r0, #1]
	ldr	r2, .L407
	lsls	r1, r3, #6
	movs	r5, r0
	strb	r1, [r2, #15]
	lsls	r3, r3, #27
	bpl	.L392
	ldrh	r3, [r2, #16]
	subs	r3, r3, #1
	strh	r3, [r2, #16]
.L392:
	ldrh	r3, [r5, #2]
	cmp	r3, #4
	bls	.L391
	movs	r3, #2
	movs	r4, #0
	mov	r8, r3
	ldr	r6, .L407+4
	adds	r7, r5, #4
.L395:
	ldrb	r0, [r7, r4]
	bl	.L11
	cmp	r0, #0
	beq	.L394
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L394
	mov	r2, r8
	ldr	r3, [r0, #12]
	orrs	r3, r2
	str	r3, [r0, #12]
.L394:
	ldrh	r3, [r5, #2]
	adds	r4, r4, #1
	subs	r3, r3, #4
	cmp	r3, r4
	bgt	.L395
.L391:
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L408:
	.align	2
.L407:
	.word	gPlaySt
	.word	GetUnit
	.size	REW_undoPhaseChange, .-REW_undoPhaseChange
	.align	1
	.p2align 2,,3
	.global	REW_redoPhaseChange
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_redoPhaseChange, %function
REW_redoPhaseChange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r8
	push	{lr}
	movs	r5, r0
	ldrb	r3, [r0, #1]
	movs	r0, #63
	ldr	r1, .L425
	lsls	r2, r3, #4
	bics	r2, r0
	strb	r2, [r1, #15]
	lsls	r3, r3, #27
	bpl	.L410
	ldrh	r3, [r1, #16]
	adds	r3, r3, #1
	strh	r3, [r1, #16]
.L410:
	ldrh	r3, [r5, #2]
	cmp	r3, #4
	bls	.L409
	movs	r3, #66
	movs	r4, #0
	mov	r8, r3
	ldr	r6, .L425+4
	adds	r7, r5, #4
.L413:
	ldrb	r0, [r7, r4]
	bl	.L11
	cmp	r0, #0
	beq	.L412
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L412
	mov	r2, r8
	ldr	r3, [r0, #12]
	bics	r3, r2
	str	r3, [r0, #12]
.L412:
	ldrh	r3, [r5, #2]
	adds	r4, r4, #1
	subs	r3, r3, #4
	cmp	r3, r4
	bgt	.L413
.L409:
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L426:
	.align	2
.L425:
	.word	gPlaySt
	.word	GetUnit
	.size	REW_redoPhaseChange, .-REW_redoPhaseChange
	.align	1
	.p2align 2,,3
	.global	REW_nextPhase
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_nextPhase, %function
REW_nextPhase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r4, r2
	cmp	r0, #0
	beq	.L430
	cmp	r0, #128
	bne	.L432
	movs	r0, #64
	movs	r5, #64
.L428:
	ldr	r3, .L433
	bl	.L5
	cmp	r0, #0
	bne	.L429
	movs	r3, #1
	strb	r3, [r4]
.L429:
	@ sp needed
	movs	r0, r5
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L432:
	ldrb	r3, [r1]
	adds	r3, r3, #1
	movs	r0, #0
	movs	r5, #0
	strb	r3, [r1]
	b	.L428
.L430:
	movs	r0, #128
	movs	r5, #128
	b	.L428
.L434:
	.align	2
.L433:
	.word	GetPhaseAbleUnitCount
	.size	REW_nextPhase, .-REW_nextPhase
	.align	1
	.p2align 2,,3
	.global	REW_actionPhaseChangeStart
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_actionPhaseChangeStart, %function
REW_actionPhaseChangeStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r6, r9
	mov	r5, r8
	mov	lr, fp
	mov	r7, r10
	push	{r5, r6, r7, lr}
	ldr	r6, .L461
	ldrb	r5, [r6, #15]
	cmp	r5, #0
	beq	.L445
	cmp	r5, #128
	bne	.L460
	movs	r0, #64
	movs	r7, #4
	movs	r5, #0
.L436:
	ldr	r3, .L461+4
	bl	.L5
	ldr	r3, .L461+8
	ldr	r2, [r3]
	mov	fp, r3
	ldrh	r3, [r2, #2]
	cmp	r3, #0
	bne	.L438
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L438:
	mov	r8, r2
	add	r8, r8, r3
	mov	r2, r8
	movs	r3, #64
	strb	r3, [r2]
	subs	r3, r3, #60
	strh	r3, [r2, #2]
	ldrb	r4, [r6, #15]
	lsrs	r3, r4, #6
	orrs	r7, r3
	movs	r3, #16
	rsbs	r5, r5, #0
	ands	r3, r5
	orrs	r7, r3
	strb	r7, [r2, #1]
	cmp	r0, #0
	bne	.L439
	movs	r2, #32
	lsls	r3, r7, #24
	lsrs	r3, r3, #24
	orrs	r3, r2
	mov	r2, r8
	strb	r3, [r2, #1]
.L439:
	movs	r3, #0
	mov	r9, r3
	adds	r3, r3, #2
	movs	r5, #1
	mov	r10, r3
	ldr	r7, .L461+12
	b	.L443
.L441:
	ldrb	r4, [r6, #15]
.L443:
	adds	r4, r4, r5
	movs	r0, r4
	bl	.L7
	cmp	r0, #0
	beq	.L440
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L440
	mov	r2, r10
	ldr	r3, [r0, #12]
	tst	r3, r2
	beq	.L440
	mov	r3, r8
	add	r3, r3, r9
	strb	r4, [r3, #4]
	mov	r3, r8
	mov	r2, r8
	ldrh	r3, [r3, #2]
	adds	r3, r3, #1
	strh	r3, [r2, #2]
	movs	r3, #1
	mov	ip, r3
	add	r9, r9, ip
.L440:
	adds	r5, r5, #1
	cmp	r5, #64
	bne	.L441
	mov	r3, fp
	mov	r1, r8
	ldr	r2, [r3]
	ldrh	r1, [r1, #2]
	ldrh	r3, [r2, #2]
	adds	r3, r3, r1
	movs	r1, #3
	movs	r0, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r0, r3
	tst	r1, r3
	beq	.L444
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L444:
	strh	r3, [r2, #2]
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L460:
	movs	r0, #0
	movs	r7, #0
	movs	r5, #1
	b	.L436
.L445:
	movs	r0, #128
	movs	r7, #8
	b	.L436
.L462:
	.align	2
.L461:
	.word	gPlaySt
	.word	GetPhaseAbleUnitCount
	.word	REW_curSequence
	.word	GetUnit
	.size	REW_actionPhaseChangeStart, .-REW_actionPhaseChangeStart
	.align	1
	.p2align 2,,3
	.global	REW_actionPhaseChangeSuppports
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_actionPhaseChangeSuppports, %function
REW_actionPhaseChangeSuppports:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, fp
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7, lr}
	ldr	r3, .L493
	ldrh	r2, [r3, #16]
	sub	sp, sp, #28
	cmp	r2, #1
	bne	.LCB3081
	b	.L463	@long jump
.LCB3081:
	ldrb	r3, [r3, #20]
	cmp	r3, #127
	bls	.LCB3084
	b	.L463	@long jump
.LCB3084:
	ldr	r3, .L493+4
	mov	r9, r3
	ldr	r3, .L493+8
	ldr	r2, .L493+12
	str	r3, [sp, #4]
	ldr	r3, .L493+16
	movs	r7, #1
	mov	r10, r3
	str	r2, [sp, #20]
	b	.L481
.L467:
	adds	r7, r7, #1
	cmp	r7, #64
	bne	.LCB3101
	b	.L463	@long jump
.LCB3101:
.L481:
	movs	r0, r7
	bl	.L9
	subs	r4, r0, #0
	beq	.L467
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L467
	ldr	r2, [r0, #12]
	ldr	r3, .L493+20
	tst	r2, r3
	bne	.L467
	ldr	r3, [sp, #4]
	bl	.L5
	cmp	r0, #4
	bgt	.L467
	mov	r3, r10
	ldr	r2, [r3]
	ldrh	r3, [r2, #2]
	cmp	r3, #0
	bne	.L470
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L470:
	adds	r3, r2, r3
	movs	r2, r3
	str	r3, [sp, #8]
	movs	r3, #6
	movs	r0, r4
	strh	r3, [r2, #2]
	ldr	r3, [sp, #20]
	bl	.L5
	cmp	r0, #0
	ble	.L479
	movs	r3, #0
	str	r3, [sp, #16]
	ldr	r3, .L493+20
	str	r7, [sp, #12]
	movs	r5, #0
	mov	r8, r3
	movs	r7, r0
	ldr	r6, .L493+24
.L471:
	movs	r1, r5
	movs	r0, r4
	bl	.L11
	cmp	r0, #0
	beq	.L475
	mov	r3, r8
	ldr	r1, [r0, #12]
	tst	r1, r3
	bne	.L475
	movs	r3, #11
	ldrsb	r3, [r0, r3]
	mov	ip, r3
	movs	r3, #192
	mov	r2, ip
	tst	r3, r2
	bne	.L475
	movs	r3, #16
	movs	r2, #16
	ldrsb	r3, [r4, r3]
	ldrsb	r2, [r0, r2]
	subs	r3, r3, r2
	asrs	r2, r3, #31
	adds	r3, r3, r2
	eors	r3, r2
	movs	r2, #17
	str	r3, [sp]
	ldrsb	r2, [r4, r2]
	mov	fp, r2
	movs	r2, #17
	mov	r3, fp
	ldrsb	r2, [r0, r2]
	subs	r2, r3, r2
	asrs	r3, r2, #31
	adds	r2, r2, r3
	eors	r2, r3
	ldr	r3, [sp]
	adds	r3, r3, r2
	cmp	r3, #0
	beq	.L476
	cmp	r3, #1
	bne	.L475
	ldr	r3, [r4, #12]
	orrs	r1, r3
	lsls	r1, r1, #26
	bpl	.L478
.L475:
	adds	r5, r5, #1
	cmp	r7, r5
	bne	.L471
	ldr	r7, [sp, #12]
.L479:
	ldr	r3, [sp, #8]
	ldrh	r3, [r3, #2]
	cmp	r3, #6
	bls	.L467
	movs	r2, #66
	ldr	r1, [sp, #8]
	strb	r2, [r1]
	strb	r7, [r1, #1]
	ldrh	r2, [r4, #16]
	strh	r2, [r1, #4]
	mov	r2, r10
	ldr	r2, [r2]
	ldrh	r1, [r2, #2]
	adds	r3, r3, r1
	movs	r1, #3
	movs	r0, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r0, r3
	tst	r1, r3
	beq	.L492
	adds	r3, r3, #4
	subs	r3, r3, r0
.L492:
	adds	r7, r7, #1
	strh	r3, [r2, #2]
	cmp	r7, #64
	beq	.LCB3238
	b	.L481	@long jump
.LCB3238:
.L463:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L476:
	ldrb	r3, [r4, #27]
	cmp	ip, r3
	bne	.L475
.L478:
	ldr	r3, [sp, #4]
	bl	.L5
	cmp	r0, #4
	bgt	.L475
	movs	r3, #50
	mov	fp, r3
	add	fp, fp, r4
	mov	r3, fp
	ldrb	r0, [r3, r5]
	movs	r1, r5
	str	r0, [sp]
	ldr	r3, .L493+28
	movs	r0, r4
	bl	.L5
	mov	r3, fp
	ldr	r0, [sp]
	ldrb	r3, [r3, r5]
	cmp	r0, r3
	beq	.L475
	ldr	r1, [sp, #8]
	mov	ip, r1
	movs	r1, r5
	ldr	r2, [sp, #16]
	lsls	r2, r2, #1
	add	r2, r2, ip
	subs	r3, r3, r0
	adds	r1, r1, #50
	strb	r3, [r2, #7]
	strb	r1, [r2, #6]
	mov	r2, ip
	ldrh	r3, [r2, #2]
	adds	r3, r3, #2
	strh	r3, [r2, #2]
	ldr	r2, [sp, #16]
	adds	r3, r2, #1
	str	r3, [sp, #16]
	b	.L475
.L494:
	.align	2
.L493:
	.word	gPlaySt
	.word	GetUnit
	.word	GetUnitTotalSupportLevel
	.word	GetUnitSupporterCount
	.word	REW_curSequence
	.word	65548
	.word	GetUnitSupporterUnit
	.word	UnitGainSupportExp
	.size	REW_actionPhaseChangeSuppports, .-REW_actionPhaseChangeSuppports
	.align	1
	.p2align 2,,3
	.global	REW_actionPhaseChangeTrackStatus
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_actionPhaseChangeTrackStatus, %function
REW_actionPhaseChangeTrackStatus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r10
	mov	r6, r8
	mov	r7, r9
	ldr	r3, .L506
	ldr	r4, [r3]
	movs	r3, #0
	push	{r6, r7, lr}
	ldr	r5, .L506+4
	sub	sp, sp, #8
	ldrb	r6, [r5, #15]
	movs	r1, r4
	str	r3, [sp, #4]
	ldr	r2, .L506+8
	ldr	r3, .L506+12
	add	r0, sp, #4
	bl	.L5
	ldrb	r5, [r5, #15]
	adds	r6, r6, #64
	adds	r5, r5, #1
	cmp	r6, r5
	ble	.L496
	lsls	r3, r5, #3
	adds	r4, r4, r3
	ldr	r3, .L506+16
	mov	r9, r3
	movs	r3, #19
	mov	r10, r3
	adds	r3, r3, #29
	mov	r8, r3
	movs	r7, #49
.L498:
	movs	r0, r5
	bl	.L9
	cmp	r0, #0
	beq	.L497
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L497
	mov	r3, r10
	strb	r3, [r4]
	ldrb	r3, [r0, #19]
	strb	r3, [r4, #1]
	mov	r3, r8
	strb	r3, [r4, #2]
	ldrb	r3, [r0, r3]
	strb	r7, [r4, #4]
	strb	r3, [r4, #3]
	ldrb	r3, [r0, r7]
	strb	r3, [r4, #5]
	movs	r3, #11
	strb	r3, [r4, #6]
	ldrb	r3, [r0, #11]
	strb	r3, [r4, #7]
.L497:
	adds	r5, r5, #1
	adds	r4, r4, #8
	cmp	r6, r5
	bgt	.L498
.L496:
	ldr	r3, .L506+20
	bl	.L5
	add	sp, sp, #8
	@ sp needed
	pop	{r5, r6, r7}
	mov	r10, r7
	mov	r9, r6
	mov	r8, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L507:
	.align	2
.L506:
	.word	REW_rewindBuffer
	.word	gPlaySt
	.word	16777344
	.word	CpuFastSet
	.word	GetUnit
	.word	TickActiveFactionTurn
	.size	REW_actionPhaseChangeTrackStatus, .-REW_actionPhaseChangeTrackStatus
	.align	1
	.p2align 2,,3
	.global	REW_actionPhaseChangeRecordStatus
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_actionPhaseChangeRecordStatus, %function
REW_actionPhaseChangeRecordStatus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, r10
	mov	r6, r9
	mov	lr, fp
	mov	r5, r8
	push	{r5, r6, r7, lr}
	ldr	r3, .L524
	ldr	r2, .L524+4
	ldrb	r3, [r3, #15]
	ldr	r6, [r2]
	adds	r7, r3, #1
	lsls	r2, r7, #3
	adds	r6, r6, #8
	adds	r6, r6, r2
	movs	r2, #64
	mov	r10, r2
	add	r10, r10, r3
	ldr	r3, .L524+8
	mov	fp, r3
	ldr	r3, .L524+12
	mov	r9, r3
	sub	sp, sp, #20
.L517:
	movs	r0, r7
	bl	.L190
	cmp	r0, #0
	beq	.L510
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L510
	mov	r3, r9
	ldr	r4, [r3]
	ldrh	r1, [r4, #2]
	subs	r5, r1, #0
	bne	.L513
	movs	r3, #4
	movs	r5, #4
	movs	r1, #4
	strh	r3, [r4, #2]
.L513:
	movs	r3, #6
	adds	r5, r4, r5
	strh	r3, [r5, #2]
	movs	r3, r6
	subs	r3, r3, #8
	str	r3, [sp]
	movs	r3, #0
	movs	r2, #6
	mov	r8, r0
	mov	ip, r6
	str	r4, [sp, #4]
	movs	r6, r5
	str	r7, [sp, #8]
	movs	r5, r3
	str	r1, [sp, #12]
	ldr	r3, [sp]
.L515:
	mov	r1, r8
	ldrb	r0, [r3]
	ldrb	r7, [r3, #1]
	ldrb	r1, [r1, r0]
	cmp	r1, r7
	beq	.L514
	adds	r2, r2, #2
	lsls	r4, r5, #1
	lsls	r2, r2, #16
	adds	r4, r6, r4
	subs	r1, r1, r7
	lsrs	r2, r2, #16
	strb	r0, [r4, #6]
	strb	r1, [r4, #7]
	strh	r2, [r6, #2]
	adds	r5, r5, #1
.L514:
	adds	r3, r3, #2
	cmp	ip, r3
	bne	.L515
	movs	r5, r6
	mov	r0, r8
	mov	r6, ip
	ldr	r4, [sp, #4]
	ldr	r7, [sp, #8]
	ldr	r1, [sp, #12]
	cmp	r2, #6
	bls	.L510
	movs	r3, #66
	strb	r7, [r5, #1]
	strb	r3, [r5]
	ldrh	r3, [r0, #16]
	strh	r3, [r5, #4]
	movs	r3, #3
	adds	r1, r1, r2
	movs	r2, r3
	lsls	r1, r1, #16
	lsrs	r1, r1, #16
	ands	r2, r1
	tst	r3, r1
	beq	.L523
	adds	r1, r1, #4
	subs	r1, r1, r2
.L523:
	strh	r1, [r4, #2]
.L510:
	adds	r7, r7, #1
	adds	r6, r6, #8
	cmp	r7, r10
	bne	.L517
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L525:
	.align	2
.L524:
	.word	gPlaySt
	.word	REW_rewindBuffer
	.word	GetUnit
	.word	REW_curSequence
	.size	REW_actionPhaseChangeRecordStatus, .-REW_actionPhaseChangeRecordStatus
	.align	1
	.p2align 2,,3
	.global	REW_undoLoadUnit
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_undoLoadUnit, %function
REW_undoLoadUnit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L534
	ldrb	r0, [r0, #1]
	bl	.L5
	cmp	r0, #0
	beq	.L526
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L526
	ldr	r3, .L534+4
	bl	.L5
.L526:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L535:
	.align	2
.L534:
	.word	GetUnit
	.word	ClearUnit
	.size	REW_undoLoadUnit, .-REW_undoLoadUnit
	.align	1
	.p2align 2,,3
	.global	REW_redoLoadUnit
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_redoLoadUnit, %function
REW_redoLoadUnit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L537
	@ sp needed
	adds	r0, r0, #4
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L538:
	.align	2
.L537:
	.word	LoadUnit
	.size	REW_redoLoadUnit, .-REW_redoLoadUnit
	.align	1
	.p2align 2,,3
	.global	REW_conseqInitUnit
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_conseqInitUnit, %function
REW_conseqInitUnit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L549
	ldr	r5, [r6]
	movs	r4, r0
	ldrh	r3, [r5, #2]
	movs	r0, r1
	cmp	r4, #0
	beq	.L539
	cmp	r3, #0
	beq	.L539
	ldr	r2, [r4]
	cmp	r2, #0
	beq	.L539
	adds	r5, r5, r3
	movs	r3, #67
	strb	r3, [r5]
	ldrb	r3, [r4, #11]
	strb	r3, [r5, #1]
	movs	r3, #24
	movs	r2, #10
	strh	r3, [r5, #2]
	adds	r1, r5, #4
	ldr	r3, .L549+4
	bl	.L5
	movs	r3, #63
	ldrb	r2, [r4, #17]
	ldrb	r1, [r4, #16]
	ands	r2, r3
	lsls	r2, r2, #6
	ands	r3, r1
	orrs	r3, r2
	ldrh	r2, [r5, #8]
	lsrs	r2, r2, #12
	lsls	r2, r2, #12
	orrs	r3, r2
	strh	r3, [r5, #8]
	ldr	r1, [r6]
	ldrh	r2, [r5, #2]
	ldrh	r3, [r1, #2]
	adds	r3, r3, r2
	movs	r2, #3
	movs	r0, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r0, r3
	tst	r2, r3
	beq	.L548
	adds	r3, r3, #4
	subs	r3, r3, r0
.L548:
	strh	r3, [r1, #2]
.L539:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L550:
	.align	2
.L549:
	.word	REW_curSequence
	.word	CpuSet
	.size	REW_conseqInitUnit, .-REW_conseqInitUnit
	.align	1
	.p2align 2,,3
	.global	REW_conseqFinalizeUnits
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_conseqFinalizeUnits, %function
REW_conseqFinalizeUnits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r6, .L572
	ldr	r4, [r6]
	ldrh	r3, [r4, #2]
	cmp	r3, #0
	beq	.L551
	movs	r5, #3
	ldr	r7, .L572+4
	adds	r4, r4, #4
.L557:
	ldrb	r3, [r4]
	cmp	r3, #67
	beq	.L571
.L554:
	movs	r1, r5
	ldrh	r3, [r4, #2]
	ldr	r2, [r6]
	ands	r1, r3
	tst	r5, r3
	beq	.L556
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L556:
	adds	r4, r4, r3
	ldrh	r3, [r2, #2]
	adds	r2, r2, r3
	cmp	r4, r2
	bcs	.L551
	cmp	r4, #0
	bne	.L557
.L551:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L571:
	ldrb	r0, [r4, #1]
	bl	.L7
	cmp	r0, #0
	beq	.L554
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L554
	movs	r3, #68
	movs	r2, #63
	strb	r3, [r4]
	ldrb	r3, [r0, #17]
	ldrb	r1, [r0, #16]
	ands	r3, r2
	lsls	r3, r3, #6
	ands	r2, r1
	orrs	r3, r2
	ldr	r1, .L572+8
	ldr	r2, [r4, #8]
	ands	r2, r1
	orrs	r3, r2
	str	r3, [r4, #8]
	movs	r3, #0
	str	r3, [r4, #12]
	b	.L554
.L573:
	.align	2
.L572:
	.word	REW_curSequence
	.word	GetUnit
	.word	16773120
	.size	REW_conseqFinalizeUnits, .-REW_conseqFinalizeUnits
	.align	1
	.p2align 2,,3
	.global	REW_findCurSequence
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_findCurSequence, %function
REW_findCurSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L575
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L575+4
	lsls	r0, r0, #16
	ldr	r3, .L575+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L576:
	.align	2
.L575:
	.word	gSaveBlockDecl
	.word	EMS_CHUNK_REWIND_SEQ
	.word	MS_FindSuspendSaveChunk
	.size	REW_findCurSequence, .-REW_findCurSequence
	.align	1
	.p2align 2,,3
	.global	REW_clearCurSequence
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_clearCurSequence, %function
REW_clearCurSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L578
	push	{r4, r5, r6, lr}
	ldr	r5, [r3]
	@ sp needed
	movs	r3, #0
	strh	r3, [r5]
	strh	r3, [r5, #2]
	ldr	r3, .L578+4
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L578+8
	lsls	r0, r0, #16
	ldr	r3, .L578+12
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	movs	r0, r5
	ldr	r3, .L578+16
	adds	r1, r4, r1
	bl	.L5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L579:
	.align	2
.L578:
	.word	REW_curSequence
	.word	gSaveBlockDecl
	.word	EMS_CHUNK_REWIND_SEQ
	.word	MS_FindSuspendSaveChunk
	.word	WriteAndVerifySramFast
	.size	REW_clearCurSequence, .-REW_clearCurSequence
	.align	1
	.p2align 2,,3
	.global	REW_findRewindBuf
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_findRewindBuf, %function
REW_findRewindBuf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L581
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L581+4
	lsls	r0, r0, #16
	ldr	r3, .L581+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L582:
	.align	2
.L581:
	.word	gSaveBlockDecl
	.word	EMS_CHUNK_REWIND_BUF
	.word	MS_FindSuspendSaveChunk
	.size	REW_findRewindBuf, .-REW_findRewindBuf
	.align	1
	.p2align 2,,3
	.global	REW_clearRewindBuf
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_clearRewindBuf, %function
REW_clearRewindBuf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r4, lr}
	sub	sp, sp, #8
	str	r3, [sp, #4]
	ldr	r3, .L584
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L584+4
	lsls	r0, r0, #16
	ldr	r3, .L584+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	ldr	r3, .L584+12
	adds	r1, r4, r1
	add	r0, sp, #4
	bl	.L5
	add	sp, sp, #8
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L585:
	.align	2
.L584:
	.word	gSaveBlockDecl
	.word	EMS_CHUNK_REWIND_BUF
	.word	MS_FindSuspendSaveChunk
	.word	WriteAndVerifySramFast
	.size	REW_clearRewindBuf, .-REW_clearRewindBuf
	.align	1
	.p2align 2,,3
	.global	REW_cpPhaseChangeSave
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_cpPhaseChangeSave, %function
REW_cpPhaseChangeSave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L588
	movs	r4, r0
	ldrb	r0, [r3, #15]
	ldr	r3, .L588+4
	bl	.L5
	cmp	r0, #0
	ble	.L587
	movs	r2, #2
	ldr	r3, .L588+8
	movs	r0, #3
	strb	r2, [r3, #22]
	ldr	r3, .L588+12
	bl	.L5
.L587:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L588+16
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L589:
	.align	2
.L588:
	.word	gPlaySt
	.word	GetPhaseAbleUnitCount
	.word	gActionData
	.word	WriteSuspendSave
	.word	AiPhaseInit
	.size	REW_cpPhaseChangeSave, .-REW_cpPhaseChangeSave
	.align	1
	.p2align 2,,3
	.global	REW_loadActiveUnitMoveOrigin
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_loadActiveUnitMoveOrigin, %function
REW_loadActiveUnitMoveOrigin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L591
	sub	sp, sp, #8
	add	r4, sp, #4
	movs	r2, r1
	ldr	r3, [r3]
	movs	r1, r4
	bl	.L5
	movs	r2, #0
	ldr	r3, .L591+4
	ldrsb	r2, [r4, r2]
	strh	r2, [r3]
	movs	r2, #1
	ldrsb	r2, [r4, r2]
	strh	r2, [r3, #2]
	add	sp, sp, #8
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L592:
	.align	2
.L591:
	.word	ReadSramFast
	.word	gActiveUnitMoveOrigin
	.size	REW_loadActiveUnitMoveOrigin, .-REW_loadActiveUnitMoveOrigin
	.align	1
	.p2align 2,,3
	.global	REW_saveActiveUnitMoveOrigin
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_saveActiveUnitMoveOrigin, %function
REW_saveActiveUnitMoveOrigin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r0
	push	{r4, lr}
	movs	r2, r1
	ldr	r1, .L594
	sub	sp, sp, #8
	ldrh	r4, [r1]
	add	r0, sp, #4
	strb	r4, [r0]
	ldrh	r1, [r1, #2]
	strb	r1, [r0, #1]
	movs	r1, r3
	ldr	r3, .L594+4
	bl	.L5
	add	sp, sp, #8
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L595:
	.align	2
.L594:
	.word	gActiveUnitMoveOrigin
	.word	WriteAndVerifySramFast
	.size	REW_saveActiveUnitMoveOrigin, .-REW_saveActiveUnitMoveOrigin
	.align	1
	.p2align 2,,3
	.global	REW_loadCurSequence
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_loadCurSequence, %function
REW_loadCurSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L597
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r1, [r3]
	ldr	r3, .L597+4
	ldr	r3, [r3]
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L598:
	.align	2
.L597:
	.word	REW_curSequence
	.word	ReadSramFast
	.size	REW_loadCurSequence, .-REW_loadCurSequence
	.align	1
	.p2align 2,,3
	.global	REW_saveCurSequence
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_saveCurSequence, %function
REW_saveCurSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #8
	push	{r4, lr}
	ldr	r3, .L601
	ldrb	r3, [r3, #22]
	bics	r3, r2
	cmp	r3, #1
	bne	.L599
	ldr	r3, .L601+4
	ldr	r3, [r3]
	movs	r2, r1
	movs	r1, r0
	movs	r0, r3
	ldr	r3, .L601+8
	bl	.L5
.L599:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L602:
	.align	2
.L601:
	.word	gActionData
	.word	REW_curSequence
	.word	WriteAndVerifySramFast
	.size	REW_saveCurSequence, .-REW_saveCurSequence
	.align	1
	.p2align 2,,3
	.global	REW_loadRewind
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_loadRewind, %function
REW_loadRewind:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L604
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r1, [r3]
	ldr	r3, .L604+4
	ldr	r3, [r3]
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L605:
	.align	2
.L604:
	.word	REW_rewindBuffer
	.word	ReadSramFast
	.size	REW_loadRewind, .-REW_loadRewind
	.align	1
	.p2align 2,,3
	.global	REW_saveRewind
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_saveRewind, %function
REW_saveRewind:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r7, r8
	mov	lr, r9
	push	{r7, lr}
	ldr	r7, .L616
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	movs	r5, r0
	movs	r6, r1
	cmp	r3, #0
	beq	.L606
	movs	r2, #8
	ldr	r3, .L616+4
	ldrb	r3, [r3, #22]
	mov	r9, r2
	bics	r3, r2
	cmp	r3, #1
	beq	.L606
	ldr	r3, .L616+8
	mov	r8, r3
	ldr	r1, [r3]
	ldr	r3, .L616+12
	movs	r2, r6
	ldr	r3, [r3]
	bl	.L5
	mov	r3, r8
	ldr	r4, [r3]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L608
	ldr	r2, [r4, #4]
	ldrh	r2, [r2, #2]
.L609:
	adds	r4, r4, r3
	ldr	r1, [r7]
	strh	r2, [r4]
	ldrh	r2, [r1, #2]
	adds	r0, r4, #4
	strh	r2, [r4, #2]
	ldr	r3, .L616+16
	subs	r2, r2, #4
	adds	r1, r1, #4
	bl	.L5
	mov	r3, r8
	ldr	r0, [r3]
	ldrh	r2, [r4, #2]
	ldr	r3, [r0]
	adds	r3, r3, r2
	movs	r1, r5
	movs	r2, r6
	str	r3, [r0]
	str	r4, [r0, #4]
	ldr	r6, .L616+20
	bl	.L11
	movs	r3, #0
	ldr	r5, [r7]
	strh	r3, [r5, #2]
	strh	r3, [r5]
	ldr	r3, .L616+24
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L616+28
	lsls	r0, r0, #16
	ldr	r3, .L616+32
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	movs	r0, r5
	adds	r1, r4, r1
	bl	.L11
.L606:
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L608:
	mov	r3, r9
	movs	r2, #0
	str	r3, [r4]
	movs	r3, #8
	b	.L609
.L617:
	.align	2
.L616:
	.word	REW_curSequence
	.word	gActionData
	.word	REW_rewindBuffer
	.word	ReadSramFast
	.word	MemCpy
	.word	WriteAndVerifySramFast
	.word	gSaveBlockDecl
	.word	EMS_CHUNK_REWIND_SEQ
	.word	MS_FindSuspendSaveChunk
	.size	REW_saveRewind, .-REW_saveRewind
	.align	1
	.p2align 2,,3
	.global	REW_rewindMenuUsability
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_rewindMenuUsability, %function
REW_rewindMenuUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L621
	push	{r4, r5, lr}
	ldr	r5, [r3]
	ldr	r3, .L621+4
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L621+8
	lsls	r0, r0, #16
	sub	sp, sp, #12
	ldr	r3, .L621+12
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	movs	r2, #4
	adds	r0, r4, r0
	add	r1, sp, #4
	bl	.L6
	ldr	r0, [sp, #4]
	rsbs	r3, r0, #0
	adcs	r0, r0, r3
	lsls	r0, r0, #1
	adds	r0, r0, #1
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L622:
	.align	2
.L621:
	.word	ReadSramFast
	.word	gSaveBlockDecl
	.word	EMS_CHUNK_REWIND_BUF
	.word	MS_FindSuspendSaveChunk
	.size	REW_rewindMenuUsability, .-REW_rewindMenuUsability
	.align	1
	.p2align 2,,3
	.global	REW_rewindMenuEffect
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_rewindMenuEffect, %function
REW_rewindMenuEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L624
	@ sp needed
	bl	.L5
	ldr	r3, .L624+4
	movs	r1, #3
	ldr	r0, .L624+8
	bl	.L5
	movs	r3, #0
	str	r3, [r0, #80]
	str	r3, [r0, #84]
	movs	r0, #23
	pop	{r4}
	pop	{r1}
	bx	r1
.L625:
	.align	2
.L624:
	.word	LockGame
	.word	Proc_Start
	.word	.LANCHOR0
	.size	REW_rewindMenuEffect, .-REW_rewindMenuEffect
	.align	1
	.p2align 2,,3
	.global	REW_displayActor
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_displayActor, %function
REW_displayActor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r8
	push	{lr}
	ldr	r3, .L631
	movs	r6, r0
	sub	sp, sp, #80
	ldrb	r0, [r1, #1]
	movs	r5, r1
	movs	r7, r2
	mov	r8, r3
	bl	.L5
	movs	r4, r0
	ldrb	r0, [r5, #1]
	cmp	r0, #255
	beq	.L629
	movs	r3, #63
	movs	r2, r0
	bics	r2, r3
	cmp	r2, #192
	beq	.L630
.L628:
	ldr	r3, [r4, #4]
	ldrb	r5, [r3, #4]
	ldr	r3, [r4]
	ldrh	r0, [r3]
	ldr	r3, .L631+4
	bl	.L5
	ldr	r3, .L631+8
	movs	r1, r0
	movs	r0, r7
	bl	.L5
	movs	r0, r4
	ldr	r3, .L631+12
	bl	.L5
	movs	r3, #1
	movs	r2, r5
	str	r0, [sp]
	movs	r1, #0
	ldr	r4, .L631+16
	rsbs	r3, r3, #0
	movs	r0, #0
	bl	.L142
	movs	r3, #128
	movs	r2, #70
	lsls	r3, r3, #3
	str	r0, [r6, #80]
	ldr	r1, [r0, #48]
	strh	r3, [r0, r2]
	ldr	r4, .L631+20
	ldrh	r2, [r1, #34]
	ands	r2, r4
	orrs	r3, r2
	movs	r2, #76
	strh	r3, [r1, #34]
	ldrh	r3, [r0, r2]
	adds	r3, r3, #1
	adds	r3, r3, #255
	strh	r3, [r0, r2]
	adds	r2, r2, #2
	ldrh	r3, [r0, r2]
	adds	r3, r3, #129
	adds	r3, r3, #255
	strh	r3, [r0, r2]
	movs	r1, #4
	ldr	r3, .L631+24
	bl	.L5
	add	sp, sp, #80
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L629:
	movs	r3, #0
	movs	r2, #0
	adds	r1, r5, #4
	add	r0, sp, #8
	bl	REW_loadUnit
	add	r4, sp, #8
	b	.L628
.L630:
	bics	r0, r2
	bl	.L10
	movs	r4, r0
	b	.L628
.L632:
	.align	2
.L631:
	.word	GetUnit
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	GetUnitSpritePalette
	.word	StartMuInternal
	.word	-3073
	.word	SetMuFacing
	.size	REW_displayActor, .-REW_displayActor
	.align	1
	.p2align 2,,3
	.global	REW_displayTarget
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_displayTarget, %function
REW_displayTarget:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r8
	push	{lr}
	movs	r4, r1
	movs	r7, r0
	ldr	r6, .L645
	ldrb	r0, [r1, #1]
	sub	sp, sp, #80
	mov	r8, r2
	bl	.L11
	ldrb	r3, [r4]
	movs	r5, r0
	cmp	r3, #2
	beq	.L640
	cmp	r3, #65
	beq	.L641
.L633:
	add	sp, sp, #80
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L641:
	ldrb	r3, [r4, #1]
	lsls	r3, r3, #31
	bmi	.L642
	movs	r0, #27
	ldr	r3, .L645+4
	bl	.L5
	movs	r1, r0
.L639:
	mov	r0, r8
	ldr	r3, .L645+8
	bl	.L5
	b	.L633
.L640:
	ldrb	r0, [r4, #1]
	cmp	r0, #255
	beq	.L643
	movs	r3, #63
	movs	r2, r0
	bics	r2, r3
	cmp	r2, #192
	beq	.L644
.L636:
	ldr	r3, [r5, #4]
	ldrb	r6, [r3, #4]
	ldr	r3, [r5]
	ldrh	r0, [r3]
	ldr	r3, .L645+12
	bl	.L5
	ldr	r3, .L645+8
	movs	r1, r0
	mov	r0, r8
	bl	.L5
	mov	r0, r8
	ldr	r3, .L645+16
	bl	.L5
	ldr	r3, .L645+20
	movs	r4, r0
	movs	r0, r5
	bl	.L5
	movs	r3, #1
	movs	r2, r6
	str	r0, [sp]
	movs	r1, #0
	ldr	r5, .L645+24
	rsbs	r3, r3, #0
	movs	r0, #0
	bl	.L6
	movs	r3, #128
	movs	r2, #70
	lsls	r3, r3, #3
	str	r0, [r7, #84]
	ldr	r1, [r0, #48]
	strh	r3, [r0, r2]
	ldr	r5, .L645+28
	ldrh	r2, [r1, #34]
	ands	r2, r5
	orrs	r3, r2
	movs	r2, #76
	strh	r3, [r1, #34]
	ldrh	r3, [r0, r2]
	adds	r4, r4, #43
	adds	r3, r3, #128
	lsls	r4, r4, #4
	adds	r4, r4, r3
	strh	r4, [r0, r2]
	adds	r2, r2, #2
	ldrh	r3, [r0, r2]
	adds	r3, r3, #129
	adds	r3, r3, #255
	strh	r3, [r0, r2]
	movs	r1, #4
	ldr	r3, .L645+32
	bl	.L5
	b	.L633
.L642:
	movs	r0, #51
	ldr	r3, .L645+4
	bl	.L5
	movs	r1, r0
	b	.L639
.L643:
	movs	r3, #0
	movs	r2, #0
	adds	r1, r4, #4
	add	r0, sp, #8
	bl	REW_loadUnit
	add	r5, sp, #8
	b	.L636
.L644:
	bics	r0, r2
	bl	.L11
	movs	r5, r0
	b	.L636
.L646:
	.align	2
.L645:
	.word	GetUnit
	.word	GetTerrainName
	.word	Text_DrawString
	.word	GetStringFromIndex
	.word	Text_GetCursor
	.word	GetUnitSpritePalette
	.word	StartMuInternal
	.word	-3073
	.word	SetMuFacing
	.size	REW_displayTarget, .-REW_displayTarget
	.align	1
	.p2align 2,,3
	.global	REW_displayCombatVerb
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_displayCombatVerb, %function
REW_displayCombatVerb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r5, r2
	movs	r2, #3
	movs	r6, r2
	ldr	r4, .L658
	ldrh	r3, [r1, #2]
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	ands	r6, r3
	tst	r2, r3
	beq	.L648
	adds	r3, r3, #4
	subs	r3, r3, r6
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L648:
	ldrh	r2, [r0, #2]
	adds	r3, r1, r3
	adds	r0, r0, r2
	cmp	r3, r0
	bcs	.L649
	ldrb	r2, [r3]
	cmp	r2, #65
	beq	.L657
.L652:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L658+4
	bl	.L5
	ldr	r3, .L658+8
	movs	r1, r0
	movs	r0, r5
	bl	.L5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L657:
	ldrb	r2, [r3, #6]
	ldrb	r1, [r3, #5]
	ldrb	r0, [r3, #4]
	ldr	r3, .L658+12
	bl	.L5
	cmp	r0, #0
	bne	.L652
	ldr	r4, .L658+16
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	b	.L652
.L649:
	movs	r3, #0
	ldrb	r3, [r3]
	.inst	0xdeff
.L659:
	.align	2
.L658:
	.word	REW_combat
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	GetTypedTrapAt
	.word	REW_obstacleDestroyed
	.size	REW_displayCombatVerb, .-REW_displayCombatVerb
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC218:
	.ascii	".\000"
	.text
	.align	1
	.p2align 2,,3
	.global	REW_refreshUI
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_refreshUI, %function
REW_refreshUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	mov	lr, r9
	movs	r3, #41
	push	{r7, lr}
	ldrb	r3, [r0, r3]
	movs	r7, r0
	sub	sp, sp, #12
	lsls	r2, r3, #30
	bpl	.LCB4699
	b	.L710	@long jump
.LCB4699:
	ldr	r2, .L725
	mov	r9, r2
	ldr	r2, .L725+4
	mov	r8, r2
.L661:
	lsls	r2, r3, #31
	bpl	.L666
	ldr	r2, .L725+8
	ldrb	r2, [r2, #15]
	cmp	r2, #64
	bne	.LCB4715
	b	.L687	@long jump
.LCB4715:
	subs	r2, r2, #128
	rsbs	r1, r2, #0
	adcs	r2, r2, r1
	lsls	r2, r2, #12
.L667:
	ldr	r1, [r7, #88]
	ldr	r0, [r1, #80]
	ldrh	r1, [r0, #34]
	lsls	r1, r1, #20
	lsrs	r1, r1, #20
	orrs	r2, r1
	strh	r2, [r0, #34]
	movs	r2, #1
	bics	r3, r2
	adds	r2, r2, #40
	strb	r3, [r7, r2]
.L666:
	movs	r2, #4
	movs	r4, r2
	ldr	r0, [r7, #92]
	ands	r4, r3
	tst	r2, r3
	bne	.LCB4744
	b	.L668	@long jump
.LCB4744:
	cmp	r0, #0
	bne	.LCB4746
	b	.L717	@long jump
.LCB4746:
.L669:
	movs	r2, #8
	movs	r4, r2
	ldr	r0, [r7, #96]
	ands	r4, r3
	tst	r2, r3
	bne	.LCB4755
	b	.L670	@long jump
.LCB4755:
.L724:
	cmp	r0, #0
	bne	.LCB4758
	b	.L718	@long jump
.LCB4758:
.L671:
	ldr	r3, .L725+12
	bl	.L5
	movs	r3, #0
	str	r3, [r7, #80]
	str	r3, [r7, #84]
	movs	r3, #160
	ldr	r4, .L725+16
	lsls	r3, r3, #3
	ldr	r5, .L725+20
	adds	r6, r4, r3
.L672:
	movs	r0, r4
	movs	r2, #48
	movs	r1, #0
	adds	r4, r4, #64
	bl	.L6
	cmp	r6, r4
	bne	.L672
	movs	r3, #41
	movs	r4, r7
	ldrb	r3, [r7, r3]
	adds	r4, r4, #48
	lsls	r2, r3, #27
	bpl	.L674
	adds	r4, r4, #8
.L674:
	movs	r2, #16
	eors	r3, r2
	movs	r2, #41
	movs	r0, r4
	strb	r3, [r7, r2]
	bl	.L9
	ldr	r3, .L725+24
	movs	r1, #2
	movs	r0, r4
	bl	.L5
	ldr	r2, [r7, #44]
	ldrb	r3, [r2, #4]
	adds	r5, r2, #4
	cmp	r3, #2
	beq	.L684
.L719:
	cmp	r3, #64
	beq	.L685
	movs	r1, #3
	movs	r0, r1
	ldrh	r3, [r5, #2]
	ands	r0, r3
	tst	r1, r3
	beq	.L682
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L682:
	adds	r5, r5, r3
	ldrh	r3, [r2, #2]
	adds	r3, r2, r3
	cmp	r5, r3
	sbcs	r3, r3, r3
	rsbs	r3, r3, #0
	rsbs	r3, r3, #0
	ands	r5, r3
	ldrb	r3, [r5]
	cmp	r3, #2
	bne	.L719
.L684:
	movs	r2, r4
	movs	r1, r5
	movs	r0, r7
	bl	REW_displayActor
	movs	r2, r4
	movs	r1, r5
	ldr	r0, [r7, #44]
	bl	REW_displayCombatVerb
	movs	r1, #3
	movs	r0, r1
	ldrh	r3, [r5, #2]
	ldr	r2, [r7, #44]
	ands	r0, r3
	tst	r1, r3
	bne	.L720
.L676:
	adds	r1, r5, r3
	ldrh	r3, [r2, #2]
	adds	r2, r2, r3
	cmp	r1, r2
	sbcs	r2, r2, r2
	movs	r0, r7
	ands	r1, r2
	movs	r2, r4
	bl	REW_displayTarget
	ldr	r1, .L725+28
	movs	r0, r4
	ldr	r3, .L725+32
	bl	.L5
	movs	r0, r4
	ldr	r1, .L725+36
	bl	.L10
.L678:
	movs	r0, #0
	ldr	r3, .L725+40
	bl	.L5
	add	sp, sp, #12
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L685:
	ldr	r3, .L725+8
	ldrb	r3, [r3, #15]
	cmp	r3, #0
	beq	.L679
	cmp	r3, #128
	bne	.L721
	movs	r0, r4
	movs	r1, #1
	ldr	r3, .L725+44
	bl	.L5
	ldr	r0, .L725+48
.L716:
	lsls	r0, r0, #16
	ldr	r3, .L725+52
	lsrs	r0, r0, #16
	bl	.L5
	ldr	r3, .L725+56
	movs	r1, r0
	movs	r0, r4
	bl	.L5
	movs	r0, r4
	ldr	r1, .L725+60
	bl	.L10
	b	.L678
.L710:
	movs	r4, r0
	ldr	r3, .L725+8
	ldrh	r5, [r3, #16]
	adds	r4, r4, #64
	lsls	r3, r5, #31
	bpl	.L663
	adds	r4, r4, #8
.L663:
	ldr	r3, .L725
	movs	r0, r4
	mov	r9, r3
	bl	.L5
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L725+64
	bl	.L5
	cmp	r5, #9
	ble	.L722
	cmp	r5, #99
	ble	.L723
.L665:
	ldr	r3, .L725+4
	ldr	r1, .L725+68
	movs	r0, r4
	mov	r8, r3
	bl	.L5
	movs	r2, #41
	movs	r1, #2
	ldrb	r3, [r7, r2]
	bics	r3, r1
	strb	r3, [r7, r2]
	b	.L661
.L720:
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	b	.L676
.L668:
	cmp	r0, #0
	bne	.LCB4971
	b	.L669	@long jump
.LCB4971:
	ldr	r3, .L725+72
	bl	.L5
	movs	r2, #8
	movs	r3, #41
	str	r4, [r7, #92]
	movs	r4, r2
	ldrb	r3, [r7, r3]
	ldr	r0, [r7, #96]
	ands	r4, r3
	tst	r2, r3
	beq	.LCB4982
	b	.L724	@long jump
.LCB4982:
.L670:
	cmp	r0, #0
	bne	.LCB4985
	b	.L671	@long jump
.LCB4985:
	ldr	r3, .L725+72
	bl	.L5
	str	r4, [r7, #96]
	b	.L671
.L721:
	movs	r0, r4
	movs	r1, #4
	ldr	r3, .L725+44
	bl	.L5
	ldr	r0, .L725+76
	b	.L716
.L722:
	movs	r0, r4
	movs	r1, #6
	ldr	r3, .L725+44
	bl	.L5
	movs	r1, r5
	movs	r0, r4
	ldr	r3, .L725+80
	bl	.L5
	b	.L665
.L687:
	movs	r2, #128
	lsls	r2, r2, #6
	b	.L667
.L679:
	ldr	r0, .L725+84
	b	.L716
.L718:
	ldr	r4, .L725+88
	str	r0, [sp, #4]
	str	r0, [sp]
	movs	r3, #0
	movs	r0, r4
	movs	r2, #0
	movs	r1, #0
	ldr	r4, .L725+92
	bl	.L142
	str	r0, [r7, #96]
	b	.L671
.L717:
	ldr	r4, .L725+96
	movs	r3, #0
	str	r0, [sp, #4]
	str	r0, [sp]
	movs	r2, #0
	movs	r0, r4
	movs	r1, #0
	ldr	r4, .L725+92
	bl	.L142
	movs	r3, #41
	str	r0, [r7, #92]
	ldrb	r3, [r7, r3]
	b	.L669
.L723:
	ldr	r3, .L725+100
	movs	r1, #10
	movs	r0, r5
	bl	.L5
	ldr	r6, .L725+80
	movs	r1, r0
	movs	r0, r4
	bl	.L11
	movs	r0, r4
	movs	r1, #16
	ldr	r3, .L725+44
	bl	.L5
	movs	r0, r5
	ldr	r3, .L725+104
	movs	r1, #10
	bl	.L5
	movs	r0, r4
	bl	.L11
	b	.L665
.L726:
	.align	2
.L725:
	.word	ClearText
	.word	PutText
	.word	gPlaySt
	.word	EndAllMus
	.word	gBG0TilemapBuffer
	.word	memset
	.word	Text_SetCursor
	.word	.LC218
	.word	Text_DrawCharacter
	.word	gBG0TilemapBuffer+138
	.word	BG_EnableSync
	.word	Text_Skip
	.word	REW_phaseRed
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	gBG0TilemapBuffer+140
	.word	Text_SetColor
	.word	gBG0TilemapBuffer+118
	.word	Proc_End
	.word	REW_phaseGreen
	.word	Text_DrawNumber
	.word	REW_phaseBlue
	.word	REW_downArrowAPDef
	.word	APProc_Create
	.word	REW_upArrowAPDef
	.word	__aeabi_idiv
	.word	__aeabi_idivmod
	.size	REW_refreshUI, .-REW_refreshUI
	.align	1
	.p2align 2,,3
	.global	REW_undo
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_undo, %function
REW_undo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #3
	push	{r4, r5, r6, lr}
	movs	r1, r2
	movs	r5, r0
	adds	r4, r0, #4
	ldrh	r3, [r4, #2]
	ldrh	r0, [r0, #2]
	ands	r1, r3
	adds	r0, r5, r0
	tst	r2, r3
	beq	.L728
.L757:
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L728:
	adds	r3, r4, r3
	cmp	r3, r0
	bcs	.L729
.L758:
	cmp	r3, #0
	beq	.L729
	movs	r4, r3
	movs	r1, r2
	ldrh	r3, [r4, #2]
	ands	r1, r3
	tst	r2, r3
	bne	.L757
	adds	r3, r4, r3
	cmp	r3, r0
	bcc	.L758
.L729:
	ldr	r6, .L761
	b	.L737
.L760:
	cmp	r3, #2
	beq	.L733
	cmp	r3, #64
	bne	.L735
	movs	r0, r4
	bl	REW_undoPhaseChange
.L735:
	movs	r1, r4
	movs	r0, r5
	bl	REW_prevEntry
	subs	r4, r0, #0
	beq	.L759
.L737:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L731
	bls	.L760
	cmp	r3, #66
	beq	.L733
	subs	r3, r3, #67
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, #1
	bhi	.L735
	ldrb	r0, [r4, #1]
	bl	.L11
	cmp	r0, #0
	beq	.L735
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L735
	ldr	r3, .L761+4
	bl	.L5
	movs	r1, r4
	movs	r0, r5
	bl	REW_prevEntry
	subs	r4, r0, #0
	bne	.L737
.L759:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L733:
	movs	r0, r4
	bl	REW_undoCombat
	b	.L735
.L731:
	movs	r0, r4
	bl	REW_undoObstacleCombat
	b	.L735
.L762:
	.align	2
.L761:
	.word	GetUnit
	.word	ClearUnit
	.size	REW_undo, .-REW_undo
	.align	1
	.p2align 2,,3
	.global	REW_redo
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_redo, %function
REW_redo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r5, r0
	movs	r6, #3
	ldr	r7, .L782
	adds	r4, r0, #4
.L771:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L764
	bhi	.L765
	cmp	r3, #2
	beq	.L766
	cmp	r3, #64
	bne	.L768
	movs	r0, r4
	bl	REW_redoPhaseChange
.L768:
	movs	r2, r6
	ldrh	r3, [r4, #2]
	ands	r2, r3
	tst	r6, r3
	beq	.L769
	adds	r3, r3, #4
	subs	r3, r3, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L769:
	adds	r4, r4, r3
	ldrh	r3, [r5, #2]
	adds	r3, r5, r3
	cmp	r4, r3
	bcs	.L763
	cmp	r4, #0
	bne	.L771
.L763:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L765:
	cmp	r3, #66
	beq	.L766
	subs	r3, r3, #67
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, #1
	bhi	.L768
	adds	r0, r4, #4
	bl	.L7
	b	.L768
.L766:
	movs	r0, r4
	bl	REW_redoCombat
	b	.L768
.L764:
	movs	r0, r4
	bl	REW_redoObstacleCombat
	b	.L768
.L783:
	.align	2
.L782:
	.word	LoadUnit
	.size	REW_redo, .-REW_redo
	.align	1
	.p2align 2,,3
	.global	REW_handleInput
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_handleInput, %function
REW_handleInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r3, .L818
	ldr	r3, [r3]
	ldr	r5, .L818+4
	ldrh	r3, [r3, #6]
	movs	r4, r0
	ldrb	r7, [r5, #15]
	ldrh	r6, [r5, #16]
	lsls	r2, r3, #25
	bpl	.L785
	movs	r2, #41
	ldrb	r2, [r0, r2]
	lsls	r2, r2, #29
	bpl	.L785
	movs	r3, #65
	ldrb	r3, [r5, r3]
	lsls	r3, r3, #30
	bpl	.L814
.L786:
	ldr	r0, [r4, #44]
	bl	REW_undo
	movs	r3, #41
	ldrb	r2, [r5, #15]
	ldrb	r3, [r4, r3]
	cmp	r2, r7
	beq	.L787
	movs	r2, #1
	orrs	r3, r2
.L787:
	ldrh	r2, [r5, #16]
	cmp	r2, r6
	beq	.L788
	movs	r2, #2
	orrs	r3, r2
.L788:
	ldr	r2, [r4, #44]
	ldrh	r1, [r2]
	subs	r2, r2, r1
	str	r2, [r4, #44]
	ldrh	r2, [r2]
	cmp	r2, #0
	beq	.L815
.L789:
	movs	r2, #8
.L813:
	orrs	r3, r2
	movs	r2, #41
	movs	r0, r4
	strb	r3, [r4, r2]
	bl	REW_refreshUI
	ldr	r3, .L818+8
	bl	.L5
	ldr	r3, .L818+12
	bl	.L5
.L784:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L785:
	lsls	r3, r3, #24
	bpl	.L784
	movs	r3, #41
	ldrb	r3, [r4, r3]
	lsls	r3, r3, #28
	bpl	.L784
	movs	r3, #65
	ldrb	r3, [r5, r3]
	lsls	r3, r3, #30
	bpl	.L816
.L791:
	ldr	r0, [r4, #44]
	ldrh	r3, [r0, #2]
	adds	r0, r0, r3
	str	r0, [r4, #44]
	bl	REW_redo
	movs	r3, #41
	ldrb	r2, [r5, #15]
	ldrb	r3, [r4, r3]
	cmp	r2, r7
	beq	.L792
	movs	r2, #1
	orrs	r3, r2
.L792:
	ldrh	r2, [r5, #16]
	cmp	r2, r6
	beq	.L793
	movs	r2, #2
	orrs	r3, r2
.L793:
	ldr	r2, .L818+16
	ldr	r2, [r2]
	ldr	r1, [r4, #44]
	ldr	r2, [r2, #4]
	cmp	r1, r2
	bcs	.L817
	movs	r2, #4
	b	.L813
.L815:
	adds	r2, r2, #4
	bics	r3, r2
	b	.L789
.L814:
	movs	r0, #102
	ldr	r3, .L818+20
	bl	.L5
	b	.L786
.L817:
	movs	r2, #8
	bics	r3, r2
	movs	r2, #4
	b	.L813
.L816:
	movs	r0, #102
	ldr	r3, .L818+20
	bl	.L5
	b	.L791
.L819:
	.align	2
.L818:
	.word	gKeyStatusPtr
	.word	gPlaySt
	.word	RefreshEntityBmMaps
	.word	RefreshUnitSprites
	.word	REW_rewindBuffer
	.word	m4aSongNumStart
	.size	REW_handleInput, .-REW_handleInput
	.global	REW_procScr
	.section	.rodata.str1.4
	.align	2
.LC242:
	.ascii	"REW_proc\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	REW_procScr, %object
	.size	REW_procScr, 96
REW_procScr:
	.short	1
	.short	0
	.word	.LC242
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	ResetText
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
	.global	__aeabi_idivmod
	.global	__aeabi_idiv
	.ident	"GCC: (devkitARM release 65) 14.2.0"
	.text
	.code 16
	.align	1
.L5:
	bx	r3
.L142:
	bx	r4
.L6:
	bx	r5
.L11:
	bx	r6
.L7:
	bx	r7
.L10:
	bx	r8
.L9:
	bx	r9
.L8:
	bx	r10
.L190:
	bx	fp
