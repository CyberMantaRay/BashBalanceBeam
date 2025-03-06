#!/bin/bash

# Usage: ./hashdir.sh <~/path/to/dir> [-c]
# Flags:
#   -c = show collisions only across each algo

hash() {
    HASH_ALGOS=("md5sum" "sha1sum" "sha256sum" "sha512sum")
    HEX_DIGITS=(32 40 64 128)

    for i in {0..3}; do
        echo "----------------------------------"
        echo "--- ALGO: ${HASH_ALGOS[$i]} --------------"
        echo "----------------------------------"

        result=$(find "$1" -type f -print0 | xargs -0 ${HASH_ALGOS[$i]} | sort)
        # result=$(find "$1" -type f -print0 \( ! -name "*.sh" \) | xargs -0 ${HASH_ALGOS[$i]} | sort)             # Excludes script files

        if [[ "$2" == "-c" ]]; then
            echo "$result" | uniq -w ${HEX_DIGITS[$i]} -D
        else echo "$result"
        fi
        
        echo -e ""
    done
}

hash "$@"


######################
###  SAMPLE OUTPUT ###
######################

# andor@ws16:~/Documents/Playground$ bash hashdir.sh ~/Downloads/data
# ----------------------------------
# --- ALGO: md5sum --------------
# ----------------------------------
# 86fb269d190d2c85f6e0468ceca42a20  ./hashdir/data/test1.txt
# 86fb269d190d2c85f6e0468ceca42a20  ./hashdir/data/test2.txt
# ed076287532e86365e841e92bfc50d8c  ./hashdir/data/hello.txt

# ----------------------------------
# --- ALGO: sha1sum --------------
# ----------------------------------
# 2ef7bde608ce5404e97d5f042f95f89f1c232871  ./hashdir/data/hello.txt
# d3486ae9136e7856bc42212385ea797094475802  ./hashdir/data/test1.txt
# d3486ae9136e7856bc42212385ea797094475802  ./hashdir/data/test2.txt

# ----------------------------------
# --- ALGO: sha256sum --------------
# ----------------------------------
# 7f83b1657ff1fc53b92dc18148a1d65dfc2d4b1fa3d677284addd200126d9069  ./hashdir/data/hello.txt
# c0535e4be2b79ffd93291305436bf889314e4a3faec05ecffcbb7df31ad9e51a  ./hashdir/data/test1.txt
# c0535e4be2b79ffd93291305436bf889314e4a3faec05ecffcbb7df31ad9e51a  ./hashdir/data/test2.txt
