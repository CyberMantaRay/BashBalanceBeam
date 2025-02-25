#!/bin/bash

# CONDITIONAL -------------
conditional() {
    a=$true

    if $a
    then
        echo "variable a is true"
    fi
}


# FOR LOOP ----------------
forloop() {
    for i in 1 2 3 4
    do
        echo $i
    done
}

forloopfile() {
    iffile = ifcon.sh
    filecon = $(cat $iffile)

    # Separate & rint file tokens by whitespace excl/ contained between quotes
    for i in $filecon
    do
        echo $i
    done
}


# WHILE LOOP --------------
whileloop() {
    declare -i a
    a=1

    while [ $a -lt 6 ]
    do
        echo $a
        a+=1
        a="$a+1"
    done
}

# EXECUTE FUNCTIONS ------------------------------
conditional
forloop
whileloop

# Run Bash scripts w/ `bash` cmd or by enabling execution permission w/ `chmod`
