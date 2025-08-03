# Rewind
Rewind/Divine Pulse implementation for FE8U.

## Limitations
See Notes.md file. I'll write these here once this project is closer to being done.

## TODO
Loads of things! I'll write down specific things I'm worried I'll otherwise forget here.
  - Track trap decay from BmMain_UpdateTraps in phasechange rewind sequence.
  - Don't track rewind during beginning & ending scenes. (At least for beginning events this seems to already happen. CallBeginningEvents is called before the first phasechange rewind action gets prepared, meaning the current sequence is empty (no action), which should prevent any consequences from being added to the sequence (A sequence must start with an action)).
  - Track BWL changes.
  - (phasechange) gorgon eggs
  - Units dying (in combat or otherwise)
  - Test undo/redo on fogmap. Should probably use some generic bmMap refreshing function for unitmap, fogmap, sprites, etc.
  - How does rewind work during tutorials? Check this after implementing rewind for every event & action.