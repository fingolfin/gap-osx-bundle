#!/bin/sh -ev

# We override the host type to build a GMP version that works across a
# wide range of OS X machines, avoiding CPU specific optimizations. Of
# course this produces somewhat slower binaries, but at least it should
# work everywhere.
# In particular, we fake a Core Duo CPU with Mac OS X 10.6

./configure --prefix=$PREFIX \
    --host=core2-apple-darwin10.0.0 \
    --disable-static \
    --enable-cxx \
    --with-pic
make -j8
make check
