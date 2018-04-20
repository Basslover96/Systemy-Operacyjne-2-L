#!/bin/bash
if [ $# -ne 2 ]
then
	echo "Błędna liczba argumentów!"
	exit 1
else
	if [ -d $1 ] 
	then
		obecny=$pwd
		cd
		cd $1
		if [ -f $2 ]
		then
			lista_plikow=`cat $2`
			for plik in $lista_plikow
			do
				if [ ! -e $plik ]
				then
					touch $plik
				fi
			done
		else
			echo "$2 nie jest poprawną ścieżką do pliku!"
			exit 1
		fi
		cd 
		cd $obecny
	else
		echo "$1 nie jest poprawną ścieżką do katalogu!"
		exit 1
	fi
fi
