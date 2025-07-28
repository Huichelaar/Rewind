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
	.global	REW_initProc
	.syntax unified
	.code	16
	.thumb_func
	.type	REW_initProc, %function
REW_initProc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L38
	push	{r4, r5, r6, lr}
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r3, .L38+4
	lsls	r3, r3, #16
	movs	r5, r0
	lsrs	r0, r3, #16
	ldr	r3, .L38+8
	add	r4, r4, ip
	bl	.L5
	ldr	r2, .L38+12
	ldr	r6, .L38+16
	ldrh	r0, [r0]
	ldr	r3, .L38+20
	lsls	r2, r2, #16
	ldr	r3, [r3]
	lsrs	r2, r2, #16
	ldr	r1, [r6]
	adds	r0, r4, r0
	bl	.L5
	ldr	r3, [r6]
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L37
	movs	r2, #41
	movs	r1, #2
	ldr	r3, [r3, #4]
	str	r3, [r5, #44]
	strb	r1, [r5, r2]
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L31
	movs	r3, #6
	strb	r3, [r5, r2]
.L31:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L37:
	movs	r0, r5
	ldr	r3, .L38+24
	bl	.L5
	b	.L31
.L39:
	.align	2
.L38:
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
	bne	.L43
	adds	r3, r3, #4
	strh	r3, [r0, #2]
.L43:
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
	beq	.L47
	adds	r2, r2, #4
	subs	r2, r2, r4
	lsls	r2, r2, #16
	lsrs	r2, r2, #16
.L47:
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
	beq	.L54
	adds	r0, r0, #4
	subs	r0, r0, r5
	lsls	r0, r0, #16
	lsrs	r0, r0, #16
.L54:
	ldrh	r4, [r2, #2]
	adds	r0, r3, r0
	adds	r2, r2, r4
	cmp	r0, r2
	sbcs	r4, r4, r4
	ands	r0, r4
	cmp	r3, r1
	beq	.L61
	cmp	r1, r0
	beq	.L62
	movs	r4, #3
	b	.L59
.L63:
	movs	r0, r3
.L59:
	movs	r5, r4
	ldrh	r3, [r0, #2]
	ands	r5, r3
	tst	r4, r3
	beq	.L57
	adds	r3, r3, #4
	subs	r3, r3, r5
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L57:
	adds	r3, r0, r3
	cmp	r3, r2
	sbcs	r5, r5, r5
	ands	r3, r5
	cmp	r1, r3
	bne	.L63
.L53:
	@ sp needed
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L62:
	movs	r0, r3
	b	.L53
.L61:
	movs	r0, #0
	b	.L53
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
	beq	.L71
.L79:
	adds	r3, r3, #4
	subs	r3, r3, r4
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L71:
	adds	r3, r0, r3
	cmp	r3, r1
	bcs	.L70
.L80:
	cmp	r3, #0
	beq	.L70
	movs	r0, r3
	movs	r4, r2
	ldrh	r3, [r0, #2]
	ands	r4, r3
	tst	r2, r3
	bne	.L79
	adds	r3, r0, r3
	cmp	r3, r1
	bcc	.L80
.L70:
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
	beq	.L81
	adds	r3, r3, #4
	subs	r3, r3, r1
	strh	r3, [r0, #2]
.L81:
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
	ldr	r3, .L88
	@ sp needed
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r0, r3
	sbcs	r0, r0, r0
	rsbs	r0, r0, #0
	bx	lr
.L89:
	.align	2
.L88:
	.word	REW_rewindBuffer
	.size	REW_isRedoAvailable, .-REW_isRedoAvailable
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
	ldr	r5, .L100
	ldr	r6, .L100+4
.L92:
	movs	r0, r4
	bl	.L6
	cmp	r0, #0
	beq	.L91
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L91
	movs	r3, #17
	movs	r2, #16
	ldrsb	r3, [r0, r3]
	ldr	r1, [r6]
	lsls	r3, r3, #2
	ldrsb	r2, [r0, r2]
	ldr	r3, [r3, r1]
	ldrb	r3, [r3, r2]
	cmp	r3, #34
	bne	.L91
	ldr	r3, [r0, #12]
	orrs	r3, r7
	str	r3, [r0, #12]
.L91:
	adds	r4, r4, #1
	cmp	r4, #192
	bne	.L92
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L101:
	.align	2
.L100:
	.word	GetUnit
	.word	gBmMapTerrain
	.size	REW_hideRoofedUnits, .-REW_hideRoofedUnits
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
	ldr	r3, .L105
	movs	r4, r0
	ldrb	r2, [r0, #6]
	ldrb	r1, [r0, #5]
	ldrb	r0, [r0, #4]
	bl	.L5
	cmp	r0, #0
	beq	.L103
	ldrb	r3, [r0, #3]
	ldrb	r2, [r4, #7]
	subs	r3, r3, r2
	strb	r3, [r0, #3]
.L102:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L103:
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L105+4
	bl	.L5
	lsls	r0, r0, #16
	movs	r2, #0
	movs	r1, #0
	ldr	r3, .L105+8
	lsrs	r0, r0, #16
	bl	.L5
	ldrb	r3, [r4, #7]
	ldrb	r2, [r4, #6]
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	rsbs	r3, r3, #0
	ldr	r4, .L105+12
	bl	.L107
	b	.L102
.L106:
	.align	2
.L105:
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
	ldr	r3, .L111
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
	beq	.L110
.L108:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L110:
	ldr	r3, .L111+4
	bl	.L5
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L111+8
	bl	.L5
	lsls	r0, r0, #16
	movs	r2, #0
	movs	r1, #0
	ldr	r3, .L111+12
	lsrs	r0, r0, #16
	bl	.L5
	b	.L108
.L112:
	.align	2
.L111:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r10
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7, lr}
	ldr	r3, .L129
	movs	r7, r0
	ldrb	r0, [r0, #1]
	bl	.L5
	subs	r6, r0, #0
	beq	.L113
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L113
	movs	r3, #16
	ldrsb	r3, [r0, r3]
	mov	r10, r3
	movs	r3, #17
	ldrh	r1, [r7, #2]
	ldrsb	r3, [r0, r3]
	mov	r8, r3
	cmp	r1, #5
	bls	.L115
	ldr	r3, .L129+4
	movs	r5, #0
	mov	r9, r3
	adds	r4, r7, #4
	b	.L119
.L127:
	ldrb	r1, [r4, #1]
	ldrb	r2, [r6, r3]
	subs	r2, r2, r1
	strb	r2, [r6, r3]
	ldrh	r1, [r7, #2]
.L117:
	subs	r2, r1, #4
	lsrs	r3, r2, #31
	adds	r3, r3, r2
	adds	r5, r5, #1
	adds	r4, r4, #2
	asrs	r3, r3, #1
	cmp	r3, r5
	ble	.L115
.L119:
	ldrb	r3, [r4]
	cmp	r3, #71
	bls	.L127
	cmp	r3, #87
	bls	.L128
	cmp	r3, #88
	bne	.L117
	ldr	r3, .L129+8
	ldrb	r0, [r6, #28]
	bl	.L5
	ldrb	r2, [r4, #1]
	ldrb	r3, [r0, #6]
	subs	r3, r3, r2
	strb	r3, [r0, #6]
	ldrh	r1, [r7, #2]
	subs	r2, r1, #4
	lsrs	r3, r2, #31
	adds	r3, r3, r2
	adds	r5, r5, #1
	adds	r4, r4, #2
	asrs	r3, r3, #1
	cmp	r3, r5
	bgt	.L119
.L115:
	mov	r3, r8
	ldr	r2, .L129+12
	ldr	r1, [r2]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	mov	r0, r10
	movs	r1, #0
	strb	r1, [r3, r0]
	movs	r3, #17
	ldr	r1, [r2]
	movs	r2, #16
	ldrsb	r3, [r6, r3]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	ldrsb	r2, [r6, r2]
	ldrb	r1, [r6, #11]
	strb	r1, [r3, r2]
.L113:
	@ sp needed
	pop	{r5, r6, r7}
	mov	r10, r7
	mov	r9, r6
	mov	r8, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L128:
	ldr	r3, [r6]
	ldrb	r0, [r3, #4]
	bl	.L9
	ldrb	r3, [r4]
	subs	r3, r3, #72
	ldrb	r1, [r4, #1]
	ldrb	r2, [r0, r3]
	subs	r2, r2, r1
	strb	r2, [r0, r3]
	ldrh	r1, [r7, #2]
	b	.L117
.L130:
	.align	2
.L129:
	.word	GetUnit
	.word	GetPidStats
	.word	GetTrap
	.word	gBmMapUnit
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r10
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7, lr}
	ldr	r3, .L147
	movs	r7, r0
	ldrb	r0, [r0, #1]
	bl	.L5
	subs	r6, r0, #0
	beq	.L131
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L131
	movs	r3, #16
	ldrsb	r3, [r0, r3]
	mov	r10, r3
	movs	r3, #17
	ldrh	r1, [r7, #2]
	ldrsb	r3, [r0, r3]
	mov	r8, r3
	cmp	r1, #5
	bls	.L133
	ldr	r3, .L147+4
	movs	r5, #0
	mov	r9, r3
	adds	r4, r7, #4
	b	.L137
.L145:
	ldrb	r1, [r4, #1]
	ldrb	r2, [r6, r3]
	adds	r2, r2, r1
	strb	r2, [r6, r3]
	ldrh	r1, [r7, #2]
.L135:
	subs	r2, r1, #4
	lsrs	r3, r2, #31
	adds	r3, r3, r2
	adds	r5, r5, #1
	adds	r4, r4, #2
	asrs	r3, r3, #1
	cmp	r3, r5
	ble	.L133
.L137:
	ldrb	r3, [r4]
	cmp	r3, #71
	bls	.L145
	cmp	r3, #87
	bls	.L146
	cmp	r3, #88
	bne	.L135
	ldr	r3, .L147+8
	ldrb	r0, [r6, #28]
	bl	.L5
	ldrb	r2, [r4, #1]
	ldrb	r3, [r0, #6]
	adds	r3, r3, r2
	strb	r3, [r0, #6]
	ldrh	r1, [r7, #2]
	subs	r2, r1, #4
	lsrs	r3, r2, #31
	adds	r3, r3, r2
	adds	r5, r5, #1
	adds	r4, r4, #2
	asrs	r3, r3, #1
	cmp	r3, r5
	bgt	.L137
.L133:
	mov	r3, r8
	ldr	r2, .L147+12
	ldr	r1, [r2]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	mov	r0, r10
	movs	r1, #0
	strb	r1, [r3, r0]
	movs	r3, #17
	ldr	r1, [r2]
	movs	r2, #16
	ldrsb	r3, [r6, r3]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	ldrsb	r2, [r6, r2]
	ldrb	r1, [r6, #11]
	strb	r1, [r3, r2]
.L131:
	@ sp needed
	pop	{r5, r6, r7}
	mov	r10, r7
	mov	r9, r6
	mov	r8, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L146:
	ldr	r3, [r6]
	ldrb	r0, [r3, #4]
	bl	.L9
	ldrb	r3, [r4]
	subs	r3, r3, #72
	ldrb	r1, [r4, #1]
	ldrb	r2, [r0, r3]
	adds	r2, r2, r1
	strb	r2, [r0, r3]
	ldrh	r1, [r7, #2]
	b	.L135
.L148:
	.align	2
.L147:
	.word	GetUnit
	.word	GetPidStats
	.word	GetTrap
	.word	gBmMapUnit
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
	ldr	r3, .L199
	movs	r6, r1
	bl	.L5
	mov	r4, sp
	cmp	r0, #0
	beq	.L151
	movs	r2, #8
	mov	r1, sp
	ldr	r3, .L199+4
	bl	.L5
	movs	r2, #11
	ldr	r7, .L199+8
	ldrsb	r2, [r7, r2]
	cmp	r2, #0
	beq	.L151
	movs	r3, #110
	ldrsb	r1, [r6, r3]
	cmp	r1, #0
	beq	.L152
	ldr	r3, [sp, #8]
	lsls	r3, r3, #8
	lsrs	r3, r3, #20
	adds	r3, r3, r1
	movs	r1, #250
	lsls	r1, r1, #4
	cmp	r3, r1
	bgt	.L193
.L153:
	ldr	r1, [r4, #8]
	ldr	r0, .L199+12
	lsls	r3, r3, #20
	lsrs	r3, r3, #8
	ands	r1, r0
	orrs	r3, r1
	str	r3, [r4, #8]
.L152:
	movs	r1, #11
	movs	r3, #192
	ldrsb	r1, [r6, r1]
	tst	r3, r1
	beq	.L154
	ldr	r3, .L199+16
	mov	r8, r3
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	cmp	r3, r1
	beq	.L155
	cmp	r2, r1
	bne	.LCB1037
	b	.L192	@long jump
.LCB1037:
.L151:
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
.L154:
	movs	r0, #250
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #18
	lsrs	r3, r3, #20
	adds	r3, r3, #1
	lsls	r0, r0, #4
	cmp	r3, r0
	bgt	.L194
.L158:
	lsls	r3, r3, #20
	lsrs	r3, r3, #18
	mov	r8, r3
	ldrh	r0, [r4, #12]
	ldr	r3, .L199+20
	ands	r0, r3
	mov	r3, r8
	orrs	r3, r0
	strh	r3, [r4, #12]
	ldr	r3, .L199+16
	mov	r8, r3
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	cmp	r3, r1
	beq	.L155
	cmp	r2, r1
	beq	.L192
.L166:
	mov	r3, r8
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	cmp	r3, r1
	bne	.LCB1095
	b	.L195	@long jump
.LCB1095:
.L167:
	movs	r3, #11
	ldrsb	r3, [r7, r3]
	cmp	r3, r1
	bne	.L151
	mov	r0, r8
	ldr	r3, .L199+24
	bl	.L5
	cmp	r0, #0
	bne	.L151
.L170:
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
	bcs	.L151
	adds	r3, r3, #1
	strb	r3, [r4, #11]
	lsrs	r3, r3, #8
	ands	r3, r1
	bics	r2, r1
	orrs	r2, r3
	strb	r2, [r4, #12]
	b	.L151
.L193:
	movs	r3, r1
	b	.L153
.L194:
	movs	r3, r0
	b	.L158
.L155:
	ldr	r3, .L199+24
	mov	r0, r8
	mov	r9, r3
	bl	.L5
	cmp	r0, #0
	bne	.L196
.L160:
	ldr	r3, .L199+28
	bl	.L5
	cmp	r0, #2
	beq	.L197
	movs	r2, #63
	ldr	r3, .L199+32
	ldrb	r1, [r3, #14]
	ands	r2, r1
	movs	r1, #0
.L163:
	ldrh	r3, [r3, #16]
	lsls	r3, r3, #22
	lsls	r2, r2, #8
	lsrs	r3, r3, #8
	orrs	r3, r2
	ldr	r0, .L199+36
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
	beq	.L198
	mov	r3, r8
	ldr	r3, [r3]
	ldrb	r0, [r3, #4]
.L165:
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
.L161:
	movs	r3, #192
	tst	r3, r1
	beq	.LCB1242
	b	.L151	@long jump
.LCB1242:
	b	.L166
.L192:
	ldr	r3, .L199+24
	mov	r9, r3
.L156:
	movs	r0, r7
	bl	.L9
	cmp	r0, #0
	beq	.L160
	movs	r1, #11
	ldrsb	r1, [r6, r1]
	b	.L161
.L196:
	movs	r1, #11
	movs	r3, #11
	ldrsb	r1, [r6, r1]
	ldrsb	r3, [r7, r3]
	cmp	r3, r1
	bne	.L161
	b	.L156
.L195:
	movs	r0, r7
	ldr	r3, .L199+24
	bl	.L5
	cmp	r0, #0
	bne	.LCB1277
	b	.L170	@long jump
.LCB1277:
	movs	r1, #11
	ldrsb	r1, [r6, r1]
	b	.L167
.L198:
	ldr	r3, [r7]
	ldrb	r0, [r3, #4]
	b	.L165
.L197:
	movs	r2, #63
	ldr	r3, .L199+40
	ldrb	r3, [r3, #17]
	movs	r1, #1
	ands	r2, r3
	ldr	r3, .L199+32
	b	.L163
.L200:
	.align	2
.L199:
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
	mov	lr, fp
	mov	r7, r10
	mov	r6, r8
	push	{r6, r7, lr}
	movs	r7, r1
	sub	sp, sp, #88
	movs	r5, r0
	movs	r4, r3
	add	r3, sp, #120
	ldrb	r3, [r3]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	mov	r10, r2
	mov	fp, r3
	ldr	r2, [sp, #128]
	ldrb	r3, [r0, #11]
	strb	r3, [r2, #1]
	add	r3, sp, #16
	mov	r8, r3
	movs	r1, r3
	movs	r2, #36
	ldr	r3, .L244
	movs	r0, r7
	bl	.L5
	ldrb	r1, [r5, #26]
	ldrb	r3, [r7, #26]
	ldr	r2, [r5, #4]
	subs	r3, r3, r1
	ldrb	r1, [r2, #17]
	subs	r3, r3, r1
	ldr	r1, [r5]
	ldrb	r1, [r1, #19]
	subs	r3, r3, r1
	mov	r1, r8
	strb	r3, [r1, #26]
	ldrb	r3, [r7, #29]
	ldrb	r1, [r5, #29]
	ldrb	r2, [r2, #18]
	subs	r3, r3, r1
	subs	r3, r3, r2
	mov	r2, r8
	strb	r3, [r2, #29]
	movs	r3, #82
	ldrsb	r3, [r7, r3]
	cmp	r3, #0
	beq	.L202
	movs	r3, #81
	movs	r2, #72
	ldrb	r3, [r7, r3]
	adds	r3, r3, #12
	ldrh	r2, [r7, r2]
	lsls	r3, r3, #1
	add	r3, r3, r8
	strh	r2, [r3, #6]
.L202:
	movs	r3, #111
	ldrsb	r1, [r7, r3]
	cmp	r1, #0
	blt	.L203
	mov	r0, r8
	ldr	r3, .L244+4
	bl	.L5
.L203:
	mov	r3, r8
	movs	r2, #115
	ldrb	r3, [r3, #18]
	ldrb	r2, [r7, r2]
	ldr	r1, [sp, #36]
	adds	r3, r3, r2
	mov	r2, r8
	movs	r0, r1
	strb	r3, [r2, #18]
	ldr	r3, [r7, #116]
	ldr	r2, .L244+8
	ands	r0, r2
	ands	r2, r3
	eors	r3, r1
	ldr	r1, .L244+12
	adds	r2, r0, r2
	ands	r3, r1
	eors	r3, r2
	str	r3, [sp, #36]
	movs	r2, #120
	mov	r3, r8
	ldrb	r2, [r7, r2]
	ldrb	r3, [r3, #24]
	adds	r3, r3, r2
	mov	r2, r8
	strb	r3, [r2, #24]
	ldrb	r3, [r2, #25]
	movs	r2, #121
	ldrb	r2, [r7, r2]
	adds	r3, r3, r2
	mov	r2, r8
	mov	r0, r8
	strb	r3, [r2, #25]
	ldr	r3, .L244+16
	bl	.L5
	movs	r0, r7
	ldr	r3, .L244+20
	bl	.L5
	cmp	r0, #0
	ble	.L204
	movs	r3, #80
	ldrb	r3, [r7, r3]
	add	r3, r3, r8
	adds	r3, r3, #40
	strb	r0, [r3]
.L204:
	ldr	r3, .L244+24
	mov	r0, r8
	bl	.L5
	ldr	r3, [sp, #128]
	adds	r6, r3, #4
	mov	r3, r8
	ldrb	r3, [r3, #16]
	subs	r3, r3, r4
	lsls	r3, r3, #24
	movs	r4, #0
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L205
	movs	r3, #16
	ldr	r1, [sp, #128]
	strb	r3, [r1, #4]
	strb	r2, [r1, #5]
	adds	r4, r4, #1
.L205:
	mov	r3, r8
	mov	r2, fp
	ldrb	r3, [r3, #17]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L206
	movs	r1, #17
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r1, [r3]
	strb	r2, [r3, #1]
	adds	r4, r4, #1
.L206:
	mov	r1, r8
	movs	r2, #0
.L208:
	ldrb	r0, [r5, r2]
	ldrb	r3, [r1]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r0, r3, #24
	cmp	r3, #0
	beq	.L207
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r2, [r3]
	strb	r0, [r3, #1]
	adds	r4, r4, #1
.L207:
	adds	r2, r2, #1
	adds	r1, r1, #1
	cmp	r2, #72
	bne	.L208
	mov	r3, r10
	cmp	r3, #0
	bne	.L243
.L211:
	ldr	r3, [r7]
	ldrb	r0, [r3, #4]
	ldr	r3, .L244+28
	bl	.L5
	mov	r8, r0
	cmp	r0, #0
	beq	.L212
	mov	r0, sp
	movs	r1, r7
	bl	REW_applyBWLChanges
	mov	r3, sp
	mov	r0, r8
	movs	r2, #1
	subs	r5, r3, #1
	subs	r0, r0, #1
.L214:
	ldrb	r1, [r0, r2]
	ldrb	r3, [r5, r2]
	subs	r3, r3, r1
	lsls	r3, r3, #24
	lsrs	r1, r3, #24
	cmp	r3, #0
	beq	.L213
	movs	r7, r2
	lsls	r3, r4, #1
	adds	r3, r6, r3
	adds	r7, r7, #71
	strb	r7, [r3]
	strb	r1, [r3, #1]
	adds	r4, r4, #1
.L213:
	adds	r2, r2, #1
	cmp	r2, #17
	bne	.L214
.L212:
	adds	r4, r4, #2
	ldr	r2, [sp, #128]
	lsls	r3, r4, #17
	lsrs	r3, r3, #16
	strh	r3, [r2, #2]
	ldr	r2, [sp, #124]
	ldrh	r2, [r2, #2]
	cmp	r2, #0
	bne	.L215
	adds	r2, r2, #4
.L215:
	adds	r3, r3, r2
	movs	r2, #3
	movs	r1, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r1, r3
	tst	r2, r3
	beq	.L216
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L216:
	ldr	r2, [sp, #124]
	strh	r3, [r2, #2]
	add	sp, sp, #88
	@ sp needed
	pop	{r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r8, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L243:
	ldrh	r0, [r7, r2]
	ldr	r3, .L244+32
	bl	.L5
	mov	r3, r8
	movs	r5, r0
	ldrb	r0, [r3, #28]
	ldr	r3, .L244+36
	bl	.L5
	ldrb	r3, [r0, #6]
	subs	r3, r5, r3
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L211
	movs	r1, #88
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r1, [r3]
	strb	r2, [r3, #1]
	adds	r4, r4, #1
	b	.L211
.L245:
	.align	2
.L244:
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
	@ args = 12, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r6, r9
	mov	r7, r10
	mov	r5, r8
	mov	lr, fp
	push	{r5, r6, r7, lr}
	sub	sp, sp, #124
	ldr	r7, [sp, #168]
	str	r1, [sp, #4]
	adds	r1, r7, #4
	str	r1, [sp]
	movs	r1, #192
	movs	r4, r0
	movs	r0, #11
	movs	r5, r1
	ldr	r6, [r4, #4]
	add	r2, sp, #160
	ldrb	r2, [r2]
	ldrsb	r0, [r4, r0]
	ldrb	r6, [r6, #4]
	lsls	r2, r2, #24
	mov	r9, r6
	asrs	r2, r2, #24
	ands	r5, r0
	tst	r1, r0
	bne	.L247
	cmp	r6, #81
	beq	.LCB1652
	b	.L281	@long jump
.LCB1652:
.L247:
	movs	r1, #255
	strb	r1, [r7, #1]
	ldr	r1, [r4]
	ldrb	r1, [r1, #4]
	strb	r1, [r7, #4]
	mov	r10, r1
	mov	r1, r9
	strb	r1, [r7, #5]
	ldr	r1, [r4, #12]
	asrs	r0, r0, #6
	lsrs	r5, r1, #12
	mov	ip, r5
	lsls	r5, r0, #1
	mov	r8, r5
	movs	r5, #6
	mov	fp, r5
	mov	r5, r8
	mov	r1, fp
	ands	r5, r1
	subs	r1, r1, #5
	mov	fp, r5
	movs	r5, r1
	mov	r1, ip
	ands	r5, r1
	mov	r8, r5
	movs	r6, #8
	mov	r1, r8
	mov	r5, fp
	ldrsb	r6, [r4, r6]
	orrs	r5, r1
	lsls	r1, r6, #3
	orrs	r5, r1
	movs	r1, #63
	mov	r8, r1
	ands	r3, r1
	ldrb	r1, [r7, #7]
	strb	r5, [r7, #6]
	movs	r5, r1
	mov	r1, r8
	ands	r2, r1
	bics	r5, r1
	ldrb	r1, [r7, #8]
	orrs	r5, r3
	strb	r5, [r7, #7]
	movs	r5, r1
	mov	r1, r8
	bics	r5, r1
	orrs	r5, r2
	strb	r5, [r7, #8]
	mov	r5, r10
	add	r1, sp, #28
	strb	r5, [r1]
	mov	r5, r9
	mov	r8, r1
	strb	r5, [r1, #1]
	movs	r1, #3
	lsls	r2, r2, #6
	ands	r0, r1
	orrs	r3, r2
	mov	r1, r8
	mov	r2, ip
	lsls	r6, r6, #11
	lsls	r0, r0, #9
	orrs	r0, r6
	strh	r0, [r1, #2]
	lsls	r1, r2, #13
	movs	r2, #128
	lsls	r2, r2, #6
	ands	r1, r2
	orrs	r3, r1
	movs	r1, #128
	ldr	r2, [sp, #32]
	lsls	r1, r1, #7
	ands	r2, r1
	orrs	r3, r2
	str	r3, [sp, #32]
	mov	r2, r8
	movs	r3, #0
	add	r6, sp, #48
	str	r3, [r2, #8]
	movs	r1, r6
	str	r3, [sp, #40]
	str	r3, [sp, #44]
	str	r3, [sp, #8]
	ldr	r2, .L282
	ldr	r3, .L282+4
	add	r0, sp, #8
	bl	.L5
	ldr	r3, .L282+8
	mov	r1, r8
	movs	r0, r6
	bl	.L5
	movs	r3, #255
	strb	r3, [r6, #9]
	ldrb	r3, [r4, #11]
	strb	r3, [r6, #11]
	ldr	r3, [r4, #60]
	str	r3, [sp, #108]
	movs	r3, #9
	adds	r5, r7, #4
	adds	r5, r5, #5
.L249:
	movs	r1, r6
	movs	r2, #0
	movs	r6, #0
	strh	r3, [r7, #2]
.L253:
	ldrb	r0, [r1]
	ldrb	r3, [r4, r2]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r0, r3, #24
	cmp	r3, #0
	beq	.L252
	lsls	r3, r6, #1
	adds	r3, r5, r3
	strb	r2, [r3]
	strb	r0, [r3, #1]
	adds	r6, r6, #1
.L252:
	adds	r2, r2, #1
	adds	r1, r1, #1
	cmp	r2, #72
	bne	.L253
	ldr	r3, [r4]
	ldrb	r0, [r3, #4]
	ldr	r3, .L282+12
	bl	.L5
	mov	r8, r0
	cmp	r0, #0
	beq	.L254
	add	r0, sp, #12
	ldr	r1, [sp, #4]
	bl	REW_applyBWLChanges
	mov	r0, r8
	movs	r2, #1
	mov	ip, r7
	add	r3, sp, #8
	adds	r4, r3, #3
	subs	r0, r0, #1
.L256:
	ldrb	r1, [r0, r2]
	ldrb	r3, [r4, r2]
	subs	r3, r3, r1
	lsls	r3, r3, #24
	lsrs	r1, r3, #24
	cmp	r3, #0
	beq	.L255
	movs	r7, r2
	lsls	r3, r6, #1
	adds	r3, r5, r3
	adds	r7, r7, #71
	strb	r7, [r3]
	strb	r1, [r3, #1]
	adds	r6, r6, #1
.L255:
	adds	r2, r2, #1
	cmp	r2, #17
	bne	.L256
	mov	r7, ip
.L254:
	ldrh	r3, [r7, #2]
	lsls	r6, r6, #1
	adds	r3, r3, r6
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	strh	r3, [r7, #2]
	ldr	r2, [sp, #164]
	ldrh	r2, [r2, #2]
	cmp	r2, #0
	bne	.L257
	adds	r2, r2, #4
.L257:
	adds	r3, r3, r2
	movs	r2, #3
	movs	r1, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r1, r3
	tst	r2, r3
	beq	.L258
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L258:
	ldr	r2, [sp, #164]
	strh	r3, [r2, #2]
	add	sp, sp, #124
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L281:
	movs	r3, #254
	movs	r0, r4
	strb	r3, [r7, #1]
	ldr	r3, .L282+16
	bl	.L5
	mov	r9, r0
	cmp	r0, #0
	ble	.L251
	ldr	r3, .L282+20
	mov	r10, r3
	ldr	r3, .L282+24
	mov	r8, r7
	mov	fp, r3
	movs	r7, r0
.L248:
	movs	r1, r5
	movs	r0, r4
	bl	.L8
	subs	r6, r0, #0
	beq	.L250
	ldr	r3, [r4]
	ldrb	r1, [r3, #4]
	bl	.L284
	adds	r6, r6, r0
	adds	r6, r6, #50
	ldrb	r3, [r6]
	ldr	r2, [sp]
	strb	r3, [r2, r5]
.L250:
	adds	r5, r5, #1
	cmp	r7, r5
	bne	.L248
	mov	r9, r7
	mov	r7, r8
.L251:
	add	r6, sp, #48
	ldr	r2, .L282+28
	ldr	r3, .L282+4
	movs	r1, r6
	movs	r0, r4
	bl	.L5
	movs	r2, #5
	ldr	r3, [r6, #12]
	orrs	r3, r2
	str	r3, [r6, #12]
	mov	r3, r9
	ldr	r5, [sp]
	adds	r3, r3, #4
	lsls	r3, r3, #16
	add	r5, r5, r9
	lsrs	r3, r3, #16
	b	.L249
.L283:
	.align	2
.L282:
	.word	83886098
	.word	CpuSet
	.word	UnitInitFromDefinition
	.word	GetPidStats
	.word	GetUnitSupporterCount
	.word	GetUnitSupporterUnit
	.word	GetUnitSupporterNum
	.word	67108882
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
	ldr	r6, .L297
	ldr	r3, .L297+4
	ldr	r5, .L297+8
	sub	sp, sp, #16
	ldrsb	r0, [r6, r0]
	ldr	r4, [r3]
	bl	.L6
	mov	r9, r0
	movs	r0, #11
	ldr	r3, .L297+12
	ldrsb	r0, [r3, r0]
	mov	r8, r3
	bl	.L6
	movs	r3, #4
	movs	r2, #8
	strh	r3, [r4, #2]
	subs	r3, r3, #2
	strb	r3, [r4, #4]
	mov	r10, r3
	ldr	r3, .L297+16
	ldrh	r3, [r3]
	ands	r2, r3
	movs	r3, #0
	movs	r5, r0
	movs	r0, #19
	ldr	r1, .L297+20
	ldrsb	r3, [r1, r3]
	ldrb	r1, [r1, #2]
	ldrsb	r0, [r6, r0]
	lsls	r1, r1, #24
	mov	ip, r3
	adds	r7, r4, #4
	asrs	r1, r1, #24
	cmp	r0, #0
	bne	.L286
	str	r1, [sp]
	mov	r0, r9
	movs	r1, r6
	str	r7, [sp, #8]
	str	r4, [sp, #4]
	bl	REW_storeCombatDataDead
	ldrh	r3, [r4, #2]
	cmp	r3, #0
	beq	.L288
.L295:
	adds	r7, r4, r3
	cmp	r5, #0
	beq	.L290
.L296:
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
	beq	.L294
	movs	r2, #0
	mov	r1, r8
	movs	r0, r5
	bl	REW_storeCombatData
.L285:
	add	sp, sp, #16
	@ sp needed
	pop	{r5, r6, r7}
	mov	r10, r7
	mov	r9, r6
	mov	r8, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L286:
	mov	r3, r10
	ldr	r0, [r6, #12]
	orrs	r0, r3
	str	r0, [r6, #12]
	mov	r3, ip
	str	r1, [sp]
	mov	r0, r9
	movs	r1, r6
	str	r7, [sp, #8]
	str	r4, [sp, #4]
	bl	REW_storeCombatData
	mov	r2, r10
	ldr	r3, [r6, #12]
	bics	r3, r2
	str	r3, [r6, #12]
	ldrh	r3, [r4, #2]
	cmp	r3, #0
	bne	.L295
.L288:
	movs	r3, #4
	strh	r3, [r4, #2]
	cmp	r5, #0
	bne	.L296
.L290:
	mov	r3, r8
	movs	r1, #17
	movs	r0, #16
	ldrsb	r1, [r3, r1]
	ldrsb	r0, [r3, r0]
	ldr	r3, .L297+24
	bl	.L5
	movs	r3, #65
	strh	r3, [r7]
	mov	r3, r8
	ldr	r2, .L297+28
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
	bne	.L293
	strh	r3, [r4, #2]
	b	.L285
.L294:
	mov	r1, r8
	movs	r0, r5
	bl	REW_storeCombatDataDead
	b	.L285
.L293:
	adds	r2, r2, #12
	subs	r2, r2, r0
	strh	r2, [r4, #2]
	b	.L285
.L298:
	.align	2
.L297:
	.word	gBattleActor
	.word	REW_curSequence
	.word	GetUnit
	.word	gBattleTarget
	.word	gBattleStats
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
	ldr	r2, .L315
	lsls	r1, r3, #6
	movs	r5, r0
	strb	r1, [r2, #15]
	lsls	r3, r3, #27
	bpl	.L300
	ldrh	r3, [r2, #16]
	subs	r3, r3, #1
	strh	r3, [r2, #16]
.L300:
	ldrh	r3, [r5, #2]
	cmp	r3, #4
	bls	.L299
	movs	r3, #2
	movs	r4, #0
	mov	r8, r3
	ldr	r6, .L315+4
	adds	r7, r5, #4
.L303:
	ldrb	r0, [r7, r4]
	bl	.L11
	cmp	r0, #0
	beq	.L302
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L302
	mov	r2, r8
	ldr	r3, [r0, #12]
	orrs	r3, r2
	str	r3, [r0, #12]
.L302:
	ldrh	r3, [r5, #2]
	adds	r4, r4, #1
	subs	r3, r3, #4
	cmp	r3, r4
	bgt	.L303
.L299:
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L316:
	.align	2
.L315:
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
	ldr	r1, .L333
	lsls	r2, r3, #4
	bics	r2, r0
	strb	r2, [r1, #15]
	lsls	r3, r3, #27
	bpl	.L318
	ldrh	r3, [r1, #16]
	adds	r3, r3, #1
	strh	r3, [r1, #16]
.L318:
	ldrh	r3, [r5, #2]
	cmp	r3, #4
	bls	.L317
	movs	r3, #66
	movs	r4, #0
	mov	r8, r3
	ldr	r6, .L333+4
	adds	r7, r5, #4
.L321:
	ldrb	r0, [r7, r4]
	bl	.L11
	cmp	r0, #0
	beq	.L320
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L320
	mov	r2, r8
	ldr	r3, [r0, #12]
	bics	r3, r2
	str	r3, [r0, #12]
.L320:
	ldrh	r3, [r5, #2]
	adds	r4, r4, #1
	subs	r3, r3, #4
	cmp	r3, r4
	bgt	.L321
.L317:
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L334:
	.align	2
.L333:
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
	beq	.L338
	cmp	r0, #128
	bne	.L340
	movs	r0, #64
	movs	r5, #64
.L336:
	ldr	r3, .L341
	bl	.L5
	cmp	r0, #0
	bne	.L337
	movs	r3, #1
	strb	r3, [r4]
.L337:
	@ sp needed
	movs	r0, r5
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L340:
	ldrb	r3, [r1]
	adds	r3, r3, #1
	movs	r0, #0
	movs	r5, #0
	strb	r3, [r1]
	b	.L336
.L338:
	movs	r0, #128
	movs	r5, #128
	b	.L336
.L342:
	.align	2
.L341:
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
	ldr	r6, .L369
	ldrb	r5, [r6, #15]
	cmp	r5, #0
	beq	.L353
	cmp	r5, #128
	bne	.L368
	movs	r0, #64
	movs	r7, #4
	movs	r5, #0
.L344:
	ldr	r3, .L369+4
	bl	.L5
	ldr	r3, .L369+8
	ldr	r2, [r3]
	mov	fp, r3
	ldrh	r3, [r2, #2]
	cmp	r3, #0
	bne	.L346
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L346:
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
	bne	.L347
	movs	r2, #32
	lsls	r3, r7, #24
	lsrs	r3, r3, #24
	orrs	r3, r2
	mov	r2, r8
	strb	r3, [r2, #1]
.L347:
	movs	r3, #0
	mov	r9, r3
	adds	r3, r3, #2
	movs	r5, #1
	mov	r10, r3
	ldr	r7, .L369+12
	b	.L351
.L349:
	ldrb	r4, [r6, #15]
.L351:
	adds	r4, r4, r5
	movs	r0, r4
	bl	.L7
	cmp	r0, #0
	beq	.L348
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L348
	mov	r2, r10
	ldr	r3, [r0, #12]
	tst	r3, r2
	beq	.L348
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
.L348:
	adds	r5, r5, #1
	cmp	r5, #64
	bne	.L349
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
	beq	.L352
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L352:
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
.L368:
	movs	r0, #0
	movs	r7, #0
	movs	r5, #1
	b	.L344
.L353:
	movs	r0, #128
	movs	r7, #8
	b	.L344
.L370:
	.align	2
.L369:
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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, fp
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7, lr}
	ldr	r3, .L401
	ldrh	r2, [r3, #16]
	sub	sp, sp, #36
	cmp	r2, #1
	bne	.LCB2526
	b	.L371	@long jump
.LCB2526:
	ldrb	r3, [r3, #20]
	cmp	r3, #127
	bls	.LCB2529
	b	.L371	@long jump
.LCB2529:
	ldr	r3, .L401+4
	mov	r9, r3
	ldr	r3, .L401+8
	ldr	r2, .L401+12
	str	r3, [sp, #8]
	ldr	r3, .L401+16
	movs	r7, #1
	mov	r10, r3
	str	r2, [sp, #28]
	b	.L389
.L375:
	adds	r7, r7, #1
	cmp	r7, #64
	bne	.LCB2546
	b	.L371	@long jump
.LCB2546:
.L389:
	movs	r0, r7
	bl	.L9
	subs	r4, r0, #0
	beq	.L375
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L375
	ldr	r2, [r0, #12]
	ldr	r3, .L401+20
	tst	r2, r3
	bne	.L375
	ldr	r3, [sp, #8]
	bl	.L5
	cmp	r0, #4
	bgt	.L375
	mov	r3, r10
	ldr	r2, [r3]
	ldrh	r3, [r2, #2]
	cmp	r3, #0
	bne	.L378
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L378:
	adds	r3, r2, r3
	movs	r2, r3
	str	r3, [sp, #12]
	movs	r3, #4
	strh	r3, [r2, #2]
	adds	r3, r2, #4
	str	r3, [sp, #24]
	movs	r0, r4
	ldr	r3, [sp, #28]
	bl	.L5
	cmp	r0, #0
	ble	.L387
	movs	r3, #0
	str	r3, [sp, #20]
	ldr	r3, .L401+20
	str	r7, [sp, #16]
	movs	r5, #0
	mov	r8, r3
	movs	r7, r0
	ldr	r6, .L401+24
.L379:
	movs	r1, r5
	movs	r0, r4
	bl	.L11
	cmp	r0, #0
	beq	.L383
	mov	r3, r8
	ldr	r1, [r0, #12]
	tst	r1, r3
	bne	.L383
	movs	r3, #11
	ldrsb	r3, [r0, r3]
	mov	ip, r3
	movs	r3, #192
	mov	r2, ip
	tst	r3, r2
	bne	.L383
	movs	r3, #16
	movs	r2, #16
	ldrsb	r3, [r4, r3]
	ldrsb	r2, [r0, r2]
	subs	r3, r3, r2
	asrs	r2, r3, #31
	adds	r3, r3, r2
	eors	r3, r2
	movs	r2, #17
	str	r3, [sp, #4]
	ldrsb	r2, [r4, r2]
	mov	fp, r2
	movs	r2, #17
	mov	r3, fp
	ldrsb	r2, [r0, r2]
	subs	r2, r3, r2
	asrs	r3, r2, #31
	adds	r2, r2, r3
	eors	r2, r3
	ldr	r3, [sp, #4]
	adds	r3, r3, r2
	cmp	r3, #0
	beq	.L384
	cmp	r3, #1
	bne	.L383
	ldr	r3, [r4, #12]
	orrs	r1, r3
	lsls	r1, r1, #26
	bpl	.L386
.L383:
	adds	r5, r5, #1
	cmp	r7, r5
	bne	.L379
	ldr	r7, [sp, #16]
.L387:
	ldr	r3, [sp, #12]
	ldrh	r3, [r3, #2]
	cmp	r3, #4
	bls	.L375
	movs	r2, #66
	ldr	r1, [sp, #12]
	strb	r2, [r1]
	mov	r2, r10
	strb	r7, [r1, #1]
	ldr	r2, [r2]
	ldrh	r1, [r2, #2]
	adds	r3, r3, r1
	movs	r1, #3
	movs	r0, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r0, r3
	tst	r1, r3
	beq	.L400
	adds	r3, r3, #4
	subs	r3, r3, r0
.L400:
	adds	r7, r7, #1
	strh	r3, [r2, #2]
	cmp	r7, #64
	beq	.LCB2683
	b	.L389	@long jump
.LCB2683:
.L371:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L384:
	ldrb	r3, [r4, #27]
	cmp	ip, r3
	bne	.L383
.L386:
	ldr	r3, [sp, #8]
	bl	.L5
	cmp	r0, #4
	bgt	.L383
	movs	r3, #50
	mov	fp, r3
	add	fp, fp, r4
	mov	r3, fp
	ldrb	r0, [r3, r5]
	movs	r1, r5
	str	r0, [sp, #4]
	ldr	r3, .L401+28
	movs	r0, r4
	bl	.L5
	mov	r3, fp
	ldr	r0, [sp, #4]
	ldrb	r3, [r3, r5]
	cmp	r0, r3
	beq	.L383
	ldr	r1, [sp, #24]
	mov	ip, r1
	movs	r1, r5
	ldr	r2, [sp, #20]
	lsls	r2, r2, #1
	add	r2, r2, ip
	adds	r1, r1, #50
	subs	r3, r3, r0
	strb	r1, [r2]
	strb	r3, [r2, #1]
	ldr	r1, [sp, #12]
	ldrh	r3, [r1, #2]
	ldr	r2, [sp, #20]
	adds	r3, r3, #2
	strh	r3, [r1, #2]
	adds	r3, r2, #1
	str	r3, [sp, #20]
	b	.L383
.L402:
	.align	2
.L401:
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
	ldr	r3, .L414
	ldr	r4, [r3]
	movs	r3, #0
	push	{r6, r7, lr}
	ldr	r5, .L414+4
	sub	sp, sp, #8
	ldrb	r6, [r5, #15]
	movs	r1, r4
	str	r3, [sp, #4]
	ldr	r2, .L414+8
	ldr	r3, .L414+12
	add	r0, sp, #4
	bl	.L5
	ldrb	r5, [r5, #15]
	adds	r6, r6, #64
	adds	r5, r5, #1
	cmp	r6, r5
	ble	.L404
	lsls	r3, r5, #3
	adds	r4, r4, r3
	ldr	r3, .L414+16
	mov	r9, r3
	movs	r3, #19
	mov	r10, r3
	adds	r3, r3, #29
	mov	r8, r3
	movs	r7, #49
.L406:
	movs	r0, r5
	bl	.L9
	cmp	r0, #0
	beq	.L405
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L405
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
.L405:
	adds	r5, r5, #1
	adds	r4, r4, #8
	cmp	r6, r5
	bgt	.L406
.L404:
	ldr	r3, .L414+20
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
.L415:
	.align	2
.L414:
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, r10
	mov	lr, fp
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7, lr}
	ldr	r3, .L432
	ldr	r2, .L432+4
	ldrb	r3, [r3, #15]
	ldr	r7, [r2]
	adds	r4, r3, #1
	lsls	r2, r4, #3
	adds	r7, r7, #8
	adds	r7, r7, r2
	movs	r2, #64
	mov	fp, r2
	add	fp, fp, r3
	ldr	r3, .L432+8
	sub	sp, sp, #28
	str	r3, [sp, #20]
	ldr	r3, .L432+12
	mov	r10, r3
.L425:
	movs	r0, r4
	ldr	r3, [sp, #20]
	bl	.L5
	cmp	r0, #0
	beq	.L418
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L418
	mov	r3, r10
	ldr	r1, [r3]
	ldrh	r5, [r1, #2]
	subs	r3, r5, #0
	bne	.L421
	movs	r3, #4
	movs	r5, #4
	strh	r3, [r1, #2]
.L421:
	mov	r8, r3
	add	r8, r8, r1
	mov	r3, r8
	movs	r2, #4
	strh	r2, [r3, #2]
	movs	r3, #4
	movs	r6, #0
	add	r3, r3, r8
	mov	r9, r3
	movs	r3, r7
	str	r5, [sp, #16]
	mov	ip, r7
	movs	r5, r6
	str	r1, [sp, #8]
	str	r4, [sp, #12]
	str	r0, [sp, #4]
	subs	r3, r3, #8
.L423:
	ldrb	r0, [r3]
	ldr	r1, [sp, #4]
	ldrb	r6, [r3, #1]
	ldrb	r1, [r1, r0]
	cmp	r1, r6
	beq	.L422
	lsls	r4, r5, #1
	add	r4, r4, r9
	subs	r1, r1, r6
	strb	r1, [r4, #1]
	mov	r1, r8
	adds	r2, r2, #2
	lsls	r2, r2, #16
	lsrs	r2, r2, #16
	strb	r0, [r4]
	strh	r2, [r1, #2]
	adds	r5, r5, #1
.L422:
	adds	r3, r3, #2
	cmp	ip, r3
	bne	.L423
	mov	r7, ip
	ldr	r1, [sp, #8]
	ldr	r4, [sp, #12]
	ldr	r5, [sp, #16]
	cmp	r2, #4
	bls	.L418
	mov	r3, r8
	movs	r0, #66
	strb	r4, [r3, #1]
	strb	r0, [r3]
	movs	r3, #3
	adds	r5, r5, r2
	movs	r2, r3
	lsls	r5, r5, #16
	lsrs	r5, r5, #16
	ands	r2, r5
	tst	r3, r5
	beq	.L431
	adds	r5, r5, #4
	subs	r5, r5, r2
.L431:
	strh	r5, [r1, #2]
.L418:
	adds	r4, r4, #1
	adds	r7, r7, #8
	cmp	r4, fp
	bne	.L425
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
.L433:
	.align	2
.L432:
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
	ldr	r3, .L442
	ldrb	r0, [r0, #1]
	bl	.L5
	cmp	r0, #0
	beq	.L434
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L434
	ldr	r3, .L442+4
	bl	.L5
.L434:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L443:
	.align	2
.L442:
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
	ldr	r3, .L445
	@ sp needed
	adds	r0, r0, #4
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L446:
	.align	2
.L445:
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
	ldr	r6, .L457
	ldr	r5, [r6]
	movs	r4, r0
	ldrh	r3, [r5, #2]
	movs	r0, r1
	cmp	r4, #0
	beq	.L447
	cmp	r3, #0
	beq	.L447
	ldr	r2, [r4]
	cmp	r2, #0
	beq	.L447
	adds	r5, r5, r3
	movs	r3, #67
	strb	r3, [r5]
	ldrb	r3, [r4, #11]
	strb	r3, [r5, #1]
	movs	r3, #24
	movs	r2, #10
	strh	r3, [r5, #2]
	adds	r1, r5, #4
	ldr	r3, .L457+4
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
	beq	.L456
	adds	r3, r3, #4
	subs	r3, r3, r0
.L456:
	strh	r3, [r1, #2]
.L447:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L458:
	.align	2
.L457:
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
	ldr	r6, .L480
	ldr	r4, [r6]
	ldrh	r3, [r4, #2]
	cmp	r3, #0
	beq	.L459
	movs	r5, #3
	ldr	r7, .L480+4
	adds	r4, r4, #4
.L465:
	ldrb	r3, [r4]
	cmp	r3, #67
	beq	.L479
.L462:
	movs	r1, r5
	ldrh	r3, [r4, #2]
	ldr	r2, [r6]
	ands	r1, r3
	tst	r5, r3
	beq	.L464
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L464:
	adds	r4, r4, r3
	ldrh	r3, [r2, #2]
	adds	r2, r2, r3
	cmp	r4, r2
	bcs	.L459
	cmp	r4, #0
	bne	.L465
.L459:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L479:
	ldrb	r0, [r4, #1]
	bl	.L7
	cmp	r0, #0
	beq	.L462
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L462
	movs	r3, #68
	movs	r2, #63
	strb	r3, [r4]
	ldrb	r3, [r0, #17]
	ldrb	r1, [r0, #16]
	ands	r3, r2
	lsls	r3, r3, #6
	ands	r2, r1
	orrs	r3, r2
	ldr	r1, .L480+8
	ldr	r2, [r4, #8]
	ands	r2, r1
	orrs	r3, r2
	str	r3, [r4, #8]
	movs	r3, #0
	str	r3, [r4, #12]
	b	.L462
.L481:
	.align	2
.L480:
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
	ldr	r3, .L483
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L483+4
	lsls	r0, r0, #16
	ldr	r3, .L483+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L484:
	.align	2
.L483:
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
	ldr	r3, .L486
	push	{r4, r5, r6, lr}
	ldr	r5, [r3]
	@ sp needed
	movs	r3, #0
	strh	r3, [r5]
	strh	r3, [r5, #2]
	ldr	r3, .L486+4
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L486+8
	lsls	r0, r0, #16
	ldr	r3, .L486+12
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	movs	r0, r5
	ldr	r3, .L486+16
	adds	r1, r4, r1
	bl	.L5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L487:
	.align	2
.L486:
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
	ldr	r3, .L489
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L489+4
	lsls	r0, r0, #16
	ldr	r3, .L489+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L490:
	.align	2
.L489:
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
	ldr	r3, .L492
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L492+4
	lsls	r0, r0, #16
	ldr	r3, .L492+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	ldr	r3, .L492+12
	adds	r1, r4, r1
	add	r0, sp, #4
	bl	.L5
	add	sp, sp, #8
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L493:
	.align	2
.L492:
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
	ldr	r3, .L496
	movs	r4, r0
	ldrb	r0, [r3, #15]
	ldr	r3, .L496+4
	bl	.L5
	cmp	r0, #0
	ble	.L495
	movs	r2, #2
	ldr	r3, .L496+8
	movs	r0, #3
	strb	r2, [r3, #22]
	ldr	r3, .L496+12
	bl	.L5
.L495:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L496+16
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L497:
	.align	2
.L496:
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
	ldr	r3, .L499
	sub	sp, sp, #8
	add	r4, sp, #4
	movs	r2, r1
	ldr	r3, [r3]
	movs	r1, r4
	bl	.L5
	movs	r2, #0
	ldr	r3, .L499+4
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
.L500:
	.align	2
.L499:
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
	ldr	r1, .L502
	sub	sp, sp, #8
	ldrh	r4, [r1]
	add	r0, sp, #4
	strb	r4, [r0]
	ldrh	r1, [r1, #2]
	strb	r1, [r0, #1]
	movs	r1, r3
	ldr	r3, .L502+4
	bl	.L5
	add	sp, sp, #8
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L503:
	.align	2
.L502:
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
	ldr	r3, .L505
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r1, [r3]
	ldr	r3, .L505+4
	ldr	r3, [r3]
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L506:
	.align	2
.L505:
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
	ldr	r3, .L509
	ldrb	r3, [r3, #22]
	bics	r3, r2
	cmp	r3, #1
	bne	.L507
	ldr	r3, .L509+4
	ldr	r3, [r3]
	movs	r2, r1
	movs	r1, r0
	movs	r0, r3
	ldr	r3, .L509+8
	bl	.L5
.L507:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L510:
	.align	2
.L509:
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
	ldr	r3, .L512
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r1, [r3]
	ldr	r3, .L512+4
	ldr	r3, [r3]
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L513:
	.align	2
.L512:
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
	ldr	r7, .L524
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	movs	r5, r0
	movs	r6, r1
	cmp	r3, #0
	beq	.L514
	movs	r2, #8
	ldr	r3, .L524+4
	ldrb	r3, [r3, #22]
	mov	r9, r2
	bics	r3, r2
	cmp	r3, #1
	beq	.L514
	ldr	r3, .L524+8
	mov	r8, r3
	ldr	r1, [r3]
	ldr	r3, .L524+12
	movs	r2, r6
	ldr	r3, [r3]
	bl	.L5
	mov	r3, r8
	ldr	r4, [r3]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L516
	ldr	r2, [r4, #4]
	ldrh	r2, [r2, #2]
.L517:
	adds	r4, r4, r3
	ldr	r1, [r7]
	strh	r2, [r4]
	ldrh	r2, [r1, #2]
	adds	r0, r4, #4
	strh	r2, [r4, #2]
	ldr	r3, .L524+16
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
	ldr	r6, .L524+20
	bl	.L11
	movs	r3, #0
	ldr	r5, [r7]
	strh	r3, [r5, #2]
	strh	r3, [r5]
	ldr	r3, .L524+24
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L524+28
	lsls	r0, r0, #16
	ldr	r3, .L524+32
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	movs	r0, r5
	adds	r1, r4, r1
	bl	.L11
.L514:
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L516:
	mov	r3, r9
	movs	r2, #0
	str	r3, [r4]
	movs	r3, #8
	b	.L517
.L525:
	.align	2
.L524:
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
	ldr	r3, .L529
	push	{r4, r5, lr}
	ldr	r5, [r3]
	ldr	r3, .L529+4
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L529+8
	lsls	r0, r0, #16
	sub	sp, sp, #12
	ldr	r3, .L529+12
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
.L530:
	.align	2
.L529:
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
	ldr	r3, .L532
	@ sp needed
	bl	.L5
	ldr	r3, .L532+4
	movs	r1, #3
	ldr	r0, .L532+8
	bl	.L5
	movs	r3, #0
	str	r3, [r0, #80]
	str	r3, [r0, #84]
	movs	r0, #23
	pop	{r4}
	pop	{r1}
	bx	r1
.L533:
	.align	2
.L532:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L535
	sub	sp, sp, #12
	movs	r5, r0
	ldrb	r0, [r1, #1]
	movs	r6, r2
	bl	.L5
	ldr	r3, [r0, #4]
	ldrb	r7, [r3, #4]
	ldr	r3, [r0]
	movs	r4, r0
	ldrh	r0, [r3]
	ldr	r3, .L535+4
	bl	.L5
	ldr	r3, .L535+8
	movs	r1, r0
	movs	r0, r6
	bl	.L5
	movs	r0, r4
	ldr	r3, .L535+12
	bl	.L5
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	movs	r1, #0
	ldr	r4, .L535+16
	rsbs	r3, r3, #0
	movs	r0, #0
	bl	.L107
	movs	r3, #128
	movs	r2, #70
	lsls	r3, r3, #3
	str	r0, [r5, #80]
	ldr	r1, [r0, #48]
	strh	r3, [r0, r2]
	ldr	r4, .L535+20
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
	ldr	r3, .L535+24
	bl	.L5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L536:
	.align	2
.L535:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldrb	r3, [r1]
	movs	r5, r0
	movs	r4, r2
	sub	sp, sp, #12
	cmp	r3, #2
	beq	.L542
	cmp	r3, #65
	beq	.L543
.L537:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L543:
	ldrb	r3, [r1, #1]
	lsls	r3, r3, #31
	bmi	.L544
	movs	r0, #27
	ldr	r3, .L545
	bl	.L5
	movs	r1, r0
.L541:
	movs	r0, r4
	ldr	r3, .L545+4
	bl	.L5
	b	.L537
.L542:
	ldrb	r0, [r1, #1]
	ldr	r3, .L545+8
	bl	.L5
	ldr	r3, [r0, #4]
	ldrb	r7, [r3, #4]
	ldr	r3, [r0]
	movs	r6, r0
	ldrh	r0, [r3]
	ldr	r3, .L545+12
	bl	.L5
	ldr	r3, .L545+4
	movs	r1, r0
	movs	r0, r4
	bl	.L5
	movs	r0, r4
	ldr	r3, .L545+16
	bl	.L5
	ldr	r3, .L545+20
	movs	r4, r0
	movs	r0, r6
	bl	.L5
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	movs	r1, #0
	ldr	r6, .L545+24
	rsbs	r3, r3, #0
	movs	r0, #0
	bl	.L11
	movs	r3, #128
	movs	r2, #70
	lsls	r3, r3, #3
	str	r0, [r5, #84]
	ldr	r1, [r0, #48]
	strh	r3, [r0, r2]
	ldr	r5, .L545+28
	ldrh	r2, [r1, #34]
	ands	r2, r5
	orrs	r3, r2
	movs	r2, #76
	strh	r3, [r1, #34]
	ldrh	r3, [r0, r2]
	adds	r4, r4, #43
	lsls	r4, r4, #4
	adds	r3, r3, #128
	adds	r3, r3, r4
	strh	r3, [r0, r2]
	adds	r2, r2, #2
	ldrh	r3, [r0, r2]
	adds	r3, r3, #129
	adds	r3, r3, #255
	strh	r3, [r0, r2]
	movs	r1, #4
	ldr	r3, .L545+32
	bl	.L5
	b	.L537
.L544:
	movs	r0, #51
	ldr	r3, .L545
	bl	.L5
	movs	r1, r0
	b	.L541
.L546:
	.align	2
.L545:
	.word	GetTerrainName
	.word	Text_DrawString
	.word	GetUnit
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
	ldr	r4, .L558
	ldrh	r3, [r1, #2]
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	ands	r6, r3
	tst	r2, r3
	beq	.L548
	adds	r3, r3, #4
	subs	r3, r3, r6
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L548:
	ldrh	r2, [r0, #2]
	adds	r3, r1, r3
	adds	r0, r0, r2
	cmp	r3, r0
	bcs	.L549
	ldrb	r2, [r3]
	cmp	r2, #65
	beq	.L557
.L552:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L558+4
	bl	.L5
	ldr	r3, .L558+8
	movs	r1, r0
	movs	r0, r5
	bl	.L5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L557:
	ldrb	r2, [r3, #6]
	ldrb	r1, [r3, #5]
	ldrb	r0, [r3, #4]
	ldr	r3, .L558+12
	bl	.L5
	cmp	r0, #0
	bne	.L552
	ldr	r4, .L558+16
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	b	.L552
.L549:
	movs	r3, #0
	ldrb	r3, [r3]
	.inst	0xdeff
.L559:
	.align	2
.L558:
	.word	REW_combat
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	GetTypedTrapAt
	.word	REW_obstacleDestroyed
	.size	REW_displayCombatVerb, .-REW_displayCombatVerb
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC205:
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
	bpl	.LCB4075
	b	.L610	@long jump
.LCB4075:
	ldr	r2, .L625
	mov	r9, r2
	ldr	r2, .L625+4
	mov	r8, r2
.L561:
	lsls	r2, r3, #31
	bpl	.L566
	ldr	r2, .L625+8
	ldrb	r2, [r2, #15]
	cmp	r2, #64
	bne	.LCB4091
	b	.L587	@long jump
.LCB4091:
	subs	r2, r2, #128
	rsbs	r1, r2, #0
	adcs	r2, r2, r1
	lsls	r2, r2, #12
.L567:
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
.L566:
	movs	r2, #4
	movs	r4, r2
	ldr	r0, [r7, #92]
	ands	r4, r3
	tst	r2, r3
	bne	.LCB4120
	b	.L568	@long jump
.LCB4120:
	cmp	r0, #0
	bne	.LCB4122
	b	.L617	@long jump
.LCB4122:
.L569:
	movs	r2, #8
	movs	r4, r2
	ldr	r0, [r7, #96]
	ands	r4, r3
	tst	r2, r3
	bne	.LCB4131
	b	.L570	@long jump
.LCB4131:
.L624:
	cmp	r0, #0
	bne	.LCB4134
	b	.L618	@long jump
.LCB4134:
.L571:
	ldr	r3, .L625+12
	bl	.L5
	movs	r3, #0
	str	r3, [r7, #80]
	str	r3, [r7, #84]
	movs	r3, #160
	ldr	r4, .L625+16
	lsls	r3, r3, #3
	ldr	r5, .L625+20
	adds	r6, r4, r3
.L572:
	movs	r0, r4
	movs	r2, #48
	movs	r1, #0
	adds	r4, r4, #64
	bl	.L6
	cmp	r6, r4
	bne	.L572
	movs	r3, #41
	movs	r4, r7
	ldrb	r3, [r7, r3]
	adds	r4, r4, #48
	lsls	r2, r3, #27
	bpl	.L574
	adds	r4, r4, #8
.L574:
	movs	r2, #16
	eors	r3, r2
	movs	r2, #41
	movs	r0, r4
	strb	r3, [r7, r2]
	bl	.L9
	ldr	r3, .L625+24
	movs	r1, #2
	movs	r0, r4
	bl	.L5
	ldr	r2, [r7, #44]
	ldrb	r3, [r2, #4]
	adds	r5, r2, #4
	cmp	r3, #2
	beq	.L584
.L619:
	cmp	r3, #64
	beq	.L585
	movs	r1, #3
	movs	r0, r1
	ldrh	r3, [r5, #2]
	ands	r0, r3
	tst	r1, r3
	beq	.L582
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L582:
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
	bne	.L619
.L584:
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
	bne	.L620
.L576:
	adds	r1, r5, r3
	ldrh	r3, [r2, #2]
	adds	r2, r2, r3
	cmp	r1, r2
	sbcs	r2, r2, r2
	movs	r0, r7
	ands	r1, r2
	movs	r2, r4
	bl	REW_displayTarget
	ldr	r1, .L625+28
	movs	r0, r4
	ldr	r3, .L625+32
	bl	.L5
	movs	r0, r4
	ldr	r1, .L625+36
	bl	.L10
.L578:
	movs	r0, #0
	ldr	r3, .L625+40
	bl	.L5
	add	sp, sp, #12
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L585:
	ldr	r3, .L625+8
	ldrb	r3, [r3, #15]
	cmp	r3, #0
	beq	.L579
	cmp	r3, #128
	bne	.L621
	movs	r0, r4
	movs	r1, #1
	ldr	r3, .L625+44
	bl	.L5
	ldr	r0, .L625+48
.L616:
	lsls	r0, r0, #16
	ldr	r3, .L625+52
	lsrs	r0, r0, #16
	bl	.L5
	ldr	r3, .L625+56
	movs	r1, r0
	movs	r0, r4
	bl	.L5
	movs	r0, r4
	ldr	r1, .L625+60
	bl	.L10
	b	.L578
.L610:
	movs	r4, r0
	ldr	r3, .L625+8
	ldrh	r5, [r3, #16]
	adds	r4, r4, #64
	lsls	r3, r5, #31
	bpl	.L563
	adds	r4, r4, #8
.L563:
	ldr	r3, .L625
	movs	r0, r4
	mov	r9, r3
	bl	.L5
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L625+64
	bl	.L5
	cmp	r5, #9
	ble	.L622
	cmp	r5, #99
	ble	.L623
.L565:
	ldr	r3, .L625+4
	ldr	r1, .L625+68
	movs	r0, r4
	mov	r8, r3
	bl	.L5
	movs	r2, #41
	movs	r1, #2
	ldrb	r3, [r7, r2]
	bics	r3, r1
	strb	r3, [r7, r2]
	b	.L561
.L620:
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	b	.L576
.L568:
	cmp	r0, #0
	bne	.LCB4347
	b	.L569	@long jump
.LCB4347:
	ldr	r3, .L625+72
	bl	.L5
	movs	r2, #8
	movs	r3, #41
	str	r4, [r7, #92]
	movs	r4, r2
	ldrb	r3, [r7, r3]
	ldr	r0, [r7, #96]
	ands	r4, r3
	tst	r2, r3
	beq	.LCB4358
	b	.L624	@long jump
.LCB4358:
.L570:
	cmp	r0, #0
	bne	.LCB4361
	b	.L571	@long jump
.LCB4361:
	ldr	r3, .L625+72
	bl	.L5
	str	r4, [r7, #96]
	b	.L571
.L621:
	movs	r0, r4
	movs	r1, #4
	ldr	r3, .L625+44
	bl	.L5
	ldr	r0, .L625+76
	b	.L616
.L622:
	movs	r0, r4
	movs	r1, #6
	ldr	r3, .L625+44
	bl	.L5
	movs	r1, r5
	movs	r0, r4
	ldr	r3, .L625+80
	bl	.L5
	b	.L565
.L587:
	movs	r2, #128
	lsls	r2, r2, #6
	b	.L567
.L579:
	ldr	r0, .L625+84
	b	.L616
.L618:
	ldr	r4, .L625+88
	str	r0, [sp, #4]
	str	r0, [sp]
	movs	r3, #0
	movs	r0, r4
	movs	r2, #0
	movs	r1, #0
	ldr	r4, .L625+92
	bl	.L107
	str	r0, [r7, #96]
	b	.L571
.L617:
	ldr	r4, .L625+96
	movs	r3, #0
	str	r0, [sp, #4]
	str	r0, [sp]
	movs	r2, #0
	movs	r0, r4
	movs	r1, #0
	ldr	r4, .L625+92
	bl	.L107
	movs	r3, #41
	str	r0, [r7, #92]
	ldrb	r3, [r7, r3]
	b	.L569
.L623:
	ldr	r3, .L625+100
	movs	r1, #10
	movs	r0, r5
	bl	.L5
	ldr	r6, .L625+80
	movs	r1, r0
	movs	r0, r4
	bl	.L11
	movs	r0, r4
	movs	r1, #16
	ldr	r3, .L625+44
	bl	.L5
	movs	r0, r5
	ldr	r3, .L625+104
	movs	r1, #10
	bl	.L5
	movs	r0, r4
	bl	.L11
	b	.L565
.L626:
	.align	2
.L625:
	.word	ClearText
	.word	PutText
	.word	gPlaySt
	.word	EndAllMus
	.word	gBG0TilemapBuffer
	.word	memset
	.word	Text_SetCursor
	.word	.LC205
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
	beq	.L628
.L657:
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L628:
	adds	r3, r4, r3
	cmp	r3, r0
	bcs	.L629
.L658:
	cmp	r3, #0
	beq	.L629
	movs	r4, r3
	movs	r1, r2
	ldrh	r3, [r4, #2]
	ands	r1, r3
	tst	r2, r3
	bne	.L657
	adds	r3, r4, r3
	cmp	r3, r0
	bcc	.L658
.L629:
	ldr	r6, .L661
	b	.L637
.L660:
	cmp	r3, #2
	beq	.L633
	cmp	r3, #64
	bne	.L635
	movs	r0, r4
	bl	REW_undoPhaseChange
.L635:
	movs	r1, r4
	movs	r0, r5
	bl	REW_prevEntry
	subs	r4, r0, #0
	beq	.L659
.L637:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L631
	bls	.L660
	cmp	r3, #66
	beq	.L633
	subs	r3, r3, #67
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, #1
	bhi	.L635
	ldrb	r0, [r4, #1]
	bl	.L11
	cmp	r0, #0
	beq	.L635
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L635
	ldr	r3, .L661+4
	bl	.L5
	movs	r1, r4
	movs	r0, r5
	bl	REW_prevEntry
	subs	r4, r0, #0
	bne	.L637
.L659:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L633:
	movs	r0, r4
	bl	REW_undoCombat
	b	.L635
.L631:
	movs	r0, r4
	bl	REW_undoObstacleCombat
	b	.L635
.L662:
	.align	2
.L661:
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
	ldr	r7, .L682
	adds	r4, r0, #4
.L671:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L664
	bhi	.L665
	cmp	r3, #2
	beq	.L666
	cmp	r3, #64
	bne	.L668
	movs	r0, r4
	bl	REW_redoPhaseChange
.L668:
	movs	r2, r6
	ldrh	r3, [r4, #2]
	ands	r2, r3
	tst	r6, r3
	beq	.L669
	adds	r3, r3, #4
	subs	r3, r3, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L669:
	adds	r4, r4, r3
	ldrh	r3, [r5, #2]
	adds	r3, r5, r3
	cmp	r4, r3
	bcs	.L663
	cmp	r4, #0
	bne	.L671
.L663:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L665:
	cmp	r3, #66
	beq	.L666
	subs	r3, r3, #67
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, #1
	bhi	.L668
	adds	r0, r4, #4
	bl	.L7
	b	.L668
.L666:
	movs	r0, r4
	bl	REW_redoCombat
	b	.L668
.L664:
	movs	r0, r4
	bl	REW_redoObstacleCombat
	b	.L668
.L683:
	.align	2
.L682:
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
	ldr	r3, .L718
	ldr	r3, [r3]
	ldr	r5, .L718+4
	ldrh	r3, [r3, #6]
	movs	r4, r0
	ldrb	r7, [r5, #15]
	ldrh	r6, [r5, #16]
	lsls	r2, r3, #25
	bpl	.L685
	movs	r2, #41
	ldrb	r2, [r0, r2]
	lsls	r2, r2, #29
	bpl	.L685
	movs	r3, #65
	ldrb	r3, [r5, r3]
	lsls	r3, r3, #30
	bpl	.L714
.L686:
	ldr	r0, [r4, #44]
	bl	REW_undo
	movs	r3, #41
	ldrb	r2, [r5, #15]
	ldrb	r3, [r4, r3]
	cmp	r2, r7
	beq	.L687
	movs	r2, #1
	orrs	r3, r2
.L687:
	ldrh	r2, [r5, #16]
	cmp	r2, r6
	beq	.L688
	movs	r2, #2
	orrs	r3, r2
.L688:
	ldr	r2, [r4, #44]
	ldrh	r1, [r2]
	subs	r2, r2, r1
	str	r2, [r4, #44]
	ldrh	r2, [r2]
	cmp	r2, #0
	beq	.L715
.L689:
	movs	r2, #8
.L713:
	orrs	r3, r2
	movs	r2, #41
	movs	r0, r4
	strb	r3, [r4, r2]
	bl	REW_refreshUI
	ldr	r3, .L718+8
	bl	.L5
	ldr	r3, .L718+12
	bl	.L5
.L684:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L685:
	lsls	r3, r3, #24
	bpl	.L684
	movs	r3, #41
	ldrb	r3, [r4, r3]
	lsls	r3, r3, #28
	bpl	.L684
	movs	r3, #65
	ldrb	r3, [r5, r3]
	lsls	r3, r3, #30
	bpl	.L716
.L691:
	ldr	r0, [r4, #44]
	ldrh	r3, [r0, #2]
	adds	r0, r0, r3
	str	r0, [r4, #44]
	bl	REW_redo
	movs	r3, #41
	ldrb	r2, [r5, #15]
	ldrb	r3, [r4, r3]
	cmp	r2, r7
	beq	.L692
	movs	r2, #1
	orrs	r3, r2
.L692:
	ldrh	r2, [r5, #16]
	cmp	r2, r6
	beq	.L693
	movs	r2, #2
	orrs	r3, r2
.L693:
	ldr	r2, .L718+16
	ldr	r2, [r2]
	ldr	r1, [r4, #44]
	ldr	r2, [r2, #4]
	cmp	r1, r2
	bcs	.L717
	movs	r2, #4
	b	.L713
.L715:
	adds	r2, r2, #4
	bics	r3, r2
	b	.L689
.L714:
	movs	r0, #102
	ldr	r3, .L718+20
	bl	.L5
	b	.L686
.L717:
	movs	r2, #8
	bics	r3, r2
	movs	r2, #4
	b	.L713
.L716:
	movs	r0, #102
	ldr	r3, .L718+20
	bl	.L5
	b	.L691
.L719:
	.align	2
.L718:
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
.LC229:
	.ascii	"REW_proc\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	REW_procScr, %object
	.size	REW_procScr, 96
REW_procScr:
	.short	1
	.short	0
	.word	.LC229
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
.L107:
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
.L284:
	bx	fp
