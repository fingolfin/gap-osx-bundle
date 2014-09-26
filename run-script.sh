#!/bin/sh -ex

# Run a script in a clean environment
# Expects the "PREFIX" env variable to be set.
if [ x$PREFIX = x ] ; then
    echo "ERROR: PREFIX not set"
    exit 1
fi

env -i \
    PREFIX=$PREFIX \
    PATH="$PREFIX/bin:/usr/bin:/bin:/usr/sbin:/sbin" \
    LDFLAGS="-L$PREFIX/lib -Wl,-rpath,$PREFIX/lib" \
    CPPFLAGS="-isystem $PREFIX/include" \
    $*
