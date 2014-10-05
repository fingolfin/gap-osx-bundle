#!/bin/sh -ev

make install

$BASEDIR/fix_install_names.sh $PREFIX \
    bin/genmodel \
    bin/gensymm \
    bin/output \
    bin/ppi \
    bin/zsolve
