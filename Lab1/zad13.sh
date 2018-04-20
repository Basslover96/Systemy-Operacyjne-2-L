#!/bin/bash
if [ $# -ne 2 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	if [ -d $1 ]
	then
		if [ -d $2 ]
		then
			obecny=$pwd
			cd $1
			for plik in *
			do
				if [ ! -d $plik ]
				then
					if [ -f $2/$plik ]
					then
						rm -f $1/$plik
					fi
				fi
			done
			cd $obecny
		else
			echo "$2 nie jest właściwą ścieżką do katalogu!"
			exit 1
		fi
	else
		echo "$1 nie jest właściwą ścieżką do katalogu!"
		exit 1
	fi
fi
