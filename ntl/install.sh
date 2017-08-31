#!/bin/sh -ev

cd src
make install

rm -f $PREFIX/include/NTL/config_log.h
rm -f $PREFIX/lib/libntl.a
