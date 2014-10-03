#!/bin/sh -ev

cd source
# HACK: invoke cmake installed by fink.
# Strictly speaking, we should probably provide cmake, too...
# but this seems to much effort for no visible gain.
GMP_DIR="$PREFIX" /sw/bin/cmake -DCMAKE_INSTALL_PREFIX:PATH="$PREFIX"
make
