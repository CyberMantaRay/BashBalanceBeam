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

# USER INPUT ----------------
ipaddress() {
    read -p "What is your IP address? " ip_addr
    ping -c2 $ip_addr
}

# --------------------------------------
# -------        EXECUTE         -------
# --------------------------------------


conditional
forloop
forloopfile
whileloop
ipaddress

# Run Bash scripts w/ `bash` cmd or by enabling execution permission w/ `chmod`
