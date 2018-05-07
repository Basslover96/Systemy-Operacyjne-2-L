#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	if [ -d $(realpath $1) ]
	then
		grep -r -hoE '[a-z]+' | sort | uniq -c | sort -nr
	else
		echo "$1 nie jest katalogiem!"
		exit 1
	fi	
fi
