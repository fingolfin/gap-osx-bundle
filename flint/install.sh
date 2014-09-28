#!/bin/sh -ev

make install

rm -f $PREFIX/lib/libflint.a

strip -S $PREFIX/lib/libflint.dylib
install_name_tool -id @rpath/libflint.dylib $PREFIX/lib/libflint.dylib
install_name_tool -add_rpath "../Resources/lib" $PREFIX/lib/libflint.dylib

# TODO: libflint.dylib references the file
#    $PREFIX/share/flint/CPimport.txt
