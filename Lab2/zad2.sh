#!/bin/bash
if [ $# -ne 0 ]
then
	echo "Skrypt nie powinien przyjmować parametrów!"
	exit 1
else
	obecny_katalog=$pwd
	cd $(dirname $0)/..
	touch xyz456
	cd $obecny_katalog
fi
