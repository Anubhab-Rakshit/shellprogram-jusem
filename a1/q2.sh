#!/bin/bash

while true

do
    echo "Enter first value :- "
    read userv1

    echo "Enter second value :- "

    read userv2

    if [[ $userv1 =~ ^-?[0-9]+([.][0-9]+)?$ && $userv2 =~ ^-?[0-9]+([.][0-9]+)?$ ]]
    then
        echo "Addition = $(echo "$userv1 + $userv2" | bc)"

        echo "Subtraction = $(echo "$userv1 - $userv2" | bc)"

        echo "Multiplication = $(echo "$userv1 * $userv2" | bc)"

        if [ "$userv2" != "0" ]
        then
            echo "Division = $(echo "scale=2; $userv1 / $userv2" | bc)"
        else
            echo "Division not possible (divide by zero)"
        fi
    else
        echo "Arithmetic operations cannot be performed."
    fi

    echo "Reverse Order :- "

    echo "$userv2 $userv1"
    echo
    echo "Run Again? (y/n)"
    read choice

    if [ "$choice" != "y" ]
    then
        break
    fi
done