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

# Read the number of Fibonacci numbers to print
echo -n "Enter the number of Fibonacci numbers to print: "
read n

# Call the function
if [ $n -ge 2 ]; then
    fibonacci $n
else
    echo "Please enter a number greater than or equal to 2."
fi

