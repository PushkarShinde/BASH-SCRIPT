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

# Read two numbers interactively
echo -n "Enter first number: "
read num1
echo -n "Enter second number: "
read num2

# Call the gcd function
gcd $num1 $num2

