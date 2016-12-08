#! /bin/bash
#Usage:  ./createReport.sh  <outputFile>
if [ -f $1 -a $# == 1 ]
then

printf "The number of lines in the input file is %s\n" $(head -n 2)
sed -i '/[0-9]/d' temp
printf "The number of lines in the output file is %s\n" $(wc -l < temp)

cp temp $1
fi
