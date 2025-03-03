source ./match.sh

# test_TEMPLATE() {
#     result=$(match "STRING" 'REGEX')
#     exitcode=$?
#     echo "$result"
#     # assertContains "$result" "CAPTURED_GROUP"
#     assertEquals 1 $exitcode
# }

################################
###      ERE UNIT TESTS      ###
################################

test_match_success() {
    result=$(match "hello 123" "[0-9]+")
    echo "$result"
    assertEquals 0 $?
}

test_match_failure() {
    result=$(match "hello world" '[0-9]+')
    exitcode=$?
    echo "$result"
    assertContains "$result" "NO MATCH."
    assertEquals 1 $exitcode
}

test_GroupCapture_AsteriskDoesNotCaptureMultiple() {
    result=$(match "123456789" '([0-9]{2})*')
    exitcode=$?
    echo "$result"
    assertContains "$result" "1: 78"
    assertEquals 0 $exitcode
    # Bash’s built-in regex engine only stores the last captured group when using quantifiers, i.e *, +, {}.
}

test_GroupCapture_EmailUsernameDomain() {
    result=$(match \
        "cynthia.shirona+challengers@e4.pokeverse.sinnoh" \
        '^(([0-9A-Za-z._]+)(\+[0-9A-Za-z._]+))@(([0-9A-Za-z]+\.){1,}([0-9A-Za-z]+))$'
    )
    exitcode=$?
    echo "$result"
    assertContains "$result" "1: cynthia.shirona+challengers"
    assertContains "$result" "4: e4.pokeverse.sinnoh"
    assertEquals 0 $?
}

. ./shunit2/shunit2
