#!/bin/sh -ex
#
# Run a script in a clean environment Expects the "PREFIX" and "BASEDIR"
# environment variables to be set.

if [ "x$PREFIX" = x ] ; then
    echo "ERROR: PREFIX not set"
    exit 1
fi

if [ "x$BASEDIR" = x ] ; then
    echo "ERROR: BASEDIR not set"
    exit 1
fi

env -i \
    BASEDIR=$BASEDIR \
    PREFIX=$PREFIX \
    SRCDIR=$SRCDIR \
    BUILDDIR=$BUILDDIR \
    HOME=$BASEDIR \
    CMAKE="`which cmake`" \
    PATH="$PREFIX/bin:/usr/bin:/bin:/usr/sbin:/sbin" \
    LDFLAGS="-L$PREFIX/lib -Wl,-rpath,$PREFIX" \
    CPPFLAGS="-isystem $PREFIX/include" \
    $*
