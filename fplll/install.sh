#!/bin/sh -ev

make install -j8

rm -f $PREFIX/lib/*.la

for name in libfplll.0.dylib ; do
    install_name_tool -id @rpath/$name $PREFIX/lib/$name
    install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/lib/$name
done

for name in bin/fplll bin/latticegen ; do
    $BASEDIR/fix_install_names.sh $PREFIX/lib @rpath $PREFIX/$name
done
