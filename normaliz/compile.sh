#!/bin/sh -ev

cd source
GMP_DIR="$PREFIX" cmake \
    -DNMZ_OPENMP:BOOL=NO \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH="$PREFIX"
make
