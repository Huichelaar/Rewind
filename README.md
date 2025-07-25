# Rewind
Rewind/Divine Pulse implementation for FE8U.

## Limitations
See Notes.md file. I'll write these here once this project is closer to being done.

## TODO
Loads of things! I'll write down specific things I'm worried I'll otherwise forget here.
  - BmMain_UpdateTraps gets executed before BmMain_ChangePhase, need to move prephasechange hook and track these traps. https://github.com/FireEmblemUniverse/fireemblem8u/blob/master/src/bm.c#L99
  - Test undo/redo on fogmap. Should probably use some generic bmMap refreshing function for unitmap, fogmap, sprites, etc.
  - Don't track rewind during beginning & ending scenes.
  - Track BWL changes.
  - (phasechange) gorgon eggs
  - Units dying (in combat or otherwise)
  - How does rewind work during tutorials? Check this after implementing rewind for every event & action.