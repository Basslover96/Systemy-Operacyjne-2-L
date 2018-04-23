#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	if [ ! -d $1 ]
	then
		echo "$1 nie jest katalogiem!"
		exit 1
	else
		obecny_katalog=pwd
		cd $(realpath $1)
		find . -type f -regex ".*/.+\..+" | rev | cut -d . -f 1 | sort | rev | uniq -c | sort -nr
		cd $pwd
	fi
fi
