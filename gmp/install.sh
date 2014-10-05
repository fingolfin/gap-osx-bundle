#!/bin/sh -ev

make install

cd $PREFIX
rm -f lib/*.la
$BASEDIR/fix_install_names.sh $PREFIX lib/libgmp.10.dylib lib/libgmpxx.4.dylib
