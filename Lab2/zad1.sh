#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	if [ ! -d $1 ]
	then
		echo "$1 nie jest prawidłową ścieżką do katalogu!"
		exit 1
	else
		dowiazania=0
		nieistniejace=0
		obecny_katalog=$pwd
		cd $(realpath $1)
		for plik in *
		do
			if [ -L $plik ]
			then
				let dowiazania=dowiazania+1
				if [ ! -e $plik ]
				then
					let nieistniejace=nieistniejace+1
				fi
			fi
		done
		echo "Liczba dowiązań symbolicznych w folderze $1 wynosi $dowiazania.">>Wynik.txt
		echo "Liczba dowiązań symbolicznych do nieistniejących plików/katalogów w katalogu $1 wynosi $nieistniejace.">>Wynik.txt
		cd $obecny_katalog
	fi
fi
