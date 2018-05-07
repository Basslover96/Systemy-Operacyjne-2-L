#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Nieprawidłowa liczba argumentów!"
	exit 1
else
	if [ ! -d $1 ]
	then
       		echo "$1 nie jest poprawną ścieżką do katalogu!"
		exit 1
	else
		obecny_katalog=$pwd
		cd $(realpath $1)
		echo "Ilość linii zawierających słówko TODO:"
		grep -r -E -w 'TODO' * | wc -l
		echo "Ilość pustych linii:"
		grep -r -E '^[[:space:]]*$' * | wc -l
		echo "Ilość niepustych linii:"
		grep -r -v '^[[:space:]]*$' * | wc -l
		echo "Ilość linii zakończonych średnikiem:"
		grep -r -E ";$" * | wc -l
		echo "Ilość linii zawierających tylko klamrę { lub }:"
		grep -r -E '^\{$|^\}$' * | wc -l
		echo "Ilość linii bez liter a-z i A-Z:"
		grep -r -v  -E '[a-zA-Z]' * | wc -l
		echo "Ilość linii zawierających dwa otwierające nawiasy obok siebie:"
		grep -r -E ".*\(\(.*" * | wc -l
		echo "Ilość linii zawierających liczby heksadecymalne:"
 		grep -r -E '0x[0-9a-fA-F]+' * | wc -l 
		echo "Ilość linii zakończonych trójliterowym rozszerzeniem pliku:"
		grep -r -E '\.[a-zA-Z0-9]{3}$' * | wc -l
		echo "Ilość struktur:"
		grep -r -E '^struct.+\{$' * | wc -l
		cd $obecny_katalog
	fi
fi
