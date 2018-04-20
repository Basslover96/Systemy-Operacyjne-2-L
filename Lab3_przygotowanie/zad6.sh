#!/bin/bash
if [ $# -ne 0 ]
then
	echo "Skrypt nie przyjmuje żadnych argumentów!"
	exit 1
else
	ps -eF | grep "^$(whoami)"
fi

