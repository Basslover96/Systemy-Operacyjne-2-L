#!/bin/bash
if [ $# -ne 2 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	if [ ! -d $1 ] || [ ! -d $2 ]
	then
		echo "Podano nieprawidłową ścieżkę katalogu źródłowego lub docelowego!"
       		exit 1	       
	else
		obecny_katalog=$pwd
		cd
		cd $2
		lista_plikow=`ls $1`
		for obiekt in $lista_plikow
		do
			ln -s $1/$obiekt $2/$obiekt 
		done
		cd 
		cd $obecny_katalog
	fi
fi
