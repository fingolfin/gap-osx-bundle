#!/bin/sh -ev

make install

rm -f $PREFIX/lib/*.la

for name in libmpc.3.dylib ; do
    install_name_tool -id @rpath/$name $PREFIX/lib/$name
    install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/lib/$name
done
