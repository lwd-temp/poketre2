_DayCareIntroText::
	text "I run a DAYCARE."
	line "Would you like me"
	cont "to raise one of"
	cont "your POKéMON?"
	done

_DayCareWhichMonText::
	text "Which POKéMON"
	line "should I raise?"
	prompt

_DayCareWillLookAfterMonText::
	text "Fine, I'll look"
	line "after @"
	TX_RAM wcd6d
	db $0
	cont "for a while."
	prompt

_DayCareComeSeeMeInAWhileText::
	text "Come see me in"
	line "a while."
	done

_DayCareMonHasGrownText::
	text "Your @"
	TX_RAM wcd6d
	db $0
	line "has grown a lot!"

	para "By level, it's"
	line "grown by "
	numtext wDayCareNumLevelsGrown, 3, 1
	text "!"

	para "Aren't I great?"
	prompt

_DayCareOweMoneyText::
	text "You owe me $"
	bcdtext wDayCareTotalCost, $c2
	db TEXT_INIT
	line "for the return"
	cont "of this POKéMON."
	done

_DayCareGotMonBackText::
	text "<PLAYER> got"
	line "@"
	TX_RAM wDayCareMonName
	text " back!"
	done

_DayCareMonNeedsMoreTimeText::
	text "Back already?"
	line "Your @"
	TX_RAM wcd6d
	db $0
	cont "needs some more"
	cont "time with me."
	prompt
