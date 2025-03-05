#!/bin/bash

############################
###      DATA TYPES      ###
############################

arrays() {
    arr1=(6 2 4 "Kali" 8 "Luther")        # Array values space-separated
    echo ${arr1[@]}         # Access all elements
    echo ${arr1[3]}                 # 0-indexed
    printf "Length: %s\n" "${#arr1[@]}"    # Get array length w/ #arr[@] or #arr[*]

    # ----- SPECIAL VARIABLES -----
    # Try running w/: bash hellobash.sh -e arg1 arg2 arg3
    # Does each output match what you expect?
    echo "$0"       # Command line arg ${n}, w/ '$0' being script name, e.g. hellobash.sh
    echo "$*"       # Command line args as string not incl. $0
    echo "$#"       # Command line arg count not incl. $0
    echo "$@"       # Command line args as array not incl. $0
    echo -- "$@"
    printf "%s\t" "$@"
    printf "\n%s\n" "$*"
    echo "${@:$(($#-1))}"       # ${@:M} = grab args from M index to end of array
    echo "${@:$#:1}"            # ${@:M:N?} = N specifies # args to grab starting at M index
}

associativeArray() {
    declare -A avatars=([roku]="Fire"
        [kyoshi]="Earth"
        [kuruk]="Water"
        [yangchen]="Air"
    )
    echo ${avatars[@]}          # Print values (random order)
    echo ${!avatars[@]}         # Print keys (random order)
    echo ${avatars[kyoshi]}

    avatars[aang]="Air"         # Adding element
    echo ${!avatars[@]}
}

gymBadgesKanto() {
    declare -A Badges=(
        [Brock]="Boulder Badge"
        [Misty]="Cascade Badge"
        [Lt.Surge]="Thunder Badge"
        [Erika]="Rainbow Badge"
        [Janine]="Soul Badge"
        [Sabrina]="Marsh Badge"
        [Blaine]="Volcano Badge"
        [Giovanni]="Earth Badge"
    )

    for gymleader in ${!Badges[@]}
    do
        echo $gymleader "=" ${Badges[$gymleader]}       # Print key/value pairs
    done
}

integerToBinary() {
    read -p "Pick a number (0-255): " integer

    # Generates all values b/w 00000000 to 11111111 as distinct elements (length=256)
    IntegerToBinary=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
    echo "$integer in binary is ${IntegerToBinary[$integer]}"
}

############################
###     CONDITIONALS     ###
############################

conditional() {
    a=$true

    if $a
    then echo "1st Avatar: Wan"
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

casestmt() {
    read -p "Choose a nation (air,water,earth,fire): " nation

    case "$nation" in
        fire)
            echo "Avatar Roku ➞ Avatar Aang." ;;
        earth)
            echo "Avatar Kyoshi → Avatar Roku." ;;
        water)
            echo "Avatar Kuruk → Avatar Kyoshi." ;;
        air)
            echo "Avatar Yangchen → Avatar Kuruk." ;;
        *)
            echo "Koh has a new target..." ;;
    esac
}


#######################
###      LOOPS      ###
#######################

forloop() {
    for i in 1 2 3 "4 5 6"
    do
        echo $i
    done

    for i in {4..8..2}          #{start..end..step}
    do
        echo $i
    done
}

forloopfile() {
    pets=./data/pets.txt
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

whileloopfile() {
    # while IFS= read -r passphrase || [[ -n "$passphrase" ]]; do         # Allows picking up last line even if doesn't end in newline
    # IFS=internal field separator, prevents trimming of leading/trailing spaces or treating spaces as delimiters
    while IFS= read -r passphrase; do       # Last line of actual content must end with a newline to be properly parsed
        echo "Passphrase: '$passphrase'"
    done < ./data/pkmn-gen4.txt
}

############################
###      USER INPUT      ###
############################

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

# arrays $@
# associativeArray
# gymBadgesKanto
# conditional
# casestmt
# add
# forloop
# forloopfile
# whileloop
# whileloopfile
# ipaddress
# calc

# Run Bash scripts w/ `bash` cmd or by enabling execution permission w/ `chmod +x`
