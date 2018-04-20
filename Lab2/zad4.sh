#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	obecny_katalog=$pwd
	cd $(realpath $1)
	for obiekt in *
	do
		if [ -L $obiekt ] && [ $(dirname $(readlink -f $obiekt)) = $(realpath $1) ] && [ -r $(basename $(readlink -f $obiekt)) ]
		then
			ln -f $(readlink $obiekt) $obiekt
		fi
	done
	cd $obecny_katalog
fi
