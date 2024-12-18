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
	.global	REW_handleInput
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_handleInput, %function
REW_handleInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ sp needed
	bx	lr
	.size	REW_handleInput, .-REW_handleInput
	.align	1
	.global	REW_rewind
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_rewind, %function
REW_rewind:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #1
	@ sp needed
	bx	lr
	.size	REW_rewind, .-REW_rewind
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
	ldr	r3, .L6
	ldr	r2, [r3]
	push	{r4, lr}
	cmp	r2, #0
	bne	.L4
	ldr	r3, .L6+4
	bl	.L8
.L3:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L4:
	ldr	r3, [r3, #4]
	str	r3, [r0, #44]
	b	.L3
.L7:
	.align	2
.L6:
	.word	REW_tempRewindBuf
	.word	EndProc
	.size	REW_initProc, .-REW_initProc
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
	ldr	r5, .L26
	ldr	r0, [r0, #80]
	bl	.L28
	ldr	r0, [r4, #88]
	cmp	r0, #0
	beq	.L10
	bl	.L28
.L10:
	ldr	r0, [r4, #84]
	cmp	r0, #0
	beq	.L11
	bl	.L28
.L11:
	ldr	r0, [r4, #72]
	cmp	r0, #0
	beq	.L12
	bl	.L28
.L12:
	ldr	r0, [r4, #76]
	cmp	r0, #0
	beq	.L13
	bl	.L28
.L13:
	@ sp needed
	ldr	r3, .L26+4
	bl	.L8
	ldr	r3, .L26+8
	bl	.L8
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L27:
	.align	2
.L26:
	.word	EndProc
	.word	ClearBG0BG1
	.word	UnlockGameLogic
	.size	REW_procEnd, .-REW_procEnd
	.align	1
	.global	REW_cancelRewind
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_cancelRewind, %function
REW_cancelRewind:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ sp needed
	bx	lr
	.size	REW_cancelRewind, .-REW_cancelRewind
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
	ldr	r3, .L31
	@ sp needed
	bl	.L8
	ldr	r3, .L31+4
	movs	r1, #3
	ldr	r0, .L31+8
	bl	.L8
	movs	r3, #0
	str	r3, [r0, #72]
	str	r3, [r0, #76]
	movs	r0, #23
	pop	{r4}
	pop	{r1}
	bx	r1
.L32:
	.align	2
.L31:
	.word	LockGameLogic
	.word	ProcStart
	.word	REW_procScr
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
	movs	r3, #7
	push	{r0, r1, r2, r4, r5, lr}
	ldr	r2, .L34
	@ sp needed
	movs	r4, r0
	ldr	r0, [r2]
	movs	r2, #6
	ldrsb	r3, [r1, r3]
	lsls	r3, r3, #2
	ldrsb	r2, [r1, r2]
	ldr	r3, [r3, r0]
	ldrb	r0, [r3, r2]
	ldr	r3, .L34+4
	bl	.L8
	ldr	r3, [r0, #4]
	ldrb	r5, [r3, #4]
	ldr	r3, [r0]
	ldrh	r0, [r3]
	ldr	r3, .L34+8
	bl	.L8
	movs	r1, r0
	movs	r0, r4
	ldr	r3, .L34+12
	adds	r0, r0, #48
	bl	.L8
	movs	r1, #0
	movs	r2, #12
	movs	r3, #1
	str	r2, [sp]
	movs	r0, r1
	movs	r2, r5
	rsbs	r3, r3, #0
	ldr	r5, .L34+16
	bl	.L28
	movs	r3, #128
	movs	r2, r0
	lsls	r3, r3, #3
	adds	r2, r2, #8
	str	r0, [r4, #72]
	ldr	r1, [r0, #48]
	strh	r3, [r2, #62]
	ldr	r4, .L34+20
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
	ldr	r3, .L34+24
	bl	.L8
	pop	{r0, r1, r2, r4, r5}
	pop	{r0}
	bx	r0
.L35:
	.align	2
.L34:
	.word	gMapUnit
	.word	GetUnit
	.word	GetStringFromIndex
	.word	Text_DrawString
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
	ldr	r2, .L37
	push	{r0, r1, r4, r5, r6, lr}
	movs	r5, r0
	@ sp needed
	ldr	r0, [r2]
	movs	r2, #6
	ldrsb	r3, [r1, r3]
	lsls	r3, r3, #2
	ldrsb	r2, [r1, r2]
	ldr	r3, [r3, r0]
	ldrb	r0, [r3, r2]
	ldr	r3, .L37+4
	bl	.L8
	ldr	r3, [r0, #4]
	ldrb	r6, [r3, #4]
	ldr	r3, [r0]
	movs	r4, r5
	ldrh	r0, [r3]
	ldr	r3, .L37+8
	bl	.L8
	adds	r4, r4, #48
	movs	r1, r0
	ldr	r3, .L37+12
	movs	r0, r4
	bl	.L8
	movs	r0, r4
	ldr	r3, .L37+16
	bl	.L8
	movs	r1, #0
	movs	r2, #13
	movs	r3, #1
	str	r2, [sp]
	movs	r4, r0
	movs	r2, r6
	movs	r0, r1
	ldr	r6, .L37+20
	rsbs	r3, r3, #0
	bl	.L39
	movs	r3, #128
	movs	r2, r0
	lsls	r3, r3, #3
	adds	r2, r2, #8
	str	r0, [r5, #76]
	ldr	r1, [r0, #48]
	strh	r3, [r2, #62]
	ldr	r5, .L37+24
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
	ldr	r3, .L37+28
	bl	.L8
	pop	{r0, r1, r4, r5, r6}
	pop	{r0}
	bx	r0
.L38:
	.align	2
.L37:
	.word	gMapUnit
	.word	GetUnit
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	Text_GetXCursor
	.word	MU_CreateInternal
	.word	-3073
	.word	MU_SetFacing
	.size	REW_displayTarget, .-REW_displayTarget
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
	ldr	r3, .L41
	movs	r2, r1
	ldr	r3, [r3]
	add	r1, sp, #4
	bl	.L8
	mov	r2, sp
	ldrb	r2, [r2, #4]
	ldr	r3, .L41+4
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
.L42:
	.align	2
.L41:
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
	ldr	r3, .L44
	movs	r2, r1
	ldrh	r1, [r3]
	strb	r1, [r4, #4]
	ldrh	r3, [r3, #2]
	movs	r1, r0
	strb	r3, [r4, #5]
	add	r0, sp, #4
	ldr	r3, .L44+4
	bl	.L8
	pop	{r0, r1, r4}
	pop	{r0}
	bx	r0
.L45:
	.align	2
.L44:
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
	ldr	r3, .L47
	ldr	r1, .L47+4
	ldr	r3, [r3]
	ldr	r1, [r1]
	bl	.L8
	pop	{r4}
	pop	{r0}
	bx	r0
.L48:
	.align	2
.L47:
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
	ldr	r3, .L51
	ldrb	r3, [r3, #22]
	movs	r2, r1
	cmp	r3, #1
	bne	.L49
	ldr	r3, .L51+4
	movs	r1, r0
	ldr	r0, [r3]
	ldr	r3, .L51+8
	bl	.L8
.L49:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L52:
	.align	2
.L51:
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
	ldr	r3, .L54
	ldr	r1, .L54+4
	ldr	r3, [r3]
	ldr	r1, [r1]
	bl	.L8
	pop	{r4}
	pop	{r0}
	bx	r0
.L55:
	.align	2
.L54:
	.word	ReadSramFast
	.word	REW_rewindBuffer
	.size	REW_loadRewind, .-REW_loadRewind
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
	movs	r2, #8
	ldr	r3, .L67
	ldrb	r3, [r3, #22]
	movs	r5, r0
	movs	r6, r1
	bics	r3, r2
	cmp	r3, #1
	beq	.L56
	ldr	r7, .L67+4
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	cmp	r3, #0
	beq	.L56
	bl	REW_loadRewind
	ldr	r3, .L67+8
	ldr	r4, [r3]
	movs	r3, #0
	ldr	r0, [r4]
	cmp	r0, r3
	beq	.L58
	ldr	r3, [r4, #4]
	ldrh	r3, [r3, #2]
.L58:
	adds	r0, r4, r0
	movs	r2, r0
	adds	r2, r2, #8
	strh	r3, [r0, #8]
	ldr	r1, [r7]
	str	r2, [sp, #4]
	ldrh	r7, [r1, #2]
	strh	r7, [r2, #2]
	ldr	r3, .L67+12
	ldrh	r2, [r1, #2]
	adds	r0, r0, #12
	adds	r1, r1, #4
	bl	.L8
	ldr	r3, [r4]
	adds	r3, r3, #4
	adds	r7, r3, r7
	ldr	r3, [sp, #4]
	movs	r2, r6
	str	r3, [r4, #4]
	movs	r1, r5
	movs	r0, r4
	str	r7, [r4]
	ldr	r3, .L67+16
	bl	.L8
.L56:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L68:
	.align	2
.L67:
	.word	gActionData
	.word	REW_curSequence
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
	movs	r2, r0
	ldrh	r0, [r0, #8]
	movs	r1, #3
	push	{r4, lr}
	movs	r4, r0
	ands	r4, r1
	tst	r0, r1
	beq	.L72
	adds	r3, r0, #4
	subs	r3, r3, r4
	lsls	r0, r3, #16
	lsrs	r0, r0, #16
.L72:
	adds	r2, r2, #8
	adds	r0, r2, r0
	@ sp needed
	pop	{r4}
	pop	{r1}
	bx	r1
	.size	REW_nextEntry, .-REW_nextEntry
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC60:
	.ascii	".\000"
	.text
	.align	1
	.global	REW_drawUI
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	REW_drawUI, %function
REW_drawUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r4, r0
	movs	r0, #216
	movs	r1, #3
	ldr	r3, .L88
	lsls	r0, r0, #2
	bl	.L8
	ldr	r5, .L88+4
	ldr	r0, .L88+8
	movs	r1, r5
	ldr	r3, .L88+12
	bl	.L8
	movs	r1, r5
	movs	r5, r4
	movs	r2, #0
	adds	r5, r5, #64
	ldr	r0, .L88+16
	ldr	r3, .L88+20
	bl	.L8
	movs	r1, #5
	movs	r0, r5
	ldr	r3, .L88+24
	bl	.L8
	movs	r1, #2
	ldr	r3, .L88+28
	movs	r0, r5
	bl	.L8
	movs	r0, #225
	ldr	r6, .L88+32
	lsls	r0, r0, #1
	bl	.L39
	ldr	r3, .L88+36
	movs	r1, r0
	movs	r0, r5
	bl	.L8
	movs	r1, #2
	ldr	r3, .L88+40
	movs	r0, r5
	bl	.L8
	ldr	r3, .L88+44
	ldrh	r7, [r3, #16]
	movs	r1, #8
	cmp	r7, #9
	ble	.L87
	cmp	r7, #99
	bgt	.L78
	movs	r1, #2
.L87:
	ldr	r3, .L88+48
	movs	r0, r5
	bl	.L8
	movs	r1, r7
	movs	r0, r5
	ldr	r3, .L88+52
	bl	.L8
.L78:
	movs	r0, r5
	movs	r5, r4
	ldr	r1, .L88+56
	adds	r5, r5, #56
	ldr	r7, .L88+60
	bl	.L90
	movs	r0, r5
	movs	r1, #4
	ldr	r3, .L88+24
	bl	.L8
	movs	r1, #2
	ldr	r3, .L88+28
	movs	r0, r5
	bl	.L8
	ldr	r0, .L88+64
	lsls	r0, r0, #16
	lsrs	r0, r0, #16
	bl	.L39
	ldr	r3, .L88+36
	movs	r1, r0
	movs	r0, r5
	bl	.L8
	movs	r0, r5
	ldr	r1, .L88+68
	bl	.L90
	ldr	r3, .L88+44
	ldrb	r3, [r3, #15]
	movs	r5, #0
	cmp	r3, #64
	beq	.L83
	subs	r3, r3, #128
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	lsls	r3, r3, #12
.L79:
	movs	r2, #0
	ldr	r6, .L88+72
	movs	r1, r2
	str	r5, [sp, #4]
	str	r5, [sp]
	ldr	r0, .L88+76
	bl	.L39
	movs	r3, #0
	str	r0, [r4, #80]
	movs	r2, r3
	movs	r1, r3
	str	r5, [sp, #4]
	str	r5, [sp]
	ldr	r0, .L88+80
	bl	.L39
	movs	r3, #0
	str	r0, [r4, #84]
	movs	r2, r3
	movs	r1, r3
	str	r5, [sp, #4]
	str	r5, [sp]
	ldr	r0, .L88+84
	movs	r5, r4
	bl	.L39
	adds	r5, r5, #48
	movs	r1, #15
	str	r0, [r4, #88]
	ldr	r3, .L88+24
	movs	r0, r5
	bl	.L8
	ldr	r3, .L88+28
	movs	r1, #2
	movs	r0, r5
	bl	.L8
	ldr	r3, [r4, #44]
	adds	r6, r3, #4
.L80:
	ldrb	r3, [r6]
	cmp	r3, #2
	bne	.L86
	@ sp needed
	movs	r1, r6
	movs	r0, r4
	bl	REW_displayActor
	ldr	r0, .L88+88
	lsls	r0, r0, #16
	ldr	r3, .L88+32
	lsrs	r0, r0, #16
	bl	.L8
	ldr	r3, .L88+36
	movs	r1, r0
	movs	r0, r5
	bl	.L8
	movs	r0, r6
	bl	REW_nextEntry
	movs	r1, r0
	movs	r0, r4
	bl	REW_displayTarget
	movs	r0, r5
	ldr	r1, .L88+92
	ldr	r3, .L88+96
	bl	.L8
	movs	r0, r5
	ldr	r1, .L88+100
	ldr	r3, .L88+60
	bl	.L8
	movs	r0, #3
	ldr	r3, .L88+104
	bl	.L8
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L83:
	movs	r3, #128
	lsls	r3, r3, #6
	b	.L79
.L86:
	movs	r0, r6
	bl	REW_nextEntry
	movs	r6, r0
	b	.L80
.L89:
	.align	2
.L88:
	.word	UnpackUiVArrowGfx
	.word	gGenericBuffer
	.word	REW_menuTSA
	.word	Decompress
	.word	gBg1MapBuffer
	.word	BgMap_ApplyTsa
	.word	Text_InitClear
	.word	Text_SetXCursor
	.word	GetStringFromIndex
	.word	Text_DrawString
	.word	Text_SetColorId
	.word	gChapterData
	.word	Text_Advance
	.word	Text_DrawNumber
	.word	gBg0MapBuffer+112
	.word	Text_Display
	.word	REW_phase
	.word	gBg0MapBuffer+240
	.word	APProc_Create
	.word	REW_phaseAPDef
	.word	REW_upArrowAPDef
	.word	REW_downArrowAPDef
	.word	REW_combat
	.word	.LC60
	.word	Text_DrawChar
	.word	gBg0MapBuffer+138
	.word	EnableBgSyncByMask
	.size	REW_drawUI, .-REW_drawUI
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
	ldr	r3, .L114
	add	r1, sp, #8
	movs	r0, r4
	bl	.L8
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
	beq	.L92
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
.L92:
	movs	r1, #111
	ldrsb	r1, [r4, r1]
	cmp	r1, #0
	blt	.L93
	ldr	r3, .L114+4
	add	r0, sp, #8
	bl	.L8
.L93:
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
	ldr	r3, .L114+8
	bl	.L8
	movs	r0, r4
	ldr	r3, .L114+12
	bl	.L8
	cmp	r0, #0
	ble	.L94
	movs	r3, r4
	adds	r3, r3, #80
	ldrb	r3, [r3]
	add	r2, sp, #8
	adds	r3, r3, r2
	adds	r3, r3, #40
	strb	r0, [r3]
.L94:
	movs	r1, r4
	movs	r0, #30
	movs	r5, #0
	add	r3, sp, #8
	movs	r2, #10
	adds	r1, r1, #30
	adds	r0, r0, r3
	ldr	r3, .L114+16
	bl	.L8
	ldr	r3, .L114+20
	add	r0, sp, #8
	bl	.L8
	movs	r6, r5
.L96:
	add	r3, sp, #8
	ldrb	r3, [r6, r3]
	ldrb	r2, [r7, r6]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	beq	.L95
	ldr	r1, [sp, #4]
	lsls	r2, r5, #1
	adds	r2, r1, r2
	strb	r6, [r2, #10]
	strb	r3, [r2, #11]
	adds	r5, r5, #1
.L95:
	adds	r6, r6, #1
	cmp	r6, #72
	bne	.L96
	ldr	r3, .L114+24
	ldrh	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L97
	adds	r4, r4, #72
	ldrh	r0, [r4]
	ldr	r3, .L114+28
	bl	.L8
	add	r3, sp, #8
	movs	r4, r0
	ldrb	r0, [r3, #28]
	ldr	r3, .L114+32
	bl	.L8
	ldrb	r0, [r0, #6]
	subs	r4, r4, r0
	lsls	r4, r4, #24
	lsrs	r4, r4, #24
	beq	.L97
	ldr	r2, [sp, #4]
	lsls	r3, r5, #1
	adds	r3, r2, r3
	strb	r6, [r3, #10]
	strb	r4, [r3, #11]
	adds	r5, r5, #1
.L97:
	ldr	r3, [sp, #4]
	strh	r5, [r3, #8]
	ldr	r3, [sp]
	adds	r5, r5, #1
	ldrh	r3, [r3, #2]
	lsls	r5, r5, #1
	adds	r5, r5, r3
	movs	r2, #3
	movs	r1, r5
	lsls	r3, r5, #16
	lsrs	r3, r3, #16
	ands	r1, r2
	tst	r5, r2
	bne	.L98
.L113:
	ldr	r2, [sp]
	strh	r3, [r2, #2]
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L98:
	adds	r3, r3, #4
	subs	r3, r3, r1
	b	.L113
.L115:
	.align	2
.L114:
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
	ldr	r3, .L125
	ldr	r5, [r3]
	ldr	r3, .L125+4
	ldr	r4, .L125+8
	ldrb	r0, [r3, #11]
	bl	.L127
	ldr	r7, .L125+12
	movs	r6, r0
	ldrb	r0, [r7, #11]
	bl	.L127
	movs	r3, #2
	strh	r3, [r5, #4]
	movs	r3, #0
	strh	r3, [r5, #6]
	ldr	r3, .L125+16
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
	ldr	r3, .L125+4
	ldrb	r3, [r3, #19]
	lsls	r3, r3, #24
	adds	r4, r5, #4
	asrs	r3, r3, #24
	beq	.L117
	movs	r3, r4
	movs	r2, r5
	movs	r0, r6
	ldr	r1, .L125+4
	bl	REW_storeCombatData
.L117:
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
	beq	.L116
	movs	r2, r5
	movs	r1, r7
	ldr	r0, [sp, #4]
	bl	REW_storeCombatData
.L116:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L126:
	.align	2
.L125:
	.word	REW_curSequence
	.word	gBattleActor
	.word	GetUnit
	.word	gBattleTarget
	.word	gActiveUnitMoveOrigin
	.size	REW_recordActionCombat, .-REW_recordActionCombat
	.global	REW_procScr
	.section	.rodata.str1.1
.LC79:
	.ascii	"REW_proc\000"
	.section	.rodata
	.align	2
	.type	REW_procScr, %object
	.size	REW_procScr, 128
REW_procScr:
	.short	1
	.short	0
	.word	.LC79
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	Text_InitFont
	.short	2
	.short	0
	.word	REW_initProc
	.short	11
	.short	1
	.word	0
	.short	2
	.short	0
	.word	REW_drawUI
	.short	3
	.short	0
	.word	REW_handleInput
	.short	24
	.short	1
	.word	REW_rewind
	.short	12
	.short	1
	.word	0
	.short	24
	.short	-1
	.word	REW_rewind
	.short	12
	.short	1
	.word	0
	.short	11
	.short	2
	.word	0
	.short	2
	.short	0
	.word	REW_cancelRewind
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
.L8:
	bx	r3
.L127:
	bx	r4
.L28:
	bx	r5
.L39:
	bx	r6
.L90:
	bx	r7
