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

relpath() {
    python -c "import os.path; print os.path.relpath('$1','${2:-$PWD}')" ;
}

env -i \
    BASEDIR=$BASEDIR \
    PREFIX=$PREFIX \
    SRCDIR=$SRCDIR \
    BUILDDIR=$BUILDDIR \
    TOOLSDIR=$TOOLSDIR \
    HOME=$BASEDIR \
    PACKAGE=$PACKAGE \
    VERSION=$VERSION \
    CC="clang" \
    CXX="clang++ -stdlib=libc++" \
    REL_PWD="`relpath $PWD $PREFIX`" \
    MACOSX_DEPLOYMENT_TARGET="10.7" \
    PATH="$PREFIX/bin:$TOOLSDIR/bin:/usr/bin:/bin:/usr/sbin:/sbin" \
    LDFLAGS="-L$PREFIX/lib -Wl,-rpath,$PREFIX" \
    CPPFLAGS="-isystem $PREFIX/include" \
    $*
