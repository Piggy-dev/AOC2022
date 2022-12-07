#!/bin/ksh
total=0
for i in $(cat input.txt)
do 
    match=0
    a="$(cut -d',' -f1 <<<"$i")"
    b="$(cut -d',' -f2 <<<"$i")"
    a1="$(cut -d'-' -f1 <<<"$a")"
    a2="$(cut -d'-' -f2 <<<"$a")"
    b1="$(cut -d'-' -f1 <<<"$b")"
    b2="$(cut -d'-' -f2 <<<"$b")"

    if [[ $a1 -le $b1 ]] && [[ $a2 -ge $b2 ]];
    then
        total=$((total+1))
        match=1
    fi
    if [[ $match == 0 ]];
    then
        if [[ $b1 -le $a1 ]] && [[ $b2 -ge $a2 ]];
        then
            total=$((total+1))
        fi
    fi
done
echo $total