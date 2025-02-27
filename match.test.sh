source ./match.sh

################################
###        UNIT TESTS        ###
################################

test_match_ThreeDigitNumber() {
    result=$(match "45778476" "[0-9]{3}")
    echo "$result"
    assertEquals 0 $?
}

test_match_success() {
    result=$(match "hello 123" "[0-9]+")
    # echo "$result"
    assertEquals 0 $?
}

test_match_failure() {
    result=$(match "hello world" "[0-9]+")
    exitcode=$?
    echo "$result"
    assertContains "$result" "NO MATCH."
    assertEquals 1 $exitcode
}

. ./shunit2/shunit2
