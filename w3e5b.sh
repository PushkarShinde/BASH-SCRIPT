#!/bin/bash

# Function to transpose a matrix
transpose_matrix() {
    local rows=$1
    local cols=$2
    shift 2 # Skip first two arguments (rows and cols)

    # Reading matrix into an array
    local matrix=("$@")

    echo "Original Matrix:"
    for ((i=0; i<rows; i++)); do
        for ((j=0; j<cols; j++)); do
            index=$((i * cols + j))
            echo -n "${matrix[$index]} "
        done
        echo
    done

    echo "Transposed Matrix:"
    for ((i=0; i<cols; i++)); do
        for ((j=0; j<rows; j++)); do
            index=$((j * cols + i))
            echo -n "${matrix[$index]} "
        done
        echo
    done
}

# Check if arguments are passed
if [ $# -lt 3 ]; then
    echo "Usage: $0 <rows> <cols> <matrix elements>"
    exit 1
fi

# Extract rows and cols from command line arguments
rows=$1
cols=$2
shift 2 # Skip first two arguments

# Call the transpose function with remaining arguments (matrix elements)
transpose_matrix $rows $cols "$@"

