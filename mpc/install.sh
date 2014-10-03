#!/bin/sh -ev

make install

rm -f $PREFIX/lib/*.la

$BASEDIR/fix_install_names.sh $PREFIX lib/libmpc.3.dylib
