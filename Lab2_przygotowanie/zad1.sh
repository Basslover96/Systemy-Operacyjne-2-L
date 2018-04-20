#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	if [ -d $1 ]
	then
		obecny_katalog=$pwd
		cd
		cd $1
		dowiazania=0
		dowiazania_do_nieistniejacych=0
		for plik in *
		do
			if [ -L $plik ]
			then
				let dowiazania=dowiazania+1
				if [ ! -e $plik ]
				then
					let dowiazania_do_nieistniejacych=dowiazania_do_nieistniejacych+1
				fi
			fi
		done
		echo "Liczba dowiązań symbolicznych wynosi $dowiazania">>wynik.txt
		echo "Liczba dowiązań symbolicznych do nieistniejących plików/katalogów wynosi $dowiazania_do_nieistniejacych">>wynik.txt
		cd
		cd $obecny_katalog
	else
		echo "$1 nie jest prawidłową ścieżką do katalogu!"
		exit 1
	fi
fi
