#!/bin/bash

function match() {
    printf "\tInput:    $1\n\tPattern:  $2\n"

    [[ $1 =~ $2 ]]      # =~ only matches once per string

    if [ $? -eq 0 ]     # $?: result of previous command
    then
        echo -e "\tMATCHES:"
        for i in "${!BASH_REMATCH[@]}"; do
            echo -e "\t  - $i: ${BASH_REMATCH[$i]}"
        done
        return 0
    # else echo "$1" | grep -Eo "$2"
    else
        echo -e "\tNO MATCH."
        return 1
    fi
}

if [[ $1 != "" ]] && [[ $2 != "" ]]
then match "$1" "$2"
fi

# Outputs RESULT of [[ $1 =~ $2 ]] process, i.e. 0=success, 1=fail

# Operator =~: performs a regex match of left string to the right ERE (extended regex)
#                           [[ "string" =~ pattern ]]
# NOTE: string should be quoted, and regex shouldn't be quoted (unless to match literal strings).
# =~ operator: https://unix.stackexchange.com/questions/597552/compare-string-with-regex

# $BASH_REMATCH - special array variable in the Bash shell that stores the results of matching a regex using =~ operator within a script
# When using the =~ operator to match a regex against a string, any captured groups (i.e., parenthesized subexpressions) are stored in the ${BASH_REMATCH[@]} array starting from index 1.
# The entire matched text is stored at index 0.
