#!/bin/sh

set -e

if [[ $# -eq 1 ]]; then
  cat $1 |
  while read -r line; do
    hr=$(printf '%*s' 80 ''); echo "${hr// /-}"

    "$0" "${line%% *}" "${line#* }"
  done
elif [[ $# -eq 2 ]]; then
  ./test.coffee $1 $2
  ./test.pl $1 $2
else
  echo 'Invalid usage'
  exit 1
fi
