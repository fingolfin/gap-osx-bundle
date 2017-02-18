#!/bin/sh -ev

cd src
./configure DEF_PREFIX=$PREFIX \
    NTL_GMP_LIP=on \
    SHARED=on \
    TUNE=x86 \
    CXX="$CXX" \
    LDFLAGS="$LDFLAGS" \
    CPPFLAGS="$CPPFLAGS"
make -j8
