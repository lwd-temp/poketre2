db 0 ; Former Pokedex ID (was never used anyway)
db 40 ; base hp
db 45 ; base attack
db 35 ; base defense
db 90 ; base speed
db 40 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 255 ; catch rate
db 69 ; base exp yield
db 0, 0, 0 ; Former Front Sprite Dimension & Pointer
db 0, 0 ; Former Back Sprite Pointer
; attacks known at lvl 0
db SCRATCH
db GROWL
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 9,10,11,12,16
	tmlearn 20,24
	tmlearn 25,31,32
	tmlearn 34,39,40
	tmlearn 44
	tmlearn 50
db 0 ; padding
