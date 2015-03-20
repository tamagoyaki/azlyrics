#!/bin/bash
#
# USAGE:
#
#   $ cat audio.cdindex | ./azlrcs-url.sh
#

URL=http://www.azlyrics.com/lyrics
ALLOWED="sed s/[^a-zA-Z0-9<>]//g"
TOLOWER="tr A-Z a-z"

list=`grep '<Artist>\|<Name>' | $ALLOWED | $TOLOWER`

for str in $list; do
    tag=`echo $str | sed 's/<\([^>]*\)>.*/\1/'`
    con=`echo $str | sed 's/.*>\([^<]*\)<.*/\1/'`

    if [ "artist" == "$tag" ]; then
	artist=$con
    elif [ "name" == "$tag" ]; then
	titles=$titles" "$con
    fi
done

for ttl in $titles; do
    no=$((no + 1))
    echo $URL/$artist/$ttl.html audio_$(printf %02d $no).html
done
