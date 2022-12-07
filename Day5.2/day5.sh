#!/bin/ksh
filename=input.txt
touch rtmp.txt
touch tmp.txt
awk 'BEGIN { FS = OFS = "" } { for(i=1; i<=NF; i++) if($i ~ /^ *$/) $i = 0}; 1' $filename | tr "[]" "00" >> tmp.txt
sed -e '/^$/,$d' tmp.txt >> rtmp.txt
rm tmp.txt
touch tmp.txt
touch tmppart2.txt
sed -n '/\S/b;:a;n;//p;ba' $filename | tr -d "[[:alpha:]]" >> tmppart2.txt
tac rtmp.txt > tmp.txt
rm rtmp.txt
part1=$(echo $(cat tmp.txt))
part1first="$(cut -d' ' -f1 <<<"$part1")"
touch tmpfile.txt
echo ${part1#* } | tr " " "\n" >> tmpfile.txt
j=1
while (( j <= ${#part1first} ))
do
    char=$(expr substr "$part1first" $j 1)
    if [ $char -ne 0 ];
    then
        filename1=tmp$char.txt
        touch $filename1
    fi
    (( j+=1 ))
done
while read line;
do
count=1
writes=1
j=1
    while (( j <= ${#line} ))
    do
        char=$(expr substr "$line" $j 1)    
        if [[ $(($count % 4 )) -eq 2 ]];
        then
            if [ $char != 0 ];
            then
                echo "$char" >> tmp$writes.txt
            fi
            (( writes+=1 ))
        fi
        (( count+=1 ))
        (( j+=1 ))
    done
done < tmpfile.txt

while read line;
do
    count=0
    for i in $line;
    do
        if [[ $count == 0 ]];
        then
            move=$i
        fi
        if [[ $count == 1 ]];
        then
            from=$i
        fi
        if [[ $count == 2 ]];
        then
            to=$i
        fi
        (( count+=1 ))
    done


    tmpmove=$( tail -n $move tmp$from.txt )
    echo "$tmpmove" >> tmp$to.txt
    while (( move > 0 ))
    do
        sed -i '$d' tmp$from.txt
        (( move-=1))
    done

done < tmppart2.txt
tmpfi=1
#echo "$writes"
while (( tmpfi < writes ));
do
    echo "$tmpfi: $(tail -n 1 tmp$tmpfi.txt)"
    (( tmpfi+=1 ))
done

rm tmp*.txt