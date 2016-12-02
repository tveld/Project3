#! /bin/bash
unzip -o -qq $*
ls | gawk -F "_" '$2 != "" {print $2}' | sort -u | while read i; do mkdir $i; done
