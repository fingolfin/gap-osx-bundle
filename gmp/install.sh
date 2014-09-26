#!/bin/sh -ev

make install

rm -f $PREFIX/lib/*.la

for name in libgmp.10.dylib libgmpxx.4.dylib ; do
    install_name_tool -id @rpath/$name $PREFIX/lib/$name
    install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/lib/$name
done

install_name_tool -change \
    $PREFIX/lib/libgmp.10.dylib \
    @rpath/libgmp.10.dylib \
    $PREFIX/lib/libgmpxx.4.dylib
