#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba parametrów!"
	exit 1
else
	if [ -d $1 ]
	then
		obecny_katalog=$pwd
		cd
		cd $1
		for plik in *
		do
			if [ ! -d $plik ] && [ ! -L $plik ] && [ ! -s $plik ]; 
			then
				echo "Plik $plik został usunięty">>usuniete
				rm -f $plik
			fi
		done
		cd
		cd $obecny_katalog
	else
		echo "$1 nie jest właściwą ścieżką do katalogu!"
		exit 1
	fi
fi
