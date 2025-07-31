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
	ldrb	r3, [r1]
	sub	sp, sp, #24
	add	r4, sp, #4
	strb	r3, [r4]
	ldrb	r3, [r1, #1]
	movs	r5, r0
	ldrb	r2, [r1, #2]
	strb	r3, [r4, #1]
	ldrb	r0, [r1, #3]
	ldrb	r3, [r1, #4]
	movs	r1, #1
	lsls	r0, r0, #26
	lsls	r3, r3, #26
	lsrs	r0, r0, #26
	ands	r1, r2
	lsrs	r3, r3, #20
	orrs	r3, r0
	lsls	r1, r1, #13
	orrs	r3, r1
	movs	r1, #128
	lsrs	r6, r2, #3
	lsls	r2, r2, #29
	lsrs	r2, r2, #30
	lsls	r6, r6, #11
	lsls	r2, r2, #9
	orrs	r2, r6
	strh	r2, [r4, #2]
	ldr	r2, [sp, #8]
	lsls	r1, r1, #7
	ands	r2, r1
	orrs	r3, r2
	str	r3, [sp, #8]
	movs	r3, #0
	movs	r1, r5
	mov	r0, sp
	str	r3, [sp, #12]
	str	r3, [sp, #16]
	str	r3, [sp, #20]
	str	r3, [sp]
	ldr	r2, .L103
	ldr	r3, .L103+4
	bl	.L5
	movs	r1, r4
	movs	r0, r5
	ldr	r3, .L103+8
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
.L104:
	.align	2
.L103:
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
	ldr	r3, .L108
	movs	r4, r0
	ldrb	r2, [r0, #6]
	ldrb	r1, [r0, #5]
	ldrb	r0, [r0, #4]
	bl	.L5
	cmp	r0, #0
	beq	.L106
	ldrb	r3, [r0, #3]
	ldrb	r2, [r4, #7]
	subs	r3, r3, r2
	strb	r3, [r0, #3]
.L105:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L106:
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L108+4
	bl	.L5
	lsls	r0, r0, #16
	movs	r2, #0
	movs	r1, #0
	ldr	r3, .L108+8
	lsrs	r0, r0, #16
	bl	.L5
	ldrb	r3, [r4, #7]
	ldrb	r2, [r4, #6]
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	rsbs	r3, r3, #0
	ldr	r4, .L108+12
	bl	.L110
	b	.L105
.L109:
	.align	2
.L108:
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
	ldr	r3, .L114
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
	beq	.L113
.L111:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L113:
	ldr	r3, .L114+4
	bl	.L5
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L114+8
	bl	.L5
	lsls	r0, r0, #16
	movs	r2, #0
	movs	r1, #0
	ldr	r3, .L114+12
	lsrs	r0, r0, #16
	bl	.L5
	b	.L111
.L115:
	.align	2
.L114:
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
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	mov	lr, fp
	push	{r5, r6, r7, lr}
	movs	r6, r0
	ldr	r3, .L142
	ldrb	r0, [r0, #1]
	sub	sp, sp, #12
	mov	r10, r3
	bl	.L5
	ldrh	r3, [r6, #2]
	mov	r9, r3
	movs	r3, #4
	ldrb	r7, [r6, #1]
	rsbs	r3, r3, #0
	add	r3, r3, r9
	movs	r5, r0
	mov	r8, r3
	adds	r4, r6, #4
	cmp	r7, #255
	beq	.L137
	movs	r3, #63
	movs	r2, r7
	bics	r2, r3
	cmp	r2, #192
	bne	.LCB826
	b	.L138	@long jump
.LCB826:
.L118:
	movs	r3, #16
	ldrsb	r3, [r5, r3]
	mov	r9, r3
	movs	r3, #17
	ldrsb	r3, [r5, r3]
	mov	r10, r3
	mov	r3, r8
	lsrs	r6, r3, #31
	add	r6, r6, r8
	movs	r7, #0
	asrs	r6, r6, #1
	cmp	r3, #1
	ble	.L128
	ldr	r3, .L142+4
	mov	r8, r3
	b	.L127
.L140:
	cmp	r3, #28
	beq	.L139
.L124:
	ldrb	r2, [r5, r3]
	ldrb	r1, [r4, #1]
	subs	r2, r2, r1
	strb	r2, [r5, r3]
.L125:
	adds	r7, r7, #1
	adds	r4, r4, #2
	cmp	r6, r7
	ble	.L128
.L127:
	ldrb	r3, [r4]
	cmp	r3, #71
	bls	.L140
	cmp	r3, #87
	bls	.L141
	cmp	r3, #88
	bne	.L125
	ldr	r3, .L142+8
	ldrb	r0, [r5, #28]
	bl	.L5
	ldrb	r2, [r4, #1]
	ldrb	r3, [r0, #6]
	adds	r7, r7, #1
	subs	r3, r3, r2
	strb	r3, [r0, #6]
	adds	r4, r4, #2
	cmp	r6, r7
	bgt	.L127
.L128:
	mov	r1, r10
	mov	r0, r9
	lsls	r7, r1, #2
	movs	r1, #0
	ldr	r2, .L142+12
	ldr	r3, [r2]
	ldr	r3, [r7, r3]
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
.L141:
	ldr	r3, [r5]
	ldrb	r0, [r3, #4]
	bl	.L10
	ldrb	r3, [r4]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r4, #1]
	subs	r2, r2, r1
	strb	r2, [r0, r3]
	b	.L125
.L139:
	movs	r3, #0
	ldrb	r0, [r4, #1]
	rsbs	r0, r0, #0
	lsls	r0, r0, #24
	strb	r3, [r5, #28]
	lsrs	r0, r0, #24
	ldr	r3, .L142+8
	bl	.L5
	movs	r3, #1
	strb	r3, [r0, #5]
	ldrb	r3, [r5, #16]
	strb	r3, [r0]
	ldrb	r3, [r5, #17]
	strb	r3, [r0, #1]
	ldrb	r3, [r4]
	b	.L124
.L137:
	ldrb	r0, [r6, #6]
	lsls	r0, r0, #29
	lsrs	r0, r0, #30
	ldr	r3, .L142+16
	lsls	r0, r0, #6
	bl	.L5
	movs	r3, #11
	ldrsb	r3, [r0, r3]
	mov	r8, r3
	movs	r1, r4
	movs	r5, r0
	bl	REW_loadUnit
	mov	r3, r8
	strb	r3, [r5, #11]
	movs	r3, #9
	rsbs	r3, r3, #0
	add	r3, r3, r9
	mov	r8, r3
	strb	r7, [r5, #9]
	adds	r4, r4, #5
	b	.L118
.L138:
	movs	r0, r7
	bics	r0, r2
	bl	.L8
	ldr	r3, .L142+20
	movs	r5, r0
	bl	.L5
	mov	r9, r0
	cmp	r0, #0
	ble	.L121
	ldr	r3, .L142+24
	mov	r10, r3
	ldr	r3, .L142+28
	mov	fp, r3
	movs	r3, #50
	mov	ip, r3
	add	ip, ip, r5
	mov	r3, ip
	movs	r7, #0
	str	r3, [sp, #4]
.L119:
	movs	r1, r7
	movs	r0, r5
	bl	.L8
	subs	r6, r0, #0
	beq	.L120
	ldr	r3, [r5]
	ldrb	r1, [r3, #4]
	bl	.L144
	ldrb	r3, [r4, r7]
	ldr	r2, [sp, #4]
	adds	r6, r6, r0
	adds	r6, r6, #50
	strb	r3, [r6]
	strb	r3, [r2, r7]
.L120:
	adds	r7, r7, #1
	cmp	r9, r7
	bne	.L119
.L121:
	mov	r3, r8
	mov	r2, r9
	subs	r3, r3, r2
	mov	r8, r3
	add	r4, r4, r9
	b	.L118
.L143:
	.align	2
.L142:
	.word	GetUnit
	.word	GetPidStats
	.word	GetTrap
	.word	gBmMapUnit
	.word	GetFreeUnit
	.word	GetUnitSupporterCount
	.word	GetUnitSupporterUnit
	.word	GetUnitSupporterNum
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
	mov	r6, r9
	mov	r5, r8
	mov	lr, fp
	mov	r7, r10
	push	{r5, r6, r7, lr}
	movs	r5, r0
	ldr	r7, .L169
	ldrb	r0, [r0, #1]
	sub	sp, sp, #12
	bl	.L7
	adds	r3, r5, #4
	movs	r6, r0
	mov	r8, r3
	ldrb	r0, [r5, #1]
	ldrh	r3, [r5, #2]
	mov	r9, r3
	subs	r4, r3, #4
	cmp	r0, #255
	bne	.LCB1061
	b	.L164	@long jump
.LCB1061:
	movs	r3, #63
	movs	r2, r0
	bics	r2, r3
	cmp	r2, #192
	bne	.LCB1068
	b	.L162	@long jump
.LCB1068:
.L163:
	ldr	r3, .L169+4
	mov	r10, r3
.L148:
	movs	r3, #16
	ldrsb	r3, [r6, r3]
	str	r3, [sp, #4]
	movs	r3, #17
	lsrs	r7, r4, #31
	ldrsb	r3, [r6, r3]
	adds	r7, r7, r4
	mov	r9, r3
	asrs	r7, r7, #1
	cmp	r4, #1
	bgt	.LCB1084
	b	.L156	@long jump
.LCB1084:
	ldr	r3, .L169+8
	mov	r4, r8
	movs	r5, #0
	mov	fp, r3
	b	.L155
.L167:
	cmp	r3, #28
	beq	.L165
.L151:
	ldrb	r2, [r6, r3]
	ldrb	r1, [r4, #1]
	adds	r2, r2, r1
	strb	r2, [r6, r3]
.L153:
	adds	r5, r5, #1
	adds	r4, r4, #2
	cmp	r7, r5
	ble	.L166
.L155:
	ldrb	r3, [r4]
	cmp	r3, #71
	bls	.L167
	cmp	r3, #87
	bls	.L168
	cmp	r3, #88
	bne	.L153
	ldr	r3, .L169+12
	ldrb	r0, [r6, #28]
	bl	.L5
	ldrb	r2, [r4, #1]
	ldrb	r3, [r0, #6]
	adds	r5, r5, #1
	adds	r3, r3, r2
	strb	r3, [r0, #6]
	adds	r4, r4, #2
	cmp	r7, r5
	bgt	.L155
.L166:
	movs	r3, #17
	movs	r1, #16
	ldrsb	r3, [r6, r3]
	ldrsb	r1, [r6, r1]
.L149:
	mov	r2, r10
	ldr	r2, [r2]
	lsls	r3, r3, #2
	ldr	r3, [r3, r2]
	ldrb	r2, [r6, #11]
	strb	r2, [r3, r1]
	mov	r3, r10
	ldr	r2, [r3]
	mov	r3, r9
	lsls	r3, r3, #2
	ldr	r3, [r3, r2]
	movs	r2, #0
	ldr	r1, [sp, #4]
	strb	r2, [r3, r1]
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
.L168:
	ldr	r3, [r6]
	ldrb	r0, [r3, #4]
	bl	.L144
	ldrb	r3, [r4]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r4, #1]
	adds	r2, r2, r1
	strb	r2, [r0, r3]
	b	.L153
.L165:
	ldr	r3, .L169+12
	ldrb	r0, [r6, #28]
	bl	.L5
	ldr	r3, .L169+16
	mov	r8, r0
	movs	r0, r6
	bl	.L5
	cmp	r0, #0
	bne	.L152
	mov	r3, r8
	strb	r0, [r3, #5]
.L152:
	mov	r2, r8
	ldrb	r3, [r6, #16]
	strb	r3, [r2]
	ldrb	r3, [r6, #17]
	strb	r3, [r2, #1]
	ldrb	r3, [r4]
	b	.L151
.L164:
	ldr	r3, .L169+4
	ldrb	r2, [r5, #8]
	ldr	r1, [r3]
	mov	r10, r3
	lsls	r2, r2, #26
	ldrb	r3, [r5, #7]
	lsrs	r2, r2, #24
	ldr	r2, [r2, r1]
	lsls	r3, r3, #26
	lsrs	r3, r3, #26
	ldrb	r0, [r2, r3]
	bl	.L7
	subs	r6, r0, #0
	beq	.L147
	movs	r3, #0
	str	r3, [r0]
.L147:
	movs	r3, #9
	mov	r4, r9
	mov	r8, r3
	subs	r4, r4, #9
	add	r8, r8, r5
	b	.L148
.L162:
	bics	r0, r2
	bl	.L7
	movs	r6, r0
	ldr	r3, .L169+20
	bl	.L5
	movs	r0, r6
	ldr	r3, .L169+24
	bl	.L5
	add	r8, r8, r0
	subs	r4, r4, r0
	b	.L163
.L156:
	ldr	r1, [sp, #4]
	b	.L149
.L170:
	.align	2
.L169:
	.word	GetUnit
	.word	gBmMapUnit
	.word	GetPidStats
	.word	GetTrap
	.word	GetUnitCurrentHp
	.word	InitUnitsupports
	.word	GetUnitSupporterCount
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
	ldr	r3, .L221
	movs	r6, r1
	bl	.L5
	mov	r4, sp
	cmp	r0, #0
	beq	.L173
	movs	r2, #8
	mov	r1, sp
	ldr	r3, .L221+4
	bl	.L5
	movs	r2, #11
	ldr	r7, .L221+8
	ldrsb	r2, [r7, r2]
	cmp	r2, #0
	beq	.L173
	movs	r3, #110
	ldrsb	r1, [r6, r3]
	cmp	r1, #0
	beq	.L174
	ldr	r3, [sp, #8]
	lsls	r3, r3, #8
	lsrs	r3, r3, #20
	adds	r3, r3, r1
	movs	r1, #250
	lsls	r1, r1, #4
	cmp	r3, r1
	bgt	.L215
.L175:
	ldr	r1, [r4, #8]
	ldr	r0, .L221+12
	lsls	r3, r3, #20
	lsrs	r3, r3, #8
	ands	r1, r0
	orrs	r3, r1
	str	r3, [r4, #8]
.L174:
	movs	r1, #11
	movs	r3, #192
	ldrsb	r1, [r6, r1]
	tst	r3, r1
	beq	.L176
	ldr	r3, .L221+16
	mov	r8, r3
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	cmp	r3, r1
	beq	.L177
	cmp	r2, r1
	bne	.LCB1330
	b	.L214	@long jump
.LCB1330:
.L173:
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
.L176:
	movs	r0, #250
	ldrh	r3, [r4, #12]
	lsls	r3, r3, #18
	lsrs	r3, r3, #20
	adds	r3, r3, #1
	lsls	r0, r0, #4
	cmp	r3, r0
	bgt	.L216
.L180:
	lsls	r3, r3, #20
	lsrs	r3, r3, #18
	mov	r8, r3
	ldrh	r0, [r4, #12]
	ldr	r3, .L221+20
	ands	r0, r3
	mov	r3, r8
	orrs	r3, r0
	strh	r3, [r4, #12]
	ldr	r3, .L221+16
	mov	r8, r3
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	cmp	r3, r1
	beq	.L177
	cmp	r2, r1
	beq	.L214
.L188:
	mov	r3, r8
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	cmp	r3, r1
	bne	.LCB1388
	b	.L217	@long jump
.LCB1388:
.L189:
	movs	r3, #11
	ldrsb	r3, [r7, r3]
	cmp	r3, r1
	bne	.L173
	mov	r0, r8
	ldr	r3, .L221+24
	bl	.L5
	cmp	r0, #0
	bne	.L173
.L192:
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
	bcs	.L173
	adds	r3, r3, #1
	strb	r3, [r4, #11]
	lsrs	r3, r3, #8
	ands	r3, r1
	bics	r2, r1
	orrs	r2, r3
	strb	r2, [r4, #12]
	b	.L173
.L215:
	movs	r3, r1
	b	.L175
.L216:
	movs	r3, r0
	b	.L180
.L177:
	ldr	r3, .L221+24
	mov	r0, r8
	mov	r9, r3
	bl	.L5
	cmp	r0, #0
	bne	.L218
.L182:
	ldr	r3, .L221+28
	bl	.L5
	cmp	r0, #2
	beq	.L219
	movs	r2, #63
	ldr	r3, .L221+32
	ldrb	r1, [r3, #14]
	ands	r2, r1
	movs	r1, #0
.L185:
	ldrh	r3, [r3, #16]
	lsls	r3, r3, #22
	lsls	r2, r2, #8
	lsrs	r3, r3, #8
	orrs	r3, r2
	ldr	r0, .L221+36
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
	beq	.L220
	mov	r3, r8
	ldr	r3, [r3]
	ldrb	r0, [r3, #4]
.L187:
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
.L183:
	movs	r3, #192
	tst	r3, r1
	beq	.LCB1535
	b	.L173	@long jump
.LCB1535:
	b	.L188
.L214:
	ldr	r3, .L221+24
	mov	r9, r3
.L178:
	movs	r0, r7
	bl	.L9
	cmp	r0, #0
	beq	.L182
	movs	r1, #11
	ldrsb	r1, [r6, r1]
	b	.L183
.L218:
	movs	r1, #11
	movs	r3, #11
	ldrsb	r1, [r6, r1]
	ldrsb	r3, [r7, r3]
	cmp	r3, r1
	bne	.L183
	b	.L178
.L217:
	movs	r0, r7
	ldr	r3, .L221+24
	bl	.L5
	cmp	r0, #0
	bne	.LCB1570
	b	.L192	@long jump
.LCB1570:
	movs	r1, #11
	ldrsb	r1, [r6, r1]
	b	.L189
.L220:
	ldr	r3, [r7]
	ldrb	r0, [r3, #4]
	b	.L187
.L219:
	movs	r2, #63
	ldr	r3, .L221+40
	ldrb	r3, [r3, #17]
	movs	r1, #1
	ands	r2, r3
	ldr	r3, .L221+32
	b	.L185
.L222:
	.align	2
.L221:
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
	mov	r9, r1
	push	{r7, lr}
	sub	sp, sp, #92
	movs	r4, r3
	add	r3, sp, #120
	ldrb	r3, [r3]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	movs	r7, r2
	mov	r10, r3
	ldr	r2, [sp, #128]
	ldrb	r3, [r0, #11]
	add	r5, sp, #16
	movs	r6, r0
	strb	r3, [r2, #1]
	movs	r1, r5
	movs	r2, #36
	ldr	r3, .L269
	mov	r0, r9
	bl	.L5
	mov	r3, r9
	ldrb	r1, [r6, #26]
	ldrb	r3, [r3, #26]
	ldr	r2, [r6, #4]
	subs	r3, r3, r1
	ldrb	r1, [r2, #17]
	subs	r3, r3, r1
	ldr	r1, [r6]
	ldrb	r1, [r1, #19]
	subs	r3, r3, r1
	strb	r3, [r5, #26]
	mov	r3, r9
	ldrb	r1, [r6, #29]
	ldrb	r3, [r3, #29]
	ldrb	r2, [r2, #18]
	subs	r3, r3, r1
	subs	r3, r3, r2
	strb	r3, [r5, #29]
	mov	r2, r9
	movs	r3, #82
	ldrsb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L224
	movs	r3, #81
	mov	r1, r9
	ldrb	r3, [r2, r3]
	movs	r2, #72
	adds	r3, r3, #12
	ldrh	r2, [r1, r2]
	lsls	r3, r3, #1
	adds	r3, r5, r3
	strh	r2, [r3, #6]
.L224:
	movs	r3, #111
	mov	r2, r9
	ldrsb	r1, [r2, r3]
	cmp	r1, #0
	blt	.L225
	movs	r0, r5
	ldr	r3, .L269+4
	bl	.L5
.L225:
	mov	r1, r9
	movs	r2, #115
	ldrb	r3, [r5, #18]
	ldrb	r2, [r1, r2]
	adds	r3, r3, r2
	ldr	r1, [sp, #36]
	strb	r3, [r5, #18]
	mov	r3, r9
	movs	r0, r1
	ldr	r3, [r3, #116]
	ldr	r2, .L269+8
	ands	r0, r2
	ands	r2, r3
	eors	r3, r1
	ldr	r1, .L269+12
	adds	r2, r0, r2
	ands	r3, r1
	eors	r3, r2
	mov	r1, r9
	movs	r2, #120
	str	r3, [sp, #36]
	ldrb	r2, [r1, r2]
	ldrb	r3, [r5, #24]
	adds	r3, r3, r2
	movs	r2, #121
	strb	r3, [r5, #24]
	ldrb	r3, [r5, #25]
	ldrb	r2, [r1, r2]
	adds	r3, r3, r2
	movs	r0, r5
	strb	r3, [r5, #25]
	ldr	r3, .L269+16
	bl	.L5
	mov	r0, r9
	ldr	r3, .L269+20
	bl	.L5
	cmp	r0, #0
	ble	.L226
	movs	r3, #80
	mov	r2, r9
	ldrb	r3, [r2, r3]
	adds	r3, r5, r3
	adds	r3, r3, #40
	strb	r0, [r3]
.L226:
	ldr	r3, .L269+24
	movs	r0, r5
	bl	.L5
	ldr	r3, [r5, #12]
	orrs	r3, r7
	str	r3, [r5, #12]
	ldr	r3, [sp, #128]
	adds	r7, r3, #4
	ldrb	r3, [r5, #16]
	subs	r3, r3, r4
	lsls	r3, r3, #24
	movs	r4, #0
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L227
	movs	r3, #16
	ldr	r1, [sp, #128]
	strb	r3, [r1, #4]
	strb	r2, [r1, #5]
	adds	r4, r4, #1
.L227:
	mov	r2, r10
	ldrb	r3, [r5, #17]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L228
	movs	r1, #17
	lsls	r3, r4, #1
	adds	r3, r7, r3
	strb	r1, [r3]
	strb	r2, [r3, #1]
	adds	r4, r4, #1
.L228:
	movs	r1, r5
	movs	r2, #0
.L230:
	ldrb	r0, [r6, r2]
	ldrb	r3, [r1]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r0, r3, #24
	cmp	r3, #0
	beq	.L229
	lsls	r3, r4, #1
	adds	r3, r7, r3
	strb	r2, [r3]
	strb	r0, [r3, #1]
	adds	r4, r4, #1
.L229:
	adds	r2, r2, #1
	adds	r1, r1, #1
	cmp	r2, #72
	bne	.L230
	mov	r3, r9
	ldr	r3, [r3]
	ldrb	r0, [r3, #4]
	ldr	r3, .L269+28
	bl	.L5
	subs	r6, r0, #0
	beq	.L231
	mov	r1, r9
	mov	r0, sp
	bl	REW_applyBWLChanges
	mov	r3, sp
	subs	r3, r3, #1
	movs	r2, #1
	mov	r10, r3
	subs	r6, r6, #1
.L233:
	mov	r3, r10
	ldrb	r0, [r6, r2]
	ldrb	r3, [r3, r2]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r0, r3, #24
	cmp	r3, #0
	beq	.L232
	movs	r1, #71
	mov	ip, r1
	add	ip, ip, r2
	mov	r1, ip
	lsls	r3, r4, #1
	adds	r3, r7, r3
	strb	r1, [r3]
	strb	r0, [r3, #1]
	adds	r4, r4, #1
.L232:
	adds	r2, r2, #1
	cmp	r2, #17
	bne	.L233
.L231:
	ldrb	r3, [r5, #28]
	cmp	r3, #0
	beq	.L236
	movs	r3, #72
	mov	r2, r9
	ldrh	r0, [r2, r3]
	cmp	r0, #0
	bne	.L268
.L236:
	adds	r4, r4, #2
	ldr	r2, [sp, #128]
	lsls	r3, r4, #17
	lsrs	r3, r3, #16
	strh	r3, [r2, #2]
	ldr	r2, [sp, #124]
	ldrh	r2, [r2, #2]
	cmp	r2, #0
	bne	.L237
	adds	r2, r2, #4
.L237:
	adds	r3, r3, r2
	movs	r2, #3
	movs	r1, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r1, r3
	tst	r2, r3
	beq	.L238
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L238:
	ldr	r2, [sp, #124]
	strh	r3, [r2, #2]
	add	sp, sp, #92
	@ sp needed
	pop	{r6, r7}
	mov	r10, r7
	mov	r9, r6
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L268:
	ldr	r3, .L269+32
	bl	.L5
	ldr	r3, .L269+36
	movs	r6, r0
	ldrb	r0, [r5, #28]
	bl	.L5
	ldrb	r3, [r0, #6]
	subs	r3, r6, r3
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L236
	lsls	r3, r4, #1
	adds	r7, r7, r3
	movs	r3, #88
	strb	r2, [r7, #1]
	strb	r3, [r7]
	adds	r4, r4, #1
	b	.L236
.L270:
	.align	2
.L269:
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
	mov	lr, fp
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	mov	fp, r1
	movs	r1, #0
	push	{r5, r6, r7, lr}
	sub	sp, sp, #108
	str	r2, [sp, #8]
	add	r2, sp, #144
	ldrsb	r1, [r2, r1]
	movs	r2, #11
	movs	r4, r0
	ldrsb	r2, [r0, r2]
	movs	r0, #192
	movs	r7, r0
	ands	r7, r2
	str	r7, [sp, #4]
	ldr	r7, [r4, #4]
	ldr	r6, [sp, #152]
	ldrb	r7, [r7, #4]
	adds	r5, r6, #4
	mov	ip, r7
	tst	r0, r2
	bne	.L272
	cmp	r7, #81
	beq	.LCB1952
	b	.L315	@long jump
.LCB1952:
.L272:
	movs	r0, #255
	strb	r0, [r6, #1]
	mov	r8, r0
	ldr	r0, [r4]
	ldrb	r0, [r0, #4]
	strb	r0, [r6, #4]
	mov	r0, ip
	strb	r0, [r6, #5]
	movs	r0, #6
	asrs	r2, r2, #5
	ands	r2, r0
	ldr	r0, [r4, #12]
	lsls	r0, r0, #19
	lsrs	r0, r0, #31
	orrs	r2, r0
	ldrb	r0, [r4, #8]
	lsls	r0, r0, #3
	orrs	r2, r0
	strb	r2, [r6, #6]
	movs	r2, #63
	ands	r3, r2
	movs	r0, r3
	ldrb	r3, [r6, #7]
	bics	r3, r2
	orrs	r3, r0
	strb	r3, [r6, #7]
	movs	r3, r1
	ldrb	r1, [r6, #8]
	ands	r3, r2
	bics	r1, r2
	orrs	r1, r3
	add	r7, sp, #32
	strb	r1, [r6, #8]
	movs	r0, r7
	movs	r1, r5
	bl	REW_loadUnit
	mov	r3, r8
	strb	r3, [r7, #9]
	ldrb	r3, [r4, #11]
	strb	r3, [r7, #11]
	ldr	r3, [r4, #60]
	str	r3, [sp, #92]
	movs	r3, #9
	adds	r5, r5, #5
.L274:
	movs	r1, r7
	movs	r2, #0
	movs	r7, #0
	strh	r3, [r6, #2]
.L278:
	ldrb	r0, [r4, r2]
	ldrb	r3, [r1]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r0, r3, #24
	cmp	r3, #0
	beq	.L277
	lsls	r3, r7, #1
	adds	r3, r5, r3
	strb	r2, [r3]
	strb	r0, [r3, #1]
	adds	r7, r7, #1
.L277:
	adds	r2, r2, #1
	adds	r1, r1, #1
	cmp	r2, #72
	bne	.L278
	ldr	r3, [r4]
	ldrb	r0, [r3, #4]
	ldr	r3, .L317
	bl	.L5
	mov	r8, r0
	cmp	r0, #0
	beq	.L279
	mov	r1, fp
	add	r0, sp, #16
	bl	REW_applyBWLChanges
	mov	r0, r8
	movs	r2, #1
	mov	ip, r4
	mov	r8, r6
	add	r3, sp, #16
	subs	r1, r3, #1
	subs	r0, r0, #1
.L281:
	ldrb	r4, [r0, r2]
	ldrb	r3, [r1, r2]
	subs	r3, r3, r4
	lsls	r3, r3, #24
	lsrs	r4, r3, #24
	cmp	r3, #0
	beq	.L280
	movs	r6, r2
	lsls	r3, r7, #1
	adds	r3, r5, r3
	adds	r6, r6, #71
	strb	r6, [r3]
	strb	r4, [r3, #1]
	adds	r7, r7, #1
.L280:
	adds	r2, r2, #1
	cmp	r2, #17
	bne	.L281
	mov	r4, ip
	mov	r6, r8
.L279:
	ldrb	r3, [r4, #28]
	cmp	r3, #0
	beq	.L284
	movs	r3, #72
	mov	r2, fp
	ldrh	r0, [r2, r3]
	cmp	r0, #0
	bne	.L316
.L284:
	ldrh	r3, [r6, #2]
	lsls	r7, r7, #1
	adds	r3, r3, r7
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	strh	r3, [r6, #2]
	ldr	r2, [sp, #148]
	ldrh	r2, [r2, #2]
	cmp	r2, #0
	bne	.L285
	adds	r2, r2, #4
.L285:
	adds	r3, r3, r2
	movs	r2, #3
	movs	r1, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r1, r3
	tst	r2, r3
	beq	.L286
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L286:
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
.L315:
	movs	r3, #64
	rsbs	r3, r3, #0
	orrs	r3, r2
	strb	r3, [r6, #1]
	movs	r0, r4
	ldr	r3, .L317+4
	bl	.L5
	mov	r8, r0
	cmp	r0, #0
	ble	.L276
	ldr	r3, .L317+8
	mov	r9, r3
	ldr	r3, .L317+12
	mov	r10, r3
	mov	r3, fp
	mov	fp, r6
	movs	r6, r0
	mov	r8, r5
	str	r3, [sp, #12]
	movs	r5, r4
	ldr	r4, [sp, #4]
.L273:
	movs	r1, r4
	movs	r0, r5
	bl	.L9
	subs	r7, r0, #0
	beq	.L275
	ldr	r3, [r5]
	ldrb	r1, [r3, #4]
	bl	.L8
	mov	r2, r8
	adds	r7, r7, r0
	adds	r7, r7, #50
	ldrb	r3, [r7]
	strb	r3, [r2, r4]
.L275:
	adds	r4, r4, #1
	cmp	r6, r4
	bne	.L273
	ldr	r3, [sp, #12]
	movs	r4, r5
	mov	r5, r8
	mov	r8, r6
	mov	r6, fp
	mov	fp, r3
.L276:
	add	r7, sp, #32
	ldr	r2, .L317+16
	ldr	r3, .L317+20
	movs	r1, r7
	movs	r0, r4
	bl	.L5
	ldr	r3, [r7, #12]
	ldr	r2, [sp, #8]
	orrs	r2, r3
	movs	r3, r2
	ldr	r2, .L317+24
	ands	r3, r2
	str	r3, [r7, #12]
	movs	r3, #0
	strb	r3, [r7, #28]
	mov	r3, r8
	adds	r3, r3, #4
	lsls	r3, r3, #16
	add	r5, r5, r8
	lsrs	r3, r3, #16
	b	.L274
.L316:
	ldr	r3, .L317+28
	bl	.L5
	mov	r8, r0
	ldr	r3, .L317+32
	ldrb	r0, [r4, #28]
	bl	.L5
	mov	r2, r8
	ldrb	r3, [r0, #6]
	subs	r3, r2, r3
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	bne	.LCB2213
	b	.L284	@long jump
.LCB2213:
	lsls	r3, r7, #1
	adds	r5, r5, r3
	movs	r3, #88
	strb	r2, [r5, #1]
	strb	r3, [r5]
	adds	r7, r7, #1
	b	.L284
.L318:
	.align	2
.L317:
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
	ldr	r3, .L331
	ldr	r4, [r3]
	ldr	r3, .L331+4
	ldr	r5, .L331+8
	ldrsb	r0, [r3, r0]
	sub	sp, sp, #16
	mov	r9, r3
	bl	.L6
	movs	r6, r0
	movs	r0, #11
	ldr	r3, .L331+12
	ldrsb	r0, [r3, r0]
	mov	r8, r3
	bl	.L6
	movs	r3, #4
	strh	r3, [r4, #2]
	subs	r3, r3, #2
	strb	r3, [r4, #4]
	mov	r1, r9
	movs	r3, #0
	ldr	r2, .L331+16
	ldrb	r1, [r1, #19]
	ldrsb	r3, [r2, r3]
	ldrb	r2, [r2, #2]
	lsls	r1, r1, #24
	lsls	r2, r2, #24
	movs	r5, r0
	adds	r7, r4, #4
	asrs	r2, r2, #24
	asrs	r1, r1, #24
	bne	.L320
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
	beq	.L322
.L329:
	adds	r7, r4, r3
	cmp	r5, #0
	beq	.L324
.L330:
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
	beq	.L328
	movs	r2, #0
	mov	r1, r8
	movs	r0, r5
	bl	REW_storeCombatData
.L319:
	add	sp, sp, #16
	@ sp needed
	pop	{r5, r6, r7}
	mov	r10, r7
	mov	r9, r6
	mov	r8, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L320:
	str	r2, [sp]
	mov	r1, r9
	movs	r2, #3
	movs	r0, r6
	str	r7, [sp, #8]
	str	r4, [sp, #4]
	bl	REW_storeCombatData
	ldrh	r3, [r4, #2]
	cmp	r3, #0
	bne	.L329
.L322:
	movs	r3, #4
	strh	r3, [r4, #2]
	cmp	r5, #0
	bne	.L330
.L324:
	mov	r3, r8
	movs	r1, #17
	movs	r0, #16
	ldrsb	r1, [r3, r1]
	ldrsb	r0, [r3, r0]
	ldr	r3, .L331+20
	bl	.L5
	movs	r3, #65
	strh	r3, [r7]
	mov	r3, r8
	ldr	r2, .L331+24
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
	bne	.L327
	strh	r3, [r4, #2]
	b	.L319
.L328:
	mov	r1, r8
	movs	r0, r5
	adds	r2, r2, #5
	bl	REW_storeCombatDataDead
	b	.L319
.L327:
	adds	r2, r2, #12
	subs	r2, r2, r0
	strh	r2, [r4, #2]
	b	.L319
.L332:
	.align	2
.L331:
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
	ldr	r2, .L349
	lsls	r1, r3, #6
	movs	r5, r0
	strb	r1, [r2, #15]
	lsls	r3, r3, #27
	bpl	.L334
	ldrh	r3, [r2, #16]
	subs	r3, r3, #1
	strh	r3, [r2, #16]
.L334:
	ldrh	r3, [r5, #2]
	cmp	r3, #4
	bls	.L333
	movs	r3, #2
	movs	r4, #0
	mov	r8, r3
	ldr	r6, .L349+4
	adds	r7, r5, #4
.L337:
	ldrb	r0, [r7, r4]
	bl	.L11
	cmp	r0, #0
	beq	.L336
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L336
	mov	r2, r8
	ldr	r3, [r0, #12]
	orrs	r3, r2
	str	r3, [r0, #12]
.L336:
	ldrh	r3, [r5, #2]
	adds	r4, r4, #1
	subs	r3, r3, #4
	cmp	r3, r4
	bgt	.L337
.L333:
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L350:
	.align	2
.L349:
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
	ldr	r1, .L367
	lsls	r2, r3, #4
	bics	r2, r0
	strb	r2, [r1, #15]
	lsls	r3, r3, #27
	bpl	.L352
	ldrh	r3, [r1, #16]
	adds	r3, r3, #1
	strh	r3, [r1, #16]
.L352:
	ldrh	r3, [r5, #2]
	cmp	r3, #4
	bls	.L351
	movs	r3, #66
	movs	r4, #0
	mov	r8, r3
	ldr	r6, .L367+4
	adds	r7, r5, #4
.L355:
	ldrb	r0, [r7, r4]
	bl	.L11
	cmp	r0, #0
	beq	.L354
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L354
	mov	r2, r8
	ldr	r3, [r0, #12]
	bics	r3, r2
	str	r3, [r0, #12]
.L354:
	ldrh	r3, [r5, #2]
	adds	r4, r4, #1
	subs	r3, r3, #4
	cmp	r3, r4
	bgt	.L355
.L351:
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L368:
	.align	2
.L367:
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
	beq	.L372
	cmp	r0, #128
	bne	.L374
	movs	r0, #64
	movs	r5, #64
.L370:
	ldr	r3, .L375
	bl	.L5
	cmp	r0, #0
	bne	.L371
	movs	r3, #1
	strb	r3, [r4]
.L371:
	@ sp needed
	movs	r0, r5
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L374:
	ldrb	r3, [r1]
	adds	r3, r3, #1
	movs	r0, #0
	movs	r5, #0
	strb	r3, [r1]
	b	.L370
.L372:
	movs	r0, #128
	movs	r5, #128
	b	.L370
.L376:
	.align	2
.L375:
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
	ldr	r6, .L403
	ldrb	r5, [r6, #15]
	cmp	r5, #0
	beq	.L387
	cmp	r5, #128
	bne	.L402
	movs	r0, #64
	movs	r7, #4
	movs	r5, #0
.L378:
	ldr	r3, .L403+4
	bl	.L5
	ldr	r3, .L403+8
	ldr	r2, [r3]
	mov	fp, r3
	ldrh	r3, [r2, #2]
	cmp	r3, #0
	bne	.L380
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L380:
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
	bne	.L381
	movs	r2, #32
	lsls	r3, r7, #24
	lsrs	r3, r3, #24
	orrs	r3, r2
	mov	r2, r8
	strb	r3, [r2, #1]
.L381:
	movs	r3, #0
	mov	r9, r3
	adds	r3, r3, #2
	movs	r5, #1
	mov	r10, r3
	ldr	r7, .L403+12
	b	.L385
.L383:
	ldrb	r4, [r6, #15]
.L385:
	adds	r4, r4, r5
	movs	r0, r4
	bl	.L7
	cmp	r0, #0
	beq	.L382
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L382
	mov	r2, r10
	ldr	r3, [r0, #12]
	tst	r3, r2
	beq	.L382
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
.L382:
	adds	r5, r5, #1
	cmp	r5, #64
	bne	.L383
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
	beq	.L386
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L386:
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
.L402:
	movs	r0, #0
	movs	r7, #0
	movs	r5, #1
	b	.L378
.L387:
	movs	r0, #128
	movs	r7, #8
	b	.L378
.L404:
	.align	2
.L403:
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
	ldr	r3, .L435
	ldrh	r2, [r3, #16]
	sub	sp, sp, #36
	cmp	r2, #1
	bne	.LCB2804
	b	.L405	@long jump
.LCB2804:
	ldrb	r3, [r3, #20]
	cmp	r3, #127
	bls	.LCB2807
	b	.L405	@long jump
.LCB2807:
	ldr	r3, .L435+4
	mov	r9, r3
	ldr	r3, .L435+8
	ldr	r2, .L435+12
	str	r3, [sp, #8]
	ldr	r3, .L435+16
	movs	r7, #1
	mov	r10, r3
	str	r2, [sp, #28]
	b	.L423
.L409:
	adds	r7, r7, #1
	cmp	r7, #64
	bne	.LCB2824
	b	.L405	@long jump
.LCB2824:
.L423:
	movs	r0, r7
	bl	.L9
	subs	r4, r0, #0
	beq	.L409
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L409
	ldr	r2, [r0, #12]
	ldr	r3, .L435+20
	tst	r2, r3
	bne	.L409
	ldr	r3, [sp, #8]
	bl	.L5
	cmp	r0, #4
	bgt	.L409
	mov	r3, r10
	ldr	r2, [r3]
	ldrh	r3, [r2, #2]
	cmp	r3, #0
	bne	.L412
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L412:
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
	ble	.L421
	movs	r3, #0
	str	r3, [sp, #20]
	ldr	r3, .L435+20
	str	r7, [sp, #16]
	movs	r5, #0
	mov	r8, r3
	movs	r7, r0
	ldr	r6, .L435+24
.L413:
	movs	r1, r5
	movs	r0, r4
	bl	.L11
	cmp	r0, #0
	beq	.L417
	mov	r3, r8
	ldr	r1, [r0, #12]
	tst	r1, r3
	bne	.L417
	movs	r3, #11
	ldrsb	r3, [r0, r3]
	mov	ip, r3
	movs	r3, #192
	mov	r2, ip
	tst	r3, r2
	bne	.L417
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
	beq	.L418
	cmp	r3, #1
	bne	.L417
	ldr	r3, [r4, #12]
	orrs	r1, r3
	lsls	r1, r1, #26
	bpl	.L420
.L417:
	adds	r5, r5, #1
	cmp	r7, r5
	bne	.L413
	ldr	r7, [sp, #16]
.L421:
	ldr	r3, [sp, #12]
	ldrh	r3, [r3, #2]
	cmp	r3, #4
	bls	.L409
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
	beq	.L434
	adds	r3, r3, #4
	subs	r3, r3, r0
.L434:
	adds	r7, r7, #1
	strh	r3, [r2, #2]
	cmp	r7, #64
	beq	.LCB2961
	b	.L423	@long jump
.LCB2961:
.L405:
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
.L418:
	ldrb	r3, [r4, #27]
	cmp	ip, r3
	bne	.L417
.L420:
	ldr	r3, [sp, #8]
	bl	.L5
	cmp	r0, #4
	bgt	.L417
	movs	r3, #50
	mov	fp, r3
	add	fp, fp, r4
	mov	r3, fp
	ldrb	r0, [r3, r5]
	movs	r1, r5
	str	r0, [sp, #4]
	ldr	r3, .L435+28
	movs	r0, r4
	bl	.L5
	mov	r3, fp
	ldr	r0, [sp, #4]
	ldrb	r3, [r3, r5]
	cmp	r0, r3
	beq	.L417
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
	b	.L417
.L436:
	.align	2
.L435:
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
	ldr	r3, .L448
	ldr	r4, [r3]
	movs	r3, #0
	push	{r6, r7, lr}
	ldr	r5, .L448+4
	sub	sp, sp, #8
	ldrb	r6, [r5, #15]
	movs	r1, r4
	str	r3, [sp, #4]
	ldr	r2, .L448+8
	ldr	r3, .L448+12
	add	r0, sp, #4
	bl	.L5
	ldrb	r5, [r5, #15]
	adds	r6, r6, #64
	adds	r5, r5, #1
	cmp	r6, r5
	ble	.L438
	lsls	r3, r5, #3
	adds	r4, r4, r3
	ldr	r3, .L448+16
	mov	r9, r3
	movs	r3, #19
	mov	r10, r3
	adds	r3, r3, #29
	mov	r8, r3
	movs	r7, #49
.L440:
	movs	r0, r5
	bl	.L9
	cmp	r0, #0
	beq	.L439
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L439
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
.L439:
	adds	r5, r5, #1
	adds	r4, r4, #8
	cmp	r6, r5
	bgt	.L440
.L438:
	ldr	r3, .L448+20
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
.L449:
	.align	2
.L448:
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
	ldr	r3, .L466
	ldr	r2, .L466+4
	ldrb	r3, [r3, #15]
	ldr	r7, [r2]
	adds	r4, r3, #1
	lsls	r2, r4, #3
	adds	r7, r7, #8
	adds	r7, r7, r2
	movs	r2, #64
	mov	fp, r2
	add	fp, fp, r3
	ldr	r3, .L466+8
	sub	sp, sp, #28
	str	r3, [sp, #20]
	ldr	r3, .L466+12
	mov	r10, r3
.L459:
	movs	r0, r4
	ldr	r3, [sp, #20]
	bl	.L5
	cmp	r0, #0
	beq	.L452
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L452
	mov	r3, r10
	ldr	r1, [r3]
	ldrh	r5, [r1, #2]
	subs	r3, r5, #0
	bne	.L455
	movs	r3, #4
	movs	r5, #4
	strh	r3, [r1, #2]
.L455:
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
.L457:
	ldrb	r0, [r3]
	ldr	r1, [sp, #4]
	ldrb	r6, [r3, #1]
	ldrb	r1, [r1, r0]
	cmp	r1, r6
	beq	.L456
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
.L456:
	adds	r3, r3, #2
	cmp	ip, r3
	bne	.L457
	mov	r7, ip
	ldr	r1, [sp, #8]
	ldr	r4, [sp, #12]
	ldr	r5, [sp, #16]
	cmp	r2, #4
	bls	.L452
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
	beq	.L465
	adds	r5, r5, #4
	subs	r5, r5, r2
.L465:
	strh	r5, [r1, #2]
.L452:
	adds	r4, r4, #1
	adds	r7, r7, #8
	cmp	r4, fp
	bne	.L459
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
.L467:
	.align	2
.L466:
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
	ldr	r3, .L476
	ldrb	r0, [r0, #1]
	bl	.L5
	cmp	r0, #0
	beq	.L468
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L468
	ldr	r3, .L476+4
	bl	.L5
.L468:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L477:
	.align	2
.L476:
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
	ldr	r3, .L479
	@ sp needed
	adds	r0, r0, #4
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L480:
	.align	2
.L479:
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
	ldr	r6, .L491
	ldr	r5, [r6]
	movs	r4, r0
	ldrh	r3, [r5, #2]
	movs	r0, r1
	cmp	r4, #0
	beq	.L481
	cmp	r3, #0
	beq	.L481
	ldr	r2, [r4]
	cmp	r2, #0
	beq	.L481
	adds	r5, r5, r3
	movs	r3, #67
	strb	r3, [r5]
	ldrb	r3, [r4, #11]
	strb	r3, [r5, #1]
	movs	r3, #24
	movs	r2, #10
	strh	r3, [r5, #2]
	adds	r1, r5, #4
	ldr	r3, .L491+4
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
	beq	.L490
	adds	r3, r3, #4
	subs	r3, r3, r0
.L490:
	strh	r3, [r1, #2]
.L481:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L492:
	.align	2
.L491:
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
	ldr	r6, .L514
	ldr	r4, [r6]
	ldrh	r3, [r4, #2]
	cmp	r3, #0
	beq	.L493
	movs	r5, #3
	ldr	r7, .L514+4
	adds	r4, r4, #4
.L499:
	ldrb	r3, [r4]
	cmp	r3, #67
	beq	.L513
.L496:
	movs	r1, r5
	ldrh	r3, [r4, #2]
	ldr	r2, [r6]
	ands	r1, r3
	tst	r5, r3
	beq	.L498
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L498:
	adds	r4, r4, r3
	ldrh	r3, [r2, #2]
	adds	r2, r2, r3
	cmp	r4, r2
	bcs	.L493
	cmp	r4, #0
	bne	.L499
.L493:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L513:
	ldrb	r0, [r4, #1]
	bl	.L7
	cmp	r0, #0
	beq	.L496
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L496
	movs	r3, #68
	movs	r2, #63
	strb	r3, [r4]
	ldrb	r3, [r0, #17]
	ldrb	r1, [r0, #16]
	ands	r3, r2
	lsls	r3, r3, #6
	ands	r2, r1
	orrs	r3, r2
	ldr	r1, .L514+8
	ldr	r2, [r4, #8]
	ands	r2, r1
	orrs	r3, r2
	str	r3, [r4, #8]
	movs	r3, #0
	str	r3, [r4, #12]
	b	.L496
.L515:
	.align	2
.L514:
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
	ldr	r3, .L517
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L517+4
	lsls	r0, r0, #16
	ldr	r3, .L517+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L518:
	.align	2
.L517:
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
	ldr	r3, .L520
	push	{r4, r5, r6, lr}
	ldr	r5, [r3]
	@ sp needed
	movs	r3, #0
	strh	r3, [r5]
	strh	r3, [r5, #2]
	ldr	r3, .L520+4
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L520+8
	lsls	r0, r0, #16
	ldr	r3, .L520+12
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	movs	r0, r5
	ldr	r3, .L520+16
	adds	r1, r4, r1
	bl	.L5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L521:
	.align	2
.L520:
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
	ldr	r3, .L523
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L523+4
	lsls	r0, r0, #16
	ldr	r3, .L523+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L524:
	.align	2
.L523:
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
	ldr	r3, .L526
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L526+4
	lsls	r0, r0, #16
	ldr	r3, .L526+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	ldr	r3, .L526+12
	adds	r1, r4, r1
	add	r0, sp, #4
	bl	.L5
	add	sp, sp, #8
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L527:
	.align	2
.L526:
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
	ldr	r3, .L530
	movs	r4, r0
	ldrb	r0, [r3, #15]
	ldr	r3, .L530+4
	bl	.L5
	cmp	r0, #0
	ble	.L529
	movs	r2, #2
	ldr	r3, .L530+8
	movs	r0, #3
	strb	r2, [r3, #22]
	ldr	r3, .L530+12
	bl	.L5
.L529:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L530+16
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L531:
	.align	2
.L530:
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
	ldr	r3, .L533
	sub	sp, sp, #8
	add	r4, sp, #4
	movs	r2, r1
	ldr	r3, [r3]
	movs	r1, r4
	bl	.L5
	movs	r2, #0
	ldr	r3, .L533+4
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
.L534:
	.align	2
.L533:
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
	ldr	r1, .L536
	sub	sp, sp, #8
	ldrh	r4, [r1]
	add	r0, sp, #4
	strb	r4, [r0]
	ldrh	r1, [r1, #2]
	strb	r1, [r0, #1]
	movs	r1, r3
	ldr	r3, .L536+4
	bl	.L5
	add	sp, sp, #8
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L537:
	.align	2
.L536:
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
	ldr	r3, .L539
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r1, [r3]
	ldr	r3, .L539+4
	ldr	r3, [r3]
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L540:
	.align	2
.L539:
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
	ldr	r3, .L543
	ldrb	r3, [r3, #22]
	bics	r3, r2
	cmp	r3, #1
	bne	.L541
	ldr	r3, .L543+4
	ldr	r3, [r3]
	movs	r2, r1
	movs	r1, r0
	movs	r0, r3
	ldr	r3, .L543+8
	bl	.L5
.L541:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L544:
	.align	2
.L543:
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
	ldr	r3, .L546
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r1, [r3]
	ldr	r3, .L546+4
	ldr	r3, [r3]
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L547:
	.align	2
.L546:
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
	ldr	r7, .L558
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	movs	r5, r0
	movs	r6, r1
	cmp	r3, #0
	beq	.L548
	movs	r2, #8
	ldr	r3, .L558+4
	ldrb	r3, [r3, #22]
	mov	r9, r2
	bics	r3, r2
	cmp	r3, #1
	beq	.L548
	ldr	r3, .L558+8
	mov	r8, r3
	ldr	r1, [r3]
	ldr	r3, .L558+12
	movs	r2, r6
	ldr	r3, [r3]
	bl	.L5
	mov	r3, r8
	ldr	r4, [r3]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L550
	ldr	r2, [r4, #4]
	ldrh	r2, [r2, #2]
.L551:
	adds	r4, r4, r3
	ldr	r1, [r7]
	strh	r2, [r4]
	ldrh	r2, [r1, #2]
	adds	r0, r4, #4
	strh	r2, [r4, #2]
	ldr	r3, .L558+16
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
	ldr	r6, .L558+20
	bl	.L11
	movs	r3, #0
	ldr	r5, [r7]
	strh	r3, [r5, #2]
	strh	r3, [r5]
	ldr	r3, .L558+24
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L558+28
	lsls	r0, r0, #16
	ldr	r3, .L558+32
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	movs	r0, r5
	adds	r1, r4, r1
	bl	.L11
.L548:
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L550:
	mov	r3, r9
	movs	r2, #0
	str	r3, [r4]
	movs	r3, #8
	b	.L551
.L559:
	.align	2
.L558:
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
	ldr	r3, .L563
	push	{r4, r5, lr}
	ldr	r5, [r3]
	ldr	r3, .L563+4
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L563+8
	lsls	r0, r0, #16
	sub	sp, sp, #12
	ldr	r3, .L563+12
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
.L564:
	.align	2
.L563:
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
	ldr	r3, .L566
	@ sp needed
	bl	.L5
	ldr	r3, .L566+4
	movs	r1, #3
	ldr	r0, .L566+8
	bl	.L5
	movs	r3, #0
	str	r3, [r0, #80]
	str	r3, [r0, #84]
	movs	r0, #23
	pop	{r4}
	pop	{r1}
	bx	r1
.L567:
	.align	2
.L566:
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
	ldr	r3, .L573
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
	beq	.L571
	movs	r3, #63
	movs	r2, r0
	bics	r2, r3
	cmp	r2, #192
	beq	.L572
.L570:
	ldr	r3, [r4, #4]
	ldrb	r5, [r3, #4]
	ldr	r3, [r4]
	ldrh	r0, [r3]
	ldr	r3, .L573+4
	bl	.L5
	ldr	r3, .L573+8
	movs	r1, r0
	movs	r0, r7
	bl	.L5
	movs	r0, r4
	ldr	r3, .L573+12
	bl	.L5
	movs	r3, #1
	movs	r2, r5
	str	r0, [sp]
	movs	r1, #0
	ldr	r4, .L573+16
	rsbs	r3, r3, #0
	movs	r0, #0
	bl	.L110
	movs	r3, #128
	movs	r2, #70
	lsls	r3, r3, #3
	str	r0, [r6, #80]
	ldr	r1, [r0, #48]
	strh	r3, [r0, r2]
	ldr	r4, .L573+20
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
	ldr	r3, .L573+24
	bl	.L5
	add	sp, sp, #80
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L571:
	adds	r1, r5, #4
	add	r0, sp, #8
	bl	REW_loadUnit
	add	r4, sp, #8
	b	.L570
.L572:
	bics	r0, r2
	bl	.L10
	movs	r4, r0
	b	.L570
.L574:
	.align	2
.L573:
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
	ldr	r6, .L587
	ldrb	r0, [r1, #1]
	sub	sp, sp, #80
	mov	r8, r2
	bl	.L11
	ldrb	r3, [r4]
	movs	r5, r0
	cmp	r3, #2
	beq	.L582
	cmp	r3, #65
	beq	.L583
.L575:
	add	sp, sp, #80
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L583:
	ldrb	r3, [r4, #1]
	lsls	r3, r3, #31
	bmi	.L584
	movs	r0, #27
	ldr	r3, .L587+4
	bl	.L5
	movs	r1, r0
.L581:
	mov	r0, r8
	ldr	r3, .L587+8
	bl	.L5
	b	.L575
.L582:
	ldrb	r0, [r4, #1]
	cmp	r0, #255
	beq	.L585
	movs	r3, #63
	movs	r2, r0
	bics	r2, r3
	cmp	r2, #192
	beq	.L586
.L578:
	ldr	r3, [r5, #4]
	ldrb	r6, [r3, #4]
	ldr	r3, [r5]
	ldrh	r0, [r3]
	ldr	r3, .L587+12
	bl	.L5
	ldr	r3, .L587+8
	movs	r1, r0
	mov	r0, r8
	bl	.L5
	mov	r0, r8
	ldr	r3, .L587+16
	bl	.L5
	ldr	r3, .L587+20
	movs	r4, r0
	movs	r0, r5
	bl	.L5
	movs	r3, #1
	movs	r2, r6
	str	r0, [sp]
	movs	r1, #0
	ldr	r5, .L587+24
	rsbs	r3, r3, #0
	movs	r0, #0
	bl	.L6
	movs	r3, #128
	movs	r2, #70
	lsls	r3, r3, #3
	str	r0, [r7, #84]
	ldr	r1, [r0, #48]
	strh	r3, [r0, r2]
	ldr	r5, .L587+28
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
	ldr	r3, .L587+32
	bl	.L5
	b	.L575
.L584:
	movs	r0, #51
	ldr	r3, .L587+4
	bl	.L5
	movs	r1, r0
	b	.L581
.L585:
	adds	r1, r4, #4
	add	r0, sp, #8
	bl	REW_loadUnit
	add	r5, sp, #8
	b	.L578
.L586:
	bics	r0, r2
	bl	.L11
	movs	r5, r0
	b	.L578
.L588:
	.align	2
.L587:
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
	ldr	r4, .L600
	ldrh	r3, [r1, #2]
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	ands	r6, r3
	tst	r2, r3
	beq	.L590
	adds	r3, r3, #4
	subs	r3, r3, r6
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L590:
	ldrh	r2, [r0, #2]
	adds	r3, r1, r3
	adds	r0, r0, r2
	cmp	r3, r0
	bcs	.L591
	ldrb	r2, [r3]
	cmp	r2, #65
	beq	.L599
.L594:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L600+4
	bl	.L5
	ldr	r3, .L600+8
	movs	r1, r0
	movs	r0, r5
	bl	.L5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L599:
	ldrb	r2, [r3, #6]
	ldrb	r1, [r3, #5]
	ldrb	r0, [r3, #4]
	ldr	r3, .L600+12
	bl	.L5
	cmp	r0, #0
	bne	.L594
	ldr	r4, .L600+16
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	b	.L594
.L591:
	movs	r3, #0
	ldrb	r3, [r3]
	.inst	0xdeff
.L601:
	.align	2
.L600:
	.word	REW_combat
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	GetTypedTrapAt
	.word	REW_obstacleDestroyed
	.size	REW_displayCombatVerb, .-REW_displayCombatVerb
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC214:
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
	bpl	.LCB4415
	b	.L652	@long jump
.LCB4415:
	ldr	r2, .L667
	mov	r9, r2
	ldr	r2, .L667+4
	mov	r8, r2
.L603:
	lsls	r2, r3, #31
	bpl	.L608
	ldr	r2, .L667+8
	ldrb	r2, [r2, #15]
	cmp	r2, #64
	bne	.LCB4431
	b	.L629	@long jump
.LCB4431:
	subs	r2, r2, #128
	rsbs	r1, r2, #0
	adcs	r2, r2, r1
	lsls	r2, r2, #12
.L609:
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
.L608:
	movs	r2, #4
	movs	r4, r2
	ldr	r0, [r7, #92]
	ands	r4, r3
	tst	r2, r3
	bne	.LCB4460
	b	.L610	@long jump
.LCB4460:
	cmp	r0, #0
	bne	.LCB4462
	b	.L659	@long jump
.LCB4462:
.L611:
	movs	r2, #8
	movs	r4, r2
	ldr	r0, [r7, #96]
	ands	r4, r3
	tst	r2, r3
	bne	.LCB4471
	b	.L612	@long jump
.LCB4471:
.L666:
	cmp	r0, #0
	bne	.LCB4474
	b	.L660	@long jump
.LCB4474:
.L613:
	ldr	r3, .L667+12
	bl	.L5
	movs	r3, #0
	str	r3, [r7, #80]
	str	r3, [r7, #84]
	movs	r3, #160
	ldr	r4, .L667+16
	lsls	r3, r3, #3
	ldr	r5, .L667+20
	adds	r6, r4, r3
.L614:
	movs	r0, r4
	movs	r2, #48
	movs	r1, #0
	adds	r4, r4, #64
	bl	.L6
	cmp	r6, r4
	bne	.L614
	movs	r3, #41
	movs	r4, r7
	ldrb	r3, [r7, r3]
	adds	r4, r4, #48
	lsls	r2, r3, #27
	bpl	.L616
	adds	r4, r4, #8
.L616:
	movs	r2, #16
	eors	r3, r2
	movs	r2, #41
	movs	r0, r4
	strb	r3, [r7, r2]
	bl	.L9
	ldr	r3, .L667+24
	movs	r1, #2
	movs	r0, r4
	bl	.L5
	ldr	r2, [r7, #44]
	ldrb	r3, [r2, #4]
	adds	r5, r2, #4
	cmp	r3, #2
	beq	.L626
.L661:
	cmp	r3, #64
	beq	.L627
	movs	r1, #3
	movs	r0, r1
	ldrh	r3, [r5, #2]
	ands	r0, r3
	tst	r1, r3
	beq	.L624
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L624:
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
	bne	.L661
.L626:
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
	bne	.L662
.L618:
	adds	r1, r5, r3
	ldrh	r3, [r2, #2]
	adds	r2, r2, r3
	cmp	r1, r2
	sbcs	r2, r2, r2
	movs	r0, r7
	ands	r1, r2
	movs	r2, r4
	bl	REW_displayTarget
	ldr	r1, .L667+28
	movs	r0, r4
	ldr	r3, .L667+32
	bl	.L5
	movs	r0, r4
	ldr	r1, .L667+36
	bl	.L10
.L620:
	movs	r0, #0
	ldr	r3, .L667+40
	bl	.L5
	add	sp, sp, #12
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L627:
	ldr	r3, .L667+8
	ldrb	r3, [r3, #15]
	cmp	r3, #0
	beq	.L621
	cmp	r3, #128
	bne	.L663
	movs	r0, r4
	movs	r1, #1
	ldr	r3, .L667+44
	bl	.L5
	ldr	r0, .L667+48
.L658:
	lsls	r0, r0, #16
	ldr	r3, .L667+52
	lsrs	r0, r0, #16
	bl	.L5
	ldr	r3, .L667+56
	movs	r1, r0
	movs	r0, r4
	bl	.L5
	movs	r0, r4
	ldr	r1, .L667+60
	bl	.L10
	b	.L620
.L652:
	movs	r4, r0
	ldr	r3, .L667+8
	ldrh	r5, [r3, #16]
	adds	r4, r4, #64
	lsls	r3, r5, #31
	bpl	.L605
	adds	r4, r4, #8
.L605:
	ldr	r3, .L667
	movs	r0, r4
	mov	r9, r3
	bl	.L5
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L667+64
	bl	.L5
	cmp	r5, #9
	ble	.L664
	cmp	r5, #99
	ble	.L665
.L607:
	ldr	r3, .L667+4
	ldr	r1, .L667+68
	movs	r0, r4
	mov	r8, r3
	bl	.L5
	movs	r2, #41
	movs	r1, #2
	ldrb	r3, [r7, r2]
	bics	r3, r1
	strb	r3, [r7, r2]
	b	.L603
.L662:
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	b	.L618
.L610:
	cmp	r0, #0
	bne	.LCB4687
	b	.L611	@long jump
.LCB4687:
	ldr	r3, .L667+72
	bl	.L5
	movs	r2, #8
	movs	r3, #41
	str	r4, [r7, #92]
	movs	r4, r2
	ldrb	r3, [r7, r3]
	ldr	r0, [r7, #96]
	ands	r4, r3
	tst	r2, r3
	beq	.LCB4698
	b	.L666	@long jump
.LCB4698:
.L612:
	cmp	r0, #0
	bne	.LCB4701
	b	.L613	@long jump
.LCB4701:
	ldr	r3, .L667+72
	bl	.L5
	str	r4, [r7, #96]
	b	.L613
.L663:
	movs	r0, r4
	movs	r1, #4
	ldr	r3, .L667+44
	bl	.L5
	ldr	r0, .L667+76
	b	.L658
.L664:
	movs	r0, r4
	movs	r1, #6
	ldr	r3, .L667+44
	bl	.L5
	movs	r1, r5
	movs	r0, r4
	ldr	r3, .L667+80
	bl	.L5
	b	.L607
.L629:
	movs	r2, #128
	lsls	r2, r2, #6
	b	.L609
.L621:
	ldr	r0, .L667+84
	b	.L658
.L660:
	ldr	r4, .L667+88
	str	r0, [sp, #4]
	str	r0, [sp]
	movs	r3, #0
	movs	r0, r4
	movs	r2, #0
	movs	r1, #0
	ldr	r4, .L667+92
	bl	.L110
	str	r0, [r7, #96]
	b	.L613
.L659:
	ldr	r4, .L667+96
	movs	r3, #0
	str	r0, [sp, #4]
	str	r0, [sp]
	movs	r2, #0
	movs	r0, r4
	movs	r1, #0
	ldr	r4, .L667+92
	bl	.L110
	movs	r3, #41
	str	r0, [r7, #92]
	ldrb	r3, [r7, r3]
	b	.L611
.L665:
	ldr	r3, .L667+100
	movs	r1, #10
	movs	r0, r5
	bl	.L5
	ldr	r6, .L667+80
	movs	r1, r0
	movs	r0, r4
	bl	.L11
	movs	r0, r4
	movs	r1, #16
	ldr	r3, .L667+44
	bl	.L5
	movs	r0, r5
	ldr	r3, .L667+104
	movs	r1, #10
	bl	.L5
	movs	r0, r4
	bl	.L11
	b	.L607
.L668:
	.align	2
.L667:
	.word	ClearText
	.word	PutText
	.word	gPlaySt
	.word	EndAllMus
	.word	gBG0TilemapBuffer
	.word	memset
	.word	Text_SetCursor
	.word	.LC214
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
	beq	.L670
.L699:
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L670:
	adds	r3, r4, r3
	cmp	r3, r0
	bcs	.L671
.L700:
	cmp	r3, #0
	beq	.L671
	movs	r4, r3
	movs	r1, r2
	ldrh	r3, [r4, #2]
	ands	r1, r3
	tst	r2, r3
	bne	.L699
	adds	r3, r4, r3
	cmp	r3, r0
	bcc	.L700
.L671:
	ldr	r6, .L703
	b	.L679
.L702:
	cmp	r3, #2
	beq	.L675
	cmp	r3, #64
	bne	.L677
	movs	r0, r4
	bl	REW_undoPhaseChange
.L677:
	movs	r1, r4
	movs	r0, r5
	bl	REW_prevEntry
	subs	r4, r0, #0
	beq	.L701
.L679:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L673
	bls	.L702
	cmp	r3, #66
	beq	.L675
	subs	r3, r3, #67
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, #1
	bhi	.L677
	ldrb	r0, [r4, #1]
	bl	.L11
	cmp	r0, #0
	beq	.L677
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L677
	ldr	r3, .L703+4
	bl	.L5
	movs	r1, r4
	movs	r0, r5
	bl	REW_prevEntry
	subs	r4, r0, #0
	bne	.L679
.L701:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L675:
	movs	r0, r4
	bl	REW_undoCombat
	b	.L677
.L673:
	movs	r0, r4
	bl	REW_undoObstacleCombat
	b	.L677
.L704:
	.align	2
.L703:
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
	ldr	r7, .L724
	adds	r4, r0, #4
.L713:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L706
	bhi	.L707
	cmp	r3, #2
	beq	.L708
	cmp	r3, #64
	bne	.L710
	movs	r0, r4
	bl	REW_redoPhaseChange
.L710:
	movs	r2, r6
	ldrh	r3, [r4, #2]
	ands	r2, r3
	tst	r6, r3
	beq	.L711
	adds	r3, r3, #4
	subs	r3, r3, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L711:
	adds	r4, r4, r3
	ldrh	r3, [r5, #2]
	adds	r3, r5, r3
	cmp	r4, r3
	bcs	.L705
	cmp	r4, #0
	bne	.L713
.L705:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L707:
	cmp	r3, #66
	beq	.L708
	subs	r3, r3, #67
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, #1
	bhi	.L710
	adds	r0, r4, #4
	bl	.L7
	b	.L710
.L708:
	movs	r0, r4
	bl	REW_redoCombat
	b	.L710
.L706:
	movs	r0, r4
	bl	REW_redoObstacleCombat
	b	.L710
.L725:
	.align	2
.L724:
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
	ldr	r3, .L760
	ldr	r3, [r3]
	ldr	r5, .L760+4
	ldrh	r3, [r3, #6]
	movs	r4, r0
	ldrb	r7, [r5, #15]
	ldrh	r6, [r5, #16]
	lsls	r2, r3, #25
	bpl	.L727
	movs	r2, #41
	ldrb	r2, [r0, r2]
	lsls	r2, r2, #29
	bpl	.L727
	movs	r3, #65
	ldrb	r3, [r5, r3]
	lsls	r3, r3, #30
	bpl	.L756
.L728:
	ldr	r0, [r4, #44]
	bl	REW_undo
	movs	r3, #41
	ldrb	r2, [r5, #15]
	ldrb	r3, [r4, r3]
	cmp	r2, r7
	beq	.L729
	movs	r2, #1
	orrs	r3, r2
.L729:
	ldrh	r2, [r5, #16]
	cmp	r2, r6
	beq	.L730
	movs	r2, #2
	orrs	r3, r2
.L730:
	ldr	r2, [r4, #44]
	ldrh	r1, [r2]
	subs	r2, r2, r1
	str	r2, [r4, #44]
	ldrh	r2, [r2]
	cmp	r2, #0
	beq	.L757
.L731:
	movs	r2, #8
.L755:
	orrs	r3, r2
	movs	r2, #41
	movs	r0, r4
	strb	r3, [r4, r2]
	bl	REW_refreshUI
	ldr	r3, .L760+8
	bl	.L5
	ldr	r3, .L760+12
	bl	.L5
.L726:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L727:
	lsls	r3, r3, #24
	bpl	.L726
	movs	r3, #41
	ldrb	r3, [r4, r3]
	lsls	r3, r3, #28
	bpl	.L726
	movs	r3, #65
	ldrb	r3, [r5, r3]
	lsls	r3, r3, #30
	bpl	.L758
.L733:
	ldr	r0, [r4, #44]
	ldrh	r3, [r0, #2]
	adds	r0, r0, r3
	str	r0, [r4, #44]
	bl	REW_redo
	movs	r3, #41
	ldrb	r2, [r5, #15]
	ldrb	r3, [r4, r3]
	cmp	r2, r7
	beq	.L734
	movs	r2, #1
	orrs	r3, r2
.L734:
	ldrh	r2, [r5, #16]
	cmp	r2, r6
	beq	.L735
	movs	r2, #2
	orrs	r3, r2
.L735:
	ldr	r2, .L760+16
	ldr	r2, [r2]
	ldr	r1, [r4, #44]
	ldr	r2, [r2, #4]
	cmp	r1, r2
	bcs	.L759
	movs	r2, #4
	b	.L755
.L757:
	adds	r2, r2, #4
	bics	r3, r2
	b	.L731
.L756:
	movs	r0, #102
	ldr	r3, .L760+20
	bl	.L5
	b	.L728
.L759:
	movs	r2, #8
	bics	r3, r2
	movs	r2, #4
	b	.L755
.L758:
	movs	r0, #102
	ldr	r3, .L760+20
	bl	.L5
	b	.L733
.L761:
	.align	2
.L760:
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
.LC238:
	.ascii	"REW_proc\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	REW_procScr, %object
	.size	REW_procScr, 96
REW_procScr:
	.short	1
	.short	0
	.word	.LC238
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
.L110:
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
.L144:
	bx	fp
