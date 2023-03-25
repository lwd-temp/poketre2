; TODO - distinguish between a pokemon and a trainer  
Class2 MapObjectsBattle, TrainerBattle
    property List, Texts

    method init
      args , #Sprite, #X, #Y, #Movement, #Direction, #Range, trainer
        var \1#MapBattleIndex = nextBattleCount()
        vars \1#Trainer = Symbolize({trainer})

        db \1#Sprite
        MapCoord \1#X, \1#Y
        db \1#Movement, \1#Direction

        AddTextPointer \1#TrainerHeader, MapText#Type#Trainer

        db \1#Trainer
        ; todo - should be a return value from the Trainer Class
        db {\1#Trainer}PartyCount | ObjectData#Trainer#BitMask
        def {\1#Trainer}PartyCount += 1

        InitTrainerHeader \1#Range, \1#TrainerHeader

        TryExpectBattleText
    endm

    method TryExpectBattleText
      args
        if \1#Texts#_size <= 1
            ExpectBattleText done
        elif \1#Texts#_size <= 3
            ExpectBattleText prompt
        endc
    endm

    method ExpectBattleText
      args , method
        ExpectText InitBattleText, {method}, Team
    endm

    method InitBattleText
      args
        if \1#Texts#_size == 0
            def \@#pointer equs "\1#BeforeBattleText"
        elif \1#Texts#_size == 1
            def \@#pointer equs "\1#AfterBattleText"
        elif \1#Texts#_size == 2
            def \@#pointer equs "\1#WinBattleText"
        else
            def \@#pointer equs "\1#LoseBattleText"
        endc

        \1#Texts@push {\@#pointer}
        AddTrainerHeaderPointer {\@#pointer}

        pushs
        TextsSec
            {\@#pointer}:
    endm

    from Text
      args
        super
        TryExpectBattleText
    endm

    ; TODO - can use generic Win or Loss texts if not provided
    method exit
      args
        ; todo - also if missing before or after
        if \1#Texts#_size < 3
            fail "Battle Win/Lose Texts are missing"
        ; If Lose Text is missing, then duplicate the last text (the win text)
        elif \1#Texts#_size == 3
            AddTrainerHeaderPointer {\1#Texts#2}
        endc

        pops
    endm
end
