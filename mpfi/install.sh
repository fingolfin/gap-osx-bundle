#!/bin/sh -ev

make install

rm -f $PREFIX/lib/*.la

for name in libmpfi.0.dylib ; do
    strip -S $PREFIX/lib/$name
    install_name_tool -id @rpath/$name $PREFIX/lib/$name
    install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/lib/$name
done
