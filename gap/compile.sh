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
rm -f $PREFIX/bin/gap
(cd $PREFIX/bin && ln -s ../lib/gap/bin/gap.sh gap)

# remove various files containing hard coded paths
rm -f bin/*/*.o
rm -f Makefile
rm -f Makefile-default64
rm -f bin/*/Makefile
rm -f bin/*/config.status
rm -f bin/*/extern/Makefile

# Clean some leftovers in packages
rm -f pkg/*/doc/*.log


# Now build various packages
PACKAGES="
    ace
    anupq
    Browse
    cohomolo
    cvec
    digraphs
    edim
    example
    float
    Gauss
    grape
    guava
    io
    json
    kbmag
    NormalizInterface
    nq
    orb
    profiling
    simpcomp
    "
# Not currently being built:
# fplsa, fr, linboxing,pargap, PolymakeInterface, xgap
#
# Also "qaos" does not really need to be "built"


# print notices in green
notice() {
    printf "\033[32m%s\033[0m\n" "$*"
}

mkdir -p $PREFIX/pkgs/gap-pkgs

cd $GAPROOT
for pkg in $PACKAGES ; do
    echo ""
    notice "==== Building $pkg ===="
    pushd pkg/$pkg*
    case $pkg in
      NormalizInterface)
        ./configure --with-normaliz=$PREFIX
        ;;
     simpcomp)
        chmod a+x configure depcomp install-sh missing
        ./configure
        ;;
     *)
        ./configure
        ;;
    esac

    make

    for pattern in autom4te.cache .libs .deps Makefile config.status \
                   "*.log" "*.la" "*.a" "*.o" ; do
        find . -name "$pattern" -print0 | xargs -0 rm -rf
    done

    case $pkg in
     simpcomp)
        cp bistellar bin/
        $BASEDIR/fix_install_names.sh $PREFIX bin/bistellar
        ;;
     *)
        $BASEDIR/fix_install_names.sh $PREFIX bin/*/*
        ;;
    esac

    touch BUILT
    echo $pkg > $PREFIX/pkgs/gap-pkgs/$pkg

    popd
done

# Delete some stuff
rm -f "$GAPROOT/pkg/"grape*/bin/*/dreadnautB.exe
rm -f "$GAPROOT/pkg/"nq*/nq
rm -f "$GAPROOT/pkg/"anupq*/pq
rm -f "$GAPROOT/pkg/"simpcomp*/bistellar
