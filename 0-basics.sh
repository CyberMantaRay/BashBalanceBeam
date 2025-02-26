#!/bin/bash

# CONDITIONAL -------------
conditional() {
    a=$true

    if $a
    then
        echo "1st Avatar: Wan"
    fi
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
    if [ $op == "add" ]
    then
        let result=$x+$y
    elif [ $op == "sub" ]
    then
        let result=$x-$y
    elif [ $op == "mul" ]
    then
        let result=$x*$y
    elif [ $op == "div" ]
    then
        let result=$x/$y
    else
        result="$x & $y"
    fi  
    
    echo $result
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
