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
touch part2.txt
sort -r -n answer.txt | head -3 >> part2.txt
rm answer.txt
result=0
while read line;
do
result=$((result+line))
done < 'part2.txt'
echo $result
rm part2.txt