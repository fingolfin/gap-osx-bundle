#!/bin/sh -ev

make install
rm -f $PREFIX/lib/libflint.a
$BASEDIR/fix_install_names.sh $PREFIX lib/libflint.dylib

# TODO: libflint.dylib references the file
#    $PREFIX/share/flint/CPimport.txt
