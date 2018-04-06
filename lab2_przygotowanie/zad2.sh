#!/bin/bash
if [ $# -ne 0 ]
then
	echo "Skrypt nie powinien posiadać argumentów!"
	exit 1
else
	obecny_katalog=$pwd
	cd ..
	touch xyz456
	cd
	cd $obecny_katalog
fi
