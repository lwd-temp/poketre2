; special text IDs
TEXT_MON_FAINTED      EQU $d0
TEXT_BLACKED_OUT      EQU $d1
TEXT_REPEL_WORE_OFF   EQU $d2
TEXT_SAFARI_GAME_OVER EQU $d3

; PrintNumber
BIT_MONEY_SIGN     EQU 5
BIT_LEFT_ALIGN     EQU 6
BIT_LEADING_ZEROES EQU 7

MONEY_SIGN EQU     (1 << BIT_MONEY_SIGN)
LEFT_ALIGN EQU     (1 << BIT_LEFT_ALIGN)
LEADING_ZEROES EQU (1 << BIT_LEADING_ZEROES)

; Textbox settings
BIT_DRAW_BORDER EQU 6
BIT_DONT_REVEAL EQU 7

DRAW_BORDER EQU 1 << BIT_DRAW_BORDER
DONT_REVEAL EQU 1 << BIT_DONT_REVEAL

FONT_COLOR_MASK EQU %00001100

BLACK_ON_WHITE EQU 0 << 2
BLACK_ON_LIGHT EQU 1 << 2
WHITE_ON_DARK EQU 2 << 2
WHITE_ON_BLACK EQU 3 << 2

TEXT_LINES_MASK EQU %00000011
LINES_1 EQU 0
LINES_2 EQU 1
LINES_3 EQU 2
LINES_4 EQU 3