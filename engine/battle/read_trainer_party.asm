ReadTrainer:
; don't change any moves in a link battle
	ld a, [wLinkState]
	and a
	ret nz

	; Initialize the enemy party
	ld hl, wEnemyPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

; get the pointer to trainer data for this class
	ld a, [wCurOpponent]
	sub 201 ; convert value from pokemon to trainer
	call PrepareTrainerClassData
	ld a, TrainerPropertyPartiesOffset
	ld [wWhichProperty], a
	call GetInstanceProperty
	
	; hl = pointer to parties
	ld a, [wTrainerNo]
	ld b, a

	; find the proper trainer number
.findTrainerParty
	dec b
	jr z, .partyFound
.findEndOfParty
	ld a, [hli]
	and a
	jr nz, .findEndOfParty
	jr .findTrainerParty

.partyFound
	ld a, [hli]
	bit PartyDataSpecialFlagIndex, a ; is the trainer special?
	jr nz, .specialTrainer ; if so, check for special moves

; standard trainer
	ld [wCurEnemyLVL], a
.addNextPokemon_Standard
	ld a, [hli]
	and a ; have we reached the end of the trainer data?
	jr z, .storeTrainerMoney
	
	call AddMonToEnemyParty
	jr .addNextPokemon_Standard

.specialTrainer
	xor PartyDataSpecialFlagMask ; unset the flag
	ld de, wEnemyMon1Moves

.addNextMon
	and a
	jr z, .storeTrainerMoney ; add the money if end of data reached
	ld [wCurEnemyLVL], a
	ld a, [hli]

	push de
	call AddMonToEnemyParty

.checkForSpecialMove
	ld a, [hli] ; load next value
	bit PartyDataSpecialFlagIndex, a ; if the high bit is set, then this pokemon have a special move
	jr nz, .storeSpecialMove

	; otherwise, update the pointer for the next mon's move and read next data set
	pop de
	push hl
	ld hl, wEnemyMon2 - wEnemyMon1
	add hl, de
	ld d, h
	ld e, l ;de = pointer to next pokemon's moves
	pop hl
	jr .addNextMon

.storeSpecialMove
	push de

	xor PartyDataSpecialFlagMask ; unset the flag
	add e
	ld e, a ; move the move index
	jr nc, .dontIncD

	inc d ; if carry, increase d
.dontIncD

	ld a, [hli] ; get the new Move ID
	ld [de], a ; write to the move slot

	pop de
	jr .checkForSpecialMove

.storeTrainerMoney
; clear wAmountMoneyWon addresses
	xor a
	ld de, wAmountMoneyWon
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	ld a, [wCurEnemyLVL]
	ld b, a

.LastLoop
; update wAmountMoneyWon addresses (money to win) based on last enemy's level
	ld hl, wTrainerBaseMoney + 1
	ld c, 2 ; wTrainerBaseMoney is a 2-byte number
	push bc
	push de
	call AddBytes
	pop de
	pop bc
	dec b
	jr nz, .LastLoop ; repeat wCurEnemyLVL times
	ret

AddMonToEnemyParty:
	push hl
	ld [wd11e], a
	farcall PokedexToIndex
	ld a, [wd11e]
	ld [wcf91], a
	ld a, ENEMY_PARTY_DATA
	ld [wMonDataLocation], a
	call AddPartyMon
	pop hl
	ret