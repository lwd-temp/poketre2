ViridianForestScript:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianForestTrainerHeaders
	ld de, ViridianForestScriptPointers
	ld a, [wViridianForestCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianForestCurScript], a
	ret

ViridianForestScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
