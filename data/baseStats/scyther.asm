db 0 ; Former Pokedex ID (was never used anyway)
db 70 ; base hp
db 110 ; base attack
db 80 ; base defense
db 105 ; base speed
db 55 ; base special
db BUG ; species type 1
db FLYING ; species type 2
db 45 ; catch rate
db 187 ; base exp yield
db 0, 0, 0 ; Former Front Sprite Dimension & Pointer
db 0, 0 ; Former Back Sprite Pointer
; attacks known at lvl 0
db QUICK_ATTACK
db 0
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 3,6
	tmlearn 9,10,15
	tmlearn 20
	tmlearn 31,32
	tmlearn 34,39,40
	tmlearn 44
	tmlearn 50,51
db 0 ; padding
