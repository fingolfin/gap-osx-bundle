#!/bin/sh -ev

make install

$BASEDIR/fix_install_names.sh $PREFIX lib/libcxsc.2.5.4.dylib

mkdir -p $PREFIX/share/cxsc
rm -rf $PREFIX/share/cxsc/examples
mv $PREFIX/examples $PREFIX/share/cxsc/examples

for name in allzeros example inewton lexample io linewton trace rungekutta; do
    $BASEDIR/fix_install_names.sh $PREFIX share/cxsc/examples/$name
done
