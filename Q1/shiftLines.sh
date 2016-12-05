#!/bin/bash
# Usage: ./shiftLines.sh test.dat
#              ^$0         ^$1

if test $# -eq 0
then
    echo "Usage: ./shiftLines.sh <file>"
    exit 0
fi

#build this variable with the shifted lines
output=""
while read line
do
    output="$output$line"$'\n'  # New line isn't working
done < $1

echo $output > outfile
