#!/bin/bash

# Used for setting text color/attributes
nrm=$(tput sgr0)
bld=$(tput bold)
red=$(tput setaf 1)
grn=$(tput setaf 2)
ylw=$(tput setaf 3)
blu=$(tput setaf 4)
mgn=$(tput setaf 5)

function print_text {
    lockfile -1 -r 60 ${SHIT_DIR}/output.lock
    lines=$(tput lines)
    last1=$(( $lines - 2 ))
    last=$(( $lines - 1 ))
    tput xoffc
    tput sc
    tput csr 1 $last1
    tput cup $last1
    echo -e $*
    tput csr 0 $last
    tput rc
    tput xonc
    rm -f ${SHIT_DIR}/output.lock
}

function print_server_text {
    output=$*
    print_text "${blu}Server> ${output}${nrm}"
}

function print_client_text {
    output=$*
    print_text "${grn}Client> ${output}${nrm}"
}

function print_status_bar {
    lockfile -1 -r 60 ${SHIT_DIR}/output.lock

    tput sc  # Save cursor position
    tput cup 0 0  # Move to top left
    tput el  # Clear to end of line

    echo "${grn}[${blu}Server:${nrm} ${status_connection}${grn}][${blu}Song:${nrm} $status_current_mp3${grn}]${nrm}"

    tput rc  # Restore cursor position

    rm -f ${SHIT_DIR}/output.lock
}