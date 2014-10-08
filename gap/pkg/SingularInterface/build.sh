#!/bin/sh -ex

if [ ! -e configure ] ; then
    ./autogen.sh
fi

./configure
make

rm -rf src/.libs src/.deps
rm -f src/pkgconfig.h 
rm -f gentableforGAP src/gentableforGAP-gentableforGAP.o
