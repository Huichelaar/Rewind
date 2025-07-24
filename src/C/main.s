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
	mov	r5, r8
	mov	r6, r9
	mov	r8, r1
	push	{r5, r6, r7, lr}
	sub	sp, sp, #92
	movs	r4, r3
	add	r3, sp, #128
	ldrb	r3, [r3]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	add	r7, sp, #16
	mov	fp, r3
	ldr	r3, .L205
	movs	r5, r0
	movs	r1, r7
	mov	r9, r2
	mov	r0, r8
	movs	r2, #36
	mov	r10, r3
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
	beq	.L150
	movs	r3, #81
	mov	r1, r8
	ldrb	r3, [r2, r3]
	movs	r2, #72
	adds	r3, r3, #12
	ldrh	r2, [r1, r2]
	lsls	r3, r3, #1
	adds	r3, r7, r3
	strh	r2, [r3, #6]
.L150:
	movs	r3, #111
	mov	r2, r8
	ldrsb	r1, [r2, r3]
	cmp	r1, #0
	blt	.L151
	movs	r0, r7
	ldr	r3, .L205+4
	bl	.L5
.L151:
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
	ldr	r2, .L205+8
	ands	r0, r2
	ands	r2, r3
	eors	r3, r1
	ldr	r1, .L205+12
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
	ldr	r3, .L205+16
	bl	.L5
	mov	r0, r8
	ldr	r3, .L205+20
	bl	.L5
	cmp	r0, #0
	ble	.L152
	movs	r3, #80
	mov	r2, r8
	ldrb	r3, [r2, r3]
	adds	r3, r7, r3
	adds	r3, r3, #40
	strb	r0, [r3]
.L152:
	ldr	r3, .L205+24
	movs	r0, r7
	bl	.L5
	ldr	r3, [sp, #136]
	adds	r6, r3, #4
	ldrb	r3, [r7, #16]
	subs	r3, r3, r4
	lsls	r3, r3, #24
	movs	r4, #0
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L153
	movs	r3, #16
	ldr	r1, [sp, #136]
	strb	r3, [r1, #4]
	strb	r2, [r1, #5]
	adds	r4, r4, #1
.L153:
	mov	r2, fp
	ldrb	r3, [r7, #17]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L154
	movs	r1, #17
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r1, [r3]
	strb	r2, [r3, #1]
	adds	r4, r4, #1
.L154:
	movs	r1, r7
	movs	r2, #0
.L156:
	ldrb	r0, [r5, r2]
	ldrb	r3, [r1]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r0, r3, #24
	cmp	r3, #0
	beq	.L155
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r2, [r3]
	strb	r0, [r3, #1]
	adds	r4, r4, #1
.L155:
	adds	r2, r2, #1
	adds	r1, r1, #1
	cmp	r2, #72
	bne	.L156
	mov	r3, r9
	cmp	r3, #0
	bne	.L201
.L159:
	ldr	r3, [r5]
	ldrb	r0, [r3, #4]
	ldr	r3, .L205+28
	bl	.L5
	subs	r5, r0, #0
	beq	.L160
	movs	r2, #8
	mov	r1, sp
	bl	.L8
	movs	r3, #110
	mov	r2, r8
	ldrsb	r2, [r2, r3]
	mov	r7, sp
	cmp	r2, #0
	beq	.L161
	ldr	r3, [sp, #8]
	lsls	r3, r3, #8
	lsrs	r3, r3, #20
	adds	r3, r3, r2
	movs	r2, #250
	lsls	r2, r2, #4
	cmp	r3, r2
	bgt	.L202
	ldr	r2, [r7, #8]
	ldr	r1, .L205+32
	lsls	r3, r3, #20
	lsrs	r3, r3, #8
	ands	r2, r1
	orrs	r3, r2
	str	r3, [r7, #8]
.L161:
	ldr	r3, .L205+36
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	bne	.L203
.L163:
	mov	r3, sp
	movs	r2, #1
	subs	r0, r3, #1
	subs	r5, r5, #1
.L166:
	ldrb	r1, [r5, r2]
	ldrb	r3, [r0, r2]
	subs	r3, r3, r1
	lsls	r3, r3, #24
	lsrs	r1, r3, #24
	cmp	r3, #0
	beq	.L165
	movs	r7, r2
	lsls	r3, r4, #1
	adds	r3, r6, r3
	adds	r7, r7, #71
	strb	r7, [r3]
	strb	r1, [r3, #1]
	adds	r4, r4, #1
.L165:
	adds	r2, r2, #1
	cmp	r2, #17
	bne	.L166
.L160:
	adds	r4, r4, #2
	ldr	r2, [sp, #136]
	lsls	r3, r4, #17
	lsrs	r3, r3, #16
	strh	r3, [r2, #2]
	ldr	r2, [sp, #132]
	ldrh	r2, [r2, #2]
	cmp	r2, #0
	bne	.L167
	adds	r2, r2, #4
.L167:
	adds	r3, r3, r2
	movs	r2, #3
	movs	r1, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r1, r3
	tst	r2, r3
	beq	.L168
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L168:
	ldr	r2, [sp, #132]
	strh	r3, [r2, #2]
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L203:
	movs	r2, #250
	ldrh	r3, [r7, #12]
	lsls	r3, r3, #18
	lsrs	r3, r3, #20
	adds	r3, r3, #1
	lsls	r2, r2, #4
	cmp	r3, r2
	bgt	.L204
	ldrh	r2, [r7, #12]
	ldr	r1, .L205+40
	lsls	r3, r3, #20
	lsrs	r3, r3, #18
	ands	r2, r1
	orrs	r3, r2
	strh	r3, [r7, #12]
	b	.L163
.L201:
	mov	r3, r8
	ldrh	r0, [r3, r2]
	ldr	r3, .L205+44
	bl	.L5
	mov	r9, r0
	ldr	r3, .L205+48
	ldrb	r0, [r7, #28]
	bl	.L5
	mov	r2, r9
	ldrb	r3, [r0, #6]
	subs	r3, r2, r3
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	bne	.LCB1303
	b	.L159	@long jump
.LCB1303:
	movs	r1, #88
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r1, [r3]
	strb	r2, [r3, #1]
	adds	r4, r4, #1
	b	.L159
.L202:
	movs	r3, r2
	ldr	r1, .L205+32
	ldr	r2, [r7, #8]
	lsls	r3, r3, #20
	lsrs	r3, r3, #8
	ands	r2, r1
	orrs	r3, r2
	str	r3, [r7, #8]
	b	.L161
.L204:
	movs	r3, r2
	ldr	r1, .L205+40
	ldrh	r2, [r7, #12]
	lsls	r3, r3, #20
	lsrs	r3, r3, #18
	ands	r2, r1
	orrs	r3, r2
	strh	r3, [r7, #12]
	b	.L163
.L206:
	.align	2
.L205:
	.word	CpuSet
	.word	SetUnitStatus
	.word	2139062143
	.word	-2139062144
	.word	UnitCheckStatCaps
	.word	GetBattleUnitUpdatedWeaponExp
	.word	UnitRemoveInvalidItems
	.word	GetPidStats
	.word	-16773121
	.word	gBattleTarget
	.word	-16381
	.word	GetItemUses
	.word	GetTrap
	.size	REW_storeCombatData, .-REW_storeCombatData
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
	mov	lr, fp
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	movs	r0, #11
	push	{r5, r6, r7, lr}
	ldr	r7, .L223
	ldr	r3, .L223+4
	ldr	r5, .L223+8
	sub	sp, sp, #20
	ldrsb	r0, [r7, r0]
	ldr	r4, [r3]
	bl	.L6
	mov	r8, r0
	movs	r0, #11
	ldr	r3, .L223+12
	ldrsb	r0, [r3, r0]
	mov	r9, r3
	bl	.L6
	movs	r3, #4
	strh	r3, [r4, #2]
	mov	fp, r3
	subs	r3, r3, #2
	strb	r3, [r4, #4]
	mov	r10, r3
	mov	r3, r8
	ldrb	r3, [r3, #11]
	strb	r3, [r4, #5]
	movs	r3, #19
	ldrsb	r3, [r7, r3]
	adds	r5, r4, #4
	movs	r6, r0
	cmp	r3, #0
	bne	.L219
.L210:
	cmp	r6, #0
	beq	.L211
.L222:
	movs	r3, #2
	strb	r3, [r5]
	ldrb	r3, [r6, #11]
	strb	r3, [r5, #1]
	mov	r3, r9
	ldrb	r3, [r3, #19]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	bne	.L220
.L207:
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
.L219:
	mov	r2, r10
	ldr	r3, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	movs	r3, #0
	ldr	r2, .L223+16
	ldrh	r0, [r2]
	movs	r2, #8
	ldr	r1, .L223+20
	ldrsb	r3, [r1, r3]
	str	r5, [sp, #8]
	str	r4, [sp, #4]
	ldrb	r1, [r1, #2]
	lsls	r1, r1, #24
	asrs	r1, r1, #24
	ands	r2, r0
	str	r1, [sp]
	mov	r0, r8
	movs	r1, r7
	bl	REW_storeCombatData
	mov	r2, r10
	ldr	r3, [r7, #12]
	bics	r3, r2
	str	r3, [r7, #12]
	ldrh	r3, [r4, #2]
	cmp	r3, #0
	bne	.L221
	mov	r3, fp
	strh	r3, [r4, #2]
	cmp	r6, #0
	bne	.L222
.L211:
	mov	r3, r9
	movs	r1, #17
	movs	r0, #16
	ldrsb	r1, [r3, r1]
	ldrsb	r0, [r3, r0]
	ldr	r3, .L223+24
	bl	.L5
	movs	r3, #65
	strh	r3, [r5]
	mov	r3, r9
	ldr	r2, .L223+28
	ldr	r1, [r2]
	mov	r2, r9
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
	strb	r3, [r5, #1]
	ldrb	r3, [r0]
	strb	r3, [r5, #4]
	ldrb	r3, [r0, #1]
	strb	r3, [r5, #5]
	ldrb	r3, [r0, #2]
	strb	r3, [r5, #6]
	mov	r3, r9
	ldrb	r2, [r0, #3]
	ldrb	r3, [r3, #19]
	subs	r3, r3, r2
	strb	r3, [r5, #7]
	movs	r3, #8
	movs	r1, #3
	strh	r3, [r5, #2]
	ldrh	r2, [r4, #2]
	movs	r3, r2
	movs	r0, r1
	adds	r3, r3, #8
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r0, r3
	tst	r1, r3
	bne	.L214
	strh	r3, [r4, #2]
	b	.L207
.L220:
	movs	r3, #16
	movs	r2, #17
	ldrsb	r3, [r6, r3]
	str	r5, [sp, #8]
	str	r4, [sp, #4]
	ldrsb	r2, [r6, r2]
	mov	r1, r9
	str	r2, [sp]
	movs	r0, r6
	movs	r2, #0
	bl	REW_storeCombatData
	b	.L207
.L214:
	adds	r2, r2, #12
	subs	r2, r2, r0
	strh	r2, [r4, #2]
	b	.L207
.L221:
	adds	r5, r3, r4
	b	.L210
.L224:
	.align	2
.L223:
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
	ldr	r2, .L241
	lsls	r1, r3, #6
	movs	r5, r0
	strb	r1, [r2, #15]
	lsls	r3, r3, #27
	bpl	.L226
	ldrh	r3, [r2, #16]
	subs	r3, r3, #1
	strh	r3, [r2, #16]
.L226:
	ldrh	r3, [r5, #2]
	cmp	r3, #4
	bls	.L225
	movs	r3, #2
	movs	r4, #0
	mov	r8, r3
	ldr	r6, .L241+4
	adds	r7, r5, #4
.L229:
	ldrb	r0, [r7, r4]
	bl	.L11
	cmp	r0, #0
	beq	.L228
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L228
	mov	r2, r8
	ldr	r3, [r0, #12]
	orrs	r3, r2
	str	r3, [r0, #12]
.L228:
	ldrh	r3, [r5, #2]
	adds	r4, r4, #1
	subs	r3, r3, #4
	cmp	r3, r4
	bgt	.L229
.L225:
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L242:
	.align	2
.L241:
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
	ldr	r1, .L259
	lsls	r2, r3, #4
	bics	r2, r0
	strb	r2, [r1, #15]
	lsls	r3, r3, #27
	bpl	.L244
	ldrh	r3, [r1, #16]
	adds	r3, r3, #1
	strh	r3, [r1, #16]
.L244:
	ldrh	r3, [r5, #2]
	cmp	r3, #4
	bls	.L243
	movs	r3, #66
	movs	r4, #0
	mov	r8, r3
	ldr	r6, .L259+4
	adds	r7, r5, #4
.L247:
	ldrb	r0, [r7, r4]
	bl	.L11
	cmp	r0, #0
	beq	.L246
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L246
	mov	r2, r8
	ldr	r3, [r0, #12]
	bics	r3, r2
	str	r3, [r0, #12]
.L246:
	ldrh	r3, [r5, #2]
	adds	r4, r4, #1
	subs	r3, r3, #4
	cmp	r3, r4
	bgt	.L247
.L243:
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L260:
	.align	2
.L259:
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
	beq	.L264
	cmp	r0, #128
	bne	.L266
	movs	r0, #64
	movs	r5, #64
.L262:
	ldr	r3, .L267
	bl	.L5
	cmp	r0, #0
	bne	.L263
	movs	r3, #1
	strb	r3, [r4]
.L263:
	@ sp needed
	movs	r0, r5
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L266:
	ldrb	r3, [r1]
	adds	r3, r3, #1
	movs	r0, #0
	movs	r5, #0
	strb	r3, [r1]
	b	.L262
.L264:
	movs	r0, #128
	movs	r5, #128
	b	.L262
.L268:
	.align	2
.L267:
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
	ldr	r6, .L295
	ldrb	r5, [r6, #15]
	cmp	r5, #0
	beq	.L279
	cmp	r5, #128
	bne	.L294
	movs	r0, #64
	movs	r7, #4
	movs	r5, #0
.L270:
	ldr	r3, .L295+4
	bl	.L5
	ldr	r3, .L295+8
	ldr	r2, [r3]
	mov	fp, r3
	ldrh	r3, [r2, #2]
	cmp	r3, #0
	bne	.L272
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L272:
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
	bne	.L273
	movs	r2, #32
	lsls	r3, r7, #24
	lsrs	r3, r3, #24
	orrs	r3, r2
	mov	r2, r8
	strb	r3, [r2, #1]
.L273:
	movs	r3, #0
	mov	r9, r3
	adds	r3, r3, #2
	movs	r5, #1
	mov	r10, r3
	ldr	r7, .L295+12
	b	.L277
.L275:
	ldrb	r4, [r6, #15]
.L277:
	adds	r4, r4, r5
	movs	r0, r4
	bl	.L7
	cmp	r0, #0
	beq	.L274
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L274
	mov	r2, r10
	ldr	r3, [r0, #12]
	tst	r3, r2
	beq	.L274
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
.L274:
	adds	r5, r5, #1
	cmp	r5, #64
	bne	.L275
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
	beq	.L278
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L278:
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
.L294:
	movs	r0, #0
	movs	r7, #0
	movs	r5, #1
	b	.L270
.L279:
	movs	r0, #128
	movs	r7, #8
	b	.L270
.L296:
	.align	2
.L295:
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
	ldr	r3, .L327
	ldrh	r2, [r3, #16]
	sub	sp, sp, #36
	cmp	r2, #1
	bne	.LCB1921
	b	.L297	@long jump
.LCB1921:
	ldrb	r3, [r3, #20]
	cmp	r3, #127
	bls	.LCB1924
	b	.L297	@long jump
.LCB1924:
	ldr	r3, .L327+4
	mov	r9, r3
	ldr	r3, .L327+8
	ldr	r2, .L327+12
	str	r3, [sp, #8]
	ldr	r3, .L327+16
	movs	r7, #1
	mov	r10, r3
	str	r2, [sp, #28]
	b	.L315
.L301:
	adds	r7, r7, #1
	cmp	r7, #64
	bne	.LCB1941
	b	.L297	@long jump
.LCB1941:
.L315:
	movs	r0, r7
	bl	.L9
	subs	r4, r0, #0
	beq	.L301
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L301
	ldr	r2, [r0, #12]
	ldr	r3, .L327+20
	tst	r2, r3
	bne	.L301
	ldr	r3, [sp, #8]
	bl	.L5
	cmp	r0, #4
	bgt	.L301
	mov	r3, r10
	ldr	r2, [r3]
	ldrh	r3, [r2, #2]
	cmp	r3, #0
	bne	.L304
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L304:
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
	ble	.L313
	movs	r3, #0
	str	r3, [sp, #20]
	ldr	r3, .L327+20
	str	r7, [sp, #16]
	movs	r5, #0
	mov	r8, r3
	movs	r7, r0
	ldr	r6, .L327+24
.L305:
	movs	r1, r5
	movs	r0, r4
	bl	.L11
	cmp	r0, #0
	beq	.L309
	mov	r3, r8
	ldr	r1, [r0, #12]
	tst	r1, r3
	bne	.L309
	movs	r3, #11
	ldrsb	r3, [r0, r3]
	mov	ip, r3
	movs	r3, #192
	mov	r2, ip
	tst	r3, r2
	bne	.L309
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
	beq	.L310
	cmp	r3, #1
	bne	.L309
	ldr	r3, [r4, #12]
	orrs	r1, r3
	lsls	r1, r1, #26
	bpl	.L312
.L309:
	adds	r5, r5, #1
	cmp	r7, r5
	bne	.L305
	ldr	r7, [sp, #16]
.L313:
	ldr	r3, [sp, #12]
	ldrh	r3, [r3, #2]
	cmp	r3, #4
	bls	.L301
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
	beq	.L326
	adds	r3, r3, #4
	subs	r3, r3, r0
.L326:
	adds	r7, r7, #1
	strh	r3, [r2, #2]
	cmp	r7, #64
	beq	.LCB2078
	b	.L315	@long jump
.LCB2078:
.L297:
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
.L310:
	ldrb	r3, [r4, #27]
	cmp	ip, r3
	bne	.L309
.L312:
	ldr	r3, [sp, #8]
	bl	.L5
	cmp	r0, #4
	bgt	.L309
	movs	r3, #50
	mov	fp, r3
	add	fp, fp, r4
	mov	r3, fp
	ldrb	r0, [r3, r5]
	movs	r1, r5
	str	r0, [sp, #4]
	ldr	r3, .L327+28
	movs	r0, r4
	bl	.L5
	mov	r3, fp
	ldr	r0, [sp, #4]
	ldrb	r3, [r3, r5]
	cmp	r0, r3
	beq	.L309
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
	b	.L309
.L328:
	.align	2
.L327:
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
	ldr	r3, .L340
	ldr	r4, [r3]
	movs	r3, #0
	push	{r6, r7, lr}
	ldr	r5, .L340+4
	sub	sp, sp, #8
	ldrb	r6, [r5, #15]
	movs	r1, r4
	str	r3, [sp, #4]
	ldr	r2, .L340+8
	ldr	r3, .L340+12
	add	r0, sp, #4
	bl	.L5
	ldrb	r5, [r5, #15]
	adds	r6, r6, #64
	adds	r5, r5, #1
	cmp	r6, r5
	ble	.L330
	lsls	r3, r5, #3
	adds	r4, r4, r3
	ldr	r3, .L340+16
	mov	r9, r3
	movs	r3, #19
	mov	r10, r3
	adds	r3, r3, #29
	mov	r8, r3
	movs	r7, #49
.L332:
	movs	r0, r5
	bl	.L9
	cmp	r0, #0
	beq	.L331
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L331
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
.L331:
	adds	r5, r5, #1
	adds	r4, r4, #8
	cmp	r6, r5
	bgt	.L332
.L330:
	ldr	r3, .L340+20
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
.L341:
	.align	2
.L340:
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
	ldr	r3, .L358
	ldr	r2, .L358+4
	ldrb	r3, [r3, #15]
	ldr	r7, [r2]
	adds	r4, r3, #1
	lsls	r2, r4, #3
	adds	r7, r7, #8
	adds	r7, r7, r2
	movs	r2, #64
	mov	fp, r2
	add	fp, fp, r3
	ldr	r3, .L358+8
	sub	sp, sp, #28
	str	r3, [sp, #20]
	ldr	r3, .L358+12
	mov	r10, r3
.L351:
	movs	r0, r4
	ldr	r3, [sp, #20]
	bl	.L5
	cmp	r0, #0
	beq	.L344
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L344
	mov	r3, r10
	ldr	r1, [r3]
	ldrh	r5, [r1, #2]
	subs	r3, r5, #0
	bne	.L347
	movs	r3, #4
	movs	r5, #4
	strh	r3, [r1, #2]
.L347:
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
.L349:
	ldrb	r0, [r3]
	ldr	r1, [sp, #4]
	ldrb	r6, [r3, #1]
	ldrb	r1, [r1, r0]
	cmp	r1, r6
	beq	.L348
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
.L348:
	adds	r3, r3, #2
	cmp	ip, r3
	bne	.L349
	mov	r7, ip
	ldr	r1, [sp, #8]
	ldr	r4, [sp, #12]
	ldr	r5, [sp, #16]
	cmp	r2, #4
	bls	.L344
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
	beq	.L357
	adds	r5, r5, #4
	subs	r5, r5, r2
.L357:
	strh	r5, [r1, #2]
.L344:
	adds	r4, r4, #1
	adds	r7, r7, #8
	cmp	r4, fp
	bne	.L351
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
.L359:
	.align	2
.L358:
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
	ldr	r3, .L368
	ldrb	r0, [r0, #1]
	bl	.L5
	cmp	r0, #0
	beq	.L360
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L360
	ldr	r3, .L368+4
	bl	.L5
.L360:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L369:
	.align	2
.L368:
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
	ldr	r3, .L371
	@ sp needed
	adds	r0, r0, #4
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L372:
	.align	2
.L371:
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
	ldr	r6, .L383
	ldr	r5, [r6]
	movs	r4, r0
	ldrh	r3, [r5, #2]
	movs	r0, r1
	cmp	r4, #0
	beq	.L373
	cmp	r3, #0
	beq	.L373
	ldr	r2, [r4]
	cmp	r2, #0
	beq	.L373
	adds	r5, r5, r3
	movs	r3, #67
	strb	r3, [r5]
	ldrb	r3, [r4, #11]
	strb	r3, [r5, #1]
	movs	r3, #24
	movs	r2, #10
	strh	r3, [r5, #2]
	adds	r1, r5, #4
	ldr	r3, .L383+4
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
	beq	.L382
	adds	r3, r3, #4
	subs	r3, r3, r0
.L382:
	strh	r3, [r1, #2]
.L373:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L384:
	.align	2
.L383:
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
	ldr	r6, .L406
	ldr	r4, [r6]
	ldrh	r3, [r4, #2]
	cmp	r3, #0
	beq	.L385
	movs	r5, #3
	ldr	r7, .L406+4
	adds	r4, r4, #4
.L391:
	ldrb	r3, [r4]
	cmp	r3, #67
	beq	.L405
.L388:
	movs	r1, r5
	ldrh	r3, [r4, #2]
	ldr	r2, [r6]
	ands	r1, r3
	tst	r5, r3
	beq	.L390
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L390:
	adds	r4, r4, r3
	ldrh	r3, [r2, #2]
	adds	r2, r2, r3
	cmp	r4, r2
	bcs	.L385
	cmp	r4, #0
	bne	.L391
.L385:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L405:
	ldrb	r0, [r4, #1]
	bl	.L7
	cmp	r0, #0
	beq	.L388
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L388
	movs	r3, #68
	movs	r2, #63
	strb	r3, [r4]
	ldrb	r3, [r0, #17]
	ldrb	r1, [r0, #16]
	ands	r3, r2
	lsls	r3, r3, #6
	ands	r2, r1
	orrs	r3, r2
	ldr	r1, .L406+8
	ldr	r2, [r4, #8]
	ands	r2, r1
	orrs	r3, r2
	str	r3, [r4, #8]
	movs	r3, #0
	str	r3, [r4, #12]
	b	.L388
.L407:
	.align	2
.L406:
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
	ldr	r3, .L409
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L409+4
	lsls	r0, r0, #16
	ldr	r3, .L409+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L410:
	.align	2
.L409:
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
	ldr	r3, .L412
	push	{r4, r5, r6, lr}
	ldr	r5, [r3]
	@ sp needed
	movs	r3, #0
	strh	r3, [r5]
	strh	r3, [r5, #2]
	ldr	r3, .L412+4
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L412+8
	lsls	r0, r0, #16
	ldr	r3, .L412+12
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	movs	r0, r5
	ldr	r3, .L412+16
	adds	r1, r4, r1
	bl	.L5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L413:
	.align	2
.L412:
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
	ldr	r3, .L415
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L415+4
	lsls	r0, r0, #16
	ldr	r3, .L415+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L416:
	.align	2
.L415:
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
	ldr	r3, .L418
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L418+4
	lsls	r0, r0, #16
	ldr	r3, .L418+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	ldr	r3, .L418+12
	adds	r1, r4, r1
	add	r0, sp, #4
	bl	.L5
	add	sp, sp, #8
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L419:
	.align	2
.L418:
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
	ldr	r3, .L422
	movs	r4, r0
	ldrb	r0, [r3, #15]
	ldr	r3, .L422+4
	bl	.L5
	cmp	r0, #0
	ble	.L421
	movs	r2, #2
	ldr	r3, .L422+8
	movs	r0, #3
	strb	r2, [r3, #22]
	ldr	r3, .L422+12
	bl	.L5
.L421:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L422+16
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L423:
	.align	2
.L422:
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
	ldr	r3, .L425
	sub	sp, sp, #8
	add	r4, sp, #4
	movs	r2, r1
	ldr	r3, [r3]
	movs	r1, r4
	bl	.L5
	movs	r2, #0
	ldr	r3, .L425+4
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
.L426:
	.align	2
.L425:
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
	ldr	r1, .L428
	sub	sp, sp, #8
	ldrh	r4, [r1]
	add	r0, sp, #4
	strb	r4, [r0]
	ldrh	r1, [r1, #2]
	strb	r1, [r0, #1]
	movs	r1, r3
	ldr	r3, .L428+4
	bl	.L5
	add	sp, sp, #8
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L429:
	.align	2
.L428:
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
	ldr	r3, .L431
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r1, [r3]
	ldr	r3, .L431+4
	ldr	r3, [r3]
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L432:
	.align	2
.L431:
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
	ldr	r3, .L435
	ldrb	r3, [r3, #22]
	bics	r3, r2
	cmp	r3, #1
	bne	.L433
	ldr	r3, .L435+4
	ldr	r3, [r3]
	movs	r2, r1
	movs	r1, r0
	movs	r0, r3
	ldr	r3, .L435+8
	bl	.L5
.L433:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L436:
	.align	2
.L435:
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
	ldr	r3, .L438
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r1, [r3]
	ldr	r3, .L438+4
	ldr	r3, [r3]
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L439:
	.align	2
.L438:
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
	ldr	r7, .L450
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	movs	r5, r0
	movs	r6, r1
	cmp	r3, #0
	beq	.L440
	movs	r2, #8
	ldr	r3, .L450+4
	ldrb	r3, [r3, #22]
	mov	r9, r2
	bics	r3, r2
	cmp	r3, #1
	beq	.L440
	ldr	r3, .L450+8
	mov	r8, r3
	ldr	r1, [r3]
	ldr	r3, .L450+12
	movs	r2, r6
	ldr	r3, [r3]
	bl	.L5
	mov	r3, r8
	ldr	r4, [r3]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L442
	ldr	r2, [r4, #4]
	ldrh	r2, [r2, #2]
.L443:
	adds	r4, r4, r3
	ldr	r1, [r7]
	strh	r2, [r4]
	ldrh	r2, [r1, #2]
	adds	r0, r4, #4
	strh	r2, [r4, #2]
	ldr	r3, .L450+16
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
	ldr	r6, .L450+20
	bl	.L11
	movs	r3, #0
	ldr	r5, [r7]
	strh	r3, [r5, #2]
	strh	r3, [r5]
	ldr	r3, .L450+24
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L450+28
	lsls	r0, r0, #16
	ldr	r3, .L450+32
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	movs	r0, r5
	adds	r1, r4, r1
	bl	.L11
.L440:
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L442:
	mov	r3, r9
	movs	r2, #0
	str	r3, [r4]
	movs	r3, #8
	b	.L443
.L451:
	.align	2
.L450:
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
	ldr	r3, .L455
	push	{r4, r5, lr}
	ldr	r5, [r3]
	ldr	r3, .L455+4
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L455+8
	lsls	r0, r0, #16
	sub	sp, sp, #12
	ldr	r3, .L455+12
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
.L456:
	.align	2
.L455:
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
	ldr	r3, .L458
	@ sp needed
	bl	.L5
	ldr	r3, .L458+4
	movs	r1, #3
	ldr	r0, .L458+8
	bl	.L5
	movs	r3, #0
	str	r3, [r0, #80]
	str	r3, [r0, #84]
	movs	r0, #23
	pop	{r4}
	pop	{r1}
	bx	r1
.L459:
	.align	2
.L458:
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
	ldr	r3, .L461
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
	ldr	r3, .L461+4
	bl	.L5
	ldr	r3, .L461+8
	movs	r1, r0
	movs	r0, r6
	bl	.L5
	movs	r0, r4
	ldr	r3, .L461+12
	bl	.L5
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	movs	r1, #0
	ldr	r4, .L461+16
	rsbs	r3, r3, #0
	movs	r0, #0
	bl	.L107
	movs	r3, #128
	movs	r2, #70
	lsls	r3, r3, #3
	str	r0, [r5, #80]
	ldr	r1, [r0, #48]
	strh	r3, [r0, r2]
	ldr	r4, .L461+20
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
	ldr	r3, .L461+24
	bl	.L5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L462:
	.align	2
.L461:
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
	beq	.L468
	cmp	r3, #65
	beq	.L469
.L463:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L469:
	ldrb	r3, [r1, #1]
	lsls	r3, r3, #31
	bmi	.L470
	movs	r0, #27
	ldr	r3, .L471
	bl	.L5
	movs	r1, r0
.L467:
	movs	r0, r4
	ldr	r3, .L471+4
	bl	.L5
	b	.L463
.L468:
	ldrb	r0, [r1, #1]
	ldr	r3, .L471+8
	bl	.L5
	ldr	r3, [r0, #4]
	ldrb	r7, [r3, #4]
	ldr	r3, [r0]
	movs	r6, r0
	ldrh	r0, [r3]
	ldr	r3, .L471+12
	bl	.L5
	ldr	r3, .L471+4
	movs	r1, r0
	movs	r0, r4
	bl	.L5
	movs	r0, r4
	ldr	r3, .L471+16
	bl	.L5
	ldr	r3, .L471+20
	movs	r4, r0
	movs	r0, r6
	bl	.L5
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	movs	r1, #0
	ldr	r6, .L471+24
	rsbs	r3, r3, #0
	movs	r0, #0
	bl	.L11
	movs	r3, #128
	movs	r2, #70
	lsls	r3, r3, #3
	str	r0, [r5, #84]
	ldr	r1, [r0, #48]
	strh	r3, [r0, r2]
	ldr	r5, .L471+28
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
	ldr	r3, .L471+32
	bl	.L5
	b	.L463
.L470:
	movs	r0, #51
	ldr	r3, .L471
	bl	.L5
	movs	r1, r0
	b	.L467
.L472:
	.align	2
.L471:
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
	ldr	r4, .L484
	ldrh	r3, [r1, #2]
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	ands	r6, r3
	tst	r2, r3
	beq	.L474
	adds	r3, r3, #4
	subs	r3, r3, r6
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L474:
	ldrh	r2, [r0, #2]
	adds	r3, r1, r3
	adds	r0, r0, r2
	cmp	r3, r0
	bcs	.L475
	ldrb	r2, [r3]
	cmp	r2, #65
	beq	.L483
.L478:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L484+4
	bl	.L5
	ldr	r3, .L484+8
	movs	r1, r0
	movs	r0, r5
	bl	.L5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L483:
	ldrb	r2, [r3, #6]
	ldrb	r1, [r3, #5]
	ldrb	r0, [r3, #4]
	ldr	r3, .L484+12
	bl	.L5
	cmp	r0, #0
	bne	.L478
	ldr	r4, .L484+16
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	b	.L478
.L475:
	movs	r3, #0
	ldrb	r3, [r3]
	.inst	0xdeff
.L485:
	.align	2
.L484:
	.word	REW_combat
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	GetTypedTrapAt
	.word	REW_obstacleDestroyed
	.size	REW_displayCombatVerb, .-REW_displayCombatVerb
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC193:
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
	bpl	.LCB3470
	b	.L536	@long jump
.LCB3470:
	ldr	r2, .L551
	mov	r9, r2
	ldr	r2, .L551+4
	mov	r8, r2
.L487:
	lsls	r2, r3, #31
	bpl	.L492
	ldr	r2, .L551+8
	ldrb	r2, [r2, #15]
	cmp	r2, #64
	bne	.LCB3486
	b	.L513	@long jump
.LCB3486:
	subs	r2, r2, #128
	rsbs	r1, r2, #0
	adcs	r2, r2, r1
	lsls	r2, r2, #12
.L493:
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
.L492:
	movs	r2, #4
	movs	r4, r2
	ldr	r0, [r7, #92]
	ands	r4, r3
	tst	r2, r3
	bne	.LCB3515
	b	.L494	@long jump
.LCB3515:
	cmp	r0, #0
	bne	.LCB3517
	b	.L543	@long jump
.LCB3517:
.L495:
	movs	r2, #8
	movs	r4, r2
	ldr	r0, [r7, #96]
	ands	r4, r3
	tst	r2, r3
	bne	.LCB3526
	b	.L496	@long jump
.LCB3526:
.L550:
	cmp	r0, #0
	bne	.LCB3529
	b	.L544	@long jump
.LCB3529:
.L497:
	ldr	r3, .L551+12
	bl	.L5
	movs	r3, #0
	str	r3, [r7, #80]
	str	r3, [r7, #84]
	movs	r3, #160
	ldr	r4, .L551+16
	lsls	r3, r3, #3
	ldr	r5, .L551+20
	adds	r6, r4, r3
.L498:
	movs	r0, r4
	movs	r2, #48
	movs	r1, #0
	adds	r4, r4, #64
	bl	.L6
	cmp	r6, r4
	bne	.L498
	movs	r3, #41
	movs	r4, r7
	ldrb	r3, [r7, r3]
	adds	r4, r4, #48
	lsls	r2, r3, #27
	bpl	.L500
	adds	r4, r4, #8
.L500:
	movs	r2, #16
	eors	r3, r2
	movs	r2, #41
	movs	r0, r4
	strb	r3, [r7, r2]
	bl	.L9
	ldr	r3, .L551+24
	movs	r1, #2
	movs	r0, r4
	bl	.L5
	ldr	r2, [r7, #44]
	ldrb	r3, [r2, #4]
	adds	r5, r2, #4
	cmp	r3, #2
	beq	.L510
.L545:
	cmp	r3, #64
	beq	.L511
	movs	r1, #3
	movs	r0, r1
	ldrh	r3, [r5, #2]
	ands	r0, r3
	tst	r1, r3
	beq	.L508
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L508:
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
	bne	.L545
.L510:
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
	bne	.L546
.L502:
	adds	r1, r5, r3
	ldrh	r3, [r2, #2]
	adds	r2, r2, r3
	cmp	r1, r2
	sbcs	r2, r2, r2
	movs	r0, r7
	ands	r1, r2
	movs	r2, r4
	bl	REW_displayTarget
	ldr	r1, .L551+28
	movs	r0, r4
	ldr	r3, .L551+32
	bl	.L5
	movs	r0, r4
	ldr	r1, .L551+36
	bl	.L10
.L504:
	movs	r0, #0
	ldr	r3, .L551+40
	bl	.L5
	add	sp, sp, #12
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L511:
	ldr	r3, .L551+8
	ldrb	r3, [r3, #15]
	cmp	r3, #0
	beq	.L505
	cmp	r3, #128
	bne	.L547
	movs	r0, r4
	movs	r1, #1
	ldr	r3, .L551+44
	bl	.L5
	ldr	r0, .L551+48
.L542:
	lsls	r0, r0, #16
	ldr	r3, .L551+52
	lsrs	r0, r0, #16
	bl	.L5
	ldr	r3, .L551+56
	movs	r1, r0
	movs	r0, r4
	bl	.L5
	movs	r0, r4
	ldr	r1, .L551+60
	bl	.L10
	b	.L504
.L536:
	movs	r4, r0
	ldr	r3, .L551+8
	ldrh	r5, [r3, #16]
	adds	r4, r4, #64
	lsls	r3, r5, #31
	bpl	.L489
	adds	r4, r4, #8
.L489:
	ldr	r3, .L551
	movs	r0, r4
	mov	r9, r3
	bl	.L5
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L551+64
	bl	.L5
	cmp	r5, #9
	ble	.L548
	cmp	r5, #99
	ble	.L549
.L491:
	ldr	r3, .L551+4
	ldr	r1, .L551+68
	movs	r0, r4
	mov	r8, r3
	bl	.L5
	movs	r2, #41
	movs	r1, #2
	ldrb	r3, [r7, r2]
	bics	r3, r1
	strb	r3, [r7, r2]
	b	.L487
.L546:
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	b	.L502
.L494:
	cmp	r0, #0
	bne	.LCB3742
	b	.L495	@long jump
.LCB3742:
	ldr	r3, .L551+72
	bl	.L5
	movs	r2, #8
	movs	r3, #41
	str	r4, [r7, #92]
	movs	r4, r2
	ldrb	r3, [r7, r3]
	ldr	r0, [r7, #96]
	ands	r4, r3
	tst	r2, r3
	beq	.LCB3753
	b	.L550	@long jump
.LCB3753:
.L496:
	cmp	r0, #0
	bne	.LCB3756
	b	.L497	@long jump
.LCB3756:
	ldr	r3, .L551+72
	bl	.L5
	str	r4, [r7, #96]
	b	.L497
.L547:
	movs	r0, r4
	movs	r1, #4
	ldr	r3, .L551+44
	bl	.L5
	ldr	r0, .L551+76
	b	.L542
.L548:
	movs	r0, r4
	movs	r1, #6
	ldr	r3, .L551+44
	bl	.L5
	movs	r1, r5
	movs	r0, r4
	ldr	r3, .L551+80
	bl	.L5
	b	.L491
.L513:
	movs	r2, #128
	lsls	r2, r2, #6
	b	.L493
.L505:
	ldr	r0, .L551+84
	b	.L542
.L544:
	ldr	r4, .L551+88
	str	r0, [sp, #4]
	str	r0, [sp]
	movs	r3, #0
	movs	r0, r4
	movs	r2, #0
	movs	r1, #0
	ldr	r4, .L551+92
	bl	.L107
	str	r0, [r7, #96]
	b	.L497
.L543:
	ldr	r4, .L551+96
	movs	r3, #0
	str	r0, [sp, #4]
	str	r0, [sp]
	movs	r2, #0
	movs	r0, r4
	movs	r1, #0
	ldr	r4, .L551+92
	bl	.L107
	movs	r3, #41
	str	r0, [r7, #92]
	ldrb	r3, [r7, r3]
	b	.L495
.L549:
	ldr	r3, .L551+100
	movs	r1, #10
	movs	r0, r5
	bl	.L5
	ldr	r6, .L551+80
	movs	r1, r0
	movs	r0, r4
	bl	.L11
	movs	r0, r4
	movs	r1, #16
	ldr	r3, .L551+44
	bl	.L5
	movs	r0, r5
	ldr	r3, .L551+104
	movs	r1, #10
	bl	.L5
	movs	r0, r4
	bl	.L11
	b	.L491
.L552:
	.align	2
.L551:
	.word	ClearText
	.word	PutText
	.word	gPlaySt
	.word	EndAllMus
	.word	gBG0TilemapBuffer
	.word	memset
	.word	Text_SetCursor
	.word	.LC193
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
	beq	.L554
.L583:
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L554:
	adds	r3, r4, r3
	cmp	r3, r0
	bcs	.L555
.L584:
	cmp	r3, #0
	beq	.L555
	movs	r4, r3
	movs	r1, r2
	ldrh	r3, [r4, #2]
	ands	r1, r3
	tst	r2, r3
	bne	.L583
	adds	r3, r4, r3
	cmp	r3, r0
	bcc	.L584
.L555:
	ldr	r6, .L587
	b	.L563
.L586:
	cmp	r3, #2
	beq	.L559
	cmp	r3, #64
	bne	.L561
	movs	r0, r4
	bl	REW_undoPhaseChange
.L561:
	movs	r1, r4
	movs	r0, r5
	bl	REW_prevEntry
	subs	r4, r0, #0
	beq	.L585
.L563:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L557
	bls	.L586
	cmp	r3, #66
	beq	.L559
	subs	r3, r3, #67
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, #1
	bhi	.L561
	ldrb	r0, [r4, #1]
	bl	.L11
	cmp	r0, #0
	beq	.L561
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L561
	ldr	r3, .L587+4
	bl	.L5
	movs	r1, r4
	movs	r0, r5
	bl	REW_prevEntry
	subs	r4, r0, #0
	bne	.L563
.L585:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L559:
	movs	r0, r4
	bl	REW_undoCombat
	b	.L561
.L557:
	movs	r0, r4
	bl	REW_undoObstacleCombat
	b	.L561
.L588:
	.align	2
.L587:
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
	ldr	r7, .L608
	adds	r4, r0, #4
.L597:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L590
	bhi	.L591
	cmp	r3, #2
	beq	.L592
	cmp	r3, #64
	bne	.L594
	movs	r0, r4
	bl	REW_redoPhaseChange
.L594:
	movs	r2, r6
	ldrh	r3, [r4, #2]
	ands	r2, r3
	tst	r6, r3
	beq	.L595
	adds	r3, r3, #4
	subs	r3, r3, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L595:
	adds	r4, r4, r3
	ldrh	r3, [r5, #2]
	adds	r3, r5, r3
	cmp	r4, r3
	bcs	.L589
	cmp	r4, #0
	bne	.L597
.L589:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L591:
	cmp	r3, #66
	beq	.L592
	subs	r3, r3, #67
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, #1
	bhi	.L594
	adds	r0, r4, #4
	bl	.L7
	b	.L594
.L592:
	movs	r0, r4
	bl	REW_redoCombat
	b	.L594
.L590:
	movs	r0, r4
	bl	REW_redoObstacleCombat
	b	.L594
.L609:
	.align	2
.L608:
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
	ldr	r3, .L644
	ldr	r3, [r3]
	ldr	r5, .L644+4
	ldrh	r3, [r3, #6]
	movs	r4, r0
	ldrb	r7, [r5, #15]
	ldrh	r6, [r5, #16]
	lsls	r2, r3, #25
	bpl	.L611
	movs	r2, #41
	ldrb	r2, [r0, r2]
	lsls	r2, r2, #29
	bpl	.L611
	movs	r3, #65
	ldrb	r3, [r5, r3]
	lsls	r3, r3, #30
	bpl	.L640
.L612:
	ldr	r0, [r4, #44]
	bl	REW_undo
	movs	r3, #41
	ldrb	r2, [r5, #15]
	ldrb	r3, [r4, r3]
	cmp	r2, r7
	beq	.L613
	movs	r2, #1
	orrs	r3, r2
.L613:
	ldrh	r2, [r5, #16]
	cmp	r2, r6
	beq	.L614
	movs	r2, #2
	orrs	r3, r2
.L614:
	ldr	r2, [r4, #44]
	ldrh	r1, [r2]
	subs	r2, r2, r1
	str	r2, [r4, #44]
	ldrh	r2, [r2]
	cmp	r2, #0
	beq	.L641
.L615:
	movs	r2, #8
.L639:
	orrs	r3, r2
	movs	r2, #41
	movs	r0, r4
	strb	r3, [r4, r2]
	bl	REW_refreshUI
	ldr	r3, .L644+8
	bl	.L5
	ldr	r3, .L644+12
	bl	.L5
.L610:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L611:
	lsls	r3, r3, #24
	bpl	.L610
	movs	r3, #41
	ldrb	r3, [r4, r3]
	lsls	r3, r3, #28
	bpl	.L610
	movs	r3, #65
	ldrb	r3, [r5, r3]
	lsls	r3, r3, #30
	bpl	.L642
.L617:
	ldr	r0, [r4, #44]
	ldrh	r3, [r0, #2]
	adds	r0, r0, r3
	str	r0, [r4, #44]
	bl	REW_redo
	movs	r3, #41
	ldrb	r2, [r5, #15]
	ldrb	r3, [r4, r3]
	cmp	r2, r7
	beq	.L618
	movs	r2, #1
	orrs	r3, r2
.L618:
	ldrh	r2, [r5, #16]
	cmp	r2, r6
	beq	.L619
	movs	r2, #2
	orrs	r3, r2
.L619:
	ldr	r2, .L644+16
	ldr	r2, [r2]
	ldr	r1, [r4, #44]
	ldr	r2, [r2, #4]
	cmp	r1, r2
	bcs	.L643
	movs	r2, #4
	b	.L639
.L641:
	adds	r2, r2, #4
	bics	r3, r2
	b	.L615
.L640:
	movs	r0, #102
	ldr	r3, .L644+20
	bl	.L5
	b	.L612
.L643:
	movs	r2, #8
	bics	r3, r2
	movs	r2, #4
	b	.L639
.L642:
	movs	r0, #102
	ldr	r3, .L644+20
	bl	.L5
	b	.L617
.L645:
	.align	2
.L644:
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
.LC217:
	.ascii	"REW_proc\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	REW_procScr, %object
	.size	REW_procScr, 96
REW_procScr:
	.short	1
	.short	0
	.word	.LC217
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
