#!/bin/sh -ev

./bootstrap.sh --prefix=$PREFIX --without-libraries=python,mpi -without-icu

#./b2 -d2 --toolset=darwin --without-python --prefix=$PREFIX

./b2 -d2


#    --compatibility_version=1.%type_pkg[boost].0 --current_version=1.%type_pkg[boost].0 \
#    --build-type=complete --layout=tagged variant=release threading=single,multi link=shared
