#!/bin/sh -ex

sed -i '' 's/malloc.h/string.h/' src/fplsa4.c
./configure
make CC="gcc -O2 "

mkdir bin/x86_64-apple-darwin10.0.0-clang-default64
mv bin/fplsa4 bin/x86_64-apple-darwin10.0.0-clang-default64/
