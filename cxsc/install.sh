#!/bin/sh -ev

make install

$BASEDIR/fix_install_names.sh $PREFIX lib/libcxsc.2.5.4.dylib

cd $PREFIX

mkdir -p share/cxsc
rm -rf share/cxsc/examples
mv examples share/cxsc/examples

for name in share/cxsc/examples/*; do
    if [ -x $name ] ; then
        $BASEDIR/fix_install_names.sh $PREFIX $name
    fi
done
