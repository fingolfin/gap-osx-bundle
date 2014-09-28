#!/bin/sh -ev

# move everything to destination dir
GAPROOT=$PREFIX/lib/gap
rm -rf $GAPROOT
mkdir -p $GAPROOT
mv * $GAPROOT   # TODO: shouldn't use * ...
cd $GAPROOT

# compile GAP; use a custom "target" pretending that this was made on 10.6
./configure --target=x86_64-apple-darwin10.0.0 --with-gmp=system
make -j8

# build documentation
make manuals

# setup bin symlink
(cd $GAPROOT/bin && ln -s ../lib/gap/bin/gap.sh)

# compile packages
cd $GAPROOT/pkg

for pkg in ace Browse edim example Gauss grape guava*; do
    echo ""
    echo "================================================="
    echo "==== Building $pkg"
    echo "================================================="
    cd $GAPROOT/pkg/$pkg
    ./configure #$GAPROOT
    make
done

# HACK: fixup float
(cd $GAPROOT/pkg/float-0.5.18 && PATH="/sw/bin:$PATH" /sw/bin/autoreconf -vif)

for pkg in anupq* cvec* io* orb* float* nq*; do
    echo ""
    echo "================================================="
    echo "==== Building $pkg"
    echo "================================================="
    cd $GAPROOT/pkg/$pkg
    ./configure #--with-gaproot=$GAPROOT
    make
done

chmod 1777 $GAPROOT/pkg/atlasrep/datagens $GAPROOT/pkg/atlasrep/dataword

cd $GAPROOT/pkg/cohomolo
./configure #$GAPROOT
make CC="gcc -fno-builtin "
cd ..

cd $GAPROOT/pkg/fplsa
sed -i '' 's/malloc.h/string.h/' src/fplsa4.c
./configure #$GAPROOT
make CC="gcc -O2 "
cd ..

cd $GAPROOT/pkg/kbmag
make clean
./configure #$GAPROOT
make COPTS="-O2 -g"
cd ..


# TODO:
# - PolymakeInterface (requires polymake)
# - NormalizInterface
# - SingularInterface
# - ...
