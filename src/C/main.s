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
	movs	r3, #7
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r6, r2
	@ sp needed
	ldr	r2, .L35
	movs	r5, r0
	ldr	r0, [r2]
	movs	r2, #6
	ldrsb	r3, [r1, r3]
	lsls	r3, r3, #2
	ldrsb	r2, [r1, r2]
	ldr	r3, [r3, r0]
	ldrb	r0, [r3, r2]
	ldr	r3, .L35+4
	bl	.L4
	ldr	r3, [r0, #4]
	ldrb	r7, [r3, #4]
	ldr	r3, [r0]
	movs	r4, r0
	ldrh	r0, [r3]
	ldr	r3, .L35+8
	bl	.L4
	ldr	r3, .L35+12
	movs	r1, r0
	movs	r0, r6
	bl	.L4
	movs	r0, r4
	ldr	r3, .L35+16
	bl	.L4
	movs	r1, #0
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	ldr	r4, .L35+20
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
	ldr	r4, .L35+24
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
	ldr	r3, .L35+28
	bl	.L4
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L36:
	.align	2
.L35:
	.word	gMapUnit
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
	movs	r3, #7
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r4, r2
	@ sp needed
	ldr	r2, .L39
	movs	r6, r0
	ldr	r0, [r2]
	movs	r2, #6
	ldrsb	r3, [r1, r3]
	lsls	r3, r3, #2
	ldrsb	r2, [r1, r2]
	ldr	r3, [r3, r0]
	ldrb	r0, [r3, r2]
	ldr	r3, .L39+4
	bl	.L4
	ldr	r3, [r0, #4]
	ldrb	r7, [r3, #4]
	ldr	r3, [r0]
	movs	r5, r0
	ldrh	r0, [r3]
	ldr	r3, .L39+8
	bl	.L4
	ldr	r3, .L39+12
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r0, r4
	ldr	r3, .L39+16
	bl	.L4
	ldr	r3, .L39+20
	movs	r4, r0
	movs	r0, r5
	bl	.L4
	movs	r1, #0
	movs	r3, #1
	movs	r2, r7
	str	r0, [sp]
	ldr	r5, .L39+24
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
	ldr	r5, .L39+28
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
	ldr	r3, .L39+32
	bl	.L4
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L40:
	.align	2
.L39:
	.word	gMapUnit
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
	ldr	r3, .L59
	movs	r2, r1
	ldr	r3, [r3]
	add	r1, sp, #4
	bl	.L4
	mov	r2, sp
	ldrb	r2, [r2, #4]
	ldr	r3, .L59+4
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
.L60:
	.align	2
.L59:
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
	ldr	r3, .L62
	movs	r2, r1
	ldrh	r1, [r3]
	strb	r1, [r4, #4]
	ldrh	r3, [r3, #2]
	movs	r1, r0
	strb	r3, [r4, #5]
	add	r0, sp, #4
	ldr	r3, .L62+4
	bl	.L4
	pop	{r0, r1, r4}
	pop	{r0}
	bx	r0
.L63:
	.align	2
.L62:
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
	ldr	r3, .L65
	ldr	r1, .L65+4
	ldr	r3, [r3]
	ldr	r1, [r1]
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L66:
	.align	2
.L65:
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
	ldr	r3, .L69
	ldrb	r3, [r3, #22]
	movs	r2, r1
	cmp	r3, #1
	bne	.L67
	ldr	r3, .L69+4
	movs	r1, r0
	ldr	r0, [r3]
	ldr	r3, .L69+8
	bl	.L4
.L67:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L70:
	.align	2
.L69:
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
	ldr	r1, .L84
	lsls	r1, r1, #16
	lsrs	r1, r1, #16
	bl	REW_loadRewind
	ldr	r3, .L84+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L75
	movs	r0, r4
	ldr	r3, .L84+8
	bl	.L4
.L74:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L75:
	ldr	r0, [r3, #4]
	movs	r3, #2
	str	r0, [r4, #44]
	adds	r4, r4, #41
	strb	r3, [r4]
	ldrh	r3, [r0]
	cmp	r3, #0
	beq	.L77
	movs	r3, #6
	strb	r3, [r4]
.L77:
	bl	REW_isRedoAvailable
	cmp	r0, #0
	beq	.L74
	movs	r3, #8
	ldrb	r2, [r4]
	orrs	r3, r2
	strb	r3, [r4]
	b	.L74
.L85:
	.align	2
.L84:
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
	ldr	r7, .L100
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	movs	r5, r0
	movs	r6, r1
	cmp	r3, #0
	beq	.L86
	ldr	r3, .L100+4
	ldrb	r3, [r3, #22]
	cmp	r3, #1
	beq	.L86
	cmp	r3, #9
	beq	.L90
.L93:
	movs	r0, r5
	movs	r1, r6
	bl	REW_loadRewind
	ldr	r3, .L100+8
	ldr	r4, [r3]
	ldr	r0, [r4]
	subs	r3, r0, #0
	beq	.L92
	ldr	r3, [r4, #4]
	ldrh	r3, [r3, #2]
.L92:
	adds	r0, r4, r0
	movs	r2, r0
	adds	r2, r2, #8
	strh	r3, [r0, #8]
	ldr	r1, [r7]
	str	r2, [sp, #4]
	ldrh	r3, [r1, #2]
	str	r3, [sp]
	movs	r3, r2
	ldr	r2, [sp]
	strh	r2, [r3, #2]
	adds	r0, r0, #12
	ldrh	r2, [r1, #2]
	ldr	r3, .L100+12
	adds	r1, r1, #4
	bl	.L4
	ldr	r3, [r4]
	ldr	r2, [sp]
	adds	r3, r3, #4
	adds	r3, r3, r2
	str	r3, [r4]
	ldr	r3, [sp, #4]
	movs	r2, r6
	str	r3, [r4, #4]
	movs	r1, r5
	ldr	r3, .L100+16
	movs	r0, r4
	bl	.L4
	movs	r2, #0
	ldr	r3, [r7]
	strh	r2, [r3, #2]
	b	.L86
.L90:
	ldr	r3, .L100+20
	ldrb	r0, [r3, #15]
	ldr	r3, .L100+24
	bl	.L4
	cmp	r0, #0
	bne	.L93
.L86:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L101:
	.align	2
.L100:
	.word	REW_curSequence
	.word	gActionData
	.word	REW_rewindBuffer
	.word	memcpy
	.word	WriteAndVerifySramFast
	.word	gChapterData
	.word	GetPhaseAbleUnitCount
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
	@ sp needed
	adds	r0, r0, #4
	adds	r0, r3, r0
	bx	lr
	.size	REW_createSeqEntry, .-REW_createSeqEntry
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
	ldrh	r2, [r0, #8]
	adds	r1, r2, #2
	push	{r4, r5, lr}
	movs	r4, #3
	movs	r5, r1
	lsls	r3, r1, #16
	lsrs	r3, r3, #16
	ands	r5, r4
	tst	r1, r4
	beq	.L105
	adds	r2, r2, #6
	subs	r3, r2, r5
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
.L105:
	adds	r0, r0, #8
	adds	r0, r0, r3
	@ sp needed
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	.size	REW_nextEntry, .-REW_nextEntry
	.align	1
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
	push	{r3, r4, r5, r6, r7, lr}
	ldrb	r3, [r1, #4]
	movs	r4, r0
	cmp	r3, #64
	bne	.L109
	movs	r6, #1
	adds	r4, r4, #41
	ldrb	r3, [r4]
	orrs	r3, r6
	strb	r3, [r4]
	movs	r3, r1
	movs	r7, #2
	ldr	r5, .L119
	ldrb	r2, [r1, #15]
	strb	r2, [r5, #15]
	adds	r0, r1, #4
	adds	r3, r3, #12
.L112:
	ldrb	r2, [r3, #2]
	tst	r2, r6
	beq	.L111
	ldrh	r3, [r5, #16]
	subs	r3, r3, #1
	strh	r3, [r5, #16]
	ldrb	r3, [r4]
	orrs	r3, r7
	strb	r3, [r4]
.L111:
	tst	r2, r7
	beq	.L109
	bl	REW_nextEntry
	movs	r3, r0
	adds	r3, r3, #8
	b	.L112
.L109:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L120:
	.align	2
.L119:
	.word	gChapterData
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldrb	r3, [r1, #4]
	movs	r4, r0
	cmp	r3, #64
	bne	.L121
	movs	r5, #1
	movs	r7, #2
	adds	r4, r4, #41
	ldrb	r3, [r4]
	orrs	r3, r5
	strb	r3, [r4]
	ldr	r6, .L129
	adds	r0, r1, #4
	adds	r1, r1, #12
.L125:
	ldrb	r2, [r1, #2]
	tst	r2, r5
	beq	.L123
	ldrh	r3, [r6, #16]
	adds	r3, r3, #1
	strh	r3, [r6, #16]
	ldrb	r3, [r4]
	orrs	r3, r7
	strb	r3, [r4]
.L123:
	tst	r2, r7
	beq	.L124
	bl	REW_nextEntry
	movs	r1, r0
	adds	r1, r1, #8
	b	.L125
.L124:
	ldrb	r2, [r1, #4]
	ldr	r3, .L129
	strb	r2, [r3, #15]
.L121:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L130:
	.align	2
.L129:
	.word	gChapterData
	.size	REW_redo, .-REW_redo
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.global	__aeabi_uidivmod
	.global	__aeabi_idivmod
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC94:
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
	bpl	.L132
	movs	r4, r0
	ldr	r3, .L176
	ldrh	r7, [r3, #16]
	adds	r4, r4, #64
	lsls	r3, r7, #31
	bpl	.L134
	adds	r4, r4, #8
.L134:
	movs	r0, r4
	ldr	r3, .L176+4
	bl	.L4
	movs	r1, #2
	movs	r0, r4
	ldr	r3, .L176+8
	bl	.L4
	cmp	r7, #9
	bgt	.L135
	movs	r1, #6
	movs	r0, r4
	ldr	r3, .L176+12
	bl	.L4
	movs	r1, r7
.L173:
	movs	r0, r4
	ldr	r3, .L176+16
	bl	.L4
.L136:
	ldr	r3, .L176+20
	movs	r0, r4
	ldr	r1, .L176+24
	bl	.L4
	movs	r2, #2
	ldrb	r3, [r6]
	bics	r3, r2
	strb	r3, [r6]
.L132:
	ldrb	r1, [r6]
	lsls	r3, r1, #31
	bpl	.L137
	ldr	r3, .L176
	ldrb	r3, [r3, #15]
	cmp	r3, #64
	beq	.L154
	subs	r3, r3, #128
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	lsls	r3, r3, #12
.L138:
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
.L137:
	ldrb	r2, [r6]
	movs	r3, #4
	movs	r4, r2
	ldr	r1, [r5, #92]
	ands	r4, r3
	tst	r2, r3
	beq	.L139
	cmp	r1, #0
	bne	.L140
	movs	r3, r1
	movs	r2, r1
	str	r1, [sp, #4]
	str	r1, [sp]
	ldr	r0, .L176+28
	ldr	r4, .L176+32
	bl	.L37
	str	r0, [r5, #92]
.L140:
	ldrb	r2, [r6]
	movs	r3, #8
	movs	r4, r2
	ldr	r1, [r5, #96]
	ands	r4, r3
	tst	r2, r3
	beq	.L141
	cmp	r1, #0
	bne	.L142
	movs	r3, r1
	movs	r2, r1
	str	r1, [sp, #4]
	str	r1, [sp]
	ldr	r0, .L176+36
	ldr	r4, .L176+32
	bl	.L37
	str	r0, [r5, #96]
.L142:
	movs	r4, #0
	ldr	r3, .L176+40
	bl	.L4
	str	r4, [r5, #80]
	str	r4, [r5, #84]
.L143:
	ldr	r3, .L176+44
	lsls	r0, r4, #6
	adds	r0, r0, r3
	movs	r2, #48
	movs	r1, #0
	ldr	r3, .L176+48
	adds	r4, r4, #1
	bl	.L4
	cmp	r4, #20
	bne	.L143
	movs	r4, r5
	movs	r3, #16
	ldrb	r2, [r6]
	adds	r4, r4, #48
	tst	r2, r3
	beq	.L145
	adds	r4, r4, #8
.L145:
	eors	r3, r2
	strb	r3, [r6]
	movs	r0, r4
	ldr	r3, .L176+4
	bl	.L4
	ldr	r3, .L176+52
	movs	r1, #2
	movs	r0, r4
	bl	.L4
	ldr	r3, [r5, #44]
	adds	r6, r3, #4
.L146:
	ldrb	r3, [r6]
	cmp	r3, #2
	beq	.L151
	cmp	r3, #64
	beq	.L152
	movs	r0, r6
	bl	REW_nextEntry
	movs	r6, r0
	b	.L146
.L135:
	cmp	r7, #99
	bgt	.L136
	ldr	r3, .L176+56
	movs	r1, #10
	movs	r0, r7
	bl	.L4
	ldr	r3, .L176+16
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r1, #16
	movs	r0, r4
	ldr	r3, .L176+12
	bl	.L4
	movs	r0, r7
	ldr	r3, .L176+60
	movs	r1, #10
	bl	.L4
	b	.L173
.L154:
	movs	r3, #128
	lsls	r3, r3, #6
	b	.L138
.L139:
	cmp	r1, #0
	beq	.L140
	movs	r0, r1
	ldr	r3, .L176+64
	bl	.L4
	str	r4, [r5, #92]
	b	.L140
.L141:
	cmp	r1, #0
	beq	.L142
	movs	r0, r1
	ldr	r3, .L176+64
	bl	.L4
	str	r4, [r5, #96]
	b	.L142
.L151:
	movs	r2, r4
	movs	r1, r6
	movs	r0, r5
	bl	REW_displayActor
	ldr	r0, .L176+68
	lsls	r0, r0, #16
	ldr	r3, .L176+72
	lsrs	r0, r0, #16
	bl	.L4
	ldr	r3, .L176+76
	movs	r1, r0
	movs	r0, r4
	bl	.L4
	movs	r0, r6
	bl	REW_nextEntry
	movs	r2, r4
	movs	r1, r0
	movs	r0, r5
	bl	REW_displayTarget
	ldr	r1, .L176+80
	movs	r0, r4
	ldr	r3, .L176+84
	bl	.L4
	ldr	r1, .L176+88
.L175:
	@ sp needed
	movs	r0, r4
	ldr	r3, .L176+20
	bl	.L4
	movs	r0, #0
	ldr	r3, .L176+92
	bl	.L4
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L152:
	ldr	r3, .L176
	ldrb	r2, [r3, #15]
	ldr	r7, .L176+72
	ldr	r6, .L176+76
	ldr	r5, .L176+96
	ldr	r0, .L176+100
	cmp	r2, #0
	beq	.L174
	ldr	r3, .L176+12
	cmp	r2, #128
	beq	.L149
	movs	r1, #4
	movs	r0, r4
	bl	.L4
	ldr	r0, .L176+104
	b	.L174
.L149:
	movs	r1, #1
	movs	r0, r4
	bl	.L4
	ldr	r0, .L176+108
.L174:
	lsls	r0, r0, #16
	lsrs	r0, r0, #16
	bl	.L6
	movs	r1, r0
	movs	r0, r4
	bl	.L7
	movs	r1, r5
	b	.L175
.L177:
	.align	2
.L176:
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
	.word	.LC94
	.word	Text_DrawChar
	.word	gBg0MapBuffer+138
	.word	EnableBgSyncByIndex
	.word	gBg0MapBuffer+140
	.word	REW_phaseBlue
	.word	REW_phaseGreen
	.word	REW_phaseRed
	.size	REW_refreshUI, .-REW_refreshUI
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
	ldr	r3, .L198
	ldrh	r3, [r3, #6]
	movs	r4, r0
	lsls	r2, r3, #25
	bpl	.L179
	movs	r5, r0
	adds	r5, r5, #41
	ldrb	r2, [r5]
	lsls	r2, r2, #29
	bpl	.L179
	ldr	r3, .L198+4
	adds	r3, r3, #65
	ldrb	r3, [r3]
	lsls	r3, r3, #30
	bmi	.L180
	movs	r0, #102
	ldr	r3, .L198+8
	bl	.L4
.L180:
	movs	r0, r4
	ldr	r1, [r4, #44]
	bl	REW_undo
	ldr	r2, [r4, #44]
	subs	r3, r2, #4
	ldrh	r2, [r2]
	subs	r3, r3, r2
	str	r3, [r4, #44]
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L181
	movs	r2, #4
	ldrb	r3, [r5]
	bics	r3, r2
	strb	r3, [r5]
.L181:
	movs	r3, #8
	ldrb	r2, [r5]
.L197:
	orrs	r3, r2
	movs	r0, r4
	strb	r3, [r5]
	bl	REW_refreshUI
.L178:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L179:
	lsls	r3, r3, #24
	bpl	.L178
	movs	r5, r4
	adds	r5, r5, #41
	ldrb	r3, [r5]
	lsls	r3, r3, #28
	bpl	.L178
	ldr	r3, .L198+4
	adds	r3, r3, #65
	ldrb	r3, [r3]
	lsls	r3, r3, #30
	bmi	.L183
	movs	r0, #102
	ldr	r3, .L198+8
	bl	.L4
.L183:
	ldr	r3, [r4, #44]
	ldrh	r1, [r3, #2]
	adds	r3, r3, #4
	adds	r1, r1, r3
	movs	r0, r4
	str	r1, [r4, #44]
	bl	REW_redo
	ldr	r0, [r4, #44]
	bl	REW_isRedoAvailable
	cmp	r0, #0
	bne	.L184
	movs	r2, #8
	ldrb	r3, [r5]
	bics	r3, r2
	strb	r3, [r5]
.L184:
	movs	r3, #4
	ldrb	r2, [r5]
	b	.L197
.L199:
	.align	2
.L198:
	.word	gKeyState
	.word	gChapterData
	.word	m4aSongNumStart
	.size	REW_handleInput, .-REW_handleInput
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
	adds	r0, r0, #4
	adds	r0, r3, r0
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
	subs	r3, r0, #4
	ldrh	r0, [r0]
	@ sp needed
	subs	r0, r3, r0
	bx	lr
	.size	REW_prevSequence, .-REW_prevSequence
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
	beq	.L202
	adds	r3, r3, #4
	subs	r3, r3, r1
	strh	r3, [r0, #2]
.L202:
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
	beq	.L208
	subs	r4, r4, #64
	cmp	r0, #128
	beq	.L208
	movs	r4, #0
	ldrb	r3, [r1]
	adds	r3, r3, #1
	strb	r3, [r1]
.L208:
	movs	r0, r4
	ldr	r3, .L213
	bl	.L4
	cmp	r0, #0
	bne	.L209
	movs	r3, #1
	strb	r3, [r5]
.L209:
	@ sp needed
	movs	r0, r4
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L214:
	.align	2
.L213:
	.word	GetPhaseAbleUnitCount
	.size	REW_nextPhase, .-REW_nextPhase
	.align	1
	.global	REW_seqPhaseChange
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_seqPhaseChange, %function
REW_seqPhaseChange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r5, #0
	sub	sp, sp, #20
	add	r3, sp, #8
	strb	r5, [r3, #6]
	strb	r5, [r3, #7]
	ldr	r3, .L236
	ldrb	r0, [r3, #15]
	add	r3, sp, #8
	adds	r2, r3, #7
	adds	r1, r3, #6
	bl	REW_nextPhase
	ldr	r7, .L236+4
	ldr	r3, [r7]
	ldrh	r4, [r3, #2]
	adds	r3, r3, #4
	adds	r4, r4, r3
	movs	r3, #64
	strb	r3, [r4]
	add	r3, sp, #8
	ldrb	r3, [r3, #6]
	strb	r5, [r4, #10]
	cmp	r3, r5
	beq	.L216
	movs	r3, #1
	strb	r3, [r4, #10]
.L216:
	add	r3, sp, #8
	ldrb	r3, [r3, #7]
	cmp	r3, #0
	beq	.L217
	movs	r3, #2
	ldrb	r2, [r4, #10]
	orrs	r3, r2
	strb	r3, [r4, #10]
.L217:
	ldr	r3, .L236
	ldrb	r5, [r3, #15]
	movs	r3, #0
	strb	r0, [r4, #12]
	str	r3, [sp, #4]
	strb	r5, [r4, #11]
	adds	r5, r5, #1
.L218:
	ldr	r3, .L236
	ldrb	r3, [r3, #15]
	adds	r3, r3, #63
	cmp	r3, r5
	bge	.L220
	ldr	r3, [sp, #4]
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	adds	r2, r3, #3
	strh	r2, [r4, #8]
	ldr	r0, [r7]
	ldrh	r2, [r0, #2]
	adds	r2, r2, #13
	adds	r3, r3, r2
	strh	r3, [r0, #2]
	bl	REW_alignSequence
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L220:
	lsls	r6, r5, #24
	lsrs	r6, r6, #24
	movs	r0, r6
	ldr	r3, .L236+8
	bl	.L4
	cmp	r0, #0
	beq	.L219
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L219
	movs	r2, #2
	ldr	r3, [r0, #12]
	tst	r3, r2
	beq	.L219
	ldr	r3, [sp, #4]
	adds	r3, r4, r3
	strb	r6, [r3, #13]
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	str	r3, [sp, #4]
.L219:
	adds	r5, r5, #1
	b	.L218
.L237:
	.align	2
.L236:
	.word	gChapterData
	.word	REW_curSequence
	.word	GetUnit
	.size	REW_seqPhaseChange, .-REW_seqPhaseChange
	.align	1
	.global	REW_storeCombatData
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_storeCombatData, %function
REW_storeCombatData:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r4, r1
	movs	r7, r0
	sub	sp, sp, #84
	str	r2, [sp]
	str	r3, [sp, #4]
	movs	r2, #36
	ldr	r3, .L258
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
	beq	.L239
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
.L239:
	movs	r1, #111
	ldrsb	r1, [r4, r1]
	cmp	r1, #0
	blt	.L240
	ldr	r3, .L258+4
	add	r0, sp, #8
	bl	.L4
.L240:
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
	ldr	r3, .L258+8
	bl	.L4
	movs	r0, r4
	ldr	r3, .L258+12
	bl	.L4
	cmp	r0, #0
	ble	.L241
	movs	r3, r4
	adds	r3, r3, #80
	ldrb	r3, [r3]
	add	r2, sp, #8
	adds	r3, r3, r2
	adds	r3, r3, #40
	strb	r0, [r3]
.L241:
	movs	r1, r4
	movs	r0, #30
	movs	r5, #0
	add	r3, sp, #8
	movs	r2, #10
	adds	r1, r1, #30
	adds	r0, r0, r3
	ldr	r3, .L258+16
	bl	.L4
	ldr	r3, .L258+20
	add	r0, sp, #8
	bl	.L4
	movs	r6, r5
.L243:
	add	r3, sp, #8
	ldrb	r3, [r6, r3]
	ldrb	r2, [r7, r6]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L242
	ldr	r1, [sp, #4]
	lsls	r2, r5, #1
	adds	r2, r1, r2
	strb	r6, [r2, #10]
	strb	r3, [r2, #11]
	adds	r5, r5, #1
.L242:
	adds	r6, r6, #1
	cmp	r6, #72
	bne	.L243
	ldr	r3, .L258+24
	ldrh	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L244
	adds	r4, r4, #72
	ldrh	r0, [r4]
	ldr	r3, .L258+28
	bl	.L4
	add	r3, sp, #8
	movs	r4, r0
	ldrb	r0, [r3, #28]
	ldr	r3, .L258+32
	bl	.L4
	ldrb	r0, [r0, #6]
	subs	r4, r4, r0
	lsls	r4, r4, #24
	lsrs	r4, r4, #24
	beq	.L244
	ldr	r2, [sp, #4]
	lsls	r3, r5, #1
	adds	r3, r2, r3
	strb	r6, [r3, #10]
	strb	r4, [r3, #11]
	adds	r5, r5, #1
.L244:
	ldr	r2, [sp, #4]
	lsls	r3, r5, #1
	strh	r3, [r2, #8]
	ldr	r3, [sp]
	adds	r5, r5, #1
	ldrh	r3, [r3, #2]
	lsls	r5, r5, #1
	adds	r5, r5, r3
	ldr	r3, [sp]
	movs	r0, r3
	strh	r5, [r3, #2]
	bl	REW_alignSequence
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L259:
	.align	2
.L258:
	.word	CpuSet
	.word	SetUnitStatus
	.word	UnitCheckStatCaps
	.word	GetBattleUnitUpdatedWeaponExp
	.word	memcpy
	.word	UnitRemoveInvalidItems
	.word	gBattleStats
	.word	GetItemUses
	.word	GetTrap
	.size	REW_storeCombatData, .-REW_storeCombatData
	.align	1
	.global	REW_recordActionCombat
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_recordActionCombat, %function
REW_recordActionCombat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r3, .L269
	ldr	r5, [r3]
	ldr	r3, .L269+4
	ldr	r4, .L269+8
	ldrb	r0, [r3, #11]
	bl	.L37
	ldr	r7, .L269+12
	movs	r6, r0
	ldrb	r0, [r7, #11]
	bl	.L37
	movs	r3, #2
	strh	r3, [r5, #4]
	movs	r3, #0
	strh	r3, [r5, #6]
	ldr	r3, .L269+16
	ldrh	r2, [r3]
	str	r0, [sp, #4]
	strb	r2, [r5, #8]
	ldrh	r3, [r3, #2]
	strb	r3, [r5, #9]
	ldrb	r3, [r6, #16]
	strb	r3, [r5, #10]
	ldrb	r3, [r6, #17]
	strb	r3, [r5, #11]
	movs	r3, #8
	strh	r3, [r5, #2]
	ldr	r3, .L269+4
	ldrb	r3, [r3, #19]
	lsls	r3, r3, #24
	adds	r4, r5, #4
	asrs	r3, r3, #24
	beq	.L261
	movs	r3, r4
	movs	r2, r5
	movs	r0, r6
	ldr	r1, .L269+4
	bl	REW_storeCombatData
.L261:
	movs	r1, #2
	ldrh	r2, [r5, #2]
	adds	r3, r2, r4
	strh	r1, [r3]
	movs	r1, #0
	movs	r0, #16
	strh	r1, [r3, #2]
	ldr	r1, [sp, #4]
	ldrsb	r0, [r1, r0]
	strb	r0, [r3, #4]
	ldrb	r1, [r1, #17]
	lsls	r1, r1, #24
	asrs	r1, r1, #24
	adds	r2, r2, #8
	strb	r1, [r3, #5]
	strb	r0, [r3, #6]
	strb	r1, [r3, #7]
	strh	r2, [r5, #2]
	movs	r2, #19
	ldrsb	r2, [r7, r2]
	cmp	r2, #0
	beq	.L260
	movs	r2, r5
	movs	r1, r7
	ldr	r0, [sp, #4]
	bl	REW_storeCombatData
.L260:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L270:
	.align	2
.L269:
	.word	REW_curSequence
	.word	gBattleActor
	.word	GetUnit
	.word	gBattleTarget
	.word	gActiveUnitMoveOrigin
	.size	REW_recordActionCombat, .-REW_recordActionCombat
	.global	REW_procScr
	.section	.rodata.str1.1
.LC125:
	.ascii	"REW_proc\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	REW_procScr, %object
	.size	REW_procScr, 96
REW_procScr:
	.short	1
	.short	0
	.word	.LC125
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
