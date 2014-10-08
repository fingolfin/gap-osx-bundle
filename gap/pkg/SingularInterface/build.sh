#!/bin/sh -ex

if [ ! -e configure ] ; then
    ./autogen.sh
fi

./configure
make
