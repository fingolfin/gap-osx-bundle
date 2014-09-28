#!/bin/sh -ev

# Tell singular explicitly were to look for each library. Otherwise
# it may pick up libraries from /opt/local or /sw
./configure --prefix=$PREFIX \
    --disable-maintainer-mode \
    --disable-dependency-tracking \
    --disable-static \
    --with-gmp=$PREFIX \
    --with-flint=$PREFIX \
    --with-readline=$PREFIX \
    --without-ntl
make -j8
