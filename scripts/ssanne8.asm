SSAnne8Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne8TrainerHeader0
	ld de, SSAnne8ScriptPointers
	ld a, [wSSAnne8CurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne8CurScript], a
	ret

SSAnne8ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnne8TextPointers:
	dw SSAnne8Text1
	dw SSAnne8Text2
	dw SSAnne8Text3
	dw SSAnne8Text4
	dw SSAnne8Text5
	dw SSAnne8Text6
	dw SSAnne8Text7
	dw SSAnne8Text8
	dw SSAnne8Text9
	dw PickUpItemText
	dw SSAnne8Text11

SSAnne8TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_8_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_8_TRAINER_0
	dw SSAnne8BattleText1 ; TextBeforeBattle
	dw SSAnne8AfterBattleText1 ; TextAfterBattle
	dw SSAnne8EndBattleText1 ; TextEndBattle
	dw SSAnne8EndBattleText1 ; TextEndBattle

SSAnne8TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_8_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_8_TRAINER_1
	dw SSAnne8BattleText2 ; TextBeforeBattle
	dw SSAnne8AfterBattleText2 ; TextAfterBattle
	dw SSAnne8EndBattleText2 ; TextEndBattle
	dw SSAnne8EndBattleText2 ; TextEndBattle

SSAnne8TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_8_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_8_TRAINER_2
	dw SSAnne8BattleText3 ; TextBeforeBattle
	dw SSAnne8AfterBattleText3 ; TextAfterBattle
	dw SSAnne8EndBattleText3 ; TextEndBattle
	dw SSAnne8EndBattleText3 ; TextEndBattle

SSAnne8TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_8_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_8_TRAINER_3
	dw SSAnne8BattleText4 ; TextBeforeBattle
	dw SSAnne8AfterBattleText4 ; TextAfterBattle
	dw SSAnne8EndBattleText4 ; TextEndBattle
	dw SSAnne8EndBattleText4 ; TextEndBattle

	db $ff

SSAnne8Text1:
	text ""
	asmtext
	ld hl, SSAnne8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text2:
	text ""
	asmtext
	ld hl, SSAnne8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text3:
	text ""
	asmtext
	ld hl, SSAnne8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text4:
	text ""
	asmtext
	ld hl, SSAnne8TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text8:
	text ""
	fartext _SSAnne8Text8
	asmtext
	ld a, WIGGLYTUFF
	call PlayCry
	jp TextScriptEnd

SSAnne8BattleText1:
	text ""
	fartext _SSAnne8BattleText1
	done

SSAnne8EndBattleText1:
	text ""
	fartext _SSAnne8EndBattleText1
	done

SSAnne8AfterBattleText1:
	text ""
	fartext _SSAnne8AfterBattleText1
	done

SSAnne8BattleText2:
	text ""
	fartext _SSAnne8BattleText2
	done

SSAnne8EndBattleText2:
	text ""
	fartext _SSAnne8EndBattleText2
	done

SSAnne8AfterBattleText2:
	text ""
	fartext _SSAnne8AfterBattleText2
	done

SSAnne8BattleText3:
	text ""
	fartext _SSAnne8BattleText3
	done

SSAnne8EndBattleText3:
	text ""
	fartext _SSAnne8EndBattleText3
	done

SSAnne8AfterBattleText3:
	text ""
	fartext _SSAnne8AfterBattleText3
	done

SSAnne8BattleText4:
	text ""
	fartext _SSAnne8BattleText4
	done

SSAnne8EndBattleText4:
	text ""
	fartext _SSAnne8EndBattleText4
	done

SSAnne8AfterBattleText4:
	text ""
	fartext _SSAnne8AfterBattleText4
	done

SSAnne8Text5:
	text ""
	fartext _SSAnne8Text5
	done

SSAnne8Text6:
	text ""
	fartext _SSAnne8Text6
	done

SSAnne8Text7:
	text ""
	fartext _SSAnne8Text7
	done

SSAnne8Text9:
	text ""
	fartext _SSAnne8Text9
	done

SSAnne8Text11:
	text ""
	fartext _SSAnne8Text11
	done
