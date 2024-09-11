#!/bin/bash

while getopts ":xa" option; do
  case $option in
    x) setx=true;;
    a) copyall=true;;
    ?)
      echo "$(basename $0) usage:"
      echo "This script copies package manager files back into repo after Renovate has messed with them for futher testing"
      echo
      echo "  [-x] (executes with set -x)"
      echo "  [-a] (copies in base renovate config files also"
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

if [ "$setx" = "true" ]
 then
 set -x
fi

for file in Dockerfile go.mod .github/workflows/renovatePG.yaml
do
 rm ~paulrelf/RenovatePG/${file} 2> /dev/null
 cp ~paulrelf/RenovatePGSourcefiles/${file} ~paulrelf/RenovatePG/${file}
done

if [ "$copyall" = "true" ]
then
 for file in renovate-config.js renovate.json5
 do
  rm ~paulrelf/RenovatePG/${file} 2> /dev/null
  cp ~paulrelf/RenovatePGSourcefiles/${file} ~paulrelf/RenovatePG/${file}
 done 
fi

