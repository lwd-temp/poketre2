; special text IDs
TEXT_MON_FAINTED      EQU $d0
TEXT_BLACKED_OUT      EQU $d1
TEXT_REPEL_WORE_OFF   EQU $d2
TEXT_SAFARI_GAME_OVER EQU $d3

; PrintNumber
BIT_ALREADY_PRINTED_MONEY_SIGN EQU 4
BIT_MONEY_SIGN     EQU 5
BIT_LEFT_ALIGN     EQU 6
BIT_RIGHT_ALIGN    EQU 6 ; When using the numtext macro
BIT_LEADING_ZEROES EQU 7

MONEY_SIGN EQU     (1 << BIT_MONEY_SIGN)
LEFT_ALIGN EQU     (1 << BIT_LEFT_ALIGN)
RIGHT_ALIGN EQU     (1 << BIT_RIGHT_ALIGN)
LEADING_ZEROES EQU (1 << BIT_LEADING_ZEROES)

; PrintBCDNumber
BIT_NO_LEADING_ZEROES EQU 7
NO_LEADING_ZEROES EQU (1 << BIT_NO_LEADING_ZEROES)

; Textbox settings
BIT_NO_DELAY EQU 4
; TODO - instead, use 2 bits to represent the border style
; each font color has 4 potential borders (though 00 = no border for all)
; remove the NO_WORD_WRAP ??
BIT_NO_BORDER EQU 5
BIT_DONT_REVEAL EQU 6
BIT_NO_WORD_WRAP EQU 7

NO_DELAY EQU 1 << BIT_NO_DELAY
NO_BORDER EQU 1 << BIT_NO_BORDER
DONT_REVEAL EQU 1 << BIT_DONT_REVEAL
NO_WORD_WRAP EQU 1 << BIT_NO_WORD_WRAP

FONT_COLOR_MASK EQU %00001100

BLACK_ON_WHITE EQU 0 << 2
BLACK_ON_LIGHT EQU 1 << 2
WHITE_ON_BLACK EQU 2 << 2
GLYPHS EQU 3 << 2

TEXT_LINES_MASK EQU %00000011
LINES_1 EQU 0
LINES_2 EQU 1
LINES_3 EQU 2
LINES_4 EQU 3

TEXTBOX_ROWS_REMAINING_MASK EQU %00001111
TEXTBOX_AUTOSCROLL_REMAINING_MASK EQU %11110000

DEFAULT_SPEECH_TEXTBOX EQU NO_WORD_WRAP | BLACK_ON_WHITE | LINES_2

; Text Commands
NO_TEXTBOX EQU 0
RAM_TEXT EQU 1
NEAR_TEXT EQU 1
TWO_OPTION_TEXT EQU 2
AUTO_PARAGRAPH EQU 3
TEXT_WAIT EQU 4
TEXT_ASM EQU 5
GOTO_TEXT EQU 6
NUM_TEXT EQU 7
BCD_TEXT EQU 8
CRY_TEXT EQU 9
SFX_TEXT EQU 10
DELAY_TEXT EQU 11
TEXT_EXIT EQU 12

TEXTBOX_DEF EQU $18
CONTINUE_TEXT EQU $4B
AUTO_CONTINUE_TEXT EQU $4C
NEXT_TEXT_LINE EQU $4E
PARAGRAPH EQU $51
TEXT_PROMPT EQU $58
TEXT_END EQU $50
MOVE_USER_TEXT EQU $5A
MOVE_TARGET_TEXT EQU $59
PLAYER_NAME_TEXT EQU $52
RIVAL_NAME_TEXT EQU $53
POKE_TEXT EQU $54
PC_TEXT EQU $5B
ROCKET_TEXT EQU $5E
TM_TEXT EQU $5C
TRAINER_TEXT EQU $5D
DOTS_TEXT EQU $56
PKMN_TEXT EQU $4A
FAR_TEXT EQU $55

nl EQU NEXT_TEXT_LINE
par EQU PARAGRAPH
