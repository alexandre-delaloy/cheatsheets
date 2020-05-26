#!/bin/bash 
if [[ $1 =~ [bB][aA][sS][hH] ]] ; then
  FILE="./cheatsheets/bash-command-line.sh"
elif [[ $1 =~ [gG][iI][tT] ]] ; then
  FILE="./cheatsheets/git-command-line.sh"
elif [[ $1 =~ [dD][oO][cC][kK][eE][rR] ]] ; then
  FILE="./cheatsheets/git-command-line.sh"
fi

if [[ $2 =~ [tT][oO][cC] ]]; then
  grep -E '\[[0-9]+(\.[0-9]+)?\] - [A-Z]+' $FILE | less
elif [[ $2 =~ [gG][oO][tT][oO] ]]; then
  less +$(grep -nio "$3" $FILE | head -n1 | cut -d : -f 1) $FILE
else
  less $FILE
fi
