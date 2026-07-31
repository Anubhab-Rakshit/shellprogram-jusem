#!/bin/bash

echo "Enter filename :- "
read file

if [ ! -f "$file" ]
then
    echo "File not found !"
    exit
fi

echo "Enter word :- "
read word

total=$(grep -o "$word" "$file" | wc -l)

if [ "$total" -eq 0 ]
then
    echo "Word not found !"
    exit
fi

echo "Total occurrences = $total"
echo
echo "Line-wise frequency"
echo

grep -n "$word" "$file" | while IFS=: read line content
do
    count=$(echo "$content" | grep -o "$word" | wc -l)
    echo "Line $line : $count occurrence(s)"
done