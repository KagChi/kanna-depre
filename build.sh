#!/usr/bin/env bash

#Original Code By Rin!#8240, with some modification.

# Remove the old lib folder first
    echo "[BUILD] Remove the old lib folder..."
    rimraf dist
    echo "[BUILD] Finish removed the old lib folder"
sleep 2
# Builder

    # start the timer
    T="$(date +%s%N)"
    echo "[BUILD] Start build the coffeescript file"

    # command goes here
    coffee --compile --output lib/ src/

    # end the timer
    T="$(($(date +%s%N)-T))"
    S="$((T/1000000000))"
    M="$((T/10000000))"

    printf "[BUILD] Finish build, time to build: %02d:%02d:%02d.%03d\n" "$((S/3600%24))" "$((S/60%60))" "$((S%60))" "${M}"
