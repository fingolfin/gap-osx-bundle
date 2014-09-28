#!/bin/sh -ev

make install

rm -f $PREFIX/lib/*.la

for name in libgmp.10.dylib libgmpxx.4.dylib ; do
    install_name_tool -id @rpath/$name $PREFIX/lib/$name
    install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/lib/$name
done

$BASEDIR/fix_install_names.sh $PREFIX/lib @rpath $PREFIX/lib/libgmpxx.4.dylib
