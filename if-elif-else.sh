#!/usr/bin/bash
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