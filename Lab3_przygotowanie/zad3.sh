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
		      echo "Liczba wszystkich katalogów:"
		      find . -type d | wc -l
		      echo "Liczba plików o rozszerzeniach .sh oraz .pl:"
		      find . -name *.sh -or -name *.pl | wc -l
		      echo "Liczba plików, które mają w nazwie ścieżkę src:"
		      find . -type f -and -path "*/src/*" | wc -l
		      echo "Liczba plików, których nazwa nie zaczyna się na literę b:"
		      find . -type f -and  -not -name "b*" | wc -l
		      echo "Liczba plików z rozszerzeniem .c o rozmiarze większym niż 100KB:"
		      find . -name *.c -and -size +100k | wc -l
		      cd $obecny_katalog
	      fi	      
fi
