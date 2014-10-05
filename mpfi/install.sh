#!/bin/sh -ev

make install

cd $PREFIX
rm -f lib/*.la
$BASEDIR/fix_install_names.sh $PREFIX lib/libmpfi.0.dylib
