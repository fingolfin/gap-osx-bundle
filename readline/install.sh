#!/bin/sh -ev

make install

cd $PREFIX
rm -f lib/*.la

for name in libhistory.6.3.dylib libreadline.6.3.dylib ; do
    chmod u+w lib/$name
    rm -f lib/$name.old
    $BASEDIR/fix_install_names.sh $PREFIX lib/$name
done
