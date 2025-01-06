	.cpu arm7tdmi
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
	.word	BgMap_ApplyTsa
	.word	gBg1MapBuffer
	.word	Text_InitClear
	.word	Text_SetXCursor
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	gBg0MapBuffer+112
	.word	Text_Display
	.word	REW_phaseIndicator
	.word	APProc_Create
	.word	REW_phaseAPDef
	.word	EnableBgSyncByIndex
	.size	REW_initUI, .-REW_initUI
	.align	1
	.p2align 2,,3
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
	.word	EndProc
	.word	ClearBG0BG1
	.word	UnlockGameLogic
	.size	REW_procEnd, .-REW_procEnd
	.align	1
	.p2align 2,,3
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
	.word	EndProc
	.size	REW_initProc, .-REW_initProc
	.align	1
	.p2align 2,,3
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
	.p2align 2,,3
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
	.p2align 2,,3
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
	.p2align 2,,3
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
	movs	r2, #3
	push	{r4, lr}
	movs	r4, r2
	movs	r3, r0
	movs	r0, r1
	ldrh	r1, [r1, #2]
	ands	r4, r1
	tst	r2, r1
	beq	.L47
	adds	r1, r1, #4
	subs	r1, r1, r4
	lsls	r1, r1, #16
	lsrs	r1, r1, #16
.L47:
	ldrh	r2, [r3, #2]
	@ sp needed
	adds	r0, r0, r1
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
	.fpu softvfp
	.type	REW_prevEntry, %function
REW_prevEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r5, #3
	movs	r6, r5
	movs	r2, r0
	adds	r4, r0, #4
	ldrh	r0, [r0, #6]
	ands	r6, r0
	tst	r5, r0
	beq	.L53
	adds	r3, r0, #4
	subs	r3, r3, r6
	lsls	r3, r3, #16
	lsrs	r0, r3, #16
.L53:
	ldrh	r3, [r2, #2]
	adds	r0, r4, r0
	adds	r2, r2, r3
	cmp	r0, r2
	sbcs	r3, r3, r3
	ands	r0, r3
	cmp	r4, r1
	beq	.L59
	cmp	r1, r0
	beq	.L60
	movs	r4, #3
	b	.L58
.L61:
	movs	r0, r3
.L58:
	movs	r5, r4
	ldrh	r3, [r0, #2]
	ands	r5, r3
	tst	r4, r3
	beq	.L56
	adds	r3, r3, #4
	subs	r3, r3, r5
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L56:
	adds	r3, r0, r3
	cmp	r3, r2
	sbcs	r5, r5, r5
	ands	r3, r5
	cmp	r1, r3
	bne	.L61
.L52:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L60:
	movs	r0, r4
	b	.L52
.L59:
	movs	r0, #0
	b	.L52
	.size	REW_prevEntry, .-REW_prevEntry
	.align	1
	.p2align 2,,3
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
	movs	r1, r0
	push	{r4, lr}
	ldrh	r3, [r1, #2]
	movs	r2, #3
	adds	r0, r0, #4
	adds	r1, r1, r3
	b	.L71
.L76:
	cmp	r3, #0
	beq	.L68
	movs	r0, r3
.L71:
	movs	r4, r2
	ldrh	r3, [r0, #2]
	ands	r4, r3
	tst	r2, r3
	beq	.L69
	adds	r3, r3, #4
	subs	r3, r3, r4
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L69:
	adds	r3, r0, r3
	cmp	r3, r1
	bcc	.L76
.L68:
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
	.fpu softvfp
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
	beq	.L77
	adds	r3, r3, #4
	subs	r3, r3, r1
	strh	r3, [r0, #2]
.L77:
	@ sp needed
	bx	lr
	.size	REW_alignSequence, .-REW_alignSequence
	.align	1
	.p2align 2,,3
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
	.p2align 2,,3
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
	ldr	r3, .L84
	@ sp needed
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r0, r3
	sbcs	r0, r0, r0
	rsbs	r0, r0, #0
	bx	lr
.L85:
	.align	2
.L84:
	.word	REW_rewindBuffer
	.size	REW_isRedoAvailable, .-REW_isRedoAvailable
	.align	1
	.p2align 2,,3
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
	push	{r3, r4, r5, r6, r7, lr}
	movs	r4, #1
	movs	r7, #129
	ldr	r5, .L96
	ldr	r6, .L96+4
.L88:
	lsls	r0, r4, #24
	lsrs	r0, r0, #24
	bl	.L6
	cmp	r0, #0
	beq	.L87
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L87
	movs	r3, #17
	movs	r2, #16
	ldrsb	r3, [r0, r3]
	ldr	r1, [r6]
	lsls	r3, r3, #2
	ldrsb	r2, [r0, r2]
	ldr	r3, [r3, r1]
	ldrb	r3, [r3, r2]
	cmp	r3, #34
	bne	.L87
	ldr	r3, [r0, #12]
	orrs	r3, r7
	str	r3, [r0, #12]
.L87:
	adds	r4, r4, #1
	cmp	r4, #192
	bne	.L88
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L97:
	.align	2
.L96:
	.word	GetUnit
	.word	gMapTerrain
	.size	REW_hideRoofedUnits, .-REW_hideRoofedUnits
	.align	1
	.p2align 2,,3
	.global	REW_undoObstacleCombat
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_undoObstacleCombat, %function
REW_undoObstacleCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L101
	movs	r4, r0
	ldrb	r2, [r0, #6]
	ldrb	r1, [r0, #5]
	ldrb	r0, [r0, #4]
	bl	.L5
	cmp	r0, #0
	beq	.L99
	ldrb	r3, [r0, #3]
	ldrb	r2, [r4, #7]
	subs	r3, r3, r2
	strb	r3, [r0, #3]
.L98:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L99:
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L101+4
	bl	.L5
	lsls	r0, r0, #16
	movs	r2, #0
	movs	r1, #0
	ldr	r3, .L101+8
	lsrs	r0, r0, #16
	bl	.L5
	ldrb	r3, [r4, #7]
	ldrb	r2, [r4, #6]
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	rsbs	r3, r3, #0
	ldr	r4, .L101+12
	bl	.L103
	b	.L98
.L102:
	.align	2
.L101:
	.word	GetSpecificTrapAt
	.word	GetMapChangesIdAt
	.word	UntriggerMapChange
	.word	AddTrap
	.size	REW_undoObstacleCombat, .-REW_undoObstacleCombat
	.align	1
	.p2align 2,,3
	.global	REW_redoObstacleCombat
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_redoObstacleCombat, %function
REW_redoObstacleCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L107
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
	beq	.L106
.L104:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L106:
	ldr	r3, .L107+4
	bl	.L5
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L107+8
	bl	.L5
	lsls	r0, r0, #16
	movs	r2, #0
	movs	r1, #0
	ldr	r3, .L107+12
	lsrs	r0, r0, #16
	bl	.L5
	b	.L104
.L108:
	.align	2
.L107:
	.word	GetSpecificTrapAt
	.word	RemoveTrap
	.word	GetMapChangesIdAt
	.word	TriggerMapChanges
	.size	REW_redoObstacleCombat, .-REW_redoObstacleCombat
	.align	1
	.p2align 2,,3
	.global	REW_undoCombat
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_undoCombat, %function
REW_undoCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	lr, fp
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7, lr}
	ldr	r3, .L125
	movs	r7, r0
	ldrb	r0, [r0, #1]
	bl	.L5
	subs	r6, r0, #0
	beq	.L109
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L109
	movs	r3, #16
	ldrsb	r3, [r0, r3]
	mov	r10, r3
	movs	r3, #17
	ldrh	r2, [r7, #2]
	ldrsb	r3, [r0, r3]
	mov	r8, r3
	cmp	r2, #5
	bls	.L111
	ldr	r3, .L125+4
	mov	fp, r3
	ldr	r3, .L125+8
	movs	r5, #0
	mov	r9, r3
	adds	r4, r7, #4
	b	.L115
.L123:
	ldrb	r2, [r6, r3]
	ldrb	r1, [r4, #1]
	subs	r2, r2, r1
	strb	r2, [r6, r3]
	ldrh	r2, [r7, #2]
.L113:
	subs	r1, r2, #4
	lsrs	r3, r1, #31
	adds	r3, r3, r1
	adds	r5, r5, #1
	adds	r4, r4, #2
	asrs	r3, r3, #1
	cmp	r3, r5
	ble	.L111
.L115:
	ldrb	r3, [r4]
	cmp	r3, #71
	bls	.L123
	cmp	r3, #87
	bls	.L124
	cmp	r3, #88
	bne	.L113
	ldrb	r0, [r6, #28]
	bl	.L127
	ldrb	r2, [r4, #1]
	ldrb	r3, [r0, #6]
	subs	r3, r3, r2
	strb	r3, [r0, #6]
	ldrh	r2, [r7, #2]
	subs	r1, r2, #4
	lsrs	r3, r1, #31
	adds	r3, r3, r1
	adds	r5, r5, #1
	adds	r4, r4, #2
	asrs	r3, r3, #1
	cmp	r3, r5
	bgt	.L115
.L111:
	mov	r3, r8
	ldr	r2, .L125+12
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
.L109:
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L124:
	ldr	r3, [r6]
	ldrb	r0, [r3, #4]
	bl	.L9
	ldrb	r3, [r4]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r4, #1]
	subs	r2, r2, r1
	strb	r2, [r0, r3]
	ldrh	r2, [r7, #2]
	b	.L113
.L126:
	.align	2
.L125:
	.word	GetUnit
	.word	GetTrap
	.word	BWL_GetEntry
	.word	gMapUnit
	.size	REW_undoCombat, .-REW_undoCombat
	.align	1
	.p2align 2,,3
	.global	REW_redoCombat
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_redoCombat, %function
REW_redoCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	lr, fp
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7, lr}
	ldr	r3, .L144
	movs	r7, r0
	ldrb	r0, [r0, #1]
	bl	.L5
	subs	r6, r0, #0
	beq	.L128
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L128
	movs	r3, #16
	ldrsb	r3, [r0, r3]
	mov	r10, r3
	movs	r3, #17
	ldrh	r2, [r7, #2]
	ldrsb	r3, [r0, r3]
	mov	r8, r3
	cmp	r2, #5
	bls	.L130
	ldr	r3, .L144+4
	mov	fp, r3
	ldr	r3, .L144+8
	movs	r5, #0
	mov	r9, r3
	adds	r4, r7, #4
	b	.L134
.L142:
	ldrb	r2, [r6, r3]
	ldrb	r1, [r4, #1]
	adds	r2, r2, r1
	strb	r2, [r6, r3]
	ldrh	r2, [r7, #2]
.L132:
	subs	r1, r2, #4
	lsrs	r3, r1, #31
	adds	r3, r3, r1
	adds	r5, r5, #1
	adds	r4, r4, #2
	asrs	r3, r3, #1
	cmp	r3, r5
	ble	.L130
.L134:
	ldrb	r3, [r4]
	cmp	r3, #71
	bls	.L142
	cmp	r3, #87
	bls	.L143
	cmp	r3, #88
	bne	.L132
	ldrb	r0, [r6, #28]
	bl	.L127
	ldrb	r2, [r4, #1]
	ldrb	r3, [r0, #6]
	adds	r3, r3, r2
	strb	r3, [r0, #6]
	ldrh	r2, [r7, #2]
	subs	r1, r2, #4
	lsrs	r3, r1, #31
	adds	r3, r3, r1
	adds	r5, r5, #1
	adds	r4, r4, #2
	asrs	r3, r3, #1
	cmp	r3, r5
	bgt	.L134
.L130:
	mov	r3, r8
	ldr	r2, .L144+12
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
.L128:
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L143:
	ldr	r3, [r6]
	ldrb	r0, [r3, #4]
	bl	.L9
	ldrb	r3, [r4]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r4, #1]
	adds	r2, r2, r1
	strb	r2, [r0, r3]
	ldrh	r2, [r7, #2]
	b	.L132
.L145:
	.align	2
.L144:
	.word	GetUnit
	.word	GetTrap
	.word	BWL_GetEntry
	.word	gMapUnit
	.size	REW_redoCombat, .-REW_redoCombat
	.align	1
	.p2align 2,,3
	.global	REW_storeCombatData
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_storeCombatData, %function
REW_storeCombatData:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, fp
	mov	r7, r10
	mov	r5, r8
	mov	r6, r9
	mov	r8, r1
	push	{r5, r6, r7, lr}
	sub	sp, sp, #100
	movs	r4, r3
	add	r3, sp, #136
	ldrb	r3, [r3]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	add	r7, sp, #24
	mov	fp, r3
	ldr	r3, .L202
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
	beq	.L147
	movs	r3, #81
	mov	r1, r8
	ldrb	r3, [r2, r3]
	movs	r2, #72
	adds	r3, r3, #12
	ldrh	r2, [r1, r2]
	lsls	r3, r3, #1
	adds	r3, r7, r3
	strh	r2, [r3, #6]
.L147:
	movs	r3, #111
	mov	r2, r8
	ldrsb	r1, [r2, r3]
	cmp	r1, #0
	blt	.L148
	movs	r0, r7
	ldr	r3, .L202+4
	bl	.L5
.L148:
	mov	r1, r8
	movs	r2, #115
	ldrb	r3, [r7, #18]
	ldrb	r2, [r1, r2]
	adds	r3, r3, r2
	movs	r2, #116
	strb	r3, [r7, #18]
	ldrb	r3, [r7, #20]
	ldrb	r2, [r1, r2]
	adds	r3, r3, r2
	movs	r2, #117
	strb	r3, [r7, #20]
	ldrb	r3, [r7, #21]
	ldrb	r2, [r1, r2]
	adds	r3, r3, r2
	movs	r2, #118
	strb	r3, [r7, #21]
	ldrb	r3, [r7, #22]
	ldrb	r2, [r1, r2]
	adds	r3, r3, r2
	movs	r2, #119
	strb	r3, [r7, #22]
	ldrb	r3, [r7, #23]
	ldrb	r2, [r1, r2]
	adds	r3, r3, r2
	movs	r2, #120
	strb	r3, [r7, #23]
	ldrb	r3, [r7, #24]
	ldrb	r2, [r1, r2]
	adds	r3, r3, r2
	movs	r2, #121
	strb	r3, [r7, #24]
	ldrb	r3, [r7, #25]
	ldrb	r2, [r1, r2]
	adds	r3, r3, r2
	movs	r0, r7
	strb	r3, [r7, #25]
	ldr	r3, .L202+8
	bl	.L5
	mov	r0, r8
	ldr	r3, .L202+12
	bl	.L5
	cmp	r0, #0
	ble	.L149
	movs	r3, #80
	mov	r2, r8
	ldrb	r3, [r2, r3]
	adds	r3, r7, r3
	adds	r3, r3, #40
	strb	r0, [r3]
.L149:
	ldr	r3, .L202+16
	movs	r0, r7
	bl	.L5
	ldr	r3, [sp, #144]
	adds	r6, r3, #4
	ldrb	r3, [r7, #16]
	subs	r3, r3, r4
	lsls	r3, r3, #24
	movs	r4, #0
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L150
	movs	r3, #16
	ldr	r1, [sp, #144]
	strb	r3, [r1, #4]
	strb	r2, [r1, #5]
	adds	r4, r4, #1
.L150:
	mov	r2, fp
	ldrb	r3, [r7, #17]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	beq	.L151
	movs	r1, #17
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r1, [r3]
	strb	r2, [r3, #1]
	adds	r4, r4, #1
.L151:
	movs	r1, r7
	movs	r2, #0
.L153:
	ldrb	r0, [r5, r2]
	ldrb	r3, [r1]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r0, r3, #24
	cmp	r3, #0
	beq	.L152
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r2, [r3]
	strb	r0, [r3, #1]
	adds	r4, r4, #1
.L152:
	adds	r2, r2, #1
	adds	r1, r1, #1
	cmp	r2, #72
	bne	.L153
	mov	r3, r9
	cmp	r3, #0
	beq	.LCB1172
	b	.L198	@long jump
.LCB1172:
.L154:
	ldr	r3, [r5]
	ldrb	r0, [r3, #4]
	ldr	r3, .L202+20
	bl	.L5
	subs	r5, r0, #0
	beq	.L155
	movs	r2, #8
	add	r1, sp, #8
	bl	.L8
	movs	r3, #110
	mov	r2, r8
	ldrsb	r2, [r2, r3]
	cmp	r2, #0
	beq	.L156
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	lsls	r3, r3, #8
	lsrs	r3, r3, #20
	adds	r3, r3, r2
	movs	r2, #250
	lsls	r2, r2, #4
	cmp	r3, r2
	ble	.LCB1200
	b	.L199	@long jump
.LCB1200:
.L157:
	ldr	r2, [sp, #16]
	str	r2, [sp, #4]
	ldr	r1, [sp, #4]
	ldr	r2, .L202+24
	lsls	r3, r3, #20
	lsrs	r3, r3, #8
	ands	r2, r1
	orrs	r3, r2
	str	r3, [sp, #16]
.L156:
	ldr	r3, .L202+28
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	bne	.L200
.L158:
	movs	r2, #1
	add	r3, sp, #8
	subs	r1, r3, #1
	subs	r0, r5, #1
.L161:
	ldrb	r5, [r0, r2]
	ldrb	r3, [r1, r2]
	subs	r3, r3, r5
	lsls	r3, r3, #24
	lsrs	r5, r3, #24
	cmp	r3, #0
	beq	.L160
	movs	r7, r2
	lsls	r3, r4, #1
	adds	r3, r6, r3
	adds	r7, r7, #71
	strb	r7, [r3]
	strb	r5, [r3, #1]
	adds	r4, r4, #1
.L160:
	adds	r2, r2, #1
	cmp	r2, #17
	bne	.L161
.L155:
	adds	r4, r4, #2
	ldr	r2, [sp, #144]
	lsls	r3, r4, #17
	lsrs	r3, r3, #16
	strh	r3, [r2, #2]
	ldr	r2, [sp, #140]
	ldrh	r2, [r2, #2]
	cmp	r2, #0
	bne	.L162
	adds	r2, r2, #4
.L162:
	adds	r3, r3, r2
	movs	r2, #3
	movs	r1, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r1, r3
	tst	r2, r3
	beq	.L197
	adds	r3, r3, #4
	subs	r3, r3, r1
.L197:
	ldr	r2, [sp, #140]
	strh	r3, [r2, #2]
	add	sp, sp, #100
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L200:
	movs	r2, #250
	add	r3, sp, #8
	ldrh	r3, [r3, #12]
	lsls	r3, r3, #18
	lsrs	r3, r3, #20
	adds	r3, r3, #1
	lsls	r2, r2, #4
	cmp	r3, r2
	bgt	.L201
.L159:
	add	r2, sp, #8
	ldrh	r2, [r2, #12]
	ldr	r1, .L202+32
	lsls	r3, r3, #20
	ands	r2, r1
	lsrs	r3, r3, #18
	orrs	r3, r2
	add	r2, sp, #8
	strh	r3, [r2, #12]
	b	.L158
.L198:
	mov	r3, r8
	ldrh	r0, [r3, r2]
	ldr	r3, .L202+36
	bl	.L5
	mov	r9, r0
	ldr	r3, .L202+40
	ldrb	r0, [r7, #28]
	bl	.L5
	mov	r2, r9
	ldrb	r3, [r0, #6]
	subs	r3, r2, r3
	lsls	r3, r3, #24
	lsrs	r2, r3, #24
	cmp	r3, #0
	bne	.LCB1333
	b	.L154	@long jump
.LCB1333:
	movs	r1, #88
	lsls	r3, r4, #1
	adds	r3, r6, r3
	strb	r1, [r3]
	strb	r2, [r3, #1]
	adds	r4, r4, #1
	b	.L154
.L199:
	movs	r3, r2
	b	.L157
.L201:
	movs	r3, r2
	b	.L159
.L203:
	.align	2
.L202:
	.word	CpuSet
	.word	SetUnitStatus
	.word	UnitCheckStatCaps
	.word	GetBattleUnitUpdatedWeaponExp
	.word	UnitRemoveInvalidItems
	.word	BWL_GetEntry
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
	.fpu softvfp
	.type	REW_actionCombat, %function
REW_actionCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, fp
	mov	r6, r9
	mov	r7, r10
	mov	r5, r8
	push	{r5, r6, r7, lr}
	ldr	r7, .L220
	ldr	r3, .L220+4
	ldr	r5, .L220+8
	sub	sp, sp, #20
	ldrb	r0, [r7, #11]
	ldr	r4, [r3]
	bl	.L6
	ldr	r3, .L220+12
	mov	r8, r0
	ldrb	r0, [r3, #11]
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
	adds	r6, r4, #4
	movs	r5, r0
	cmp	r3, #0
	bne	.L216
.L205:
	cmp	r5, #0
	beq	.L207
.L219:
	movs	r3, #2
	strb	r3, [r6]
	ldrb	r3, [r5, #11]
	strb	r3, [r6, #1]
	mov	r3, r9
	ldrb	r3, [r3, #19]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	bne	.L217
.L204:
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
.L216:
	mov	r2, r10
	ldr	r3, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	movs	r3, #0
	ldr	r2, .L220+16
	ldrh	r0, [r2]
	movs	r2, #8
	ldr	r1, .L220+20
	ldrsb	r3, [r1, r3]
	str	r6, [sp, #8]
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
	bne	.L218
	mov	r3, fp
	strh	r3, [r4, #2]
	cmp	r5, #0
	bne	.L219
.L207:
	mov	r3, r9
	movs	r1, #17
	movs	r0, #16
	ldrsb	r1, [r3, r1]
	ldrsb	r0, [r3, r0]
	ldr	r3, .L220+24
	bl	.L5
	movs	r3, #65
	strh	r3, [r6]
	mov	r3, r9
	ldr	r2, .L220+28
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
	cmp	r3, #51
	bne	.L210
	subs	r3, r3, #50
	strb	r3, [r6, #1]
.L210:
	ldrb	r3, [r0]
	strb	r3, [r6, #4]
	ldrb	r3, [r0, #1]
	strb	r3, [r6, #5]
	ldrb	r3, [r0, #2]
	strb	r3, [r6, #6]
	mov	r3, r9
	ldrb	r2, [r0, #3]
	ldrb	r3, [r3, #19]
	subs	r3, r3, r2
	strb	r3, [r6, #7]
	movs	r3, #8
	movs	r1, #3
	strh	r3, [r6, #2]
	ldrh	r2, [r4, #2]
	movs	r3, r2
	movs	r0, r1
	adds	r3, r3, #8
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r0, r3
	tst	r1, r3
	bne	.L211
	strh	r3, [r4, #2]
	b	.L204
.L217:
	movs	r3, #16
	movs	r2, #17
	ldrsb	r3, [r5, r3]
	str	r6, [sp, #8]
	str	r4, [sp, #4]
	ldrsb	r2, [r5, r2]
	mov	r1, r9
	str	r2, [sp]
	movs	r0, r5
	movs	r2, #0
	bl	REW_storeCombatData
	b	.L204
.L211:
	adds	r2, r2, #12
	subs	r2, r2, r0
	strh	r2, [r4, #2]
	b	.L204
.L218:
	adds	r6, r3, r4
	b	.L205
.L221:
	.align	2
.L220:
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
	.p2align 2,,3
	.global	REW_undoPhaseChange
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_undoPhaseChange, %function
REW_undoPhaseChange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r8
	push	{lr}
	ldrb	r2, [r0, #1]
	ldr	r3, .L237
	lsls	r1, r2, #6
	movs	r5, r0
	strb	r1, [r3, #15]
	lsls	r2, r2, #27
	bpl	.L223
	ldrh	r2, [r3, #16]
	subs	r2, r2, #1
	strh	r2, [r3, #16]
.L223:
	ldrh	r3, [r5, #2]
	cmp	r3, #4
	bls	.L222
	movs	r3, #2
	movs	r4, #0
	mov	r8, r3
	ldr	r6, .L237+4
	adds	r7, r5, #4
.L226:
	ldrb	r0, [r7, r4]
	bl	.L11
	cmp	r0, #0
	beq	.L225
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L225
	mov	r2, r8
	ldr	r3, [r0, #12]
	orrs	r3, r2
	str	r3, [r0, #12]
.L225:
	ldrh	r3, [r5, #2]
	adds	r4, r4, #1
	subs	r3, r3, #4
	cmp	r3, r4
	bgt	.L226
.L222:
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L238:
	.align	2
.L237:
	.word	gChapterData
	.word	GetUnit
	.size	REW_undoPhaseChange, .-REW_undoPhaseChange
	.align	1
	.p2align 2,,3
	.global	REW_redoPhaseChange
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_redoPhaseChange, %function
REW_redoPhaseChange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r8
	push	{lr}
	movs	r5, r0
	ldrb	r1, [r0, #1]
	movs	r0, #63
	ldr	r2, .L254
	lsls	r3, r1, #4
	bics	r3, r0
	strb	r3, [r2, #15]
	lsls	r3, r1, #27
	bpl	.L240
	ldrh	r3, [r2, #16]
	adds	r3, r3, #1
	strh	r3, [r2, #16]
.L240:
	ldrh	r3, [r5, #2]
	cmp	r3, #4
	bls	.L239
	movs	r3, #66
	movs	r4, #0
	mov	r8, r3
	ldr	r6, .L254+4
	adds	r7, r5, #4
.L243:
	ldrb	r0, [r7, r4]
	bl	.L11
	cmp	r0, #0
	beq	.L242
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L242
	mov	r2, r8
	ldr	r3, [r0, #12]
	bics	r3, r2
	str	r3, [r0, #12]
.L242:
	ldrh	r3, [r5, #2]
	adds	r4, r4, #1
	subs	r3, r3, #4
	cmp	r3, r4
	bgt	.L243
.L239:
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L255:
	.align	2
.L254:
	.word	gChapterData
	.word	GetUnit
	.size	REW_redoPhaseChange, .-REW_redoPhaseChange
	.align	1
	.p2align 2,,3
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
	cmp	r0, #0
	beq	.L259
	cmp	r0, #128
	beq	.L260
	movs	r0, #0
	movs	r4, #0
	ldrb	r3, [r1]
	adds	r3, r3, #1
	strb	r3, [r1]
.L257:
	ldr	r3, .L261
	bl	.L5
	cmp	r0, #0
	bne	.L258
	movs	r3, #1
	strb	r3, [r5]
.L258:
	@ sp needed
	movs	r0, r4
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L260:
	movs	r0, #64
	movs	r4, #64
	b	.L257
.L259:
	movs	r0, #128
	movs	r4, #128
	b	.L257
.L262:
	.align	2
.L261:
	.word	GetPhaseAbleUnitCount
	.size	REW_nextPhase, .-REW_nextPhase
	.align	1
	.p2align 2,,3
	.global	REW_actionPhaseChangeStart
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_actionPhaseChangeStart, %function
REW_actionPhaseChangeStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r7, r10
	mov	r6, r9
	mov	lr, fp
	mov	r5, r8
	push	{r5, r6, r7, lr}
	ldr	r6, .L289
	ldrb	r7, [r6, #15]
	cmp	r7, #0
	beq	.L275
	cmp	r7, #128
	bne	.L276
	movs	r0, #64
	movs	r5, #4
	movs	r7, #0
.L264:
	ldr	r3, .L289+4
	bl	.L5
	ldr	r3, .L289+8
	ldr	r2, [r3]
	mov	fp, r3
	ldrh	r3, [r2, #2]
	cmp	r3, #0
	bne	.L266
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L266:
	mov	r8, r2
	add	r8, r8, r3
	mov	r2, r8
	movs	r3, #64
	strb	r3, [r2]
	subs	r3, r3, #60
	strh	r3, [r2, #2]
	ldrb	r4, [r6, #15]
	lsrs	r3, r4, #6
	orrs	r5, r3
	cmp	r7, #0
	beq	.L286
	movs	r3, #16
	orrs	r5, r3
.L286:
	mov	r3, r8
	strb	r5, [r3, #1]
	cmp	r0, #0
	bne	.L269
	movs	r2, #32
	ldrb	r3, [r3, #1]
	orrs	r3, r2
	mov	r2, r8
	strb	r3, [r2, #1]
.L269:
	movs	r3, #0
	mov	r9, r3
	adds	r3, r3, #2
	movs	r5, #1
	mov	r10, r3
	ldr	r7, .L289+12
	b	.L272
.L288:
	ldrb	r4, [r6, #15]
.L272:
	adds	r4, r4, r5
	lsls	r4, r4, #24
	lsrs	r4, r4, #24
	movs	r0, r4
	bl	.L7
	cmp	r0, #0
	beq	.L270
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L270
	mov	r2, r10
	ldr	r3, [r0, #12]
	tst	r3, r2
	beq	.L270
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
.L270:
	adds	r5, r5, #1
	cmp	r5, #64
	bne	.L288
	mov	r3, fp
	mov	r2, r8
	ldr	r1, [r3]
	ldrh	r2, [r2, #2]
	ldrh	r3, [r1, #2]
	adds	r3, r3, r2
	movs	r2, #3
	movs	r0, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r0, r3
	tst	r2, r3
	beq	.L287
	adds	r3, r3, #4
	subs	r3, r3, r0
.L287:
	strh	r3, [r1, #2]
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L276:
	movs	r0, #0
	movs	r5, #0
	movs	r7, #1
	b	.L264
.L275:
	movs	r0, #128
	movs	r5, #8
	b	.L264
.L290:
	.align	2
.L289:
	.word	gChapterData
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
	.fpu softvfp
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
	ldr	r3, .L318
	ldrh	r2, [r3, #16]
	sub	sp, sp, #28
	cmp	r2, #1
	bne	.LCB1947
	b	.L291	@long jump
.LCB1947:
	ldrb	r3, [r3, #20]
	cmp	r3, #127
	bls	.LCB1950
	b	.L291	@long jump
.LCB1950:
	ldr	r3, .L318+4
	movs	r7, #1
	mov	fp, r3
	b	.L307
.L295:
	adds	r7, r7, #1
	cmp	r7, #64
	bne	.LCB1962
	b	.L291	@long jump
.LCB1962:
.L307:
	lsls	r5, r7, #24
	lsrs	r5, r5, #24
	movs	r0, r5
	bl	.L127
	subs	r4, r0, #0
	beq	.L295
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L295
	ldr	r3, .L318+8
	ldr	r2, [r0, #12]
	tst	r2, r3
	bne	.L295
	ldr	r3, .L318+12
	bl	.L5
	cmp	r0, #4
	bgt	.L295
	ldr	r3, .L318+16
	ldr	r2, [r3]
	ldrh	r3, [r2, #2]
	cmp	r3, #0
	bne	.L298
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L298:
	adds	r3, r2, r3
	movs	r2, r3
	str	r3, [sp, #8]
	movs	r3, #4
	strh	r3, [r2, #2]
	adds	r3, r2, #4
	str	r3, [sp, #20]
	movs	r0, r4
	ldr	r3, .L318+20
	bl	.L5
	cmp	r0, #0
	ble	.L305
	movs	r3, #0
	str	r3, [sp, #16]
	ldr	r3, .L318+24
	mov	r10, r3
	ldr	r3, .L318+8
	mov	r9, r3
	movs	r3, r7
	movs	r6, #0
	movs	r7, r0
	mov	r8, r3
	str	r5, [sp, #12]
.L299:
	movs	r1, r6
	movs	r0, r4
	bl	.L8
	cmp	r0, #0
	beq	.L301
	mov	r3, r9
	ldr	r1, [r0, #12]
	tst	r1, r3
	bne	.L301
	movs	r5, #11
	movs	r3, #192
	ldrsb	r5, [r0, r5]
	tst	r3, r5
	bne	.L301
	movs	r3, #16
	movs	r2, #16
	ldrsb	r3, [r4, r3]
	ldrsb	r2, [r0, r2]
	subs	r3, r3, r2
	asrs	r2, r3, #31
	adds	r3, r3, r2
	eors	r3, r2
	str	r3, [sp, #4]
	movs	r2, #17
	movs	r3, #17
	ldrsb	r2, [r4, r2]
	ldrsb	r3, [r0, r3]
	subs	r2, r2, r3
	asrs	r3, r2, #31
	adds	r2, r2, r3
	eors	r2, r3
	ldr	r3, [sp, #4]
	mov	ip, r3
	add	r2, r2, ip
	cmp	r2, #0
	beq	.L302
	cmp	r2, #1
	bne	.L301
	ldr	r3, [r4, #12]
	orrs	r1, r3
	lsls	r3, r1, #26
	bpl	.L304
.L301:
	adds	r6, r6, #1
	cmp	r7, r6
	bne	.L299
	mov	r7, r8
	ldr	r5, [sp, #12]
.L305:
	ldr	r3, [sp, #8]
	ldrh	r3, [r3, #2]
	cmp	r3, #4
	bls	.L295
	movs	r2, #66
	ldr	r1, [sp, #8]
	strb	r2, [r1]
	strb	r5, [r1, #1]
	ldr	r2, .L318+16
	ldr	r1, [r2]
	ldrh	r2, [r1, #2]
	adds	r3, r3, r2
	movs	r2, #3
	movs	r0, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	ands	r0, r3
	tst	r2, r3
	beq	.L317
	adds	r3, r3, #4
	subs	r3, r3, r0
.L317:
	adds	r7, r7, #1
	strh	r3, [r1, #2]
	cmp	r7, #64
	beq	.LCB2107
	b	.L307	@long jump
.LCB2107:
.L291:
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
.L302:
	ldrb	r3, [r4, #27]
	cmp	r5, r3
	bne	.L301
.L304:
	ldr	r3, .L318+12
	bl	.L5
	cmp	r0, #4
	bgt	.L301
	movs	r5, r4
	adds	r5, r5, #50
	ldrb	r0, [r5, r6]
	ldr	r3, .L318+28
	str	r0, [sp, #4]
	movs	r1, r6
	movs	r0, r4
	bl	.L5
	ldrb	r3, [r5, r6]
	ldr	r0, [sp, #4]
	cmp	r0, r3
	beq	.L301
	ldr	r1, [sp, #20]
	mov	ip, r1
	movs	r1, r6
	ldr	r5, [sp, #16]
	lsls	r2, r5, #1
	add	r2, r2, ip
	subs	r3, r3, r0
	adds	r1, r1, #50
	strb	r3, [r2, #1]
	strb	r1, [r2]
	ldr	r2, [sp, #8]
	ldrh	r3, [r2, #2]
	adds	r3, r3, #2
	strh	r3, [r2, #2]
	adds	r3, r5, #1
	str	r3, [sp, #16]
	b	.L301
.L319:
	.align	2
.L318:
	.word	gChapterData
	.word	GetUnit
	.word	65548
	.word	GetUnitTotalSupportLevel
	.word	REW_curSequence
	.word	GetROMUnitSupportCount
	.word	GetUnitSupportingUnit
	.word	UnitGainSupportExp
	.size	REW_actionPhaseChangeSuppports, .-REW_actionPhaseChangeSuppports
	.align	1
	.p2align 2,,3
	.global	REW_actionPhaseChangeTrackStatus
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_actionPhaseChangeTrackStatus, %function
REW_actionPhaseChangeTrackStatus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r10
	mov	r6, r8
	mov	r7, r9
	ldr	r3, .L331
	ldr	r4, [r3]
	movs	r3, #0
	push	{r6, r7, lr}
	ldr	r5, .L331+4
	sub	sp, sp, #8
	ldrb	r6, [r5, #15]
	movs	r1, r4
	str	r3, [sp, #4]
	ldr	r2, .L331+8
	ldr	r3, .L331+12
	add	r0, sp, #4
	bl	.L5
	ldrb	r5, [r5, #15]
	adds	r6, r6, #64
	adds	r5, r5, #1
	cmp	r6, r5
	ble	.L321
	lsls	r3, r5, #3
	adds	r4, r4, r3
	ldr	r3, .L331+16
	mov	r9, r3
	movs	r3, #19
	mov	r10, r3
	adds	r3, r3, #29
	mov	r8, r3
	movs	r7, #49
.L323:
	lsls	r0, r5, #24
	lsrs	r0, r0, #24
	bl	.L9
	cmp	r0, #0
	beq	.L322
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L322
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
.L322:
	adds	r5, r5, #1
	adds	r4, r4, #8
	cmp	r6, r5
	bgt	.L323
.L321:
	ldr	r3, .L331+20
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
.L332:
	.align	2
.L331:
	.word	REW_rewindBuffer
	.word	gChapterData
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
	.fpu softvfp
	.type	REW_actionPhaseChangeRecordStatus, %function
REW_actionPhaseChangeRecordStatus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, fp
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7, lr}
	ldr	r3, .L349
	ldrb	r2, [r3, #15]
	adds	r3, r2, #1
	mov	fp, r3
	ldr	r3, .L349+4
	ldr	r3, [r3]
	mov	r1, fp
	adds	r3, r3, #8
	mov	r9, r3
	lsls	r1, r1, #3
	add	r9, r9, r1
	mov	r7, fp
	mov	r5, r9
	sub	sp, sp, #20
	adds	r2, r2, #64
	str	r2, [sp, #12]
.L342:
	lsls	r6, r7, #24
	lsrs	r6, r6, #24
	movs	r0, r6
	ldr	r3, .L349+8
	bl	.L5
	cmp	r0, #0
	beq	.L335
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L335
	ldr	r3, .L349+12
	ldr	r3, [r3]
	mov	fp, r3
	ldrh	r3, [r3, #2]
	str	r3, [sp, #4]
	cmp	r3, #0
	bne	.L338
	mov	r3, fp
	movs	r2, #4
	strh	r2, [r3, #2]
	movs	r3, #4
	str	r2, [sp, #4]
.L338:
	movs	r2, #4
	movs	r1, #0
	add	r3, r3, fp
	mov	r10, r3
	strh	r2, [r3, #2]
	adds	r3, r3, #4
	mov	r8, r3
	movs	r3, r5
	str	r6, [sp, #8]
	mov	r9, r7
	movs	r6, r1
	mov	ip, r5
	str	r0, [sp]
	subs	r3, r3, #8
.L340:
	ldrb	r5, [r3]
	ldr	r1, [sp]
	ldrb	r0, [r3, #1]
	ldrb	r1, [r1, r5]
	cmp	r1, r0
	beq	.L339
	lsls	r4, r6, #1
	add	r4, r4, r8
	subs	r1, r1, r0
	strb	r1, [r4, #1]
	mov	r1, r10
	adds	r2, r2, #2
	lsls	r2, r2, #16
	lsrs	r2, r2, #16
	strb	r5, [r4]
	strh	r2, [r1, #2]
	adds	r6, r6, #1
.L339:
	adds	r3, r3, #2
	cmp	ip, r3
	bne	.L340
	mov	r7, r9
	mov	r5, ip
	ldr	r6, [sp, #8]
	cmp	r2, #4
	bls	.L335
	mov	r3, r10
	movs	r1, #66
	strb	r6, [r3, #1]
	strb	r1, [r3]
	ldr	r3, [sp, #4]
	mov	ip, r3
	movs	r3, #3
	movs	r1, r3
	add	r2, r2, ip
	lsls	r2, r2, #16
	lsrs	r2, r2, #16
	ands	r1, r2
	tst	r3, r2
	beq	.L348
	adds	r2, r2, #4
	subs	r2, r2, r1
.L348:
	mov	r3, fp
	strh	r2, [r3, #2]
.L335:
	ldr	r3, [sp, #12]
	adds	r7, r7, #1
	adds	r5, r5, #8
	cmp	r7, r3
	bne	.L342
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
.L350:
	.align	2
.L349:
	.word	gChapterData
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
	.fpu softvfp
	.type	REW_undoLoadUnit, %function
REW_undoLoadUnit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L359
	ldrb	r0, [r0, #1]
	bl	.L5
	cmp	r0, #0
	beq	.L351
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L351
	ldr	r3, .L359+4
	bl	.L5
.L351:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L360:
	.align	2
.L359:
	.word	GetUnit
	.word	ClearUnit
	.size	REW_undoLoadUnit, .-REW_undoLoadUnit
	.align	1
	.p2align 2,,3
	.global	REW_redoLoadUnit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_redoLoadUnit, %function
REW_redoLoadUnit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L362
	@ sp needed
	adds	r0, r0, #4
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L363:
	.align	2
.L362:
	.word	LoadUnit
	.size	REW_redoLoadUnit, .-REW_redoLoadUnit
	.align	1
	.p2align 2,,3
	.global	REW_conseqInitUnit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_conseqInitUnit, %function
REW_conseqInitUnit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L374
	ldr	r5, [r6]
	ldrh	r3, [r5, #2]
	movs	r4, r0
	movs	r0, r1
	cmp	r3, #0
	beq	.L364
	cmp	r4, #0
	beq	.L364
	ldr	r2, [r4]
	cmp	r2, #0
	beq	.L364
	adds	r5, r5, r3
	movs	r3, #67
	strb	r3, [r5]
	ldrb	r3, [r4, #11]
	strb	r3, [r5, #1]
	movs	r3, #24
	movs	r2, #10
	strh	r3, [r5, #2]
	adds	r1, r5, #4
	ldr	r3, .L374+4
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
	beq	.L373
	adds	r3, r3, #4
	subs	r3, r3, r0
.L373:
	strh	r3, [r1, #2]
.L364:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L375:
	.align	2
.L374:
	.word	REW_curSequence
	.word	CpuSet
	.size	REW_conseqInitUnit, .-REW_conseqInitUnit
	.align	1
	.p2align 2,,3
	.global	REW_conseqFinalizeUnits
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_conseqFinalizeUnits, %function
REW_conseqFinalizeUnits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, r8
	push	{lr}
	ldr	r4, .L398
	ldr	r7, [r4]
	ldrh	r2, [r7, #2]
	cmp	r2, #0
	beq	.L376
	movs	r3, #68
	movs	r6, #63
	mov	r8, r3
	ldr	r5, .L398+4
	adds	r7, r7, #4
	b	.L382
.L397:
	cmp	r7, #0
	beq	.L376
.L382:
	ldrb	r3, [r7]
	cmp	r3, #67
	beq	.L396
.L379:
	movs	r1, #3
	movs	r0, r1
	ldrh	r3, [r7, #2]
	ldr	r2, [r4]
	ands	r0, r3
	tst	r1, r3
	beq	.L381
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L381:
	ldrh	r1, [r2, #2]
	adds	r7, r7, r3
	adds	r2, r2, r1
	cmp	r7, r2
	bcc	.L397
.L376:
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L396:
	ldrb	r0, [r7, #1]
	bl	.L6
	cmp	r0, #0
	beq	.L379
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L379
	mov	r3, r8
	strb	r3, [r7]
	ldrb	r3, [r0, #17]
	ldrb	r2, [r0, #16]
	ands	r3, r6
	ands	r2, r6
	lsls	r3, r3, #6
	ldr	r1, [r7, #8]
	orrs	r3, r2
	ldr	r2, .L398+8
	ands	r2, r1
	orrs	r3, r2
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L379
.L399:
	.align	2
.L398:
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
	.fpu softvfp
	.type	REW_findCurSequence, %function
REW_findCurSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L401
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L401+4
	lsls	r0, r0, #16
	ldr	r3, .L401+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L402:
	.align	2
.L401:
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
	.fpu softvfp
	.type	REW_clearCurSequence, %function
REW_clearCurSequence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L404
	push	{r4, r5, r6, lr}
	ldr	r5, [r3]
	@ sp needed
	movs	r3, #0
	strh	r3, [r5]
	strh	r3, [r5, #2]
	ldr	r3, .L404+4
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L404+8
	lsls	r0, r0, #16
	ldr	r3, .L404+12
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	movs	r0, r5
	ldr	r3, .L404+16
	adds	r1, r4, r1
	bl	.L5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L405:
	.align	2
.L404:
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
	.fpu softvfp
	.type	REW_findRewindBuf, %function
REW_findRewindBuf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L407
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L407+4
	lsls	r0, r0, #16
	ldr	r3, .L407+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L408:
	.align	2
.L407:
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
	.fpu softvfp
	.type	REW_clearRewindBuf, %function
REW_clearRewindBuf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r4, lr}
	sub	sp, sp, #8
	str	r3, [sp, #4]
	ldr	r3, .L410
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L410+4
	lsls	r0, r0, #16
	ldr	r3, .L410+8
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	ldr	r3, .L410+12
	adds	r1, r4, r1
	add	r0, sp, #4
	bl	.L5
	add	sp, sp, #8
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L411:
	.align	2
.L410:
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
	.fpu softvfp
	.type	REW_cpPhaseChangeSave, %function
REW_cpPhaseChangeSave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L418
	movs	r4, r0
	ldrb	r0, [r3, #15]
	ldr	r3, .L418+4
	bl	.L5
	cmp	r0, #0
	bne	.L417
.L413:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L418+8
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L417:
	movs	r2, #2
	ldr	r3, .L418+12
	movs	r0, #3
	strb	r2, [r3, #22]
	ldr	r3, .L418+16
	bl	.L5
	b	.L413
.L419:
	.align	2
.L418:
	.word	gChapterData
	.word	GetPhaseAbleUnitCount
	.word	CpPhase_Init
	.word	gActionData
	.word	SaveSuspendedGame
	.size	REW_cpPhaseChangeSave, .-REW_cpPhaseChangeSave
	.align	1
	.p2align 2,,3
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
	push	{lr}
	ldr	r3, .L421
	sub	sp, sp, #12
	movs	r2, r1
	ldr	r3, [r3]
	add	r1, sp, #4
	bl	.L5
	mov	r2, sp
	ldrb	r2, [r2, #4]
	ldr	r3, .L421+4
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
.L422:
	.align	2
.L421:
	.word	ReadSramFast
	.word	gActiveUnitMoveOrigin
	.size	REW_loadActiveUnitMoveOrigin, .-REW_loadActiveUnitMoveOrigin
	.align	1
	.p2align 2,,3
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
	push	{r4, lr}
	sub	sp, sp, #8
	mov	r4, sp
	ldr	r3, .L424
	movs	r2, r1
	ldrh	r1, [r3]
	strb	r1, [r4, #4]
	ldrh	r3, [r3, #2]
	movs	r1, r0
	strb	r3, [r4, #5]
	add	r0, sp, #4
	ldr	r3, .L424+4
	bl	.L5
	add	sp, sp, #8
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L425:
	.align	2
.L424:
	.word	gActiveUnitMoveOrigin
	.word	WriteAndVerifySramFast
	.size	REW_saveActiveUnitMoveOrigin, .-REW_saveActiveUnitMoveOrigin
	.align	1
	.p2align 2,,3
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
	ldr	r3, .L427
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r1, [r3]
	ldr	r3, .L427+4
	ldr	r3, [r3]
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L428:
	.align	2
.L427:
	.word	REW_curSequence
	.word	ReadSramFast
	.size	REW_loadCurSequence, .-REW_loadCurSequence
	.align	1
	.p2align 2,,3
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
	movs	r2, #8
	push	{r4, lr}
	ldr	r3, .L431
	ldrb	r3, [r3, #22]
	bics	r3, r2
	cmp	r3, #1
	bne	.L429
	ldr	r3, .L431+4
	ldr	r3, [r3]
	movs	r2, r1
	movs	r1, r0
	movs	r0, r3
	ldr	r3, .L431+8
	bl	.L5
.L429:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L432:
	.align	2
.L431:
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
	.fpu softvfp
	.type	REW_loadRewind, %function
REW_loadRewind:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L434
	push	{r4, lr}
	movs	r2, r1
	@ sp needed
	ldr	r1, [r3]
	ldr	r3, .L434+4
	ldr	r3, [r3]
	bl	.L5
	pop	{r4}
	pop	{r0}
	bx	r0
.L435:
	.align	2
.L434:
	.word	REW_rewindBuffer
	.word	ReadSramFast
	.size	REW_loadRewind, .-REW_loadRewind
	.align	1
	.p2align 2,,3
	.global	REW_saveRewind
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_saveRewind, %function
REW_saveRewind:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r7, r8
	mov	lr, r9
	push	{r7, lr}
	ldr	r3, .L446
	mov	r8, r3
	ldr	r3, [r3]
	ldrh	r3, [r3, #2]
	movs	r4, r0
	movs	r5, r1
	cmp	r3, #0
	beq	.L436
	movs	r6, #8
	ldr	r3, .L446+4
	ldrb	r3, [r3, #22]
	bics	r3, r6
	cmp	r3, #1
	beq	.L436
	ldr	r7, .L446+8
	ldr	r3, .L446+12
	movs	r2, r1
	ldr	r3, [r3]
	ldr	r1, [r7]
	bl	.L5
	ldr	r7, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L438
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #2]
.L439:
	adds	r6, r7, r3
	mov	r3, r8
	strh	r2, [r6]
	ldr	r1, [r3]
	ldrh	r3, [r1, #2]
	mov	r9, r3
	strh	r3, [r6, #2]
	ldrh	r2, [r1, #2]
	ldr	r3, .L446+16
	adds	r0, r6, #4
	subs	r2, r2, #4
	adds	r1, r1, #4
	bl	.L5
	ldr	r3, [r7]
	add	r3, r3, r9
	movs	r2, r5
	movs	r1, r4
	str	r3, [r7]
	str	r6, [r7, #4]
	movs	r0, r7
	ldr	r6, .L446+20
	bl	.L11
	mov	r3, r8
	ldr	r5, [r3]
	movs	r3, #0
	strh	r3, [r5, #2]
	strh	r3, [r5]
	ldr	r3, .L446+24
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L446+28
	lsls	r0, r0, #16
	ldr	r3, .L446+32
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r1, [r0]
	movs	r2, #4
	movs	r0, r5
	adds	r1, r4, r1
	bl	.L11
.L436:
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L438:
	movs	r2, #0
	movs	r3, #8
	str	r6, [r7]
	b	.L439
.L447:
	.align	2
.L446:
	.word	REW_curSequence
	.word	gActionData
	.word	REW_rewindBuffer
	.word	ReadSramFast
	.word	memcpy
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
	.fpu softvfp
	.type	REW_rewindMenuUsability, %function
REW_rewindMenuUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L451
	push	{r4, r5, lr}
	ldr	r5, [r3]
	ldr	r3, .L451+4
	ldrh	r4, [r3, #12]
	movs	r3, #224
	lsls	r3, r3, #20
	mov	ip, r3
	ldr	r0, .L451+8
	lsls	r0, r0, #16
	sub	sp, sp, #12
	ldr	r3, .L451+12
	lsrs	r0, r0, #16
	add	r4, r4, ip
	bl	.L5
	ldrh	r0, [r0]
	movs	r2, #4
	adds	r0, r4, r0
	add	r1, sp, #4
	bl	.L6
	ldr	r0, [sp, #4]
	subs	r3, r0, #1
	sbcs	r0, r0, r3
	movs	r3, #1
	rsbs	r0, r0, #0
	bics	r0, r3
	adds	r0, r0, #3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L452:
	.align	2
.L451:
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
	.fpu softvfp
	.type	REW_rewindMenuEffect, %function
REW_rewindMenuEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L454
	@ sp needed
	bl	.L5
	ldr	r3, .L454+4
	movs	r1, #3
	ldr	r0, .L454+8
	bl	.L5
	movs	r3, #0
	str	r3, [r0, #80]
	str	r3, [r0, #84]
	movs	r0, #23
	pop	{r4}
	pop	{r1}
	bx	r1
.L455:
	.align	2
.L454:
	.word	LockGameLogic
	.word	ProcStart
	.word	.LANCHOR0
	.size	REW_rewindMenuEffect, .-REW_rewindMenuEffect
	.align	1
	.p2align 2,,3
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
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L457
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
	ldr	r3, .L457+4
	bl	.L5
	ldr	r3, .L457+8
	movs	r1, r0
	movs	r0, r6
	bl	.L5
	movs	r0, r4
	ldr	r3, .L457+12
	bl	.L5
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	movs	r1, #0
	ldr	r4, .L457+16
	rsbs	r3, r3, #0
	movs	r0, #0
	bl	.L103
	movs	r3, #128
	movs	r2, #70
	lsls	r3, r3, #3
	str	r0, [r5, #80]
	ldr	r1, [r0, #48]
	strh	r3, [r0, r2]
	ldr	r4, .L457+20
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
	ldr	r3, .L457+24
	bl	.L5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L458:
	.align	2
.L457:
	.word	GetUnit
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	GetUnitMapSpritePaletteIndex
	.word	MU_CreateInternal
	.word	-3073
	.word	MU_SetFacing
	.size	REW_displayActor, .-REW_displayActor
	.align	1
	.p2align 2,,3
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
	push	{r4, r5, r6, r7, lr}
	ldrb	r3, [r1]
	movs	r5, r0
	movs	r4, r2
	sub	sp, sp, #12
	cmp	r3, #2
	beq	.L464
	cmp	r3, #65
	beq	.L465
.L459:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L465:
	ldrb	r3, [r1, #1]
	lsls	r3, r3, #31
	bmi	.L466
	movs	r0, #27
	ldr	r3, .L467
	bl	.L5
	movs	r1, r0
.L463:
	movs	r0, r4
	ldr	r3, .L467+4
	bl	.L5
	b	.L459
.L464:
	ldrb	r0, [r1, #1]
	ldr	r3, .L467+8
	bl	.L5
	ldr	r3, [r0, #4]
	ldrb	r7, [r3, #4]
	ldr	r3, [r0]
	movs	r6, r0
	ldrh	r0, [r3]
	ldr	r3, .L467+12
	bl	.L5
	ldr	r3, .L467+4
	movs	r1, r0
	movs	r0, r4
	bl	.L5
	movs	r0, r4
	ldr	r3, .L467+16
	bl	.L5
	ldr	r3, .L467+20
	movs	r4, r0
	movs	r0, r6
	bl	.L5
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	movs	r1, #0
	ldr	r6, .L467+24
	rsbs	r3, r3, #0
	movs	r0, #0
	bl	.L11
	movs	r3, #128
	movs	r2, #70
	lsls	r3, r3, #3
	str	r0, [r5, #84]
	ldr	r1, [r0, #48]
	strh	r3, [r0, r2]
	ldr	r5, .L467+28
	ldrh	r2, [r1, #34]
	ands	r2, r5
	orrs	r3, r2
	movs	r2, #76
	strh	r3, [r1, #34]
	ldrh	r3, [r0, r2]
	adds	r4, r4, #43
	adds	r3, r3, #128
	lsls	r4, r4, #4
	adds	r4, r3, r4
	strh	r4, [r0, r2]
	adds	r2, r2, #2
	ldrh	r3, [r0, r2]
	adds	r3, r3, #129
	adds	r3, r3, #255
	strh	r3, [r0, r2]
	movs	r1, #4
	ldr	r3, .L467+32
	bl	.L5
	b	.L459
.L466:
	movs	r0, #51
	ldr	r3, .L467
	bl	.L5
	movs	r1, r0
	b	.L463
.L468:
	.align	2
.L467:
	.word	GetTerrainName
	.word	Text_DrawString
	.word	GetUnit
	.word	GetStringFromIndex
	.word	Text_GetXCursor
	.word	GetUnitMapSpritePaletteIndex
	.word	MU_CreateInternal
	.word	-3073
	.word	MU_SetFacing
	.size	REW_displayTarget, .-REW_displayTarget
	.align	1
	.p2align 2,,3
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
	movs	r5, r2
	movs	r2, #3
	movs	r6, r2
	ldr	r4, .L477
	movs	r3, r1
	ldrh	r1, [r1, #2]
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	ands	r6, r1
	tst	r2, r1
	beq	.L470
	adds	r1, r1, #4
	subs	r1, r1, r6
	lsls	r1, r1, #16
	lsrs	r1, r1, #16
.L470:
	ldrh	r2, [r0, #2]
	adds	r3, r3, r1
	adds	r0, r0, r2
	cmp	r3, r0
	sbcs	r0, r0, r0
	ands	r3, r0
	ldrb	r2, [r3]
	cmp	r2, #65
	beq	.L476
.L472:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L477+4
	bl	.L5
	ldr	r3, .L477+8
	movs	r1, r0
	movs	r0, r5
	bl	.L5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L476:
	ldrb	r2, [r3, #6]
	ldrb	r1, [r3, #5]
	ldrb	r0, [r3, #4]
	ldr	r3, .L477+12
	bl	.L5
	cmp	r0, #0
	bne	.L472
	ldr	r4, .L477+16
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	b	.L472
.L478:
	.align	2
.L477:
	.word	REW_combat
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	GetSpecificTrapAt
	.word	REW_obstacleDestroyed
	.size	REW_displayCombatVerb, .-REW_displayCombatVerb
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.global	__aeabi_uidivmod
	.global	__aeabi_idivmod
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC180:
	.ascii	".\000"
	.text
	.align	1
	.p2align 2,,3
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
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	mov	lr, r9
	movs	r3, #41
	push	{r7, lr}
	ldrb	r3, [r0, r3]
	movs	r7, r0
	sub	sp, sp, #12
	lsls	r2, r3, #30
	bpl	.LCB3526
	b	.L528	@long jump
.LCB3526:
	ldr	r2, .L540
	mov	r9, r2
	ldr	r2, .L540+4
	mov	r8, r2
.L480:
	lsls	r2, r3, #31
	bpl	.L485
	ldr	r2, .L540+8
	ldrb	r2, [r2, #15]
	cmp	r2, #64
	bne	.LCB3542
	b	.L506	@long jump
.LCB3542:
	subs	r2, r2, #128
	rsbs	r1, r2, #0
	adcs	r2, r2, r1
	lsls	r2, r2, #12
.L486:
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
.L485:
	movs	r2, #4
	movs	r4, r2
	ldr	r0, [r7, #92]
	ands	r4, r3
	tst	r2, r3
	bne	.LCB3570
	b	.L487	@long jump
.LCB3570:
	cmp	r0, #0
	bne	.LCB3572
	b	.L532	@long jump
.LCB3572:
.L488:
	movs	r2, #8
	movs	r4, r2
	ldr	r0, [r7, #96]
	ands	r4, r3
	tst	r2, r3
	bne	.LCB3581
	b	.L489	@long jump
.LCB3581:
.L539:
	cmp	r0, #0
	bne	.LCB3584
	b	.L533	@long jump
.LCB3584:
.L490:
	ldr	r3, .L540+12
	bl	.L5
	movs	r3, #0
	str	r3, [r7, #80]
	str	r3, [r7, #84]
	movs	r3, #160
	ldr	r4, .L540+16
	lsls	r3, r3, #3
	ldr	r5, .L540+20
	adds	r6, r4, r3
.L491:
	movs	r0, r4
	movs	r2, #48
	movs	r1, #0
	adds	r4, r4, #64
	bl	.L6
	cmp	r6, r4
	bne	.L491
	movs	r3, #41
	movs	r5, r7
	ldrb	r3, [r7, r3]
	adds	r5, r5, #48
	lsls	r2, r3, #27
	bpl	.L493
	adds	r5, r5, #8
.L493:
	movs	r2, #16
	eors	r3, r2
	movs	r2, #41
	movs	r0, r5
	strb	r3, [r7, r2]
	bl	.L9
	movs	r1, #2
	ldr	r3, .L540+24
	movs	r0, r5
	bl	.L5
	ldr	r2, [r7, #44]
	ldrb	r3, [r2, #4]
	adds	r4, r2, #4
	movs	r1, #3
	cmp	r3, #2
	beq	.L503
.L534:
	cmp	r3, #64
	beq	.L504
	movs	r0, r1
	ldrh	r3, [r4, #2]
	ands	r0, r3
	tst	r1, r3
	beq	.L501
	adds	r3, r3, #4
	subs	r3, r3, r0
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L501:
	adds	r3, r4, r3
	ldrh	r4, [r2, #2]
	adds	r4, r2, r4
	cmp	r3, r4
	sbcs	r4, r4, r4
	ands	r4, r3
	ldrb	r3, [r4]
	cmp	r3, #2
	bne	.L534
.L503:
	movs	r2, r5
	movs	r1, r4
	movs	r0, r7
	bl	REW_displayActor
	movs	r2, r5
	movs	r1, r4
	ldr	r0, [r7, #44]
	bl	REW_displayCombatVerb
	movs	r2, #3
	movs	r0, r2
	ldrh	r1, [r4, #2]
	ldr	r3, [r7, #44]
	ands	r0, r1
	tst	r2, r1
	bne	.L535
.L495:
	ldrh	r2, [r3, #2]
	adds	r1, r4, r1
	adds	r3, r3, r2
	cmp	r1, r3
	sbcs	r3, r3, r3
	movs	r2, r5
	ands	r1, r3
	movs	r0, r7
	bl	REW_displayTarget
	movs	r0, r5
	ldr	r1, .L540+28
	ldr	r3, .L540+32
	bl	.L5
	movs	r0, r5
	ldr	r1, .L540+36
	bl	.L10
.L497:
	movs	r0, #0
	ldr	r3, .L540+40
	bl	.L5
	add	sp, sp, #12
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L504:
	ldr	r3, .L540+8
	ldrb	r3, [r3, #15]
	cmp	r3, #0
	beq	.L498
	cmp	r3, #128
	bne	.L536
	movs	r1, #1
	movs	r0, r5
	ldr	r3, .L540+44
	bl	.L5
	ldr	r0, .L540+48
.L531:
	lsls	r0, r0, #16
	ldr	r3, .L540+52
	lsrs	r0, r0, #16
	bl	.L5
	ldr	r3, .L540+56
	movs	r1, r0
	movs	r0, r5
	bl	.L5
	movs	r0, r5
	ldr	r1, .L540+60
	bl	.L10
	b	.L497
.L528:
	movs	r4, r0
	ldr	r3, .L540+8
	ldrh	r5, [r3, #16]
	adds	r4, r4, #64
	lsls	r3, r5, #31
	bpl	.L482
	adds	r4, r4, #8
.L482:
	ldr	r3, .L540
	movs	r0, r4
	mov	r9, r3
	bl	.L5
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L540+64
	bl	.L5
	cmp	r5, #9
	ble	.L537
	cmp	r5, #99
	ble	.L538
.L484:
	ldr	r3, .L540+4
	ldr	r1, .L540+68
	movs	r0, r4
	mov	r8, r3
	bl	.L5
	movs	r2, #41
	movs	r1, #2
	ldrb	r3, [r7, r2]
	bics	r3, r1
	strb	r3, [r7, r2]
	b	.L480
.L535:
	adds	r1, r1, #4
	subs	r1, r1, r0
	lsls	r1, r1, #16
	lsrs	r1, r1, #16
	b	.L495
.L487:
	cmp	r0, #0
	bne	.LCB3797
	b	.L488	@long jump
.LCB3797:
	ldr	r3, .L540+72
	bl	.L5
	movs	r2, #8
	movs	r3, #41
	str	r4, [r7, #92]
	movs	r4, r2
	ldrb	r3, [r7, r3]
	ldr	r0, [r7, #96]
	ands	r4, r3
	tst	r2, r3
	beq	.LCB3808
	b	.L539	@long jump
.LCB3808:
.L489:
	cmp	r0, #0
	bne	.LCB3811
	b	.L490	@long jump
.LCB3811:
	ldr	r3, .L540+72
	bl	.L5
	str	r4, [r7, #96]
	b	.L490
.L536:
	movs	r1, #4
	movs	r0, r5
	ldr	r3, .L540+44
	bl	.L5
	ldr	r0, .L540+76
	b	.L531
.L498:
	ldr	r0, .L540+80
	b	.L531
.L506:
	movs	r2, #128
	lsls	r2, r2, #6
	b	.L486
.L537:
	movs	r1, #6
	movs	r0, r4
	ldr	r3, .L540+44
	bl	.L5
	movs	r1, r5
	movs	r0, r4
	ldr	r3, .L540+84
	bl	.L5
	b	.L484
.L532:
	movs	r3, #0
	str	r0, [sp, #4]
	str	r0, [sp]
	movs	r2, #0
	movs	r1, #0
	ldr	r0, .L540+88
	ldr	r4, .L540+92
	bl	.L103
	movs	r3, #41
	str	r0, [r7, #92]
	ldrb	r3, [r7, r3]
	b	.L488
.L533:
	str	r0, [sp, #4]
	str	r0, [sp]
	movs	r3, #0
	movs	r2, #0
	movs	r1, #0
	ldr	r0, .L540+96
	ldr	r4, .L540+92
	bl	.L103
	str	r0, [r7, #96]
	b	.L490
.L538:
	ldr	r3, .L540+100
	movs	r1, #10
	movs	r0, r5
	bl	.L5
	ldr	r6, .L540+84
	movs	r1, r0
	movs	r0, r4
	bl	.L11
	movs	r1, #16
	movs	r0, r4
	ldr	r3, .L540+44
	bl	.L5
	movs	r0, r5
	ldr	r3, .L540+104
	movs	r1, #10
	bl	.L5
	movs	r0, r4
	bl	.L11
	b	.L484
.L541:
	.align	2
.L540:
	.word	Text_Clear
	.word	Text_Display
	.word	gChapterData
	.word	MU_EndAll
	.word	gBg0MapBuffer
	.word	memset
	.word	Text_SetXCursor
	.word	.LC180
	.word	Text_DrawChar
	.word	gBg0MapBuffer+138
	.word	EnableBgSyncByIndex
	.word	Text_Advance
	.word	REW_phaseRed
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	gBg0MapBuffer+140
	.word	Text_SetColorId
	.word	gBg0MapBuffer+118
	.word	EndProc
	.word	REW_phaseGreen
	.word	REW_phaseBlue
	.word	Text_DrawNumber
	.word	REW_upArrowAPDef
	.word	APProc_Create
	.word	REW_downArrowAPDef
	.word	__aeabi_idiv
	.word	__aeabi_idivmod
	.size	REW_refreshUI, .-REW_refreshUI
	.align	1
	.p2align 2,,3
	.global	REW_undo
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_undo, %function
REW_undo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #3
	push	{r3, r4, r5, r6, r7, lr}
	movs	r1, r2
	movs	r5, r0
	adds	r4, r0, #4
	ldrh	r3, [r4, #2]
	ldrh	r0, [r0, #2]
	ands	r1, r3
	adds	r0, r5, r0
	tst	r2, r3
	beq	.L543
.L572:
	adds	r3, r3, #4
	subs	r3, r3, r1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L543:
	adds	r3, r4, r3
	cmp	r3, r0
	bcs	.L544
.L573:
	cmp	r3, #0
	beq	.L544
	movs	r4, r3
	movs	r1, r2
	ldrh	r3, [r4, #2]
	ands	r1, r3
	tst	r2, r3
	bne	.L572
	adds	r3, r4, r3
	cmp	r3, r0
	bcc	.L573
.L544:
	ldr	r6, .L576
	ldr	r7, .L576+4
	b	.L563
.L575:
	cmp	r3, #2
	beq	.L548
	cmp	r3, #64
	bne	.L550
	movs	r0, r4
	bl	REW_undoPhaseChange
.L550:
	movs	r1, r4
	movs	r0, r5
	bl	REW_prevEntry
	subs	r4, r0, #0
	beq	.L574
.L563:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L546
	bls	.L575
	cmp	r3, #66
	beq	.L548
	subs	r3, r3, #67
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, #1
	bhi	.L550
	ldrb	r0, [r4, #1]
	bl	.L11
	cmp	r0, #0
	beq	.L550
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L550
	bl	.L7
	movs	r1, r4
	movs	r0, r5
	bl	REW_prevEntry
	subs	r4, r0, #0
	bne	.L563
.L574:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L548:
	movs	r0, r4
	bl	REW_undoCombat
	b	.L550
.L546:
	movs	r0, r4
	bl	REW_undoObstacleCombat
	b	.L550
.L577:
	.align	2
.L576:
	.word	GetUnit
	.word	ClearUnit
	.size	REW_undo, .-REW_undo
	.align	1
	.p2align 2,,3
	.global	REW_redo
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_redo, %function
REW_redo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r5, r0
	movs	r6, #3
	ldr	r7, .L598
	adds	r4, r0, #4
	b	.L586
.L597:
	cmp	r3, #2
	beq	.L581
	cmp	r3, #64
	bne	.L583
	movs	r0, r4
	bl	REW_redoPhaseChange
.L583:
	movs	r2, r6
	ldrh	r3, [r4, #2]
	ands	r2, r3
	tst	r6, r3
	beq	.L584
	adds	r3, r3, #4
	subs	r3, r3, r2
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L584:
	adds	r4, r4, r3
	ldrh	r3, [r5, #2]
	adds	r3, r5, r3
	cmp	r4, r3
	bcs	.L578
	cmp	r4, #0
	beq	.L578
.L586:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L579
	bls	.L597
	cmp	r3, #66
	beq	.L581
	subs	r3, r3, #67
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, #1
	bhi	.L583
	adds	r0, r4, #4
	bl	.L7
	b	.L583
.L581:
	movs	r0, r4
	bl	REW_redoCombat
	b	.L583
.L579:
	movs	r0, r4
	bl	REW_redoObstacleCombat
	b	.L583
.L578:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L599:
	.align	2
.L598:
	.word	LoadUnit
	.size	REW_redo, .-REW_redo
	.align	1
	.p2align 2,,3
	.global	REW_handleInput
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_handleInput, %function
REW_handleInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r3, .L632
	ldr	r5, .L632+4
	ldrh	r3, [r3, #6]
	movs	r4, r0
	ldrb	r7, [r5, #15]
	ldrh	r6, [r5, #16]
	lsls	r2, r3, #25
	bpl	.L601
	movs	r2, #41
	ldrb	r2, [r0, r2]
	lsls	r2, r2, #29
	bpl	.L601
	movs	r3, #65
	ldrb	r3, [r5, r3]
	lsls	r3, r3, #30
	bpl	.L626
.L602:
	ldr	r0, [r4, #44]
	bl	REW_undo
	ldrb	r3, [r5, #15]
	cmp	r3, r7
	beq	.L627
	movs	r3, #41
	movs	r2, #1
	ldrb	r3, [r4, r3]
	orrs	r3, r2
.L604:
	ldrh	r2, [r5, #16]
	cmp	r2, r6
	beq	.L605
	movs	r2, #2
	orrs	r3, r2
.L605:
	ldr	r2, [r4, #44]
	ldrh	r1, [r2]
	subs	r2, r2, r1
	str	r2, [r4, #44]
	ldrh	r2, [r2]
	cmp	r2, #0
	beq	.L628
.L606:
	movs	r2, #8
.L625:
	orrs	r3, r2
	movs	r2, #41
	movs	r0, r4
	strb	r3, [r4, r2]
	bl	REW_refreshUI
	ldr	r3, .L632+8
	bl	.L5
	ldr	r3, .L632+12
	bl	.L5
.L600:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L601:
	lsls	r3, r3, #24
	bpl	.L600
	movs	r3, #41
	ldrb	r3, [r4, r3]
	lsls	r3, r3, #28
	bpl	.L600
	movs	r3, #65
	ldrb	r3, [r5, r3]
	lsls	r3, r3, #30
	bpl	.L629
.L608:
	ldr	r0, [r4, #44]
	ldrh	r3, [r0, #2]
	adds	r0, r0, r3
	str	r0, [r4, #44]
	bl	REW_redo
	ldrb	r3, [r5, #15]
	cmp	r3, r7
	beq	.L630
	movs	r3, #41
	movs	r2, #1
	ldrb	r3, [r4, r3]
	orrs	r3, r2
.L610:
	ldrh	r2, [r5, #16]
	cmp	r2, r6
	beq	.L611
	movs	r2, #2
	orrs	r3, r2
.L611:
	ldr	r2, .L632+16
	ldr	r2, [r2]
	ldr	r1, [r4, #44]
	ldr	r2, [r2, #4]
	cmp	r1, r2
	bcs	.L631
	movs	r2, #4
	b	.L625
.L628:
	adds	r2, r2, #4
	bics	r3, r2
	b	.L606
.L627:
	movs	r3, #41
	ldrb	r3, [r4, r3]
	b	.L604
.L626:
	movs	r0, #102
	ldr	r3, .L632+20
	bl	.L5
	b	.L602
.L631:
	movs	r2, #8
	bics	r3, r2
	movs	r2, #4
	b	.L625
.L630:
	movs	r3, #41
	ldrb	r3, [r4, r3]
	b	.L610
.L629:
	movs	r0, #102
	ldr	r3, .L632+20
	bl	.L5
	b	.L608
.L633:
	.align	2
.L632:
	.word	gKeyState
	.word	gChapterData
	.word	RefreshEntityBmMaps
	.word	SMS_UpdateFromGameData
	.word	REW_rewindBuffer
	.word	m4aSongNumStart
	.size	REW_handleInput, .-REW_handleInput
	.global	REW_procScr
	.section	.rodata.str1.4
	.align	2
.LC201:
	.ascii	"REW_proc\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	REW_procScr, %object
	.size	REW_procScr, 96
REW_procScr:
	.short	1
	.short	0
	.word	.LC201
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
.L5:
	bx	r3
.L103:
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
.L127:
	bx	fp
