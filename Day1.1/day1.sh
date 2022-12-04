#!/bin/ksh
result=0
filename='input.txt'
touch answer.txt
while read line;
do
if [[ $line ==  "" ]]
    then
    echo "$result" >> "answer.txt"
    result=0
else
    result=$((result+line))
fi
done < $filename
sort -r -n answer.txt | head -1
rm answer.txt
    