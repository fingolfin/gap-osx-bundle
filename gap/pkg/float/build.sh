#!/bin/sh -ex

# HACK: float 0.5.18 is missing autotools stuff, so regenerate it
PATH="$TOOLSDIR/bin:$PATH" $BASEDIR/build-tools/bin/autoreconf -vif

./configure
make

( cd $PREFIX && $BASEDIR/fix_install_names.sh $PREFIX $REL_PWD/bin/*/* )

# Cleanup leftovers which may contain the PREFIX path (and thus would
# trigger the code which detects hardcoded paths).
rm -rf src/float.la src/.libs */Makefile
rm -rf src/.deps
rm -f config.log config.status Makefile
rm -rf autom4te.cache/
rm -rf doc/*.log
