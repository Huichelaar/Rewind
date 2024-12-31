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
	ldr	r3, .L28
	@ sp needed
	bl	.L4
	ldr	r3, .L28+4
	movs	r1, #3
	ldr	r0, .L28+8
	bl	.L4
	movs	r3, #0
	str	r3, [r0, #80]
	str	r3, [r0, #84]
	movs	r0, #23
	pop	{r4}
	pop	{r1}
	bx	r1
.L29:
	.align	2
.L28:
	.word	LockGameLogic
	.word	ProcStart
	.word	.LANCHOR0
	.size	REW_rewindMenuEffect, .-REW_rewindMenuEffect
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
	ldr	r3, .L32
	@ sp needed
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r0, r3
	sbcs	r0, r0, r0
	rsbs	r0, r0, #0
	bx	lr
.L33:
	.align	2
.L32:
	.word	REW_rewindBuffer
	.size	REW_isRedoAvailable, .-REW_isRedoAvailable
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
	ldr	r3, .L35
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
	ldr	r3, .L35+4
	bl	.L4
	ldr	r3, .L35+8
	movs	r1, r0
	movs	r0, r6
	bl	.L4
	movs	r0, r4
	ldr	r3, .L35+12
	bl	.L4
	movs	r1, #0
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	ldr	r4, .L35+16
	movs	r0, r1
	rsbs	r3, r3, #0
	bl	.L37
	movs	r3, #128
	movs	r2, r0
	lsls	r3, r3, #3
	adds	r2, r2, #8
	str	r0, [r5, #80]
	ldr	r1, [r0, #48]
	strh	r3, [r2, #62]
	ldr	r4, .L35+20
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
	ldr	r3, .L35+24
	bl	.L4
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L36:
	.align	2
.L35:
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
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r3, .L39
	@ sp needed
	movs	r6, r0
	ldrb	r0, [r1, #1]
	movs	r4, r2
	bl	.L4
	ldr	r3, [r0, #4]
	ldrb	r7, [r3, #4]
	ldr	r3, [r0]
	movs	r5, r0
	ldrh	r0, [r3]
	ldr	r3, .L39+4
	bl	.L4
	ldr	r3, .L39+8
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r0, r4
	ldr	r3, .L39+12
	bl	.L4
	ldr	r3, .L39+16
	movs	r4, r0
	movs	r0, r5
	bl	.L4
	movs	r1, #0
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	ldr	r5, .L39+20
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
	ldr	r5, .L39+24
	ldrh	r2, [r1, #34]
	ands	r2, r5
	orrs	r3, r2
	movs	r2, r0
	strh	r3, [r1, #34]
	adds	r2, r2, #76
	ldrh	r3, [r2]
	adds	r4, r4, #43
	adds	r3, r3, #128
	lsls	r4, r4, #4
	adds	r4, r4, r3
	ldrh	r3, [r2, #2]
	adds	r3, r3, #129
	adds	r3, r3, #255
	strh	r3, [r2, #2]
	movs	r1, #4
	strh	r4, [r2]
	ldr	r3, .L39+28
	bl	.L4
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L40:
	.align	2
.L39:
	.word	GetUnit
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	Text_GetXCursor
	.word	GetUnitMapSpritePaletteIndex
	.word	MU_CreateInternal
	.word	-3073
	.word	MU_SetFacing
	.size	REW_displayTarget, .-REW_displayTarget
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
	ldr	r3, .L42
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	ldr	r0, .L42+4
	lsls	r3, r3, #20
	lsls	r0, r0, #16
	adds	r4, r4, r3
	lsrs	r0, r0, #16
	ldr	r3, .L42+8
	bl	.L4
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L43:
	.align	2
.L42:
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
	ldr	r4, .L45
	@ sp needed
	ldr	r3, [r4]
	strh	r2, [r3]
	strh	r2, [r3, #2]
	bl	REW_findCurSequence
	movs	r2, #4
	movs	r1, r0
	ldr	r3, .L45+4
	movs	r0, r4
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L46:
	.align	2
.L45:
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
	ldr	r3, .L48
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	ldr	r0, .L48+4
	lsls	r3, r3, #20
	lsls	r0, r0, #16
	adds	r4, r4, r3
	lsrs	r0, r0, #16
	ldr	r3, .L48+8
	bl	.L4
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L49:
	.align	2
.L48:
	.word	gSaveBlockDecl
	.word	EMS_CHUNK_REWIND_BUF
	.word	MS_FindSuspendSaveChunk
	.size	REW_findRewindBuf, .-REW_findRewindBuf
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
	ldr	r3, .L53
	ldr	r4, [r3]
	bl	REW_findRewindBuf
	movs	r2, #4
	add	r1, sp, #4
	bl	.L37
	ldr	r3, [sp, #4]
	movs	r0, #1
	cmp	r3, #0
	bne	.L51
	adds	r0, r0, #2
.L51:
	@ sp needed
	pop	{r1, r2, r4}
	pop	{r1}
	bx	r1
.L54:
	.align	2
.L53:
	.word	ReadSramFast
	.size	REW_rewindMenuUsability, .-REW_rewindMenuUsability
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
	ldr	r3, .L56
	add	r0, sp, #4
	bl	.L4
	add	sp, sp, #12
	@ sp needed
	pop	{r0}
	bx	r0
.L57:
	.align	2
.L56:
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
	ldr	r3, .L63
	movs	r4, r0
	ldrb	r0, [r3, #15]
	ldr	r3, .L63+4
	bl	.L4
	cmp	r0, #0
	beq	.L59
	movs	r2, #2
	ldr	r3, .L63+8
	movs	r0, #3
	strb	r2, [r3, #22]
	ldr	r3, .L63+12
	bl	.L4
.L59:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L63+16
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L64:
	.align	2
.L63:
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
	ldr	r3, .L66
	movs	r2, r1
	ldr	r3, [r3]
	add	r1, sp, #4
	bl	.L4
	mov	r2, sp
	ldrb	r2, [r2, #4]
	ldr	r3, .L66+4
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
.L67:
	.align	2
.L66:
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
	ldr	r3, .L69
	movs	r2, r1
	ldrh	r1, [r3]
	strb	r1, [r4, #4]
	ldrh	r3, [r3, #2]
	movs	r1, r0
	strb	r3, [r4, #5]
	add	r0, sp, #4
	ldr	r3, .L69+4
	bl	.L4
	pop	{r0, r1, r4}
	pop	{r0}
	bx	r0
.L70:
	.align	2
.L69:
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
	ldr	r3, .L72
	ldr	r1, .L72+4
	ldr	r3, [r3]
	ldr	r1, [r1]
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L73:
	.align	2
.L72:
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
	ldr	r3, .L76
	ldrb	r3, [r3, #22]
	movs	r2, r1
	cmp	r3, #1
	bne	.L74
	ldr	r3, .L76+4
	movs	r1, r0
	ldr	r0, [r3]
	ldr	r3, .L76+8
	bl	.L4
.L74:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L77:
	.align	2
.L76:
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
	ldr	r3, .L79
	ldr	r1, .L79+4
	ldr	r3, [r3]
	ldr	r1, [r1]
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L80:
	.align	2
.L79:
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
	ldr	r1, .L91
	lsls	r1, r1, #16
	lsrs	r1, r1, #16
	bl	REW_loadRewind
	ldr	r3, .L91+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L82
	movs	r0, r4
	ldr	r3, .L91+8
	bl	.L4
.L81:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L82:
	ldr	r0, [r3, #4]
	movs	r3, #2
	str	r0, [r4, #44]
	adds	r4, r4, #41
	strb	r3, [r4]
	ldrh	r3, [r0]
	cmp	r3, #0
	beq	.L84
	movs	r3, #6
	strb	r3, [r4]
.L84:
	bl	REW_isRedoAvailable
	cmp	r0, #0
	beq	.L81
	movs	r3, #8
	ldrb	r2, [r4]
	orrs	r3, r2
	strb	r3, [r4]
	b	.L81
.L92:
	.align	2
.L91:
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
	ldr	r6, .L103
	str	r0, [sp, #4]
	ldr	r3, [r6]
	ldrh	r3, [r3, #2]
	movs	r5, r1
	cmp	r3, #0
	beq	.L93
	movs	r7, #8
	ldr	r3, .L103+4
	ldrb	r3, [r3, #22]
	bics	r3, r7
	cmp	r3, #1
	beq	.L93
	bl	REW_loadRewind
	ldr	r3, .L103+8
	ldr	r4, [r3]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L95
	ldr	r3, [r4, #4]
	ldrh	r3, [r3, #2]
.L96:
	ldr	r2, [r4]
	adds	r7, r4, r2
	ldr	r1, [r6]
	strh	r3, [r7]
	ldrh	r3, [r1, #2]
	str	r3, [sp]
	strh	r3, [r7, #2]
	ldrh	r2, [r1, #2]
	ldr	r3, .L103+12
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
	ldr	r3, .L103+16
	str	r7, [r4, #4]
	ldr	r1, [sp, #4]
	bl	.L4
	movs	r2, #0
	ldr	r3, [r6]
	strh	r2, [r3, #2]
.L93:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L95:
	str	r7, [r4]
	b	.L96
.L104:
	.align	2
.L103:
	.word	REW_curSequence
	.word	gActionData
	.word	REW_rewindBuffer
	.word	memcpy
	.word	WriteAndVerifySramFast
	.size	REW_saveRewind, .-REW_saveRewind
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
	bne	.L107
	adds	r3, r3, #4
	strh	r3, [r0, #2]
.L107:
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
	beq	.L111
	adds	r3, r0, #4
	subs	r3, r3, r4
	lsls	r0, r3, #16
	lsrs	r0, r0, #16
.L111:
	adds	r0, r2, r0
	@ sp needed
	pop	{r4}
	pop	{r1}
	bx	r1
	.size	REW_nextEntry, .-REW_nextEntry
	.align	1
	.global	REW_redo
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_redo, %function
REW_redo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #28
	str	r0, [sp, #20]
	ldrh	r3, [r1, #2]
	adds	r3, r1, r3
	str	r3, [sp, #16]
	movs	r3, #1
	str	r3, [sp, #4]
	adds	r5, r1, #4
.L116:
	ldr	r3, [sp, #16]
	cmp	r5, r3
	bcc	.L126
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L126:
	ldrb	r3, [r5]
	cmp	r3, #64
	beq	.L117
	cmp	r3, #65
	beq	.L118
	cmp	r3, #2
	bne	.L119
.L118:
	ldrb	r0, [r5, #1]
	ldr	r3, .L145
	bl	.L4
	subs	r4, r0, #0
	beq	.L116
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L116
	movs	r3, #16
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #8]
	movs	r3, #17
	movs	r7, #0
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #12]
	adds	r6, r5, #4
.L121:
	ldrh	r2, [r5, #2]
	subs	r2, r2, #4
	lsrs	r3, r2, #31
	adds	r3, r3, r2
	asrs	r3, r3, #1
	cmp	r3, r7
	bgt	.L125
	ldr	r1, .L145+4
	ldr	r3, [sp, #12]
	ldr	r2, [r1]
	lsls	r3, r3, #2
	ldr	r3, [r3, r2]
	movs	r2, #0
	ldr	r0, [sp, #8]
	strb	r2, [r3, r0]
	movs	r3, #17
	ldr	r0, [r1]
	movs	r1, #16
	ldrsb	r3, [r4, r3]
	lsls	r3, r3, #2
	ldr	r3, [r3, r0]
	ldrsb	r1, [r4, r1]
	ldrb	r0, [r4, #11]
	strb	r0, [r3, r1]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	beq	.L119
	movs	r3, #2
	ldr	r1, [r4, #12]
	orrs	r3, r1
	str	r3, [r4, #12]
	str	r2, [sp, #4]
	b	.L119
.L117:
	movs	r2, #1
	movs	r6, #63
	ldr	r3, [sp, #20]
	adds	r3, r3, #41
	ldrb	r4, [r3]
	orrs	r2, r4
	strb	r2, [r3]
	ldrb	r0, [r5, #1]
	ldr	r1, .L145+8
	lsls	r2, r0, #4
	bics	r2, r6
	strb	r2, [r1, #15]
	lsls	r2, r0, #27
	bpl	.L119
	movs	r2, #3
	ldrh	r0, [r1, #16]
	orrs	r2, r4
	adds	r0, r0, #1
	strh	r0, [r1, #16]
	strb	r2, [r3]
.L119:
	movs	r0, r5
	bl	REW_nextEntry
	movs	r5, r0
	b	.L116
.L125:
	ldrb	r3, [r6]
	cmp	r3, #71
	bhi	.L122
	ldrb	r2, [r4, r3]
	ldrb	r1, [r6, #1]
	adds	r2, r2, r1
	strb	r2, [r4, r3]
.L123:
	adds	r7, r7, #1
	adds	r6, r6, #2
	b	.L121
.L122:
	cmp	r3, #87
	bhi	.L124
	ldr	r3, [r4]
	ldrb	r0, [r3, #4]
	ldr	r3, .L145+12
	bl	.L4
	ldrb	r3, [r6]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r6, #1]
	adds	r2, r2, r1
	strb	r2, [r0, r3]
	b	.L123
.L124:
	cmp	r3, #88
	bne	.L123
	ldr	r3, .L145+16
	ldrb	r0, [r4, #28]
	bl	.L4
	ldrb	r2, [r6, #1]
	ldrb	r3, [r0, #6]
	adds	r3, r3, r2
	strb	r3, [r0, #6]
	b	.L123
.L146:
	.align	2
.L145:
	.word	GetUnit
	.word	gMapUnit
	.word	gChapterData
	.word	BWL_GetEntry
	.word	GetTrap
	.size	REW_redo, .-REW_redo
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.global	__aeabi_uidivmod
	.global	__aeabi_idivmod
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC98:
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
	bpl	.L148
	movs	r4, r0
	ldr	r3, .L192
	ldrh	r7, [r3, #16]
	adds	r4, r4, #64
	lsls	r3, r7, #31
	bpl	.L150
	adds	r4, r4, #8
.L150:
	movs	r0, r4
	ldr	r3, .L192+4
	bl	.L4
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L192+8
	bl	.L4
	cmp	r7, #9
	bgt	.L151
	movs	r1, #6
	movs	r0, r4
	ldr	r3, .L192+12
	bl	.L4
	movs	r1, r7
.L189:
	movs	r0, r4
	ldr	r3, .L192+16
	bl	.L4
.L152:
	ldr	r3, .L192+20
	movs	r0, r4
	ldr	r1, .L192+24
	bl	.L4
	movs	r2, #2
	ldrb	r3, [r6]
	bics	r3, r2
	strb	r3, [r6]
.L148:
	ldrb	r1, [r6]
	lsls	r3, r1, #31
	bpl	.L153
	ldr	r3, .L192
	ldrb	r3, [r3, #15]
	cmp	r3, #64
	beq	.L170
	subs	r3, r3, #128
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	lsls	r3, r3, #12
.L154:
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
.L153:
	ldrb	r2, [r6]
	movs	r3, #4
	movs	r4, r2
	ldr	r1, [r5, #92]
	ands	r4, r3
	tst	r2, r3
	beq	.L155
	cmp	r1, #0
	bne	.L156
	movs	r3, r1
	movs	r2, r1
	str	r1, [sp, #4]
	str	r1, [sp]
	ldr	r0, .L192+28
	ldr	r4, .L192+32
	bl	.L37
	str	r0, [r5, #92]
.L156:
	ldrb	r2, [r6]
	movs	r3, #8
	movs	r4, r2
	ldr	r1, [r5, #96]
	ands	r4, r3
	tst	r2, r3
	beq	.L157
	cmp	r1, #0
	bne	.L158
	movs	r3, r1
	movs	r2, r1
	str	r1, [sp, #4]
	str	r1, [sp]
	ldr	r0, .L192+36
	ldr	r4, .L192+32
	bl	.L37
	str	r0, [r5, #96]
.L158:
	movs	r4, #0
	ldr	r3, .L192+40
	bl	.L4
	str	r4, [r5, #80]
	str	r4, [r5, #84]
.L159:
	ldr	r3, .L192+44
	lsls	r0, r4, #6
	adds	r0, r0, r3
	movs	r2, #48
	movs	r1, #0
	ldr	r3, .L192+48
	adds	r4, r4, #1
	bl	.L4
	cmp	r4, #20
	bne	.L159
	movs	r4, r5
	movs	r3, #16
	ldrb	r2, [r6]
	adds	r4, r4, #48
	tst	r2, r3
	beq	.L161
	adds	r4, r4, #8
.L161:
	eors	r3, r2
	strb	r3, [r6]
	movs	r0, r4
	ldr	r3, .L192+4
	bl	.L4
	ldr	r3, .L192+52
	movs	r1, #2
	movs	r0, r4
	bl	.L4
	ldr	r3, [r5, #44]
	adds	r6, r3, #4
.L162:
	ldrb	r3, [r6]
	cmp	r3, #2
	beq	.L167
	cmp	r3, #64
	beq	.L168
	movs	r0, r6
	bl	REW_nextEntry
	movs	r6, r0
	b	.L162
.L151:
	cmp	r7, #99
	bgt	.L152
	ldr	r3, .L192+56
	movs	r1, #10
	movs	r0, r7
	bl	.L4
	ldr	r3, .L192+16
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r1, #16
	movs	r0, r4
	ldr	r3, .L192+12
	bl	.L4
	movs	r0, r7
	ldr	r3, .L192+60
	movs	r1, #10
	bl	.L4
	b	.L189
.L170:
	movs	r3, #128
	lsls	r3, r3, #6
	b	.L154
.L155:
	cmp	r1, #0
	beq	.L156
	movs	r0, r1
	ldr	r3, .L192+64
	bl	.L4
	str	r4, [r5, #92]
	b	.L156
.L157:
	cmp	r1, #0
	beq	.L158
	movs	r0, r1
	ldr	r3, .L192+64
	bl	.L4
	str	r4, [r5, #96]
	b	.L158
.L167:
	movs	r2, r4
	movs	r1, r6
	movs	r0, r5
	bl	REW_displayActor
	ldr	r0, .L192+68
	lsls	r0, r0, #16
	ldr	r3, .L192+72
	lsrs	r0, r0, #16
	bl	.L4
	ldr	r3, .L192+76
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r0, r6
	bl	REW_nextEntry
	movs	r2, r4
	movs	r1, r0
	movs	r0, r5
	bl	REW_displayTarget
	ldr	r1, .L192+80
	movs	r0, r4
	ldr	r3, .L192+84
	bl	.L4
	ldr	r1, .L192+88
.L191:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L192+20
	bl	.L4
	movs	r0, #0
	ldr	r3, .L192+92
	bl	.L4
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L168:
	ldr	r3, .L192
	ldrb	r2, [r3, #15]
	ldr	r7, .L192+72
	ldr	r6, .L192+76
	ldr	r5, .L192+96
	ldr	r0, .L192+100
	cmp	r2, #0
	beq	.L190
	ldr	r3, .L192+12
	cmp	r2, #128
	beq	.L165
	movs	r1, #4
	movs	r0, r4
	bl	.L4
	ldr	r0, .L192+104
	b	.L190
.L165:
	movs	r1, #1
	movs	r0, r4
	bl	.L4
	ldr	r0, .L192+108
.L190:
	lsls	r0, r0, #16
	lsrs	r0, r0, #16
	bl	.L6
	movs	r1, r0
	movs	r0, r4
	bl	.L7
	movs	r1, r5
	b	.L191
.L193:
	.align	2
.L192:
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
	.word	REW_combat
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	.LC98
	.word	Text_DrawChar
	.word	gBg0MapBuffer+138
	.word	EnableBgSyncByIndex
	.word	gBg0MapBuffer+140
	.word	REW_phaseBlue
	.word	REW_phaseGreen
	.word	REW_phaseRed
	.size	REW_refreshUI, .-REW_refreshUI
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
	bne	.L196
	movs	r4, #0
	b	.L194
.L197:
	movs	r0, r5
	bl	REW_nextEntry
	movs	r4, r5
	movs	r5, r0
.L196:
	cmp	r5, r6
	bne	.L197
.L194:
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
.L200:
	cmp	r5, r4
	bcc	.L201
	@ sp needed
	movs	r0, r2
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L201:
	movs	r0, r5
	bl	REW_nextEntry
	movs	r2, r5
	movs	r5, r0
	b	.L200
	.size	REW_lastEntry, .-REW_lastEntry
	.align	1
	.global	REW_undo
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_undo, %function
REW_undo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #28
	str	r0, [sp, #20]
	movs	r0, r1
	movs	r7, r1
	bl	REW_lastEntry
	movs	r3, #0
	movs	r5, r0
	str	r3, [sp, #8]
.L203:
	cmp	r5, #0
	bne	.L213
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L213:
	ldrb	r3, [r5]
	cmp	r3, #64
	beq	.L204
	cmp	r3, #65
	beq	.L205
	cmp	r3, #2
	bne	.L206
.L205:
	ldrb	r0, [r5, #1]
	ldr	r3, .L230
	bl	.L4
	subs	r4, r0, #0
	beq	.L203
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L203
	movs	r3, #16
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #12]
	movs	r3, #17
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #16]
	movs	r3, #0
	str	r3, [sp, #4]
	adds	r6, r5, #4
.L208:
	ldrh	r2, [r5, #2]
	subs	r2, r2, #4
	lsrs	r3, r2, #31
	adds	r3, r3, r2
	ldr	r2, [sp, #4]
	asrs	r3, r3, #1
	cmp	r3, r2
	bgt	.L212
	ldr	r2, .L230+4
	ldr	r3, [sp, #16]
	ldr	r1, [r2]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	movs	r1, #0
	ldr	r0, [sp, #12]
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
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L214
	movs	r3, #66
	ldr	r2, [r4, #12]
	bics	r2, r3
	str	r2, [r4, #12]
	b	.L206
.L204:
	movs	r2, #1
	ldr	r3, [sp, #20]
	adds	r3, r3, #41
	ldrb	r4, [r3]
	orrs	r2, r4
	strb	r2, [r3]
	ldrb	r2, [r5, #1]
	ldr	r1, .L230+8
	lsls	r0, r2, #6
	strb	r0, [r1, #15]
	movs	r0, #16
	tst	r2, r0
	beq	.L206
	movs	r2, #3
	ldrh	r0, [r1, #16]
	orrs	r2, r4
	subs	r0, r0, #1
	strh	r0, [r1, #16]
	strb	r2, [r3]
.L206:
	movs	r1, r5
	movs	r0, r7
	bl	REW_prevEntry
	movs	r5, r0
	b	.L203
.L212:
	ldrb	r3, [r6]
	cmp	r3, #71
	bhi	.L209
	ldrb	r2, [r4, r3]
	ldrb	r1, [r6, #1]
	subs	r2, r2, r1
	strb	r2, [r4, r3]
.L210:
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	str	r3, [sp, #4]
	adds	r6, r6, #2
	b	.L208
.L209:
	cmp	r3, #87
	bhi	.L211
	ldr	r3, [r4]
	ldrb	r0, [r3, #4]
	ldr	r3, .L230+12
	bl	.L4
	ldrb	r3, [r6]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r6, #1]
	subs	r2, r2, r1
	strb	r2, [r0, r3]
	b	.L210
.L211:
	cmp	r3, #88
	bne	.L210
	ldr	r3, .L230+16
	ldrb	r0, [r4, #28]
	bl	.L4
	ldrb	r2, [r6, #1]
	ldrb	r3, [r0, #6]
	subs	r3, r3, r2
	strb	r3, [r0, #6]
	b	.L210
.L214:
	movs	r3, #1
	str	r3, [sp, #8]
	b	.L206
.L231:
	.align	2
.L230:
	.word	GetUnit
	.word	gMapUnit
	.word	gChapterData
	.word	BWL_GetEntry
	.word	GetTrap
	.size	REW_undo, .-REW_undo
	.align	1
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L252
	ldrh	r3, [r3, #6]
	movs	r4, r0
	lsls	r2, r3, #25
	bpl	.L233
	movs	r5, r0
	adds	r5, r5, #41
	ldrb	r2, [r5]
	lsls	r2, r2, #29
	bpl	.L233
	ldr	r3, .L252+4
	adds	r3, r3, #65
	ldrb	r3, [r3]
	lsls	r3, r3, #30
	bmi	.L234
	movs	r0, #102
	ldr	r3, .L252+8
	bl	.L4
.L234:
	movs	r0, r4
	ldr	r1, [r4, #44]
	bl	REW_undo
	ldr	r3, [r4, #44]
	ldrh	r2, [r3]
	subs	r3, r3, r2
	str	r3, [r4, #44]
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L235
	movs	r2, #4
	ldrb	r3, [r5]
	bics	r3, r2
	strb	r3, [r5]
.L235:
	movs	r3, #8
	ldrb	r2, [r5]
.L251:
	orrs	r3, r2
	strb	r3, [r5]
	movs	r0, r4
	bl	REW_refreshUI
	ldr	r3, .L252+12
	bl	.L4
.L232:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L233:
	lsls	r3, r3, #24
	bpl	.L232
	movs	r5, r4
	adds	r5, r5, #41
	ldrb	r3, [r5]
	lsls	r3, r3, #28
	bpl	.L232
	ldr	r3, .L252+4
	adds	r3, r3, #65
	ldrb	r3, [r3]
	lsls	r3, r3, #30
	bmi	.L237
	movs	r0, #102
	ldr	r3, .L252+8
	bl	.L4
.L237:
	ldr	r1, [r4, #44]
	ldrh	r3, [r1, #2]
	adds	r1, r1, r3
	movs	r0, r4
	str	r1, [r4, #44]
	bl	REW_redo
	ldr	r0, [r4, #44]
	bl	REW_isRedoAvailable
	cmp	r0, #0
	bne	.L238
	movs	r2, #8
	ldrb	r3, [r5]
	bics	r3, r2
	strb	r3, [r5]
.L238:
	movs	r3, #4
	ldrb	r2, [r5]
	b	.L251
.L253:
	.align	2
.L252:
	.word	gKeyState
	.word	gChapterData
	.word	m4aSongNumStart
	.word	SMS_UpdateFromGameData
	.size	REW_handleInput, .-REW_handleInput
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
	beq	.L254
	adds	r3, r3, #4
	subs	r3, r3, r1
	strh	r3, [r0, #2]
.L254:
	@ sp needed
	bx	lr
	.size	REW_alignSequence, .-REW_alignSequence
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
	beq	.L260
	subs	r4, r4, #64
	cmp	r0, #128
	beq	.L260
	movs	r4, #0
	ldrb	r3, [r1]
	adds	r3, r3, #1
	strb	r3, [r1]
.L260:
	movs	r0, r4
	ldr	r3, .L265
	bl	.L4
	cmp	r0, #0
	bne	.L261
	movs	r3, #1
	strb	r3, [r5]
.L261:
	@ sp needed
	movs	r0, r4
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L266:
	.align	2
.L265:
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #20
	add	r2, sp, #8
	strb	r3, [r2, #2]
	strb	r3, [r2, #3]
	ldr	r2, .L286
	ldr	r2, [r2]
	str	r2, [sp, #4]
	str	r3, [sp, #12]
	ldr	r2, .L286+4
	ldr	r1, [sp, #4]
	ldr	r3, .L286+8
	add	r0, sp, #12
	bl	.L4
	ldr	r4, .L286+12
	add	r3, sp, #8
	adds	r2, r3, #3
	adds	r1, r3, #2
	ldrb	r0, [r4, #15]
	bl	REW_nextPhase
	ldr	r7, .L286+16
	movs	r6, r0
	ldr	r0, [r7]
	bl	REW_createSeqEntry
	movs	r3, #64
	strb	r3, [r0]
	ldrb	r3, [r4, #15]
	lsrs	r2, r6, #4
	lsrs	r3, r3, #6
	orrs	r3, r2
	add	r2, sp, #8
	lsls	r3, r3, #24
	ldrb	r2, [r2, #2]
	lsrs	r3, r3, #24
	movs	r5, r0
	strb	r3, [r0, #1]
	cmp	r2, #0
	beq	.L268
	movs	r2, #16
	orrs	r3, r2
	strb	r3, [r0, #1]
.L268:
	add	r3, sp, #8
	ldrb	r3, [r3, #3]
	cmp	r3, #0
	beq	.L269
	movs	r3, #32
	ldrb	r2, [r5, #1]
	orrs	r3, r2
	strb	r3, [r5, #1]
.L269:
	adds	r4, r6, #1
	adds	r6, r6, #64
	lsls	r4, r4, #24
	lsls	r6, r6, #24
	lsrs	r4, r4, #24
	lsrs	r6, r6, #24
.L270:
	cmp	r6, r4
	bne	.L272
	movs	r3, #4
	ldr	r0, [r7]
	strh	r3, [r5, #2]
	ldrh	r2, [r0, #2]
	cmp	r2, #0
	bne	.L273
	strh	r3, [r0, #2]
.L273:
	ldrh	r3, [r0, #2]
	adds	r3, r3, #4
	strh	r3, [r0, #2]
	bl	REW_alignSequence
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L272:
	movs	r0, r4
	ldr	r3, .L286+20
	bl	.L4
	cmp	r0, #0
	beq	.L271
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L271
	movs	r3, #63
	movs	r1, #12
	ldr	r2, [sp, #4]
	ands	r3, r4
	lsls	r3, r3, #5
	strb	r1, [r2, r3]
	ldr	r1, [sp, #4]
	ldrb	r2, [r0, #12]
	adds	r3, r1, r3
	strb	r2, [r3, #1]
	movs	r2, #13
	strb	r2, [r3, #2]
	ldrb	r2, [r0, #13]
	strb	r2, [r3, #3]
	movs	r2, #19
	strb	r2, [r3, #4]
	ldrb	r2, [r0, #19]
	strb	r2, [r3, #5]
	movs	r2, #48
	strb	r2, [r3, #6]
	movs	r2, r0
	adds	r2, r2, #48
	ldrb	r2, [r2]
	strb	r2, [r3, #7]
	movs	r2, #49
	strb	r2, [r3, #8]
	movs	r2, r0
	adds	r2, r2, #49
	ldrb	r2, [r2]
	strb	r2, [r3, #9]
	movs	r2, #50
	strb	r2, [r3, #10]
	movs	r2, r0
	adds	r2, r2, #50
	ldrb	r2, [r2]
	strb	r2, [r3, #11]
	movs	r2, #51
	strb	r2, [r3, #12]
	movs	r2, r0
	adds	r2, r2, #51
	ldrb	r2, [r2]
	strb	r2, [r3, #13]
	movs	r2, #52
	strb	r2, [r3, #14]
	movs	r2, r0
	adds	r2, r2, #52
	ldrb	r2, [r2]
	strb	r2, [r3, #15]
	movs	r2, #53
	strb	r2, [r3, #16]
	movs	r2, r0
	adds	r2, r2, #53
	ldrb	r2, [r2]
	strb	r2, [r3, #17]
	movs	r2, #54
	strb	r2, [r3, #18]
	movs	r2, r0
	adds	r2, r2, #54
	ldrb	r2, [r2]
	strb	r2, [r3, #19]
	movs	r2, #55
	strb	r2, [r3, #20]
	movs	r2, r0
	adds	r2, r2, #55
	ldrb	r2, [r2]
	strb	r2, [r3, #21]
	movs	r2, #56
	strb	r2, [r3, #22]
	movs	r2, r0
	adds	r2, r2, #56
	ldrb	r2, [r2]
	strb	r2, [r3, #23]
	movs	r2, #11
	strb	r2, [r3, #24]
	ldrb	r1, [r0, #11]
	strb	r2, [r3, #26]
	strb	r1, [r3, #25]
	ldrb	r1, [r0, #11]
	strb	r2, [r3, #28]
	strb	r1, [r3, #27]
	ldrb	r1, [r0, #11]
	strb	r2, [r3, #30]
	strb	r1, [r3, #29]
	ldrb	r2, [r0, #11]
	strb	r2, [r3, #31]
.L271:
	adds	r4, r4, #1
	lsls	r4, r4, #24
	lsrs	r4, r4, #24
	b	.L270
.L287:
	.align	2
.L286:
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
	ldr	r3, .L309
	ldr	r3, [r3]
	ldrh	r2, [r3, #2]
	sub	sp, sp, #44
	cmp	r2, #0
	beq	.L288
	ldrb	r2, [r3, #4]
	cmp	r2, #64
	bne	.L288
	ldr	r2, .L309+4
	ldr	r2, [r2]
	str	r2, [sp, #24]
	movs	r2, #63
	adds	r4, r3, #4
	ldrb	r3, [r3, #5]
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
.L290:
	ldr	r3, [sp, #36]
	ldr	r2, [sp, #8]
	cmp	r3, r2
	bge	.L295
	ldr	r3, .L309
	ldr	r0, [r3]
	bl	REW_alignSequence
.L288:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L295:
	ldr	r3, [sp, #8]
	lsls	r7, r3, #24
	lsrs	r7, r7, #24
	movs	r0, r7
	ldr	r3, .L309+8
	bl	.L4
	subs	r6, r0, #0
	beq	.L291
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L291
	ldr	r3, .L309
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
.L294:
	ldr	r3, [sp]
	ldrb	r3, [r3]
	ldrb	r5, [r6, r3]
	str	r3, [sp, #20]
	ldr	r3, [sp]
	ldrb	r3, [r3, #1]
	subs	r5, r5, r3
	lsls	r5, r5, #24
	lsrs	r5, r5, #24
	beq	.L292
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L293
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
.L293:
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
.L292:
	ldr	r3, [sp]
	adds	r3, r3, #2
	str	r3, [sp]
	ldr	r2, [sp]
	ldr	r3, [sp, #32]
	cmp	r3, r2
	bne	.L294
.L291:
	ldr	r3, [sp, #8]
	adds	r3, r3, #1
	str	r3, [sp, #8]
	b	.L290
.L310:
	.align	2
.L309:
	.word	REW_curSequence
	.word	REW_rewindBuffer
	.word	GetUnit
	.size	REW_actionPostPhaseChange, .-REW_actionPostPhaseChange
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
	ldr	r3, .L363
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
	beq	.L312
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
.L312:
	movs	r1, #111
	ldrsb	r1, [r5, r1]
	cmp	r1, #0
	blt	.L313
	ldr	r3, .L363+4
	add	r0, sp, #32
	bl	.L4
.L313:
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
	ldr	r3, .L363+8
	bl	.L4
	movs	r0, r5
	ldr	r3, .L363+12
	bl	.L4
	cmp	r0, #0
	ble	.L314
	movs	r3, r5
	adds	r3, r3, #80
	ldrb	r3, [r3]
	adds	r4, r4, r3
	adds	r4, r4, #40
	strb	r0, [r4]
.L314:
	add	r4, sp, #32
	ldr	r3, .L363+16
	movs	r0, r4
	bl	.L4
	ldr	r3, .L363+20
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	beq	.L315
	ldr	r3, .L363+24
	bl	.L4
.L315:
	ldr	r3, [sp, #136]
	adds	r3, r3, #4
	str	r3, [sp, #4]
	ldrb	r3, [r4, #16]
	movs	r4, #0
	subs	r6, r3, r6
	lsls	r6, r6, #24
	lsrs	r6, r6, #24
	cmp	r6, r4
	beq	.L316
	movs	r3, #16
	ldr	r2, [sp, #136]
	strb	r3, [r2, #4]
	strb	r6, [r2, #5]
	adds	r4, r4, #1
.L316:
	add	r3, sp, #32
	ldrb	r3, [r3, #17]
	ldr	r2, [sp, #12]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L317
	ldr	r1, [sp, #4]
	lsls	r2, r4, #1
	adds	r2, r1, r2
	movs	r1, #17
	strb	r3, [r2, #1]
	strb	r1, [r2]
	adds	r4, r4, #1
.L317:
	movs	r2, #0
	add	r1, sp, #32
.L319:
	ldrb	r3, [r2, r1]
	ldrb	r0, [r7, r2]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L318
	ldr	r6, [sp, #4]
	lsls	r0, r4, #1
	adds	r0, r6, r0
	strb	r2, [r0]
	strb	r3, [r0, #1]
	adds	r4, r4, #1
.L318:
	adds	r2, r2, #1
	cmp	r2, #72
	bne	.L319
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L320
	movs	r3, r5
	adds	r3, r3, #72
	ldrh	r0, [r3]
	ldr	r3, .L363+28
	bl	.L4
	add	r3, sp, #32
	movs	r6, r0
	ldrb	r0, [r3, #28]
	ldr	r3, .L363+32
	bl	.L4
	ldrb	r0, [r0, #6]
	subs	r6, r6, r0
	lsls	r6, r6, #24
	lsrs	r6, r6, #24
	beq	.L320
	ldr	r2, [sp, #4]
	lsls	r3, r4, #1
	adds	r3, r2, r3
	movs	r2, #88
	strb	r6, [r3, #1]
	strb	r2, [r3]
	adds	r4, r4, #1
.L320:
	ldr	r3, [r7]
	ldrb	r0, [r3, #4]
	ldr	r3, .L363+36
	bl	.L4
	subs	r6, r0, #0
	beq	.L321
	movs	r2, #8
	ldr	r3, .L363
	add	r1, sp, #16
	bl	.L4
	movs	r2, #110
	ldrsb	r2, [r5, r2]
	cmp	r2, #0
	beq	.L322
	ldr	r3, [sp, #24]
	str	r3, [sp, #8]
	lsls	r3, r3, #8
	lsrs	r3, r3, #20
	adds	r3, r3, r2
	movs	r2, #250
	lsls	r2, r2, #4
	cmp	r3, r2
	ble	.L323
	movs	r3, r2
.L323:
	ldr	r2, [sp, #24]
	str	r2, [sp, #8]
	ldr	r1, [sp, #8]
	ldr	r2, .L363+40
	lsls	r3, r3, #20
	lsrs	r3, r3, #8
	ands	r2, r1
	orrs	r3, r2
	str	r3, [sp, #24]
.L322:
	ldr	r3, .L363+20
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	beq	.L324
	movs	r2, #250
	add	r3, sp, #16
	ldrh	r3, [r3, #12]
	lsls	r3, r3, #18
	lsrs	r3, r3, #20
	adds	r3, r3, #1
	lsls	r2, r2, #4
	cmp	r3, r2
	ble	.L325
	movs	r3, r2
.L325:
	add	r2, sp, #16
	ldrh	r2, [r2, #12]
	ldr	r1, .L363+44
	lsls	r3, r3, #20
	ands	r2, r1
	lsrs	r3, r3, #18
	orrs	r3, r2
	add	r2, sp, #16
	strh	r3, [r2, #12]
.L324:
	movs	r2, #0
.L327:
	add	r3, sp, #16
	ldrb	r3, [r2, r3]
	ldrb	r1, [r6, r2]
	subs	r3, r3, r1
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L326
	ldr	r0, [sp, #4]
	lsls	r1, r4, #1
	adds	r1, r0, r1
	movs	r0, r2
	adds	r0, r0, #72
	strb	r0, [r1]
	strb	r3, [r1, #1]
	adds	r4, r4, #1
.L326:
	adds	r2, r2, #1
	cmp	r2, #16
	bne	.L327
.L321:
	adds	r4, r4, #2
	ldr	r3, [sp, #136]
	lsls	r4, r4, #17
	lsrs	r4, r4, #16
	strh	r4, [r3, #2]
	ldr	r3, [sp, #132]
	ldrh	r3, [r3, #2]
	cmp	r3, #0
	bne	.L328
	ldr	r2, [sp, #132]
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L328:
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
.L364:
	.align	2
.L363:
	.word	CpuSet
	.word	SetUnitStatus
	.word	UnitCheckStatCaps
	.word	GetBattleUnitUpdatedWeaponExp
	.word	UnitRemoveInvalidItems
	.word	gBattleTarget
	.word	BattleApplyExpGains
	.word	GetItemUses
	.word	GetTrap
	.word	BWL_GetEntry
	.word	-16773121
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
	ldr	r4, .L374
	ldr	r3, .L374+4
	sub	sp, sp, #28
	ldr	r5, .L374+8
	ldrb	r0, [r4, #11]
	ldr	r6, [r3]
	bl	.L5
	ldr	r3, .L374+12
	str	r0, [sp, #16]
	ldrb	r0, [r3, #11]
	bl	.L5
	movs	r7, #2
	movs	r3, #4
	strb	r7, [r6, #4]
	strh	r3, [r6, #2]
	movs	r5, r0
	adds	r0, r6, r3
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #11]
	strb	r3, [r0, #1]
	movs	r3, #19
	ldrsb	r3, [r4, r3]
	cmp	r3, #0
	beq	.L366
	ldr	r2, .L374+16
	ldrh	r2, [r2]
	mov	ip, r2
	ldr	r3, [r4, #12]
	ldr	r1, .L374+20
	orrs	r3, r7
	str	r3, [r4, #12]
	ldrh	r3, [r1]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	str	r3, [sp, #20]
	movs	r2, #8
	mov	r3, ip
	str	r0, [sp, #8]
	str	r6, [sp, #4]
	ldrh	r1, [r1, #2]
	lsls	r1, r1, #24
	asrs	r1, r1, #24
	str	r1, [sp]
	ands	r2, r3
	movs	r1, r4
	ldr	r3, [sp, #20]
	ldr	r0, [sp, #16]
	bl	REW_storeCombatData
	ldr	r3, [r4, #12]
	bics	r3, r7
	str	r3, [r4, #12]
.L366:
	movs	r0, r6
	bl	REW_createSeqEntry
	movs	r3, #2
	strb	r3, [r0]
	ldrb	r3, [r5, #11]
	strb	r3, [r0, #1]
	movs	r3, #19
	ldr	r1, .L374+12
	ldrsb	r3, [r1, r3]
	cmp	r3, #0
	beq	.L365
	movs	r3, #16
	movs	r2, #17
	ldrsb	r3, [r5, r3]
	str	r0, [sp, #8]
	str	r6, [sp, #4]
	ldrsb	r2, [r5, r2]
	movs	r0, r5
	str	r2, [sp]
	movs	r2, #0
	bl	REW_storeCombatData
.L365:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L375:
	.align	2
.L374:
	.word	gBattleActor
	.word	REW_curSequence
	.word	GetUnit
	.word	gBattleTarget
	.word	gBattleStats
	.word	gActiveUnitMoveOrigin
	.size	REW_actionCombat, .-REW_actionCombat
	.global	REW_procScr
	.section	.rodata.str1.1
.LC142:
	.ascii	"REW_proc\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	REW_procScr, %object
	.size	REW_procScr, 96
REW_procScr:
	.short	1
	.short	0
	.word	.LC142
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
.L37:
	bx	r4
.L5:
	bx	r5
.L7:
	bx	r6
.L6:
	bx	r7
