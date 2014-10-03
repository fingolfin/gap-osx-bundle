#!/bin/sh -ev

./configure --prefix=$PREFIX \
    --with-gmp=$PREFIX \
    --with-mpfr=$PREFIX
make -j8
#make check
