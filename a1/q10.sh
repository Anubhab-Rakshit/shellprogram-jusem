#!/bin/bash

DEL_DIR="my-deleted-files"

if [ ! -d "$DEL_DIR" ]
then
    mkdir "$DEL_DIR"
fi

if [ "$1" = "-cl" ]
then
    echo -n "Are you sure you want to clear the entire $DEL_DIR directory? (y/n) :- "
    read ans
    if [ "$ans" = "y" ] || [ "$ans" = "Y" ]
    then
        rm -rf "$DEL_DIR"/*
        echo "Directory cleared."
    else
        echo "Action canceled."
    fi
    exit 0
fi

if [ $# -eq 0 ]
then
    echo "Usage: $0 <filename1> <filename2> ... OR $0 -cl"
    exit 1
fi

for file in "$@"
do
    if [ ! -e "$file" ]
    then
        echo "File '$file' does not exist."
        continue
    fi
    
    filename=$(basename "$file")
    dest_path="$DEL_DIR/$filename"
    
    if [ -e "$dest_path" ]
    then
        mv "$dest_path" "$dest_path.0"
        
        ver=1
        while [ -e "$dest_path.$ver" ]
        do
            ver=$(( ver + 1 ))
        done
        
        mv "$file" "$dest_path.$ver"
    elif [ -e "$dest_path.0" ]
    then
        ver=1
        while [ -e "$dest_path.$ver" ]
        do
            ver=$(( ver + 1 ))
        done
        
        mv "$file" "$dest_path.$ver"
    else
        mv "$file" "$dest_path"
    fi
done
