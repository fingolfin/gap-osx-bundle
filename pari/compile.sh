#!/bin/sh -ev

./configure --prefix=$PREFIX \
  --with-readline=$PREFIX \
  --with-gmp=$PREFIX \
  --graphic=none
make gp -j8
#make doc
make dobench
