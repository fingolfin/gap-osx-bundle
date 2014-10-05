#!/bin/sh -ex

make clean || :
./configure
make COPTS="-O2 -g"

$BASEDIR/fix_install_names.sh $PREFIX bin/*/*

# Cleanup leftovers which may contain the PREFIX path (and thus would
# trigger the code which detects hardcoded paths).
rm -f standalone/src/*.o standalone/lib/*.o
rm -f standalone/lib/fsalib.a
rm -rf src/.deps
rm -f config.log config.status Makefile
rm -rf autom4te.cache/
rm -rf doc/*.log
