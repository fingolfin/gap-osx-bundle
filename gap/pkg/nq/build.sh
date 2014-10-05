#!/bin/sh -ex

./configure
make

$BASEDIR/fix_install_names.sh $PREFIX bin/*/*

# Cleanup leftovers which may contain the PREFIX path (and thus would
# trigger the code which detects hardcoded paths).
rm -rf nq src/*.o
rm -rf src/.deps
rm -f config.log config.status Makefile
rm -rf autom4te.cache/
rm -rf doc/*.log
