#! /bin/bash

sedOut="\\b/g;s\\/b"
sedCommand=$(tr -s '\n' ' ' < $1 | sed 's/ /$sedOut/g')
echo "$sedCommand"
