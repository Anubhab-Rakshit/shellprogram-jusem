#!/bin/bash


#1. Write a shell script that reads command line arguments and prints the number of arguments.
#Given this sequence of words as command line arguments “To the OS Laboratory at Alpha
#Lab Welcome”, the script should echo back the information that there are 8 arguments.
#Additionally it should echo back some of the arguments in the following order: “Welcome To
#the OS Laboratory at Alpha Lab”

echo "Number of arguments = $#"

echo -n "Required Output: "

# Print last argument
echo -n "${!#} "

# Print the remaining arguments
for ((i=1; i<$#; i++))
do
    eval echo -n "\$$i"
    echo -n " "
done

echo