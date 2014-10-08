#!/bin/sh -ev

# Note: we do not build all boost libraries to save time (and space).
# Indeed, for now we only need dynamic_bitset for Normaliz.
# If new packages require more boost functionality, we can
# selectively enable it here.

./bootstrap.sh --prefix=$PREFIX \
    --without-icu \
    --with-libraries=atomic

#    --without-libraries=python,mpi 

./b2 -d2 link=shared
