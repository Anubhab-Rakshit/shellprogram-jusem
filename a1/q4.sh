#!/bin/bash

echo "Enter directory :- "
read path

if [ ! -d "$path" ]
then
    echo "Directory does not exist !"
    exit
fi

total=$(find "$path" -type f | wc -l)

echo "Total files = $total"

echo

echo "Files in each subdirectory :- "

find "$path" -type d | while read sub
do

    count=$(find "$sub" -maxdepth 1 -type f | wc -l)
    echo "$(basename "$sub") : $count"

done

echo

echo "Files modified within last week"

find "$dir" -type f -mtime -7