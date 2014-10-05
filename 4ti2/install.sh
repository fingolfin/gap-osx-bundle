#!/bin/sh -ev

make install

$BASEDIR/fix_install_names.sh $PREFIX \
    bin/4ti2gmp \
    bin/4ti2int32 \
    bin/4ti2int64 \
    bin/genmodel \
    bin/gensymm \
    bin/output \
    bin/ppi \
    bin/zsolve
