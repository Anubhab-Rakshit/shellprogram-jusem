#!/bin/bash

echo "Enter directory path :- "

read path

if [ ! -d "$path" ]
then
    echo "Directory does not exist."
    exit
fi

echo
echo "Files :- "
find "$path" -type f

echo
echo "Directories :- "
find "$path" -type d

files=$(find "$path" -type f | wc -l)
dirs=$(find "$path" -type d | wc -l)

echo
echo "Total Files = $files"
echo "Total Directories = $dirs"

echo
echo "Files modified in last 7 days :- "
find "$path" -type f -mtime -7

echo
echo "Total Size :- "
find "$path" -type f -mtime -7 -exec du -ch {} + | tail -1