#!/bin/bash
# Usage: ./shiftLines.sh test.dat noise.txt
#              ^$0         ^$1      ^$2

if test $# -eq 0
then
    echo "Usage: ./shiftLines.sh <file> <noise file>"
    exit 0
fi


cat $1 | gawk '
{
    size = split($0, words, " ")

    for (i = 1; i <= NF; i++)
        if (system("grep $words[i] $2") != "")
            delete words[i]

    for (i = 0; i < size; i++)
        print words[i]

}'
# output=""
# while read line
# do
#     output=$output$line$'\n' # New line isn't working
# done < $1
#
# echo "$output" > outfile
