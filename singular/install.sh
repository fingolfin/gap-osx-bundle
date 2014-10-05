#!/bin/sh -ev

make install
#make check

rm -f $PREFIX/lib/*.la
rm -f $PREFIX/libexec/singular/MOD/*.la
rm -rf $PREFIX/lib/pkgconfig

VER=4.0.1
OMVER=0.9.6

cd $PREFIX

$BASEDIR/fix_install_names.sh $PREFIX \
            bin/Singular \
            bin/ESingular \
            bin/TSingular \
            lib/libSingular-$VER.dylib \
            lib/libpolys-$VER.dylib \
            lib/libresources-$VER.dylib \
            lib/libomalloc-$OMVER.dylib \
            lib/libfactory-$VER.dylib

for name in libexec/singular/MOD/*.so ; do
    $BASEDIR/fix_install_names.sh $PREFIX $name
done

for name in LLL change_cost gen_test solve_IP toric_ideal ; do
    $BASEDIR/fix_install_names.sh $PREFIX libexec/singular/MOD/$name
done
