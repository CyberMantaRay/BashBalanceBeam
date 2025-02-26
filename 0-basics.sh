#!/bin/bash

# CONDITIONAL -------------
conditional() {
    a=$true

    if $a
    then
        echo "1st Avatar: Wan"
    fi

    # Equivalent to:

    $a && echo "82nd Avatar: Aang"

    # Shell & Booleans: https://stackoverflow.com/questions/2953646/how-can-i-declare-and-use-boolean-variables-in-a-shell-script
}

add() {
    op="err"
    if [ $op == "mul" ]
    then
        let result=2*3          # 'let' enables math ops
    else
        result=2*3
    fi  
    
    echo $result
}


# LOOPS ----------------
forloop() {
    for i in 1 2 3 "4 5 6"
    do
        echo $i
    done
}

forloopfile() {
    pets=pets.txt
    filetokens=$(cat $pets)

    # Separate tokens by whitespace
    for i in $filetokens
    do
        echo $i
    done
}

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

# USER INPUT ----------------
ipaddress() {
    read -p "What is your IP address? " ip_addr
    ping -c2 $ip_addr
}

calc() {
    read -p "Operand x: " x
    read -p "Operand y: " y
    read -p "Op (add,sub,mul,div): " op

    declare -i result           # 'declare' casts variable as specified type, i.e. -i for integer
    opperformed=true

    if [ $op == "add" ]; then
        result=$x+$y
    elif [ $op == "sub" ]; then
        result=$x-$y
    elif [ $op == "mul" ]; then
        result=$x*$y
    elif [ $op == "div" ]; then
        result=$x/$y
    else
        echo "$x & $y"
        opperformed=false
    fi

    if [ "$opperformed" == true ]; then echo $result; fi
}

# --------------------------------------
# -------        EXECUTE         -------
# --------------------------------------

conditional
# add
# forloop
# forloopfile
# whileloop
# ipaddress
calc

# Run Bash scripts w/ `bash` cmd or by enabling execution permission w/ `chmod`
