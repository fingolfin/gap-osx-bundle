#!/bin/sh -ev

cd source

make install

install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/lib/libnormaliz.dylib
install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/bin/normaliz
