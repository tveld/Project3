#! /bin/bash
if [ -f $1 -a $# == 1 ]
then
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
}' temp | echo "$(sort -u)" > temp
cat temp
fi
