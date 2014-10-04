#!/bin/sh -ex

# HACK: float 0.5.18 is missing autotools stuff
# FIXME: do not hardcode /sw/bin for autotools. Instead,
# use our own autotools version, or make this user customizable
PATH="/sw/bin:$PATH" /sw/bin/autoreconf -vif

./configure
make

$BASEDIR/fix_install_names.sh $PREFIX $REL_PWD/bin/*/*

# Cleanup leftovers which may contain the PREFIX path (and thus would
# trigger the code which detects hardcoded paths).
make clean
rm -rf src/.deps
rm -f config.log config.status Makefile
rm -rf autom4te.cache/
rm -rf doc/*.log
