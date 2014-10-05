#!/bin/sh -ev

make install

rm -f $PREFIX/lib/*.la

$BASEDIR/fix_install_names.sh $PREFIX bin/glpsol lib/libglpk.0.dylib lib/libglpk.36.dylib
