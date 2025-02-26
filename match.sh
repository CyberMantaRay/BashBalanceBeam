#!/bin/bash

[[ $1 =~ $2 ]]
echo $?          # $?: result of previous command

# Outputs RESULT of [[ $1 =~ $2 ]] process, i.e. 0=success, 1=fail

# Operator =~: performs a regex match of left string to the right ERE (extended regex)
#                           [[ "string" =~ pattern ]]
# NOTE: string should be quoted, and regex shouldn't be quoted (unless to match literal strings).
# =~ operator: https://unix.stackexchange.com/questions/597552/compare-string-with-regex
