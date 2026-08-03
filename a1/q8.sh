#!/bin/bash

if [ $# -eq 2 ]
then
    date1=$1
    date2=$2
else
    echo -n "Enter first birthday (DD/MM/YYYY) :- "
    read date1
    
    echo -n "Enter second birthday (DD/MM/YYYY) :- "
    read date2
fi

day1=$(date -j -f "%d/%m/%Y" "$date1" "+%A" 2>/dev/null)
day2=$(date -j -f "%d/%m/%Y" "$date2" "+%A" 2>/dev/null)

if [ -z "$day1" ] || [ -z "$day2" ]
then
    echo "Invalid date provided. Please use DD/MM/YYYY."
    exit 1
fi

if [ "$day1" = "$day2" ]
then
    echo "Match! Both were born on a $day1."
else
    echo "No match. Person 1 was born on a $day1, Person 2 was born on a $day2."
fi
