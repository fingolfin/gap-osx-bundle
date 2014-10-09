#!/bin/sh -ev

make install

install -m 755 -d "$PREFIX/etc/"
install -m 644 "misc/gprc.dft" "$PREFIX/etc/"
install -m 644 "misc/gpalias" "$PREFIX/etc/"

cd "$PREFIX"
rm lib/pari/pari.cfg
mv bin/gp-2.7 bin/gp-2.7-real
install -m 755 "$BASEDIR/pari/gp.sh" bin/gp-2.7
