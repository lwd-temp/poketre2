UnknownDungeon3Script:
	call EnableAutoTextBoxDrawing
	ld hl, MewtwoTrainerHeader
	ld de, .ScriptPointers
	ld a, [wUnknownDungeon3CurScript]
	call ExecuteCurMapScriptInTable
	ld [wUnknownDungeon3CurScript], a
	ret

.ScriptPointers
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

UnknownDungeon3TextPointers:
	dw MewtwoText
	dw PickUpItemText
	dw PickUpItemText

MewtwoTrainerHeader:
	dbEventFlagBit EVENT_BEAT_MEWTWO
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MEWTWO
	dw MewtwoBattleText ; TextBeforeBattle
	dw MewtwoBattleText ; TextAfterBattle
	dw MewtwoBattleText ; TextEndBattle
	dw MewtwoBattleText ; TextEndBattle

	db $ff

MewtwoText:
	text ""
	asmtext
	ld hl, MewtwoTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MewtwoBattleText:
	text ""
	fartext _MewtwoBattleText
	asmtext
	ld a, MEWTWO
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
