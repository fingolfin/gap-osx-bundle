#!/bin/sh -ex

make clean || :
./configure
make COPTS="-O2 -g"
