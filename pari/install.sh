#!/bin/sh -ev

make install

for name in libpari-gmp.dylib ; do
    install_name_tool -id @rpath/$name $PREFIX/lib/$name
    #install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/lib/$name
done

install_name_tool -add_rpath "../Resources/lib" $PREFIX/lib/libpari-gmp.dylib

for name in gp-2.7 ; do
    install_name_tool -change \
        $PREFIX/lib/libpari-gmp.dylib \
        @rpath/libpari-gmp.dylib \
        $PREFIX/bin/$name
    install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/bin/$name
done

# TODO: the BUILD path is also referenced in the following files:
# bin/gphelp
# include/pari/paricfg.h
# lib/pari/pari.cfg
# share/pari/doc/paricfg.tex
# share/pari/examples/Makefile

# TODO: libpari-gmp.dylib references the path
#   $PREFIX/share/pari

# TODO: bin/gp-2.7 references the path
#   $PREFIX/bin/gbhelp
