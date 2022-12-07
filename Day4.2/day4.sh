#!/bin/ksh
total=0
for i in $(cat input.txt)
do 
    a="$(cut -d',' -f1 <<<"$i")"
    b="$(cut -d',' -f2 <<<"$i")"
    a1="$(cut -d'-' -f1 <<<"$a")"
    a2="$(cut -d'-' -f2 <<<"$a")"
    b1="$(cut -d'-' -f1 <<<"$b")"
    b2="$(cut -d'-' -f2 <<<"$b")"

    if [[ $a2 -ge $b1 ]] && [[ $a1 -le $b2 ]];
    then
        total=$((total+1))
    fi

done
echo $total