#!/bin/bash


if [ $# -eq 0 ]
then
    echo "File name not provided ! "
    exit 1
fi

filename=$1


if [ ! -f "$filename" ]
then
    echo "Error: File '$filename' not found!"
    exit 1
fi


echo -n "Enter the string to search :- "
read search_str


if [ -z "$search_str" ]
then
    echo "Error: Search string cannot be empty."
    exit 1
fi


total_count=$(grep -o "$search_str" "$filename" | wc -l | tr -d ' ')


if [ "$total_count" -eq 0 ]
then
    echo "The string '$search_str' was not found in the file."

else
    echo "Total occurrences of the string :- $total_count"
    echo "Line details :- "
    grep -o -n "$search_str" "$filename" | cut -d: -f1 | uniq -c | while read count line_num
    do
        echo "Line $line_num :- $count time(s)"
    done
fi
