#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	if [ ! -d $(realpath $1) ]
	then
		awk '{if (NR<3 || NR>7) print}' $(realpath $1)
	else
		echo "$1 jest folderem!"
		exit 1
	fi
fi
