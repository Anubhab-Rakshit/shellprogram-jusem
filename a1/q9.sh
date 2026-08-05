#!/bin/bash

if [ $# -eq 0 ]
then
    echo -n "Enter an integer :- "
    read num
else
    num=$1
fi

start_time=$(date +%s)

fact=1
for (( i=1; i<=num; i++ ))
do
    fact=$(echo "$fact * $i" | bc)
done

end_time=$(date +%s)
time_taken=$(( end_time - start_time ))

echo "Factorial of $num is $fact"
echo "Time taken :- $time_taken seconds"
