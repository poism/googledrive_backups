#!/bin/bash
# Explode the cat-egories of output from the comparison-*.csv file into individual csvs

if [ -z "${1}" ]; then
	echo "No comparison file given to catsplode!"
	exit
fi

comparison=${1}
extension="${comparison##*.}"
filename="${comparison%.*}"

function explodingCats() {
	echo "Exploding ${comparison} for ${1}"
	cat "${comparison}" | grep "${1}," > "${filename}.${1}.${extension}"
	if [ ! -s "${filename}.${1}.${extension}" ] ; then
		rm "${filename}.${1}.${extension}"
	fi
}

explodingCats IDENTICAL
explodingCats RENAMED
explodingCats MOVED
explodingCats CHANGED
explodingCats PATH_MATCH
explodingCats NAME_MATCH
explodingCats RECOVERABLE
explodingCats RECOVER_MAYBE
#explodingCats NULL
#explodingCats MISSING
