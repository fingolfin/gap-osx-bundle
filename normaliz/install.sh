#!/bin/sh -ev

cd source
make install

cd $PREFIX
$BASEDIR/fix_install_names.sh $PREFIX bin/normaliz lib/libnormaliz.dylib 

# For some strange reason, normaliz ends up using @rpath/libnormaliz.0.dylib
# even before we run fix_install_names.sh, so we must fix bin/normaliz manually.
install_name_tool -change @rpath/libnormaliz.0.dylib @rpath/lib/libnormaliz.0.dylib $PREFIX/bin/normaliz
