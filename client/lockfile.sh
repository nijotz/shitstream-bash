#!/bin/bash

# Define a lockfile funtion if lockfile and flock are not installed

function lockdir {
    mkdir $1 && return 0
    return 1
}

function lockclear {
    rm -f $1 2>/dev/null || rmdir $1 2>/dev/null
}

if ! which lockfile; then
function lockfile {
    lockdir $(echo "${@: -1}")
}
fi