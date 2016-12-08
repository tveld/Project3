#! /bin/bash

> temp

echo

while read stdin
do
	echo "$stdin" >> temp
done

while read noise
do

	sed -i "s/\b$noise\b//g" temp

done < $1

sed -i 's/  / /g' temp

gawk '{
	for(i = 1; i < NF; i++){
		printf("%s ", $i);
	}
	printf("%s\n", $NF);
}' temp | sort -u
cat temp
