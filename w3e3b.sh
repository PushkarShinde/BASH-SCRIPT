#!/bin/bash

# Function to print Fibonacci sequence
fibonacci() {
    local n=$1
    a=0
    b=1
    echo -n "$a $b "

    for ((i=2; i<n; i++)); do
        fib=$((a + b))
        echo -n "$fib "
        a=$b
        b=$fib
    done
    echo
}

# Check if an argument is passed
if [ $# -eq 0 ]; then
    echo "Usage: $0 <number_of_fibonacci_numbers>"
    exit 1
fi

# Call the function with the command-line argument
n=$1
if [ $n -ge 2 ]; then
    fibonacci $n
else
    echo "Please enter a number greater than or equal to 2."
fi

