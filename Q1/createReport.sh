#! /bin/bash
printf "The number of lines in the input file is %s\n" $(head -n 2)
sed '/[0-9]/d'

