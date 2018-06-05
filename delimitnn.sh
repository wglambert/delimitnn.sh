#!/bin/bash  #https://stackoverflow.com/a/16904731
var=$(cat $1)                 # read file into string
var=${var//$'\n'$'\n'/$'\t'}                # 2 newlines to 1 tab
while [[ "$var" =~ $'\t'$'\n' ]] ; do
          var=${var//$'\t'$'\n'/$'\t'}          # eat up further newlines
  done

  IFS=$'\t'                               # field separator is now tab
  array=( $var )                         # split into array
  i=0

  if [ -z "$2" ]; then
  for x in ${array[@]}; do               # print result
     ((i++))
     echo -e "$i) $x\n"                  # prefix lines with #)
  done

  else
    for x in ${array[$2]}; do               # print result
     ((i++))
     echo -e "$x"
  done
  fi
