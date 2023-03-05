Definition Struct
    exit
        DefineContextMacro {\1#Lambdas}
        DefineContextMacro {\1#Methods}
    endm

    open
        def \1#Symbol equs "\5"
        def \1#UseSuper = false

        ; remove Symbol from forward to Instance Init
        def \@#args equs "\1, \2, \3, \4"
        shift 5
        continue {\@#args}, \#
    endm

    method
        continue {\1#Name}_\2
    endm

    property
        continue {\1#Symbol}#\2
    endm

    handle
        def \@#context equs "\1"
        shift 4

        continue {{\@#context}#Symbol}, \#
    endm
end