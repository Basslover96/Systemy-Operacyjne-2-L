#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	if [ ! -d $1 ]
	then
		awk '{print NR , $0}' $(realpath $1)
	else
		echo "$1 jest folderem!"
		exit 1
	fi
fi
