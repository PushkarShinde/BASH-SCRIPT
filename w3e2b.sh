#!/bin/bash

# Function to check if a number is prime
is_prime() {
    local num=$1
    if [ $num -le 1 ]; then
        return 1
    fi
    for ((i=2; i*i<=num; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            return 1
        fi
    done
    return 0
}

# Check if the argument is passed
if [ $# -eq 0 ]; then
    echo "Usage: $0 <limit>"
    exit 1
fi

limit=$1
echo "Prime numbers below $limit are:"

# Loop through all numbers below the given limit
for ((num=2; num<limit; num++)); do
    is_prime $num
    if [ $? -eq 0 ]; then
        echo $num
    fi
done

