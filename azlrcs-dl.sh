#!/bin/bash
#
# USAGE:
#
#   $ cat audio.cdindex | ./azlrcs-url.sh | ./azlrcs-dl.sh
#   $ echo http://www.azlyrics.com/lyrics/hoge/gero.html | ./azlrcs-dl.sh
#


#
# $1, URL
# $2, output-filename
#
# If no output-filename specified, generate it from URL.
#
todo=`awk '{
  oname = $2;

  if ("" == oname) {
    oname = $1;
    sub(".*/", "", oname);
  }

  print "wget -U Mozilla " $1 " -O " oname
}'`


IFS=$'\n'

for job in $todo; do
    #echo $job
    eval $job
done
