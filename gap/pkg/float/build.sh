#!/bin/sh -ex

# HACK: float 0.5.18 is missing autotools stuff, so regenerate it
autoreconf -vif

./configure
make
