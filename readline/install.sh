#!/bin/sh -ev

make install

rm -f $PREFIX/lib/*.la

for name in libhistory.6.3.dylib libreadline.6.3.dylib ; do
    chmod u+w $PREFIX/lib/$name
    rm -f $PREFIX/lib/$name.old
    strip -S $PREFIX/lib/$name
    install_name_tool -id @rpath/$name $PREFIX/lib/$name
    install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/lib/$name
done
