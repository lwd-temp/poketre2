CeladonMansion5Script:
	jp EnableAutoTextBoxDrawing

CeladonMansion5TextPointers:
	dw CeladonMansion5Text1
	dw CeladonMansion5Text2

CeladonMansion5Text1:
	text ""
	fartext _CeladonMansion5Text1
	done

CeladonMansion5Text2:
	text ""
	asmtext
	lb bc, EEVEE, 25
	call GivePokemon
	jr nc, .asm_24365
	ld a, HS_CELADON_MANSION_5_GIFT
	ld [wMissableObjectIndex], a
	predef HideObject
.asm_24365
	jp TextScriptEnd
