#!/bin/sh -ev

# HACK: invoke cmake installed by fink.
# Strictly speaking, we should probably provide cmake, too...
# but this seems to much effort for no visible gain.
/sw/bin/cmake -DCMAKE_INSTALL_PREFIX:PATH="$PREFIX" \
    -DBUILD_SHARED:BOOL=ON \
    -DCMAKE_MACOSX_RPATH:BOOL=OFF
make -j8
