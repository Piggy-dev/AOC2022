#!/bin/ksh
opponent=0
myscore=0
roundscore=0
totalscore=0
for i in $(cat input.txt)
do
case $i in
    X) roundscore=0
        case $opponent in
            A) myscore=3;;
            B) myscore=1;;
            C) myscore=2;;
        esac;;
    Y) roundscore=3
            case $opponent in
            A) myscore=1;;
            B) myscore=2;;
            C) myscore=3;;
        esac;;
    Z) roundscore=6
        case $opponent in
            A) myscore=2;;
            B) myscore=3;;
            C) myscore=1;;
        esac;;
    *) opponent=$i;;
esac
    totalscore=$((myscore+roundscore+totalscore))
    roundscore=0
    myscore=0
done
echo $totalscore