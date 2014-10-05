#!/bin/sh -ev

# The tweaks below (patches, LDFLAGS, etc) are taken
# from the glpk Fink package.

perl -pi -e 's;libglpk_la_LDFLAGS =;$& -no-undefined -Wl,-single_module -Wl,-x -Wl,-dead_strip;' src/Makefile.in

LDFLAGS="$LDFLAGS -dead_strip" \
CFLAGS="-O3 -fstrict-aliasing -s -Wall" \
./configure --prefix=$PREFIX --with-gmp --with-zlib
make

