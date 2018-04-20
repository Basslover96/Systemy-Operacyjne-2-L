#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	obecny_katalog=$pwd
	cd $(realpath $1)
	for plik in *
	do
		if [ -r $plik ]
		then
			for plik1 in *
			do
				if [ $plik -ef $plik1 ] && [ $(realpath $plik) != $(realpath $plik1) ]
				then
					ln -f -s $(realpath $1)/$plik $(realpath $1)/$plik1
				fi
			done
		fi
	done
	cd $obecny_katalog
fi
