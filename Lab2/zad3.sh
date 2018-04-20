#!/bin/bash
if [ $# -ne 2 ]
then
	echo "Nieprawidłowa liczba parametrów wejściowych!"
	exit 1
else
	if [ ! -d $1 ] || [ ! -d $2 ]
	then
		echo "Podano nieprawidłową ścieżkę do katalogu źródłowego lub docelowego!"
		exit 1
	else
		obecny_katalog=$pwd
		cd $(realpath $2)
		lista=$(ls $(realpath $1))
		for obiekt in $lista
		do 
			ln -s $(realpath $1)/$obiekt $(realpath $2)/$obiekt
		done	
		cd $obecny_katalog
	fi
fi
