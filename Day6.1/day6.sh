#!/bin/ksh
str=$(cat input.txt)
j=1
s1=""
s2=""
s3=""
s4=""
while (( j <= ${#str} ))
do
    char=$(expr substr "$str" $j 1)
    if [[ $s1 == ""  ]];
    then
        s1=$char
    elif [ -z "$s2" ];
    then
        s2=$char
    elif [ -z "$s3" ];
    then
        s3=$char
    else
        s4=$char
        touch tmp.txt
        echo "$s1" >> tmp.txt 
        echo "$s2" >> tmp.txt 
        echo "$s3" >> tmp.txt 
        echo "$s4" >> tmp.txt
        touch tmp2.txt
        sub=$(sort tmp.txt tmp2.txt | uniq)
        subst=$(echo $sub | tr -d ' ')

        rm tmp.txt
        rm tmp2.txt
        if [[ ${#subst} == 4 ]];
        then
            echo "$j"
            exit
        else
            s1=$s2
            s2=$s3
            s3=$s4
        fi
    fi
    (( j+=1 ))
done