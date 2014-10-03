#!/bin/sh -ev

if [ "x$CMAKE" = x ] ; then
    echo "ERROR: cmake not found, please read the README"
    exit 1
fi

$CMAKE -DCMAKE_INSTALL_PREFIX:PATH="$PREFIX" \
    -DBUILD_SHARED:BOOL=ON \
    -DCMAKE_MACOSX_RPATH:BOOL=OFF
make -j8
