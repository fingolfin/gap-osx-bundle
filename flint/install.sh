#!/bin/sh -ev

make install
rm -f $PREFIX/lib/libflint.a
echo "TODO: fix install_name"
