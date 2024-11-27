#!/usr/bin/bash

: << 'com'
you will create a simple Bash script containing a conditional statement to handle the following tasks:
Prompt the user for a Yes or No response to a question
Print a response based on the user's answer  
com

echo "Are you a human?"
echo -n "Enter \"y\" for yes and \"n\" for no: "
read answer

if [ "$answer" == "y" ]; then
    echo "Me too!"
elif [ "$answer" == "n" ]; then
    echo "WTF!"
else
    echo "Invalid Answer!"
fi