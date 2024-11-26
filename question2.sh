#!/usr/bin/bash

: <<'com'
you will create a Bash script that performs basic arithmetic calculations on two integers entered by the user. 
You will also use logical comparisons to determine which calculation leads to the greatest result.
com

# Prompt user for two integers
echo -n "Enter a integers: "
read num1 
echo -n "Enter another integer: "
read num2

# Calculate the sum and product of the two integers
sum=$((num1 + num2))
product=$((num1 * num2))

# Print the sum and product
echo "The sum is: $sum"
echo "The product is: $product"

# Compare sum and product and display the appropriate message
if [ $sum -lt $product ]; then
    echo "The sum is less than the product!"
elif [ $sum -gt $product ]; then
    echo "The sum is greater than the product!"
else
    echo "The sum is equal to the product!"
fi
