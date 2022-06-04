NameRaterScript:
	jp EnableAutoTextBoxDrawing

NameRaterScript_1da15:
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret

NameRaterScript_1da20:
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, wPlayerName
	ld c, NAME_LENGTH
	call .asm_1da47
	jr c, .asm_1da52
	ld hl, wPartyMon1OTID
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, wPlayerID
	ld c, $2
.asm_1da47
	ld a, [de]
	cp [hl]
	jr nz, .asm_1da52
	inc hl
	inc de
	dec c
	jr nz, .asm_1da47
	and a
	ret
.asm_1da52
	scf
	ret

NameRaterTextPointers:
	dw NameRaterText1

NameRaterText1:
	text ""
	asmtext
	call SaveScreenTilesToBuffer2
	ld hl, NameRaterText_1dab3
	call NameRaterScript_1da15
	jr nz, .asm_1daae
	ld hl, NameRaterText_1dab8
	call PrintText
	xor a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jr c, .asm_1daae
	call GetPartyMonName2
	call NameRaterScript_1da20
	ld hl, NameRaterText_1dad1
	jr c, .asm_1daa8
	ld hl, NameRaterText_1dabd
	call NameRaterScript_1da15
	jr nz, .asm_1daae
	ld hl, NameRaterText_1dac2
	call PrintText
	callba DisplayNameRaterScreen
	jr c, .asm_1daae
	ld hl, NameRaterText_1dac7
.asm_1daa8
	call PrintText
	jp TextScriptEnd
.asm_1daae
	ld hl, NameRaterText_1dacc
	jr .asm_1daa8

NameRaterText_1dab3:
	text ""
	fartext _NameRaterText_1dab3
	done

NameRaterText_1dab8:
	text ""
	fartext _NameRaterText_1dab8
	done

NameRaterText_1dabd:
	text ""
	fartext _NameRaterText_1dabd
	done

NameRaterText_1dac2:
	text ""
	fartext _NameRaterText_1dac2
	done

NameRaterText_1dac7:
	text ""
	fartext _NameRaterText_1dac7
	done

NameRaterText_1dacc:
	text ""
	fartext _NameRaterText_1dacc
	done

NameRaterText_1dad1:
	text ""
	fartext _NameRaterText_1dad1
	done
