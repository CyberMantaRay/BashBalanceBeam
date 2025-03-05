#!/bin/bash

set -eu

createScript() {
    # echo "Entering createScript()..."

    # Predefined text
    cat <<'EOF' > "$CREATION_PATH$FILENAME.sh"
#!/bin/bash

helloBash() {
    echo "Hello Bash!"
}
EOF
}

createTests() {
    # echo "Entering createTests()..."

    # Predefined text
    cat <<EOF > "$CREATION_PATH$FILENAME.test.sh"
source ./$FILENAME.sh

################################
###        UNIT TESTS        ###
################################

testHelloBash() {
    result=\$(helloBash)
    exitcode=\$?
    echo -e "  ∙ \$result"
    assertContains "\$result" "Hello Bash!"
    assertEquals 0 \$exitcode
}

. ../shunit2/shunit2
EOF
}

checkFlags() {
    # echo "Entering checkFlags()..."
    
    CREATE_DIR=false            # Flag to determine if directory should be created

    for arg in "$@"; do
        # echo "Arg: $arg"
        if [ "$arg" == "-d" ]; then
            shift
            createDirectory $@
            CREATE_DIR=true
        fi
    done

}

createDirectory() {
    mkdir $FILENAME
    CREATION_PATH=$CREATION_PATH$FILENAME/
}

removeFiles() {
    # TODO! For dev mode only
    sleep 1
    cd ..
    rm -r "$FILENAME"
}

invalidUsage() {
    echo "Usage: $0 [-d] <filename>"
    exit 1
}

######################
###      MAIN      ###
######################

DEV_MODE=false
CREATION_PATH=./
FILENAME=${@:$#}

if [ $# -lt 1 ]; then                      # Check if a filename is provided
    invalidUsage "$0"
elif [ $# -gt 1 ]; then
    checkFlags "$@"
fi

if [ -f "$1" ]; then
    echo "$1.sh already exists."
    exit 1
else
    createScript
    createTests
    cd "$CREATION_PATH"
    bash "$FILENAME.test.sh"

    # removeFiles
fi

# FILENAME="$1"
