#!/bin/bash

# Check SLoC for the given Golang project.
# Prune vendor directory so as to ignore library source code.
go_src='*.go'
go_ignore_dir='./vendor'
go_ignore_line='^\s*$|^\s*//'

if [ -z "$1" ]; then
  echo "Please designate target directory" 1>&2
  exit 1
fi

project_root=$1
sloc=`find ${project_root} ! \( -path "${project_root}/vendor" -prune \) -type f -name ${go_src} -exec cat {} + | grep -vE ${go_ignore_line} | wc -l`

echo "SLoC: ${sloc}"
