Scope Text
    ; \1 - AutoExit function
    ; \2+? - auto exit triggers
    init
        def \1#DoAutoExit = false
        def \1#isAutoExiting = false

        SetAutoExit \2

        def \@#self equs "\1"
        shift 2
        def {\@#self}#AutoExitTriggers equs "\#"
        
        rept _narg
            def Text_\1 equs "TriggerAutoExit \1,"
            shift
        endr
    endm

    function text, "TriggerAutoExit text,"

    function SetAutoExit
      args
        if \1#DoAutoExit
            fail "An AutoExit has already been defined for this text: {\1#AutoExit}"
        endc

        if strcmp("\2","")
            def \1#DoAutoExit = true
            String \1#AutoExit, "\2"
        endc
    endm

    function TriggerAutoExit
      args
        end
        shift
        exec \#
    endm

    function PurgeAutoExitTriggers
      args
        for i, 2, _narg+1
            purge {\1#Name}_\<i>
        endr
    endm
    
    ; Define the textbox before writing the text
    function textbox
      args
        db TEXTBOX_DEF, \2
    endm
    
    function more
      args
        shift
        foreach db, \#
    ENDM
    
    function ramtext
      args
        dbw RAM_TEXT, \2
    ENDM

    function gototext
      args
        dbw GOTO_TEXT, \2
    ENDM

    function neartext
      args
        dbw NEAR_TEXT, \2
    ENDM

    function fartext
      args
        db FAR_TEXT
        dab \2
    ENDM
    
    ; 1 - address
    ; 2 - num digits
    ; 3 - num bytes & flags
    function numtext
      args
        db NUM_TEXT
        dw \2
        db (\3 << 3) | \4
    ENDM

    function bcdtext
      args
        db BCD_TEXT
        dw \2
        db \3
    ENDM

    function crytext
      args
        db CRY_TEXT, \2
    ENDM

    function sfxtext
      args
        db SFX_TEXT, \2
    ENDM

    function asmtext
      args
        SetAutoExit asmdone
        db TEXT_ASM
    ENDM
    
    function delaytext
      args
        db DELAY_TEXT
    ENDM
    
    function two_opt
      args
        db TWO_OPTION_TEXT
        shift
        foreach dw, \#
    ENDM

    ; Scroll to the next line.
    function cont
      args
        shift
        foreach db, CONTINUE_TEXT, \#
    ENDM
    
    ; Scroll without user interaction
    function autocont
      args
        shift
        foreach db, AUTO_CONTINUE_TEXT, \#
    ENDM
    
    ; Move a line down.
    function next
      args
        shift
        foreach db, NEXT_TEXT_LINE, \#
    ENDM
    
    ; Start a new paragraph.
    function para
      args
        shift
        foreach db, PARAGRAPH, \#
    ENDM
    
    ; Start a new paragraph without user interaction
    function autopara
      args
        shift
        foreach db, AUTO_PARAGRAPH, \#
    ENDM

    ; Just wait for a keypress before continuing
    function wait
      args
        db TEXT_WAIT
    ENDM

    ; End a string
    function done
      args
        db TEXT_END
        CleanExit
    endm

    ; Prompt the player to end a text box (initiating some other event).
    function prompt
      args
	    db TEXT_PROMPT
        CleanExit
    endm

    ; Just wait for a keypress before continuing
    function asmdone
      args
	    jp TextScriptEnd
        CleanExit
    endm

    ; Exit without waiting for keypress
    function close
      args
	    db TEXT_EXIT
    endm

    function CleanExit
      args
        ; dont end again if this was called through auto-exit
        if not \1#isAutoExiting
            ; todo - test if provided function is expected AutoExit
            if \1#DoAutoExit
            endc

            def \1#DoAutoExit = false
            end
        endc
    endm

    exit
        PurgeAutoExitTriggers {\1#AutoExitTriggers}
        if \1#DoAutoExit
            def \1#isAutoExiting = true
            ; execute the auto exit function
            {\1#AutoExit}
        endc
    endm
end