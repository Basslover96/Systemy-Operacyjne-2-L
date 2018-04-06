#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	obecny_katalog=$pwd
	cd
	cd $1
	dowiazania=0
	for plik in *
	do
		if [ -r $plik ]
		then
			for plik1 in *
			do
				if [ $plik -ef $plik1 ] && [ $(realpath $plik) != $(realpath $plik1) ] 
				then
					ln -f -s $plik $plik1
				fi
			done
		fi
	done
	cd
	cd $obecny_katalog
fi
