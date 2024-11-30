#!/bin/bash

# Function to transpose a matrix
transpose_matrix() {
    local rows=$1
    local cols=$2
    echo "Enter the matrix (row by row):"

    # Reading matrix row by row
    for ((i=0; i<rows; i++)); do
        for ((j=0; j<cols; j++)); do
            read -p "Element [$i, $j]: " matrix[$i,$j]
        done
    done

    echo "Original Matrix:"
    for ((i=0; i<rows; i++)); do
        for ((j=0; j<cols; j++)); do
            echo -n "${matrix[$i,$j]} "
        done
        echo
    done

    echo "Transposed Matrix:"
    for ((i=0; i<cols; i++)); do
        for ((j=0; j<rows; j++)); do
            echo -n "${matrix[$j,$i]} "
        done
        echo
    done
}

# Reading dimensions of the matrix
read -p "Enter number of rows: " rows
read -p "Enter number of columns: " cols

# Call the function to transpose
transpose_matrix $rows $cols

