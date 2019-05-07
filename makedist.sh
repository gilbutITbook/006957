#!/bin/sh

# generate ZIP file for distribution.
# BUG: /tmp is not cleaned.

# if [ -e .svn ]; then
#   echo 'Error: .svn exists.'
#   echo 'Do not "svn checkout" but "svn export".'
#   exit 1
# fi

DIR=pscs-sim
TMP=/tmp
TMPDIR=$TMP/$DIR
ZIPNAME=$PWD/$DIR.zip
BAK=`date '+%Y%m%d%H%M%S'`.bak

[ -e $ZIPNAME ] && mv -f $ZIPNAME $ZIPNAME.$BAK
[ -e $TMPDIR ] && mv -f $TMPDIR $TMPDIR.$BAK
mkdir $TMPDIR
cp -a * $TMPDIR
(cd $TMPDIR && make bat && nkf --windows --overwrite *.txt)
(cd $TMP && zip -r $ZIPNAME $DIR -x \*.bak)
