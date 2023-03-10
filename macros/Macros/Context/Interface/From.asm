/*
    From methods get execute when returning to this Context from another Context with the given name(s)
    - can end with string to make lambda
    - otherwise, need to follow with 'func'
*/
macro Interface@from
    is#String \<_NARG>
    if so
        for i, 3, _narg
            def \2@from@\<i> equs \<_NARG>
            append \2#Froms, from@\<i>
        endr
    else
        redef temp@name equs "\2@from@\@"
        Interface@func \1, \2, {temp@name}
        for i, 3, _narg+1
            def \2@from@\<i> equs "Interface@from#execute \2@from@\<i>, {temp@name},"
            append \2#Froms, from@\<i>
        endr
    endc
endm

macro Interface@from#execute
    def \@#prev_super equs "{super}"
    redef super equs "{\1#Super} \3, \4,"
    exec \2, \3, \4
    redef super equs "{\@#prev_super}"
endm

macro Interface@from#inherit
    for i, 4, _narg+1
        ; if not defined in this type, pull from parent
        if not def(\2@\<i>)
            Interface@from#inherit#define \2@\<i>, \1, \3, \<i>

            redef \2@\<i>#Super equs "{\3@\<i>#Super}"
            redef \2@\<i>#isSuper = true
            
            append \2#Froms, \<i>
        ; otherwise, the super is the parent
        else
            Interface@from#inherit#define \2@\<i>#Super, \1, \3, \<i>
            redef \2@\<i>#isSuper = false
        endc
    endr
endm
/*
    \1 - Symbol to assign to
    \2 - Context
    \3 - Parent Interface
    \4 - Method
*/
macro Interface@from#inherit#define
    redef \1 equs "{\3@\4}"
endm
