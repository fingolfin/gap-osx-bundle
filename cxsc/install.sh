#!/bin/sh -ev

make install

for name in libcxsc.2.5.4.dylib ; do
    install_name_tool -id @rpath/$name $PREFIX/lib/$name
    install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/lib/$name
done

for name in allzeros example inewton lexample io linewton trace rungekutta; do
    install_name_tool -change \
        libcxsc.2.dylib \
        @rpath/libcxsc.2.dylib \
        $PREFIX/examples/$name
    install_name_tool -rpath $PREFIX/lib "../Resources/lib" $PREFIX/examples/$name

    strip -S $PREFIX/$name
    $BASEDIR/fix_install_names.sh $PREFIX/lib @rpath $PREFIX/$name
done


mkdir -p $PREFIX/share/cxsc
rm -rf $PREFIX/share/cxsc/examples
mv $PREFIX/examples $PREFIX/share/cxsc/
