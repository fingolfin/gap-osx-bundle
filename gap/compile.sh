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

# clean some useless generated files containing the build path
rm -f config.log config.status bin/*/config.log

# setup bin symlink
(cd $PREFIX/bin && ln -s ../lib/gap/bin/gap.sh gap)

# TODO: fixup bin/gap-default64.sh to auto-determine path,
# like we do for libsingular-config

# TODO:
# - gap/bin/x86_64-apple-darwin10.0.0-gcc-default64/gac
# gap/bin/x86_64-apple-darwin10.0.0-gcc-default64/sysinfo.gap

rm -f bin/*/*.o
