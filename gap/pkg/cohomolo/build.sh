#!/bin/sh -ex

./configure
make CC="gcc -fno-builtin "
