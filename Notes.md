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

## Items

A unit's item inventory can change by means of:
  - Equipping a (different) item. This action is free.
  - Discarding an item. This action is free.
  - Defeating an enemy that drops an item.
  - Stealing from an enemy.
  - Unlocking a chest.
  - Trading (blue units) with another unit (blue or green).
  - Trading with the supply.
  - Maybe more I haven't thought of.
  
Note that equipping and discarding items can be done freely without forcing the unit to commit to any move. This means a rewind sequence can start with one of these actions. The action will not be saved, just like the sequence at this point, so no harm no foul. Just something to keep in mind.

One idea to track item inventory changes is to plant hooks in UnitAddItem, AddItemToConvoy, UnitRemoveItem and RemoveItemFromConvoy (the big 4). Problem is that there are awkward exceptions:
  - LoadUnit will add items by calling UnitAddItem, which would result in tracking the items twice, wasting space. Technically this issue can be avoided by not tracking in UnitAddItem if unit has 0 HP as the loaded unit at this point will have 0 HP. This also works for gorgon eggs (they're initialized with 5 hp).
  - PrepItemSupply_GiveItemToSupply (which is not just used in preps, but when a unit interacts with the supply, even during a chapter) doesn't actually call UnitRemoveItem, but manually removes the item.
  - Others I may not be aware of.

Conversely I could hook at all the different actions that result in a unit's inventory and the convoy's inventory being changed instead of the big 4. More control. Already have a few ORGS following this idea written in src/asm/conseqs/conseqs.event. Also makes it easier to merge certain changes like a unit storing an item in the convoy. This should only require one entry saving the item (and the inventory slot of the unit, not convoy as we don't care about the order of items in the convoy) instead of one entry for removing the item from the unit and another for adding it to the convoy.

Heres how I was thinking of implementing the rewind entries:

REW_unitInventoryReorder:
  Invoked when equipping a different item.
  flags will be:
    - 3 bits for first item new location (5 options).
    - 2 bits for second and third item new location (4 and 3 remaining options.
    - 1 bit for fourth item new location (2 remaining options.
    - 0 bits for fifth (only one option, by process of elimination).
  meaning one byte will be enough for this part.
  need:
    - Unit index byte.
  If entry immediately before this one is also a REW_unitInventoryReorder for the same unit (player is equipping different items on this unit) then we should merge the two.
  
  Is there some way to merge equip -> discard -> equip? Maybe not very relevant as I assume not many players will even discard items when they're not forced to.
  
REW_unitInventoryChange
  Invoked when discarding or obtaining an item.
  Also invoked when sending to/taking from convoy.
   unit.
  need:
    - Unit index byte.
    - The item that's discarded/obtained. 2 bytes.
    
  flags will be:
    - The inventory slot the item was in before being discarded. 3 bits.
    - Indication whether item is obtained      or discarded. 1 bit.
    - Indication whether item is obtained from or given to convoy. 1 bit.

What if convoy is full?

## Phase change
Notes w.r.t. phase change.

### Main proc structure
https://github.com/FireEmblemUniverse/fireemblem8u/blob/master/src/bm.c#L72
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
https://github.com/FireEmblemUniverse/fireemblem8u/blob/master/src/bm.c#L375

### Other relevant notes
Basically phase order:
blue -> red -> green -> repeat.

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

## Limitations
things that don't yet work and/or will not work:
  - FAD0 function (seems to be for FE7 Morphs, unused in FE8?)
  - gorgon eggs & hatching.
  - demon king summons.
  - phantom summon by summoners.
  - SPAWN_ALLY, SPAWN_NPC, SPAWN_ENEMY eventcodes. Don't seem to be used in vanilla (confirm this!)
  
  - When stealing the last item from a unit that can drop last item, make sure to track US_DROP_ITEM.
  https://github.com/FireEmblemUniverse/fireemblem8u/blob/master/src/bmmind.c#L370
  
  - When buying from/selling to shops, don't just track convoy/unit items, also track gold.
  
  - BWL rewind implementation situation
    lossAmt:      TODO. Need to implement rewind for arena still.
    favval:       NOGO. Volatile. Changes even when not committing to actions.
    actAmt:       NOGO. Volatile. Changes even when not committing to actions.
    statViewAmt:  NOGO. Volatile. Changes even when not committing to actions.
    deathLoc:     TODO. Various spots including traps, etc. Start from PidStatsRecordDefeatInfo
    deathTurn:    TODO. Various spots including traps, etc. Start from PidStatsRecordDefeatInfo
    deployAmt:    NOGO. Doesn't change during a chapter.
    moveAmt:      TODO. PidStatsAddSquaresMoved is called only in MoveActiveUnit.
    deathCause:   TODO. Various spots including traps, etc. Start from PidStatsRecordDefeatInfo
    expGained:    TODO. Still need arena.
    winAmt:       TODO. Still need arena.
    battleAmt:    TODO. Still need arena.
    killerPid:    TODO. Various spots including traps, etc. Start from PidStatsRecordDefeatInfo
    deathSkirm:   TODO. Various spots including traps, etc. Start from PidStatsRecordDefeatInfo

  - gPlaySt.chapterTotalSupportGain does not yet get reset when undoing moves.
  - Riding ballistae doesn't undo yet.
  - Anything rescue-related (rescuing units, giving, taking, dropping (voluntarily or due to death) doesn't undo yet.
  - Traps. Don't overlay any trap over a cracked-wall trap. GetTrapAt may return the not-cracked-wall trap and that breaks the search for the cracked-wall trap. Only once wall has been destroyed can its tiles be occupied by a different trap. Also, lightarrow, gas, firetile.
  - Unit loading requires every LOAD to be followed with an ENUN. As far as I'm aware vanilla does not require this, though it does abide by this. We now hard-require this. This is due to a hook in ENUN finalizing loaded units' final positions in rewind data. We can't know these positions when they're first loaded if they've got REDAs, due to the unit's final position changing if the final REDA tile is occupied.