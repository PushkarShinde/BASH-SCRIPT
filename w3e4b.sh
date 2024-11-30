#!/bin/bash

# Function to calculate GCD using Euclidean algorithm
gcd() {
    local a=$1
    local b=$2
    while [ $b -ne 0 ]; do
        local temp=$b
        b=$((a % b))
        a=$temp
    done
    echo "GCD is: $a"
}

# Check if two arguments are passed
if [ $# -ne 2 ]; then
    echo "Usage: $0 <number1> <number2>"
    exit 1
fi

# Call the gcd function with command-line arguments
gcd $1 $2

