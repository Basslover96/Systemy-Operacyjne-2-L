#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	if [ ! -f $1 ]
	then
		echo "$1 nie jest plikiem!"
		exit 1
	else
		cat $(realpath $1)  | sort -n
	fi
fi
