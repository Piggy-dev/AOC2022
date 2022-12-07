#!/bin/ksh
filename=test.txt
touch rtmp.txt
touch tmp.txt
awk 'BEGIN { FS = OFS = "" } { for(i=1; i<=NF; i++) if($i ~ /^ *$/) $i = 0}; 1' $filename | tr "[]" "00" >> tmp.txt
sed -e '/^$/,$d' tmp.txt >> rtmp.txt
rm tmp.txt
touch tmp.txt
part2=$(sed -n '/\S/b;:a;n;//p;ba' $filename)
tac rtmp.txt > tmp.txt
rm rtmp.txt
part1=$(echo $(cat tmp.txt))
part1first="$(cut -d' ' -f1 <<<"$part1")"
touch tmpfile.txt
echo ${part1#* } | tr " " "\n" >> tmpfile.txt
echo "$part1second"
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
j=1
while read line;
do
count=1
writes=1
    while (( j <= ${#line} ))
    do
        char=$(expr substr "$line" $j 1)    
        if [[ $(($count % 4 )) -eq 2 ]];
        then
            if [ $char != 0 ];
            then
                echo "$char" >> tmp$writes.txt
                echo "$writes $char $count"
            fi
            (( writes+=1 ))
        fi
        (( count+=1 ))
        (( j+=1 ))
    done
done < tmpfile.txt
rm tmp*.txt