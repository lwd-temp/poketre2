SSAnne6Script:
	call EnableAutoTextBoxDrawing
	ret

SSAnne6TextPointers:
	dw SSAnne6Text1
	dw SSAnne6Text2
	dw SSAnne6Text3
	dw SSAnne6Text4
	dw SSAnne6Text5
	dw SSAnne6Text6
	dw SSAnne6Text7

SSAnne6Text1:
	text ""
	fartext _SSAnne6Text1
	done

SSAnne6Text2:
	text ""
	fartext _SSAnne6Text2
	done

SSAnne6Text3:
	text ""
	fartext _SSAnne6Text3
	done

SSAnne6Text4:
	text ""
	fartext _SSAnne6Text4
	done

SSAnne6Text5:
	text ""
	fartext _SSAnne6Text5
	done

SSAnne6Text6:
	text ""
	fartext _SSAnne6Text6
	done

SSAnne6Text7:
	TX_ASM
	ld hl, SSAnne6Text_61807
	call PrintText
	ld a, [hRandomAdd]
	bit 7, a
	jr z, .asm_93eb1
	ld hl, SSAnne6Text_6180c
	jr .asm_63292
.asm_93eb1
	bit 4, a
	jr z, .asm_7436c
	ld hl, SSAnne6Text_61811
	jr .asm_63292
.asm_7436c
	ld hl, SSAnne6Text_61816
.asm_63292
	call PrintText
	jp TextScriptEnd

SSAnne6Text_61807:
	text ""
	fartext _SSAnne6Text_61807
	done

SSAnne6Text_6180c:
	text ""
	fartext _SSAnne6Text_6180c
	done

SSAnne6Text_61811:
	text ""
	fartext _SSAnne6Text_61811
	done

SSAnne6Text_61816:
	text ""
	fartext _SSAnne6Text_61816
	done
