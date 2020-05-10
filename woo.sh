#!/bin/bash 
if [[ $1 =~ [bB][aA][sS][hH] ]] ; then
  FILE="bash-command-line.txt"
elif [[ $1 =~ [gG][iI][tT] ]] ; then
  FILE="git-command-line.txt"
fi

if [[ $2 =~ [tT][oO][cC] ]]; then
  grep -E '\[[0-9]+(\.[0-9]+)?\] - [A-Z]+' $FILE | less
elif [[ $2 =~ [gG][oO][tT][oO] ]]; then
  less +$(grep -nio "$3" $FILE | head -n1 | cut -d : -f 1) $FILE
else
  less $FILE
fi
