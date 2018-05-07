#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	if [ ! -d $(realpath $1) ]
	then
		awk '{if ($0 ~ /.*[0-9].*/) {print $0} else {print toupper($0)}}' $(realpath $1)
	else
		echo "$1 jest folderem!"
		exit
	fi
fi
