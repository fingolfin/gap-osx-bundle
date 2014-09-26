#!/bin/sh -ev

./configure --prefix=$PREFIX \
    --disable-static
make -j8
make check
