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
	ldrb	r3, [r1]
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r6, r0
	movs	r4, r2
	cmp	r3, #2
	bne	.L39
	ldrb	r0, [r1, #1]
	ldr	r3, .L45
	bl	.L4
	ldr	r3, [r0, #4]
	ldrb	r7, [r3, #4]
	ldr	r3, [r0]
	movs	r5, r0
	ldrh	r0, [r3]
	ldr	r3, .L45+4
	bl	.L4
	ldr	r3, .L45+8
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r0, r4
	ldr	r3, .L45+12
	bl	.L4
	ldr	r3, .L45+16
	movs	r4, r0
	movs	r0, r5
	bl	.L4
	movs	r1, #0
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	ldr	r5, .L45+20
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
	ldr	r5, .L45+24
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
	ldr	r3, .L45+28
.L44:
	bl	.L4
.L38:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L39:
	cmp	r3, #66
	bne	.L38
	ldrb	r2, [r1, #1]
	movs	r0, #51
	ldr	r3, .L45+32
	lsls	r2, r2, #31
	bmi	.L43
	movs	r0, #27
.L43:
	bl	.L4
	ldr	r3, .L45+8
	movs	r1, r0
	movs	r0, r4
	b	.L44
.L46:
	.align	2
.L45:
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
.L49:
	lsls	r0, r4, #24
	ldr	r3, .L57
	lsrs	r0, r0, #24
	bl	.L4
	cmp	r0, #0
	beq	.L48
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L48
	movs	r3, #17
	ldr	r2, .L57+4
	ldr	r1, [r2]
	movs	r2, #16
	ldrsb	r3, [r0, r3]
	lsls	r3, r3, #2
	ldrsb	r2, [r0, r2]
	ldr	r3, [r3, r1]
	ldrb	r3, [r3, r2]
	cmp	r3, #34
	bne	.L48
	ldr	r3, [r0, #12]
	orrs	r3, r5
	str	r3, [r0, #12]
.L48:
	adds	r4, r4, #1
	cmp	r4, #192
	bne	.L49
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L58:
	.align	2
.L57:
	.word	GetUnit
	.word	gMapTerrain
	.size	REW_hideRoofedUnits, .-REW_hideRoofedUnits
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
	ldr	r3, .L60
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	ldr	r0, .L60+4
	lsls	r3, r3, #20
	lsls	r0, r0, #16
	adds	r4, r4, r3
	lsrs	r0, r0, #16
	ldr	r3, .L60+8
	bl	.L4
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L61:
	.align	2
.L60:
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
	ldr	r4, .L63
	@ sp needed
	ldr	r3, [r4]
	strh	r2, [r3]
	strh	r2, [r3, #2]
	bl	REW_findCurSequence
	movs	r2, #4
	movs	r1, r0
	ldr	r3, .L63+4
	movs	r0, r4
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L64:
	.align	2
.L63:
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
	ldr	r3, .L66
	push	{r4, lr}
	ldrh	r4, [r3, #12]
	@ sp needed
	movs	r3, #224
	ldr	r0, .L66+4
	lsls	r3, r3, #20
	lsls	r0, r0, #16
	adds	r4, r4, r3
	lsrs	r0, r0, #16
	ldr	r3, .L66+8
	bl	.L4
	ldrh	r0, [r0]
	adds	r0, r4, r0
	pop	{r4}
	pop	{r1}
	bx	r1
.L67:
	.align	2
.L66:
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
	ldr	r3, .L71
	ldr	r4, [r3]
	bl	REW_findRewindBuf
	movs	r2, #4
	add	r1, sp, #4
	bl	.L37
	ldr	r3, [sp, #4]
	movs	r0, #1
	cmp	r3, #0
	bne	.L69
	adds	r0, r0, #2
.L69:
	@ sp needed
	pop	{r1, r2, r4}
	pop	{r1}
	bx	r1
.L72:
	.align	2
.L71:
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
	ldr	r3, .L74
	add	r0, sp, #4
	bl	.L4
	add	sp, sp, #12
	@ sp needed
	pop	{r0}
	bx	r0
.L75:
	.align	2
.L74:
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
	ldr	r3, .L81
	movs	r4, r0
	ldrb	r0, [r3, #15]
	ldr	r3, .L81+4
	bl	.L4
	cmp	r0, #0
	beq	.L77
	movs	r2, #2
	ldr	r3, .L81+8
	movs	r0, #3
	strb	r2, [r3, #22]
	ldr	r3, .L81+12
	bl	.L4
.L77:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L81+16
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L82:
	.align	2
.L81:
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
	ldr	r3, .L84
	movs	r2, r1
	ldr	r3, [r3]
	add	r1, sp, #4
	bl	.L4
	mov	r2, sp
	ldrb	r2, [r2, #4]
	ldr	r3, .L84+4
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
.L85:
	.align	2
.L84:
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
	ldr	r3, .L87
	movs	r2, r1
	ldrh	r1, [r3]
	strb	r1, [r4, #4]
	ldrh	r3, [r3, #2]
	movs	r1, r0
	strb	r3, [r4, #5]
	add	r0, sp, #4
	ldr	r3, .L87+4
	bl	.L4
	pop	{r0, r1, r4}
	pop	{r0}
	bx	r0
.L88:
	.align	2
.L87:
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
	ldr	r3, .L90
	ldr	r1, .L90+4
	ldr	r3, [r3]
	ldr	r1, [r1]
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L91:
	.align	2
.L90:
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
	ldr	r3, .L94
	ldrb	r3, [r3, #22]
	movs	r2, r1
	cmp	r3, #1
	bne	.L92
	ldr	r3, .L94+4
	movs	r1, r0
	ldr	r0, [r3]
	ldr	r3, .L94+8
	bl	.L4
.L92:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L95:
	.align	2
.L94:
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
	ldr	r3, .L97
	ldr	r1, .L97+4
	ldr	r3, [r3]
	ldr	r1, [r1]
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L98:
	.align	2
.L97:
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
	ldr	r1, .L109
	lsls	r1, r1, #16
	lsrs	r1, r1, #16
	bl	REW_loadRewind
	ldr	r3, .L109+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L100
	movs	r0, r4
	ldr	r3, .L109+8
	bl	.L4
.L99:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L100:
	ldr	r0, [r3, #4]
	movs	r3, #2
	str	r0, [r4, #44]
	adds	r4, r4, #41
	strb	r3, [r4]
	ldrh	r3, [r0]
	cmp	r3, #0
	beq	.L102
	movs	r3, #6
	strb	r3, [r4]
.L102:
	bl	REW_isRedoAvailable
	cmp	r0, #0
	beq	.L99
	movs	r3, #8
	ldrb	r2, [r4]
	orrs	r3, r2
	strb	r3, [r4]
	b	.L99
.L110:
	.align	2
.L109:
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
	ldr	r6, .L121
	str	r0, [sp, #4]
	ldr	r3, [r6]
	ldrh	r3, [r3, #2]
	movs	r5, r1
	cmp	r3, #0
	beq	.L111
	movs	r7, #8
	ldr	r3, .L121+4
	ldrb	r3, [r3, #22]
	bics	r3, r7
	cmp	r3, #1
	beq	.L111
	bl	REW_loadRewind
	ldr	r3, .L121+8
	ldr	r4, [r3]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L113
	ldr	r3, [r4, #4]
	ldrh	r3, [r3, #2]
.L114:
	ldr	r2, [r4]
	adds	r7, r4, r2
	ldr	r1, [r6]
	strh	r3, [r7]
	ldrh	r3, [r1, #2]
	str	r3, [sp]
	strh	r3, [r7, #2]
	ldrh	r2, [r1, #2]
	ldr	r3, .L121+12
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
	ldr	r3, .L121+16
	str	r7, [r4, #4]
	ldr	r1, [sp, #4]
	bl	.L4
	movs	r2, #0
	ldr	r3, [r6]
	strh	r2, [r3, #2]
.L111:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L113:
	str	r7, [r4]
	b	.L114
.L122:
	.align	2
.L121:
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
	bne	.L125
	adds	r3, r3, #4
	strh	r3, [r0, #2]
.L125:
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
	beq	.L129
	adds	r3, r0, #4
	subs	r3, r3, r4
	lsls	r0, r3, #16
	lsrs	r0, r0, #16
.L129:
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
	adds	r4, r1, #4
.L134:
	ldr	r3, [sp, #16]
	cmp	r4, r3
	bcc	.L146
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L146:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L135
	bhi	.L136
	cmp	r3, #2
	beq	.L135
	cmp	r3, #64
	beq	.L137
.L138:
	movs	r0, r4
	bl	REW_nextEntry
	movs	r4, r0
	b	.L134
.L136:
	cmp	r3, #66
	bne	.L138
	ldr	r3, .L165
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
	bne	.L138
	ldr	r3, .L165+4
	bl	.L4
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L165+8
	bl	.L4
	lsls	r0, r0, #16
	movs	r2, r5
	movs	r1, r5
	ldr	r3, .L165+12
	lsrs	r0, r0, #16
	bl	.L4
	b	.L138
.L137:
	movs	r2, #1
	movs	r6, #63
	ldr	r3, [sp, #20]
	adds	r3, r3, #41
	ldrb	r0, [r3]
	orrs	r2, r0
	strb	r2, [r3]
	ldrb	r5, [r4, #1]
	ldr	r2, .L165+16
	lsls	r1, r5, #4
	bics	r1, r6
	strb	r1, [r2, #15]
	lsls	r1, r5, #27
	bpl	.L138
	ldrh	r1, [r2, #16]
	adds	r1, r1, #1
	strh	r1, [r2, #16]
	movs	r2, #3
	orrs	r0, r2
	strb	r0, [r3]
	b	.L138
.L135:
	ldrb	r0, [r4, #1]
	ldr	r3, .L165+20
	bl	.L4
	subs	r5, r0, #0
	beq	.L134
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L134
	movs	r3, #16
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #8]
	movs	r3, #17
	movs	r7, #0
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #12]
	adds	r6, r4, #4
.L141:
	ldrh	r2, [r4, #2]
	subs	r2, r2, #4
	lsrs	r3, r2, #31
	adds	r3, r3, r2
	asrs	r3, r3, #1
	cmp	r3, r7
	bgt	.L145
	ldr	r1, .L165+24
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
	ldrsb	r3, [r5, r3]
	lsls	r3, r3, #2
	ldr	r3, [r3, r0]
	ldrsb	r1, [r5, r1]
	ldrb	r0, [r5, #11]
	strb	r0, [r3, r1]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	beq	.L138
	movs	r3, #2
	ldr	r1, [r5, #12]
	orrs	r3, r1
	str	r3, [r5, #12]
	str	r2, [sp, #4]
	b	.L138
.L145:
	ldrb	r3, [r6]
	cmp	r3, #71
	bhi	.L142
	ldrb	r2, [r5, r3]
	ldrb	r1, [r6, #1]
	adds	r2, r2, r1
	strb	r2, [r5, r3]
.L143:
	adds	r7, r7, #1
	adds	r6, r6, #2
	b	.L141
.L142:
	cmp	r3, #87
	bhi	.L144
	ldr	r3, [r5]
	ldrb	r0, [r3, #4]
	ldr	r3, .L165+28
	bl	.L4
	ldrb	r3, [r6]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r6, #1]
	adds	r2, r2, r1
	strb	r2, [r0, r3]
	b	.L143
.L144:
	cmp	r3, #88
	bne	.L143
	ldr	r3, .L165+32
	ldrb	r0, [r5, #28]
	bl	.L4
	ldrb	r2, [r6, #1]
	ldrb	r3, [r0, #6]
	adds	r3, r3, r2
	strb	r3, [r0, #6]
	b	.L143
.L166:
	.align	2
.L165:
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
	ldr	r4, .L169
	ldrb	r3, [r0]
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	cmp	r3, #66
	bne	.L168
	ldrb	r2, [r0, #6]
	ldrb	r1, [r0, #5]
	ldr	r3, .L169+4
	ldrb	r0, [r0, #4]
	bl	.L4
	cmp	r0, #0
	bne	.L168
	ldr	r4, .L169+8
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
.L168:
	movs	r0, r4
	@ sp needed
	ldr	r3, .L169+12
	bl	.L4
	ldr	r3, .L169+16
	movs	r1, r0
	movs	r0, r5
	bl	.L4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L170:
	.align	2
.L169:
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
.LC107:
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
	bpl	.L172
	movs	r4, r0
	ldr	r3, .L216
	ldrh	r7, [r3, #16]
	adds	r4, r4, #64
	lsls	r3, r7, #31
	bpl	.L174
	adds	r4, r4, #8
.L174:
	movs	r0, r4
	ldr	r3, .L216+4
	bl	.L4
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L216+8
	bl	.L4
	cmp	r7, #9
	bgt	.L175
	movs	r1, #6
	movs	r0, r4
	ldr	r3, .L216+12
	bl	.L4
	movs	r1, r7
.L213:
	movs	r0, r4
	ldr	r3, .L216+16
	bl	.L4
.L176:
	ldr	r3, .L216+20
	movs	r0, r4
	ldr	r1, .L216+24
	bl	.L4
	movs	r2, #2
	ldrb	r3, [r6]
	bics	r3, r2
	strb	r3, [r6]
.L172:
	ldrb	r1, [r6]
	lsls	r3, r1, #31
	bpl	.L177
	ldr	r3, .L216
	ldrb	r3, [r3, #15]
	cmp	r3, #64
	beq	.L194
	subs	r3, r3, #128
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	lsls	r3, r3, #12
.L178:
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
.L177:
	ldrb	r2, [r6]
	movs	r3, #4
	movs	r4, r2
	ldr	r1, [r5, #92]
	ands	r4, r3
	tst	r2, r3
	beq	.L179
	cmp	r1, #0
	bne	.L180
	movs	r3, r1
	movs	r2, r1
	str	r1, [sp, #4]
	str	r1, [sp]
	ldr	r0, .L216+28
	ldr	r4, .L216+32
	bl	.L37
	str	r0, [r5, #92]
.L180:
	ldrb	r2, [r6]
	movs	r3, #8
	movs	r4, r2
	ldr	r1, [r5, #96]
	ands	r4, r3
	tst	r2, r3
	beq	.L181
	cmp	r1, #0
	bne	.L182
	movs	r3, r1
	movs	r2, r1
	str	r1, [sp, #4]
	str	r1, [sp]
	ldr	r0, .L216+36
	ldr	r4, .L216+32
	bl	.L37
	str	r0, [r5, #96]
.L182:
	movs	r4, #0
	ldr	r3, .L216+40
	bl	.L4
	str	r4, [r5, #80]
	str	r4, [r5, #84]
.L183:
	ldr	r3, .L216+44
	lsls	r0, r4, #6
	adds	r0, r0, r3
	movs	r2, #48
	movs	r1, #0
	ldr	r3, .L216+48
	adds	r4, r4, #1
	bl	.L4
	cmp	r4, #20
	bne	.L183
	movs	r4, r5
	movs	r3, #16
	ldrb	r2, [r6]
	adds	r4, r4, #48
	tst	r2, r3
	beq	.L185
	adds	r4, r4, #8
.L185:
	eors	r3, r2
	strb	r3, [r6]
	movs	r0, r4
	ldr	r3, .L216+4
	bl	.L4
	ldr	r3, .L216+52
	movs	r1, #2
	movs	r0, r4
	bl	.L4
	ldr	r3, [r5, #44]
	adds	r6, r3, #4
.L186:
	ldrb	r3, [r6]
	cmp	r3, #2
	beq	.L191
	cmp	r3, #64
	beq	.L192
	movs	r0, r6
	bl	REW_nextEntry
	movs	r6, r0
	b	.L186
.L175:
	cmp	r7, #99
	bgt	.L176
	ldr	r3, .L216+56
	movs	r1, #10
	movs	r0, r7
	bl	.L4
	ldr	r3, .L216+16
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r1, #16
	movs	r0, r4
	ldr	r3, .L216+12
	bl	.L4
	movs	r0, r7
	ldr	r3, .L216+60
	movs	r1, #10
	bl	.L4
	b	.L213
.L194:
	movs	r3, #128
	lsls	r3, r3, #6
	b	.L178
.L179:
	cmp	r1, #0
	beq	.L180
	movs	r0, r1
	ldr	r3, .L216+64
	bl	.L4
	str	r4, [r5, #92]
	b	.L180
.L181:
	cmp	r1, #0
	beq	.L182
	movs	r0, r1
	ldr	r3, .L216+64
	bl	.L4
	str	r4, [r5, #96]
	b	.L182
.L191:
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
	ldr	r1, .L216+68
	movs	r0, r4
	ldr	r3, .L216+72
	bl	.L4
	ldr	r1, .L216+76
.L215:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L216+20
	bl	.L4
	movs	r0, #0
	ldr	r3, .L216+80
	bl	.L4
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L192:
	ldr	r3, .L216
	ldrb	r2, [r3, #15]
	ldr	r7, .L216+84
	ldr	r6, .L216+88
	ldr	r5, .L216+92
	ldr	r0, .L216+96
	cmp	r2, #0
	beq	.L214
	ldr	r3, .L216+12
	cmp	r2, #128
	beq	.L189
	movs	r1, #4
	movs	r0, r4
	bl	.L4
	ldr	r0, .L216+100
	b	.L214
.L189:
	movs	r1, #1
	movs	r0, r4
	bl	.L4
	ldr	r0, .L216+104
.L214:
	lsls	r0, r0, #16
	lsrs	r0, r0, #16
	bl	.L6
	movs	r1, r0
	movs	r0, r4
	bl	.L7
	movs	r1, r5
	b	.L215
.L217:
	.align	2
.L216:
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
	.word	.LC107
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
	bne	.L220
	movs	r4, #0
	b	.L218
.L221:
	movs	r0, r5
	bl	REW_nextEntry
	movs	r4, r5
	movs	r5, r0
.L220:
	cmp	r5, r6
	bne	.L221
.L218:
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
.L224:
	cmp	r5, r4
	bcc	.L225
	@ sp needed
	movs	r0, r2
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L225:
	movs	r0, r5
	bl	REW_nextEntry
	movs	r2, r5
	movs	r5, r0
	b	.L224
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
	movs	r4, r0
	str	r3, [sp, #8]
.L227:
	cmp	r4, #0
	bne	.L240
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L240:
	ldrb	r3, [r4]
	cmp	r3, #65
	beq	.L228
	bhi	.L229
	cmp	r3, #2
	beq	.L228
	cmp	r3, #64
	beq	.L230
.L231:
	movs	r1, r4
	movs	r0, r7
	bl	REW_prevEntry
	movs	r4, r0
	b	.L227
.L229:
	cmp	r3, #66
	bne	.L231
	ldrb	r2, [r4, #6]
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L257
	bl	.L4
	subs	r5, r0, #0
	beq	.L233
	ldrb	r3, [r0, #3]
	ldrb	r2, [r4, #7]
	subs	r3, r3, r2
	strb	r3, [r0, #3]
	b	.L231
.L230:
	movs	r2, #1
	ldr	r3, [sp, #20]
	adds	r3, r3, #41
	ldrb	r5, [r3]
	orrs	r2, r5
	strb	r2, [r3]
	ldrb	r2, [r4, #1]
	ldr	r1, .L257+4
	lsls	r0, r2, #6
	strb	r0, [r1, #15]
	lsls	r2, r2, #27
	bpl	.L231
	movs	r2, #3
	ldrh	r0, [r1, #16]
	orrs	r2, r5
	subs	r0, r0, #1
	strh	r0, [r1, #16]
	strb	r2, [r3]
	b	.L231
.L233:
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r3, .L257+8
	bl	.L4
	lsls	r0, r0, #16
	movs	r2, r5
	movs	r1, r5
	ldr	r3, .L257+12
	lsrs	r0, r0, #16
	bl	.L4
	ldrb	r3, [r4, #7]
	ldrb	r2, [r4, #6]
	ldrb	r1, [r4, #5]
	ldrb	r0, [r4, #4]
	ldr	r5, .L257+16
	rsbs	r3, r3, #0
	bl	.L5
	b	.L231
.L228:
	ldrb	r0, [r4, #1]
	ldr	r3, .L257+20
	bl	.L4
	subs	r5, r0, #0
	beq	.L227
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L227
	movs	r3, #16
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #12]
	movs	r3, #17
	ldrsb	r3, [r0, r3]
	str	r3, [sp, #16]
	movs	r3, #0
	str	r3, [sp, #4]
	adds	r6, r4, #4
.L235:
	ldrh	r2, [r4, #2]
	subs	r2, r2, #4
	lsrs	r3, r2, #31
	adds	r3, r3, r2
	ldr	r2, [sp, #4]
	asrs	r3, r3, #1
	cmp	r3, r2
	bgt	.L239
	ldr	r2, .L257+24
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
	ldrsb	r3, [r5, r3]
	lsls	r3, r3, #2
	ldr	r3, [r3, r1]
	ldrsb	r2, [r5, r2]
	ldrb	r1, [r5, #11]
	strb	r1, [r3, r2]
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L241
	movs	r2, #66
	ldr	r3, [r5, #12]
	bics	r3, r2
	str	r3, [r5, #12]
	b	.L231
.L239:
	ldrb	r3, [r6]
	cmp	r3, #71
	bhi	.L236
	ldrb	r2, [r5, r3]
	ldrb	r1, [r6, #1]
	subs	r2, r2, r1
	strb	r2, [r5, r3]
.L237:
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	str	r3, [sp, #4]
	adds	r6, r6, #2
	b	.L235
.L236:
	cmp	r3, #87
	bhi	.L238
	ldr	r3, [r5]
	ldrb	r0, [r3, #4]
	ldr	r3, .L257+28
	bl	.L4
	ldrb	r3, [r6]
	subs	r3, r3, #72
	ldrb	r2, [r0, r3]
	ldrb	r1, [r6, #1]
	subs	r2, r2, r1
	strb	r2, [r0, r3]
	b	.L237
.L238:
	cmp	r3, #88
	bne	.L237
	ldr	r3, .L257+32
	ldrb	r0, [r5, #28]
	bl	.L4
	ldrb	r2, [r6, #1]
	ldrb	r3, [r0, #6]
	subs	r3, r3, r2
	strb	r3, [r0, #6]
	b	.L237
.L241:
	movs	r3, #1
	str	r3, [sp, #8]
	b	.L231
.L258:
	.align	2
.L257:
	.word	GetSpecificTrapAt
	.word	gChapterData
	.word	GetMapChangesIdAt
	.word	UntriggerMapChange
	.word	AddTrap
	.word	GetUnit
	.word	gMapUnit
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
	ldr	r3, .L279
	ldrh	r3, [r3, #6]
	movs	r4, r0
	lsls	r2, r3, #25
	bpl	.L260
	movs	r5, r0
	adds	r5, r5, #41
	ldrb	r2, [r5]
	lsls	r2, r2, #29
	bpl	.L260
	ldr	r3, .L279+4
	adds	r3, r3, #65
	ldrb	r3, [r3]
	lsls	r3, r3, #30
	bmi	.L261
	movs	r0, #102
	ldr	r3, .L279+8
	bl	.L4
.L261:
	movs	r0, r4
	ldr	r1, [r4, #44]
	bl	REW_undo
	ldr	r3, [r4, #44]
	ldrh	r2, [r3]
	subs	r3, r3, r2
	str	r3, [r4, #44]
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L262
	movs	r2, #4
	ldrb	r3, [r5]
	bics	r3, r2
	strb	r3, [r5]
.L262:
	movs	r3, #8
	ldrb	r2, [r5]
.L278:
	orrs	r3, r2
	strb	r3, [r5]
	movs	r0, r4
	bl	REW_refreshUI
	ldr	r3, .L279+12
	bl	.L4
.L259:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L260:
	lsls	r3, r3, #24
	bpl	.L259
	movs	r5, r4
	adds	r5, r5, #41
	ldrb	r3, [r5]
	lsls	r3, r3, #28
	bpl	.L259
	ldr	r3, .L279+4
	adds	r3, r3, #65
	ldrb	r3, [r3]
	lsls	r3, r3, #30
	bmi	.L264
	movs	r0, #102
	ldr	r3, .L279+8
	bl	.L4
.L264:
	ldr	r1, [r4, #44]
	ldrh	r3, [r1, #2]
	adds	r1, r1, r3
	movs	r0, r4
	str	r1, [r4, #44]
	bl	REW_redo
	ldr	r0, [r4, #44]
	bl	REW_isRedoAvailable
	cmp	r0, #0
	bne	.L265
	movs	r2, #8
	ldrb	r3, [r5]
	bics	r3, r2
	strb	r3, [r5]
.L265:
	movs	r3, #4
	ldrb	r2, [r5]
	b	.L278
.L280:
	.align	2
.L279:
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
	beq	.L281
	adds	r3, r3, #4
	subs	r3, r3, r1
	strh	r3, [r0, #2]
.L281:
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
	beq	.L287
	subs	r4, r4, #64
	cmp	r0, #128
	beq	.L287
	movs	r4, #0
	ldrb	r3, [r1]
	adds	r3, r3, #1
	strb	r3, [r1]
.L287:
	movs	r0, r4
	ldr	r3, .L292
	bl	.L4
	cmp	r0, #0
	bne	.L288
	movs	r3, #1
	strb	r3, [r5]
.L288:
	@ sp needed
	movs	r0, r4
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L293:
	.align	2
.L292:
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
	ldr	r2, .L313
	ldr	r2, [r2]
	str	r2, [sp, #4]
	str	r3, [sp, #12]
	ldr	r2, .L313+4
	ldr	r1, [sp, #4]
	ldr	r3, .L313+8
	add	r0, sp, #12
	bl	.L4
	ldr	r4, .L313+12
	add	r3, sp, #8
	adds	r2, r3, #3
	adds	r1, r3, #2
	ldrb	r0, [r4, #15]
	bl	REW_nextPhase
	ldr	r7, .L313+16
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
	beq	.L295
	movs	r2, #16
	orrs	r3, r2
	strb	r3, [r0, #1]
.L295:
	add	r3, sp, #8
	ldrb	r3, [r3, #3]
	cmp	r3, #0
	beq	.L296
	movs	r3, #32
	ldrb	r2, [r5, #1]
	orrs	r3, r2
	strb	r3, [r5, #1]
.L296:
	adds	r4, r6, #1
	adds	r6, r6, #64
	lsls	r4, r4, #24
	lsls	r6, r6, #24
	lsrs	r4, r4, #24
	lsrs	r6, r6, #24
.L297:
	cmp	r6, r4
	bne	.L299
	movs	r3, #4
	ldr	r0, [r7]
	strh	r3, [r5, #2]
	ldrh	r2, [r0, #2]
	cmp	r2, #0
	bne	.L300
	strh	r3, [r0, #2]
.L300:
	ldrh	r3, [r0, #2]
	adds	r3, r3, #4
	strh	r3, [r0, #2]
	bl	REW_alignSequence
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L299:
	movs	r0, r4
	ldr	r3, .L313+20
	bl	.L4
	cmp	r0, #0
	beq	.L298
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L298
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
.L298:
	adds	r4, r4, #1
	lsls	r4, r4, #24
	lsrs	r4, r4, #24
	b	.L297
.L314:
	.align	2
.L313:
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
	ldr	r3, .L336
	ldr	r3, [r3]
	ldrh	r2, [r3, #2]
	sub	sp, sp, #44
	cmp	r2, #0
	beq	.L315
	ldrb	r2, [r3, #4]
	cmp	r2, #64
	bne	.L315
	ldr	r2, .L336+4
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
.L317:
	ldr	r3, [sp, #36]
	ldr	r2, [sp, #8]
	cmp	r3, r2
	bge	.L322
	ldr	r3, .L336
	ldr	r0, [r3]
	bl	REW_alignSequence
.L315:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L322:
	ldr	r3, [sp, #8]
	lsls	r7, r3, #24
	lsrs	r7, r7, #24
	movs	r0, r7
	ldr	r3, .L336+8
	bl	.L4
	subs	r6, r0, #0
	beq	.L318
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L318
	ldr	r3, .L336
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
.L321:
	ldr	r3, [sp]
	ldrb	r3, [r3]
	ldrb	r5, [r6, r3]
	str	r3, [sp, #20]
	ldr	r3, [sp]
	ldrb	r3, [r3, #1]
	subs	r5, r5, r3
	lsls	r5, r5, #24
	lsrs	r5, r5, #24
	beq	.L319
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L320
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
.L320:
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
.L319:
	ldr	r3, [sp]
	adds	r3, r3, #2
	str	r3, [sp]
	ldr	r2, [sp]
	ldr	r3, [sp, #32]
	cmp	r3, r2
	bne	.L321
.L318:
	ldr	r3, [sp, #8]
	adds	r3, r3, #1
	str	r3, [sp, #8]
	b	.L317
.L337:
	.align	2
.L336:
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
	ldr	r3, .L386
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
	beq	.L339
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
.L339:
	movs	r1, #111
	ldrsb	r1, [r5, r1]
	cmp	r1, #0
	blt	.L340
	ldr	r3, .L386+4
	add	r0, sp, #32
	bl	.L4
.L340:
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
	ldr	r3, .L386+8
	bl	.L4
	movs	r0, r5
	ldr	r3, .L386+12
	bl	.L4
	cmp	r0, #0
	ble	.L341
	movs	r3, r5
	adds	r3, r3, #80
	ldrb	r3, [r3]
	adds	r4, r4, r3
	adds	r4, r4, #40
	strb	r0, [r4]
.L341:
	add	r4, sp, #32
	movs	r0, r4
	ldr	r3, .L386+16
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
	beq	.L342
	movs	r3, #16
	ldr	r2, [sp, #136]
	strb	r3, [r2, #4]
	strb	r6, [r2, #5]
	adds	r4, r4, #1
.L342:
	add	r3, sp, #32
	ldrb	r3, [r3, #17]
	ldr	r2, [sp, #12]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L343
	ldr	r1, [sp, #4]
	lsls	r2, r4, #1
	adds	r2, r1, r2
	movs	r1, #17
	strb	r3, [r2, #1]
	strb	r1, [r2]
	adds	r4, r4, #1
.L343:
	movs	r2, #0
	add	r1, sp, #32
.L345:
	ldrb	r3, [r2, r1]
	ldrb	r0, [r7, r2]
	subs	r3, r3, r0
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L344
	ldr	r6, [sp, #4]
	lsls	r0, r4, #1
	adds	r0, r6, r0
	strb	r2, [r0]
	strb	r3, [r0, #1]
	adds	r4, r4, #1
.L344:
	adds	r2, r2, #1
	cmp	r2, #72
	bne	.L345
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L346
	movs	r3, r5
	adds	r3, r3, #72
	ldrh	r0, [r3]
	ldr	r3, .L386+20
	bl	.L4
	add	r3, sp, #32
	movs	r6, r0
	ldrb	r0, [r3, #28]
	ldr	r3, .L386+24
	bl	.L4
	ldrb	r0, [r0, #6]
	subs	r6, r6, r0
	lsls	r6, r6, #24
	lsrs	r6, r6, #24
	beq	.L346
	ldr	r2, [sp, #4]
	lsls	r3, r4, #1
	adds	r3, r2, r3
	movs	r2, #88
	strb	r6, [r3, #1]
	strb	r2, [r3]
	adds	r4, r4, #1
.L346:
	ldr	r3, [r7]
	ldrb	r0, [r3, #4]
	ldr	r3, .L386+28
	bl	.L4
	subs	r6, r0, #0
	beq	.L347
	movs	r2, #8
	ldr	r3, .L386
	add	r1, sp, #16
	bl	.L4
	movs	r2, #110
	ldrsb	r2, [r5, r2]
	cmp	r2, #0
	beq	.L348
	ldr	r3, [sp, #24]
	str	r3, [sp, #8]
	lsls	r3, r3, #8
	lsrs	r3, r3, #20
	adds	r3, r3, r2
	movs	r2, #250
	lsls	r2, r2, #4
	cmp	r3, r2
	ble	.L349
	movs	r3, r2
.L349:
	ldr	r2, [sp, #24]
	str	r2, [sp, #8]
	ldr	r1, [sp, #8]
	ldr	r2, .L386+32
	lsls	r3, r3, #20
	lsrs	r3, r3, #8
	ands	r2, r1
	orrs	r3, r2
	str	r3, [sp, #24]
.L348:
	ldr	r3, .L386+36
	ldrb	r3, [r3, #11]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	beq	.L350
	movs	r2, #250
	add	r3, sp, #16
	ldrh	r3, [r3, #12]
	lsls	r3, r3, #18
	lsrs	r3, r3, #20
	adds	r3, r3, #1
	lsls	r2, r2, #4
	cmp	r3, r2
	ble	.L351
	movs	r3, r2
.L351:
	add	r2, sp, #16
	ldrh	r2, [r2, #12]
	ldr	r1, .L386+40
	lsls	r3, r3, #20
	ands	r2, r1
	lsrs	r3, r3, #18
	orrs	r3, r2
	add	r2, sp, #16
	strh	r3, [r2, #12]
.L350:
	movs	r2, #0
.L353:
	add	r3, sp, #16
	ldrb	r3, [r2, r3]
	ldrb	r1, [r6, r2]
	subs	r3, r3, r1
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L352
	ldr	r0, [sp, #4]
	lsls	r1, r4, #1
	adds	r1, r0, r1
	movs	r0, r2
	adds	r0, r0, #72
	strb	r0, [r1]
	strb	r3, [r1, #1]
	adds	r4, r4, #1
.L352:
	adds	r2, r2, #1
	cmp	r2, #16
	bne	.L353
.L347:
	adds	r4, r4, #2
	ldr	r3, [sp, #136]
	lsls	r4, r4, #17
	lsrs	r4, r4, #16
	strh	r4, [r3, #2]
	ldr	r3, [sp, #132]
	ldrh	r3, [r3, #2]
	cmp	r3, #0
	bne	.L354
	ldr	r2, [sp, #132]
	adds	r3, r3, #4
	strh	r3, [r2, #2]
.L354:
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
.L387:
	.align	2
.L386:
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
	ldr	r6, .L399
	ldr	r3, .L399+4
	sub	sp, sp, #28
	ldr	r5, .L399+8
	ldrb	r0, [r6, #11]
	ldr	r4, [r3]
	bl	.L5
	ldr	r3, .L399+12
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
	beq	.L389
	ldr	r2, .L399+16
	ldrh	r2, [r2]
	mov	ip, r2
	ldr	r3, [r6, #12]
	ldr	r1, .L399+20
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
.L389:
	movs	r0, r4
	bl	REW_createSeqEntry
	ldr	r7, .L399+12
	movs	r6, r0
	cmp	r5, #0
	beq	.L390
	movs	r3, #2
	strb	r3, [r0]
	ldrb	r3, [r5, #11]
	strb	r3, [r0, #1]
	movs	r3, #19
	ldrsb	r3, [r7, r3]
	cmp	r3, #0
	beq	.L388
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
.L388:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L390:
	movs	r1, #17
	movs	r0, #16
	ldrsb	r1, [r7, r1]
	ldr	r3, .L399+24
	ldrsb	r0, [r7, r0]
	bl	.L4
	movs	r3, #66
	strh	r3, [r6]
	movs	r3, #17
	ldr	r2, .L399+28
	ldr	r1, [r2]
	movs	r2, #16
	ldrsb	r3, [r7, r3]
	lsls	r3, r3, #2
	ldrsb	r2, [r7, r2]
	ldr	r3, [r3, r1]
	ldrb	r3, [r3, r2]
	cmp	r3, #51
	bne	.L392
	subs	r3, r3, #50
	strb	r3, [r6, #1]
.L392:
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
	b	.L388
.L400:
	.align	2
.L399:
	.word	gBattleActor
	.word	REW_curSequence
	.word	GetUnit
	.word	gBattleTarget
	.word	gBattleStats
	.word	gActiveUnitMoveOrigin
	.word	GetTrapAt
	.word	gMapTerrain
	.size	REW_actionCombat, .-REW_actionCombat
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
.L37:
	bx	r4
.L5:
	bx	r5
.L7:
	bx	r6
.L6:
	bx	r7
