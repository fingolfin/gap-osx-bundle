#!/bin/sh -ev

make install

rm -f $PREFIX/lib/*.la

$BASEDIR/fix_install_names.sh $PREFIX lib/libmpfi.0.dylib
