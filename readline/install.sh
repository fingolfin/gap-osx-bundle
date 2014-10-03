#!/bin/sh -ev

make install

rm -f $PREFIX/lib/*.la

for name in libhistory.6.3.dylib libreadline.6.3.dylib ; do
    chmod u+w $PREFIX/lib/$name
    rm -f $PREFIX/lib/$name.old
    $BASEDIR/fix_install_names.sh $PREFIX lib/$name
done
