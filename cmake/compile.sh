#!/bin/sh -ev

# Use a custom prefix -- we do not want to ship this package to the
# user, but rather only use it as a build tool.
#export MACOSX_DEPLOYMENT_TARGET=""
./bootstrap --prefix=$TOOLSDIR
make
