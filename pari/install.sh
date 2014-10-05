#!/bin/sh -ev

make install

cd $PREFIX
$BASEDIR/fix_install_names.sh $PREFIX bin/gp-2.7 lib/libpari-gmp.dylib

# TODO: libpari-gmp.dylib references the path
#   $PREFIX/share/pari

# TODO: bin/gp-2.7 references the path
#   $PREFIX/bin/gbhelp

# TODO: the BUNDLE path is also being referenced in the following files:
# bin/gphelp
# include/pari/paricfg.h
# lib/pari/pari.cfg
# share/pari/doc/paricfg.tex
# share/pari/examples/Makefile

