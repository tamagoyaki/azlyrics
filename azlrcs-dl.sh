#!/bin/bash
#
# USAGE:
#
#   $ cat audio.cdindex | ./azlrcs-url.sh | ./azlrcs-dl.sh
#

todo=`awk '{print "wget -U Mozilla " $1 " -O " $2}'`

IFS=$'\n'

for job in $todo; do
    #echo $job
    eval $job
done
