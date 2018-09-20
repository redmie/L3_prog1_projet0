#!/bin/sh
if [ $# -eq 1 ]
then
  make
  ocaml penrose_base.ml $1
  make clean
else
  echo "Usage : $0 <number_of_iterations>"
fi
