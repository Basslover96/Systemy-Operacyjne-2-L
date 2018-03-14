#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Błędna liczba argumentów!"
	exit 1
else
	if [ -d $1 ]
	then
		obecny=$pwd
		cd
		cd $1
		rm -f *.old
		for nazwa_pliku in *
		do
			if [ -w $nazwa_pliku ]
			then
				mv $nazwa_pliku $nazwa_pliku.old
			fi
		done
		cd
		cd $obecny
	else
		echo "Nie ma takiego katalogu!"
		exit 1
	fi
fi
