#!/bin/sh -ev

cd src
./configure DEF_PREFIX=$PREFIX \
    NTL_GMP_LIP=on \
    SHARED=on \
    WIZARD=off \
    CXX="$CXX" \
    LDFLAGS="$LDFLAGS" \
    CPPFLAGS="$CPPFLAGS"
make -j8
