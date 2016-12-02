#! /bin/bash

# unzip file
unzip -o -qq $*

# make new directory, rename file, move into appropriate directory
ls | gawk -F "_" '$5 != "" {print $2 " " $5}' | sort -u | while read -r dir fname;
do
	mkdir $dir
	mv *$dir*$fname $fname
	mv $fname $dir
done 
