SSAnne9Script:
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, SSAnne9TrainerHeader0
	ld de, SSAnne9ScriptPointers
	ld a, [wSSAnne9CurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne9CurScript], a
	ret

SSAnne9ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnne9TextPointers:
	dw SSAnne9Text1
	dw SSAnne9Text2
	dw SSAnne9Text3
	dw SSAnne9Text4
	dw SSAnne9Text5
	dw PickUpItemText
	dw SSAnne9Text7
	dw SSAnne9Text8
	dw PickUpItemText
	dw SSAnne9Text10
	dw SSAnne9Text11
	dw SSAnne9Text12
	dw SSAnne9Text13

SSAnne9TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_0
	dw SSAnne9BattleText1 ; TextBeforeBattle
	dw SSAnne9AfterBattleText1 ; TextAfterBattle
	dw SSAnne9EndBattleText1 ; TextEndBattle
	dw SSAnne9EndBattleText1 ; TextEndBattle

SSAnne9TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_1
	dw SSAnne9BattleText2 ; TextBeforeBattle
	dw SSAnne9AfterBattleText2 ; TextAfterBattle
	dw SSAnne9EndBattleText2 ; TextEndBattle
	dw SSAnne9EndBattleText2 ; TextEndBattle

SSAnne9TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_2
	dw SSAnne9BattleText3 ; TextBeforeBattle
	dw SSAnne9AfterBattleText3 ; TextAfterBattle
	dw SSAnne9EndBattleText3 ; TextEndBattle
	dw SSAnne9EndBattleText3 ; TextEndBattle

SSAnne9TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_3
	dw SSAnne9BattleText4 ; TextBeforeBattle
	dw SSAnne9AfterBattleText4 ; TextAfterBattle
	dw SSAnne9EndBattleText4 ; TextEndBattle
	dw SSAnne9EndBattleText4 ; TextEndBattle

	db $ff

SSAnne9Text1:
	TX_ASM
	ld hl, SSAnne9TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text2:
	TX_ASM
	ld hl, SSAnne9TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text3:
	TX_ASM
	ld hl, SSAnne9TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text4:
	TX_ASM
	ld hl, SSAnne9TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text5:
	TX_ASM
	call SaveScreenTilesToBuffer1
	ld hl, SSAnne9Text_61bf2
	call PrintText
	call LoadScreenTilesFromBuffer1
	ld a, SNORLAX
	call DisplayPokedex
	jp TextScriptEnd

SSAnne9Text_61bf2:
	text ""
	fartext _SSAnne9Text_61bf2
	done

SSAnne9Text7:
	TX_ASM
	ld hl, SSAnne9Text_61c01
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c01:
	text ""
	fartext _SSAnne9Text_61c01
	done

SSAnne9Text8:
	TX_ASM
	ld hl, SSAnne9Text_61c10
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c10:
	text ""
	fartext _SSAnne9Text_61c10
	done

SSAnne9Text10:
	TX_ASM
	ld hl, SSAnne9Text_61c1f
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c1f:
	text ""
	fartext _SSAnne9Text_61c1f
	done

SSAnne9Text11:
	TX_ASM
	ld hl, SSAnne9Text_61c2e
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c2e:
	text ""
	fartext _SSAnne9Text_61c2e
	done

SSAnne9Text12:
	TX_ASM
	ld hl, SSAnne9Text_61c3d
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c3d:
	text ""
	fartext _SSAnne9Text_61c3d
	done

SSAnne9Text13:
	TX_ASM
	ld hl, SSAnne9Text_61c4c
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c4c:
	text ""
	fartext _SSAnne9Text_61c4c
	done

SSAnne9BattleText1:
	text ""
	fartext _SSAnne9BattleText1
	done

SSAnne9EndBattleText1:
	text ""
	fartext _SSAnne9EndBattleText1
	done

SSAnne9AfterBattleText1:
	text ""
	fartext _SSAnne9AfterBattleText1
	done

SSAnne9BattleText2:
	text ""
	fartext _SSAnne9BattleText2
	done

SSAnne9EndBattleText2:
	text ""
	fartext _SSAnne9EndBattleText2
	done

SSAnne9AfterBattleText2:
	text ""
	fartext _SSAnne9AfterBattleText2
	done

SSAnne9BattleText3:
	text ""
	fartext _SSAnne9BattleText3
	done

SSAnne9EndBattleText3:
	text ""
	fartext _SSAnne9EndBattleText3
	done

SSAnne9AfterBattleText3:
	text ""
	fartext _SSAnne9AfterBattleText3
	done

SSAnne9BattleText4:
	text ""
	fartext _SSAnne9BattleText4
	done

SSAnne9EndBattleText4:
	text ""
	fartext _SSAnne9EndBattleText4
	done

SSAnne9AfterBattleText4:
	text ""
	fartext _SSAnne9AfterBattleText4
	done
