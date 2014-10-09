#!/bin/sh -ev

make install

cd $PREFIX
rm lib/pari/pari.cfg
mv bin/gp-2.7 bin/gp-2.7-real
install -m 755 $BASEDIR/pari/gp.sh bin/gp-2.7
