#! /bin/bash
if [ -f $1 -a $# == 1 ]
then
printf "$(wc -l < $1 | xargs)\n"

gawk '{
    for(s = 1; s <= NF; s++){

        for(i = 1; i <= NF; i++){
            mod = (i + s)%NF +1
            printf("%s ", $mod);
        }
        printf("\n");
    }
}' $1
fi
