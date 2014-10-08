#!/bin/sh -ex

if [ ! -e configure ] ; then
    ./autogen.sh
fi

./configure --with-normaliz=$PREFIX
make
