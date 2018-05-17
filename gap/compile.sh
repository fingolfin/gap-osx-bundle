#!/bin/sh -ev

# move everything to destination dir
GAPROOT=$PREFIX/lib/gap
rm -rf $GAPROOT
mkdir -p $GAPROOT
mv * $GAPROOT   # TODO: shouldn't use * ...
cd $GAPROOT

# compile GAP; use a custom "target" pretending that this was made on 10.6
./configure --host=x86_64-apple-darwin10.0.0
make -j8

$BASEDIR/fix_install_names.sh $PREFIX gap

# build documentation
# TODO/FIXME: temporary disable, re-enable after debugging
# #make doc

# setup bin symlink
rm -f $PREFIX/bin/gap
(cd $PREFIX/bin && ln -s ../lib/gap/bin/gap.sh gap)


# temporarily move away packages we do not support and/or want to
# build differently
mkdir -p pkg.off
mv pkg/linboxing* pkg.off/
mv pkg/NormalizInterface* pkg.off/
mv pkg/PolymakeInterface* pkg.off/

#
# build everything
#
cd $GAPROOT/pkg
../bin/BuildPackages.sh --strict

mv ../pkg.off/NormalizInterface* ./
cd NormalizInterface*
./configure --with-normaliz=$PREFIX
make -j8
cd ..

# now do some cleanup... must be done before running fix_install_names.sh
# to avoid problems with invalid inputs for fix_install_names.sh
( cd guava*/src/leon && make clean && rm -f leonconv ctjhai/minimum-weight )

for pattern in autom4te.cache .libs .deps Makefile config.status \
               "*.log" "*.la" "*.a" "*.o" "*.dSYM" ; do
    find . -name "$pattern" -print0 | xargs -0 rm -rf
done

rm -f anupq*/pq
rm -rf carat*/carat/bin
rm -f carat*/config.carat
rm -f grape*/bin/*/dreadnautB.exe
rm -f guava*/src/leonconv guava*/src/ctjhai/minimum-weight
rm -f nq*/nq
rm -f simpcomp*/bistellar
rm -f semigroups*/bin/lib/libsemigroups.lai
rm -f xgap*/bin/*/config*
rm -f */doc/*.log
rm -f */Makefile-default*
rm -rf log

#
rm -f */bin/*/*.la
$BASEDIR/fix_install_names.sh $PREFIX */bin/bistellar
$BASEDIR/fix_install_names.sh $PREFIX */bin/*/*

cd ..

rm -f config.log config.status
rm -rf obj
rm -f GNUMakefile
rm -f doc/make_doc
rm -f cnf/GAP-*FLAGS

echo "-----------------"
echo "DONE building GAP"
echo "-----------------"
