#ifndef SAVE_H
#define SAVE_H
#include "gbafe.h"
#include "../internal.h"

// Custom.
void* REW_findCurSequence();
void REW_clearCurSequence();
void* REW_findRewindBuf();
void REW_clearRewindBuf();
void REW_cpPhaseChangeSave(Proc* proc);
void REW_loadActiveUnitMoveOrigin(void* src, u32 size);
void REW_saveActiveUnitMoveOrigin(void* dest, u32 size);
void REW_loadCurSequence(void* src, u32 size);
void REW_saveCurSequence(void* dest, u32 size);
void REW_loadRewind(void* src, u32 size);
void REW_saveRewind(void* dest, u32 size);

// EMS.
struct SaveChunkDecl {
	/* 00 */ u16 offset;
	/* 02 */ u16 size;

	/* 04 */ void (*save)(void* target, unsigned size);
	/* 08 */ void (*load)(void* source, unsigned size);

	/* 0C */ u16 identifier;
};
extern const struct SaveChunkDecl* MS_FindSuspendSaveChunk(unsigned chunkId);
extern const u16* EMS_CHUNK_REWIND_SEQ;
extern const u16* EMS_CHUNK_REWIND_BUF;
extern const u16  gSaveBlockDecl[];

// Vanilla.
void CpPhase_Init(Proc* proc);                // 0x80396AD
void SaveSuspendedGame(int saveBlockId);      // 0x80A5A49

#endif // SAVE_H