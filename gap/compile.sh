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

$BASEDIR/fix_install_names.sh $PREFIX bin/*/gap

# build documentation
make manuals

# clean some useless generated files containing the build path
rm -f config.log config.status bin/*/config.log

# setup bin symlink
(cd $PREFIX/bin && ln -s ../lib/gap/bin/gap.sh gap)

# remove various files containing hard coded paths
rm -f bin/*/*.o
rm -f Makefile-default64
rm -f bin/*/Makefile
rm -f bin/*/config.status
rm -f bin/*/extern/Makefile

# Clean some leftovers in packages
rm -f pkg/*/doc/*.log
