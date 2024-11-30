#!/bin/bash

# Function to calculate the scalar product of two vectors
scalar_product() {
    local n=$1
    local product=0

    # Loop through the vectors and calculate the scalar product
    for ((i=0; i<n; i++)); do
        product=$((product + vector1[i] * vector2[i]))
    done

    echo "The scalar product of the vectors is: $product"
}

# Read the size of the vectors
echo -n "Enter the number of elements in the vectors: "
read n

# Initialize vectors
declare -a vector1
declare -a vector2

# Read the elements of the first vector
echo "Enter elements of the first vector:"
for ((i=0; i<n; i++)); do
    read -p "Element $((i+1)): " vector1[i]
done

# Read the elements of the second vector
echo "Enter elements of the second vector:"
for ((i=0; i<n; i++)); do
    read -p "Element $((i+1)): " vector2[i]
done

# Call the function to calculate scalar product
scalar_product $n

