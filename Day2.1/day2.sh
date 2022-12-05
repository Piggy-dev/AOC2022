#!/bin/ksh
opponent=0
myscore=0
roundscore=0
totalscore=0
for i in $(cat input.txt)
do
case $i in
    X) myscore=1
        case $opponent in
            A) roundscore=3;;
            B) roundscore=0;;
            C) roundscore=6;;
        esac;;
    Y) myscore=2
            case $opponent in
            A) roundscore=6;;
            B) roundscore=3;;
            C) roundscore=0;;
        esac;;
    Z) myscore=3
        case $opponent in
            A) roundscore=0;;
            B) roundscore=6;;
            C) roundscore=3;;
        esac;;
    *) opponent=$i;;
esac
    totalscore=$((myscore+roundscore+totalscore))
    roundscore=0
    myscore=0
done
echo $totalscore