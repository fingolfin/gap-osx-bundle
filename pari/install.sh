#!/bin/sh -ev

make install

# install_name_tool -add_rpath "../Resources/lib" $PREFIX/lib/libpari-gmp.dylib

$BASEDIR/fix_install_names.sh $PREFIX bin/gp-2.7 lib/libpari-gmp.dylib

# TODO: the BUNDLE path is still being referenced in the following files:
# bin/gp-2.7
# bin/gphelp
# include/pari/paricfg.h
# lib/pari/pari.cfg
# share/pari/doc/paricfg.tex
# share/pari/examples/Makefile

# TODO: libpari-gmp.dylib references the path
#   $PREFIX/share/pari

# TODO: bin/gp-2.7 references the path
#   $PREFIX/bin/gbhelp
