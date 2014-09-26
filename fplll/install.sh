#!/bin/sh -ev

make install -j8

rm -f $PREFIX/lib/*.la

for name in libfplll.0.dylib ; do
    install_name_tool -id @rpath/$name $PREFIX/lib/$name
    install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/lib/$name
done

for name in fplll latticegen ; do
    install_name_tool -change \
        $PREFIX/lib/libfplll.0.dylib \
        @rpath/libfplll.0.dylib \
        $PREFIX/bin/$name
    install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/bin/$name
done
