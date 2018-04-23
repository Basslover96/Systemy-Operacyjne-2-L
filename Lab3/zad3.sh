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
		      echo "Liczba wszystkich plików:"
		      find . -type f | wc -l
		      echo "Liczba plików o rozszerzeniach .c oraz .h:"
		      find . -name *.c -or -name *.h | wc -l
		      echo "Liczba plików, które nie mają w ścieżce katalogu lib:"
		      find . -type f -and -not -path "*/lib/*" | wc -l
		      echo "Liczba plików, których nazwa zaczyna się na literę a:"
		      find . -type f -and -name "a*" | wc -l
		      echo "Liczba plików z rozszerzeniem .h o rozmiarze mniejszym niż 5KB:"
		      find . -name *.h -and -size -5k | wc -l
		      cd $obecny_katalog
	      fi	      
fi
