#! /bin/bash

# unzip file
unzip -o -qq $*

# make new directory, rename file, move into appropriate directory
ls | gawk -F "_" '$5 != "" {print $2 " " $5}' | sort -u | while read -r dir fname;
do
	mkdir -p $dir
	mv *$dir*$fname $fname
	mv $fname $dir
done 

# add the blackboard generated files to the appropriate directory
ls | gawk -F "_" '$4 !="" {print $2 " " $4}' | sort -u | while read -r dir fname;
do
	mv *$dir*$fname memo.txt
	mv memo.txt $dir
done 
