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
		if [ $(wc -l < $(realpath $1)) -lt 45 ]
		then
			echo "Plik $1 nie ma 45 linii!"
			exit 1
		else
			cat $(realpath $1) | nl | head -n 45 | tail -n 31
		fi
	fi
fi
