# Haphazardly organised notes
Current limitations of rewind are written in the last subsection. Will add to them (and remove some) as development continues.

## EventTypes

- TurnBasedEvents, https://feuniverse.us/t/fe8-ea-eventing-guide/7080/2#turnbasedevents-12
  also apply during phase changes!
- CharacterBasedEvents
- LocationBasedEvents
- MiscBasedEvents
- TrapData
- PlayerUnits
- BeginningScene & EndingScene. Don't store events in rewinddata if executed during either of these scenes!
- Tutorial events. maybe disable rewind menu option if tutorial flag is set. Alternatively, ignore altogether and don't use tutorial events.

## Phase change
Notes w.r.t. phase change.

### Main proc structure
https://github.com/FireEmblemUniverse/fireemblem8u/blob/master/src/bm.c#L69
PhaseChange: We start at gProc_BMapMain label 3
  PROC_CALL_2(BmMain_ChangePhase),
    SwitchPhases()
      Set chapterdata phase to next faction.
      Increment turn if next phase is blue.
      Increment supports.
    RunPhaseSwitchEvents
      Check if win condition was met, set winflag if so, CallEndEvent(), return true.
      Run any turnbased events, return true if found?
      Run any tutorial phasechange events.
  PROC_CALL(BmMain_SuspendBeforePhase),
  .
  .
  .
  PROC_CALL(TickActiveFactionTurn),
  PROC_START_CHILD_BLOCKING(gProcScr_StatusDecayDisplay),
  PROC_START_CHILD_BLOCKING(gProcScr_TerrainHealDisplay),
  PROC_START_CHILD_BLOCKING(gProcScr_PoisonDamageDisplay),
  PROC_START_CHILD_BLOCKING(gProcScr_GorgonEggHatchDisplay),

phaseChange Rewind data. Check out decomp's SwitchPhases function:
https://github.com/FireEmblemUniverse/fireemblem8u/blob/master/src/bm.c#L372

### Rewind plan
Hook at start of BmMain_ChangePhase, track in entry->flags:
  - 2 bits for prePhase
  - 2 bits for postPhase
  - 1 bit for turnIncr
  - 1 bit for skip phase.
In data, track unitIDs of greyed out units.

Hook in ProcessTurnSupportExp, add new unitchange rewindEntries for every unit whose support(s) change.

turnbased events will add themselves to rewind sequence.

Hook after gProc_BMapMain's proc label 9, tracking all new phase units' health, status, BWL (maybe not, too late for favoritism anyways), etc. (not supports anymore!) in the usual banim buffer. Because turnbased events already executed we no longer need to require scripted battles to not take place during turnbased events!

Hook immediately before gProc_BMapMain's proc label 5. Maybe replace the call to 0x8015434 as this seems to be leftover unused tutorial stuff from FE7. Make the PROC_CALL_2 into PROC_CALL, the original PROC_CALL_2 never yields due to the function it calls always returning true. Add unitChange rewindentries for all units' whose HP, status, etc. was changed using data that was buffered in previous hook.

### Other relevant notes
Basically phase order:
blue -> red -> green -> repeat.

After green phase, turncount gets incremented if under 999, supports get increased. RunPhaseSwitchEvents gets run as well. Seems to set win flag if win condition == GOAL_TYPE_DEFEAT_ALL or GOAL_TYPE_DEFEAT_BOSS and condition is met. Also runs TUTORIAL_EVT_TYPE_PHASECHANGE tutorial events. More importantly, turnBasedEvents. These can actually be run at different times of a turn, namely at the start of a phase!

Technically, when battle map starts, phase is set to green and turncount to 0. Then when the first phase change is forced, turncount increments, and supports are not increased due to an exception when turncount == 1, where ProcessTurnSupportExp immediately returns.

phase change calls ClearActiveFactionGrayedStates which calls PidStatsSubFavval08 which seems to deal with BWL for blue units. Need to track this for rewind when we start dealing with BWL.

phase change status decrement, need to keep this in mind too!

MIND THE GORGON EGGS during phase change!

## Unit loading
Notes w.r.t. loading units.

### Pipeline
Unit-loading rabbit hole. If we load unit with REDA, this is the pipeline to finding the end-position for unit.

Event2C_LoadUnits                   Load unit.
  EventLoadUnitWithMovement
    LoadUnit_800F704
      sub_800F8A8
        MuCtr_StartDefinedMove      Starts an muCtrlProc
          MuCtr_InitDefinedMove     Inits some more values in muCtrlProc, stores end pos in proc->x, y.
            AdjustNewUnitPosition   Finds available end pos to fit unit in.

### Rewind plan
Hook here when loading units:
https://github.com/FireEmblemUniverse/fireemblem8u/blob/1193deefdd322c261df42d561e21002957ccc08d/src/eventscr.c#L2296
store allegiance byte, ptr to ROM unitdef. Ignore if unit is cutscene unit (one of this func's args).
Hook again here in ENUN:
https://github.com/FireEmblemUniverse/fireemblem8u/blob/1193deefdd322c261df42d561e21002957ccc08d/src/eventscr.c#L3073
Now add x and y pos to corresponding unit in rewind-data.
When undoing load, just clear units based on allegiance byte. When redoing load, create new unitDef on stack, copy ROM unitdef from rewind data, zero out REDAcount and REDAptr, change x and y to rewinddata's x and y.

## Limitations
things that don't yet work and/or will not work:
  - FAD0 function (seems to be for FE7 Morphs, unused in FE8?)
  - gorgon eggs & hatching.
  - demon king summons.
  - phantom summon by summoners.
  - SPAWN_ALLY, SPAWN_NPC, SPAWN_ENEMY eventcodes. Shame but aren't planning to use these anyways.
  - BWL, only tracks Battles, Wins, Losses. Favoritism is too volatile, and Idc about the other stats either tbh. That said exp gained by combat is properly rewound at the moment. May change that.
  - gPlaySt.chapterTotalSupportGain does not get reset when undoing moves. Maybe I'll change this if I end up caring enough about this data.
  - Dont run animated scripted battles during turnBasedEvents. One of these buffers (left OAMData, Framedata, right OAMData, Framedata) is used by phasechange to track unit changes during phases due to healtiles, poison, status decay etc.
  - Riding ballistae doesn't undo. I don't plan on having rideable ballistae.
  - Anything rescue-related (rescuing units, giving, taking, dropping (voluntarily or due to death). Don't plan on having rescue available either.
  - Traps. Don't overlay any trap over a cracked-wall trap. GetTrapAt may return the not-cracked-wall trap and that breaks the search for the cracked-wall trap. Only once wall has been destroyed can its tiles be occupied by a different trap.
  - Unit loading requires every LOAD to be followed with an ENUN. As far as I'm aware vanilla does not require this, though it does abide by this. We now hard-require this. This is due to a hook in ENUN finalizing loaded units' final positions in rewind data. We can't know these positions when they're first loaded if they've got REDAs, due to the unit's final position changing if the final REDA tile is occupied.