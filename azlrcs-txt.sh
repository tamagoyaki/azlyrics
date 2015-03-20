#!/bin/bash
#
# USAGE:
#
#   $ ls *.html | ./azlrcs-txt.sh
#
#   The htmlfile must come from azlyrics.com
#

FROM='<!-- start of lyrics -->'
TO='<!-- end of lyrics -->'

while read ifile
do
    ofile=`echo $ifile | sed 's/\.html$/\.txt/'`
    #echo $ifile "to" $ofile
    awk "/$FROM/,/$TO/" $ifile | grep -v '<!--.*-->' | \
	sed 's/<.*>//' | tr -d "\r" > $ofile
done

