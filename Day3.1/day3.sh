#!/bin/ksh
match=0
value=0
total=0
for i in $(cat input.txt)
do
    sub1=$(echo "${i:0:${#i}/2}")
    sub2=$(echo "${i:${#i}/2}")
    j=1
    while (( j <= ${#sub1} ))
    do
        char=$(expr substr "$sub1" $j 1)
        if [[ "$sub2" = *"$char"* ]];
        then
            match=$char
        fi
        (( j+=1 ))
    done
    case $match in
        a)value=1;;
        b)value=2;;
        c)value=3;;
        d)value=4;;
        e)value=5;;
        f)value=6;;
        g)value=7;;
        h)value=8;;
        i)value=9;;
        j)value=10;;
        k)value=11;;
        l)value=12;;
        m)value=13;;
        n)value=14;;
        o)value=15;;
        p)value=16;;
        q)value=17;;
        r)value=18;;
        s)value=19;;
        t)value=20;;
        u)value=21;;
        v)value=22;;
        w)value=23;;
        x)value=24;;
        y)value=25;;
        z)value=26;;
        A)value=27;;
        B)value=28;;
        C)value=29;;
        D)value=30;;
        E)value=31;;
        F)value=32;;
        G)value=33;;
        H)value=34;;
        I)value=35;;
        J)value=36;;
        K)value=37;;
        L)value=38;;
        M)value=39;;
        N)value=40;;
        O)value=41;;
        P)value=42;;
        Q)value=43;;
        R)value=44;;
        S)value=45;;
        T)value=46;;
        U)value=47;;
        V)value=48;;
        W)value=49;;
        X)value=50;;
        Y)value=51;;
        Z)value=52;;
    esac
    total=$((value+total))
    value=0
    match=0
done
echo $total