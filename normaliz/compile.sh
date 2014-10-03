#!/bin/sh -ev

if [ "x$CMAKE" = x ] ; then
    echo "ERROR: cmake not found, please read the README"
    exit 1
fi

cd source
GMP_DIR="$PREFIX" $CMAKE -DCMAKE_INSTALL_PREFIX:PATH="$PREFIX"
make
