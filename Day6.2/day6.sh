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
    elif [ -z "$s4" ];
    then
        s4=$char
    elif [ -z "$s5" ];
    then
        s5=$char
    elif [ -z "$s6" ];
    then
        s6=$char
    elif [ -z "$s7" ];
    then
        s7=$char
    elif [ -z "$s8" ];
    then
        s8=$char
    elif [ -z "$s9" ];
    then
        s9=$char
    elif [ -z "$s10" ];
    then
        s10=$char
    elif [ -z "$s11" ];
    then
        s11=$char
    elif [ -z "$s12" ];
    then
        s12=$char
    elif [ -z "$s13" ];
    then
        s13=$char
    else
        s14=$char
        touch tmp.txt
        echo "$s1" >> tmp.txt 
        echo "$s2" >> tmp.txt 
        echo "$s3" >> tmp.txt 
        echo "$s4" >> tmp.txt
        echo "$s5" >> tmp.txt 
        echo "$s6" >> tmp.txt 
        echo "$s7" >> tmp.txt 
        echo "$s8" >> tmp.txt
        echo "$s9" >> tmp.txt 
        echo "$s10" >> tmp.txt 
        echo "$s11" >> tmp.txt 
        echo "$s12" >> tmp.txt
        echo "$s13" >> tmp.txt 
        echo "$s14" >> tmp.txt 
        touch tmp2.txt
        sub=$(sort tmp.txt tmp2.txt | uniq)
        subst=$(echo $sub | tr -d ' ')
        rm tmp.txt
        rm tmp2.txt
        if [[ ${#subst} == 14 ]];
        then
            echo "$j"
            exit
        else
            s1=$s2
            s2=$s3
            s3=$s4
            s4=$s5
            s5=$s6
            s6=$s7
            s7=$s8
            s8=$s9
            s9=$s10
            s10=$s11
            s11=$s12
            s12=$s13
            s13=$s14
        fi
    fi
    (( j+=1 ))
done