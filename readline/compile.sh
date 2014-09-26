#!/bin/sh -ev

./configure --prefix=$PREFIX \
    --disable-static
make
