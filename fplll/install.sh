#!/bin/sh -ev

make install -j8

cd $PREFIX
rm -f lib/*.la
$BASEDIR/fix_install_names.sh $PREFIX lib/libfplll.0.dylib bin/fplll bin/latticegen
