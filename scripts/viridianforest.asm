ViridianForestScript:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianForestTrainerHeader0
	ld de, ViridianForestScriptPointers
	ld a, [wViridianForestCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianForestCurScript], a
	ret

ViridianForestScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

ViridianForestTextPointers:
	dw ViridianForestText1
	dw ViridianForestText2
	dw ViridianForestText3
	dw ViridianForestText4
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw ViridianForestText8
	dw ViridianForestText9
	dw ViridianForestText10
	dw ViridianForestText11
	dw ViridianForestText12
	dw ViridianForestText13
	dw ViridianForestText14

ViridianForestTrainerHeader0:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0
	dw ViridianForestBattleText1 ; TextBeforeBattle
	dw ViridianForestAfterBattleText1 ; TextAfterBattle
	dw ViridianForestEndBattleText1 ; TextEndBattle
	dw ViridianForestEndBattleText1 ; TextEndBattle

ViridianForestTrainerHeader1:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_1
	dw ViridianForestBattleText2 ; TextBeforeBattle
	dw ViridianForestAfterBattleText2 ; TextAfterBattle
	dw ViridianForestEndBattleText2 ; TextEndBattle
	dw ViridianForestEndBattleText2 ; TextEndBattle

ViridianForestTrainerHeader2:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_2
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_2
	dw ViridianForestBattleText3 ; TextBeforeBattle
	dw ViridianForestAfterBattleText3 ; TextAfterBattle
	dw ViridianForestEndBattleText3 ; TextEndBattle
	dw ViridianForestEndBattleText3 ; TextEndBattle

	db $ff

ViridianForestText1:
	fartext _ViridianForestText1
	done

ViridianForestText2:
	asmtext
	ld hl, ViridianForestTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

ViridianForestText3:
	asmtext
	ld hl, ViridianForestTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

ViridianForestText4:
	asmtext
	ld hl, ViridianForestTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

ViridianForestBattleText1:
	fartext _ViridianForestBattleText1
	done

ViridianForestEndBattleText1:
	fartext _ViridianForestEndBattleText1
	done

ViridianForestAfterBattleText1:
	fartext _ViridianFrstAfterBattleText1
	done

ViridianForestBattleText2:
	fartext _ViridianForestBattleText2
	done

ViridianForestEndBattleText2:
	fartext _ViridianForestEndBattleText2
	done

ViridianForestAfterBattleText2:
	fartext _ViridianFrstAfterBattleText2
	done

ViridianForestBattleText3:
	fartext _ViridianForestBattleText3
	done

ViridianForestEndBattleText3:
	fartext _ViridianForestEndBattleText3
	done

ViridianForestAfterBattleText3:
	fartext _ViridianFrstAfterBattleText3
	done

ViridianForestText8:
	fartext _ViridianForestText8
	done

ViridianForestText9:
	fartext _ViridianForestText9
	done

ViridianForestText10:
	fartext _ViridianForestText10
	done

ViridianForestText11:
	fartext _ViridianForestText11
	done

ViridianForestText12:
	fartext _ViridianForestText12
	done

ViridianForestText13:
	fartext _ViridianForestText13
	done

ViridianForestText14:
	fartext _ViridianForestText14
	done
