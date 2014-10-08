#!/bin/sh -ev

./b2 -d2 install

# FIXME: why does boost build the static lib even though
# we only enabled building shared libs?
rm $PREFIX/lib/libboost_atomic.a
