#!/bin/sh -ev

cd source
make install

$BASEDIR/fix_install_names.sh $PREFIX bin/normaliz lib/libnormaliz.dylib 
