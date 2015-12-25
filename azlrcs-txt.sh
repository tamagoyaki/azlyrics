#!/bin/bash
#
# USAGE:
#
#   $ ls *.html | ./azlrcs-txt.sh
#
#   The htmlfile must come from azlyrics.com
#

FROM='MP3MP3 Email'
TO='Submit Corrections'

while read ifile
do
    ofile=`echo $ifile | sed 's/\.html$/\.txt/'`
    #echo $ifile "to" $ofile
    w3m -dump $ifile | awk "/$FROM/,/$TO/" | grep -v "$FROM\|$TO" > $ofile
done

