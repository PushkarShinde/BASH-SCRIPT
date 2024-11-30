#!/bin/bash

# Function to calculate the scalar product of two vectors
scalar_product() {
    local n=$1
    shift
    local vector1=("${@:1:$n}")
    local vector2=("${@:$((n + 1)):$n}")

    local product=0

    # Loop through the vectors and calculate the scalar product
    for ((i=0; i<n; i++)); do
        product=$((product + vector1[i] * vector2[i]))
    done

    echo "The scalar product of the vectors is: $product"
}

# Check if the correct number of arguments is passed
if [ $# -lt 3 ]; then
    echo "Usage: $0 <vector_size> <vector1_elements> <vector2_elements>"
    exit 1
fi

# Get the size of the vectors
n=$1
shift

# Call the function with the vector elements
scalar_product $n "$@"

