#!/bin/sh -e

prefix="$(cd "$(dirname "$0")"/.. && pwd)"

if [ "x$GPRC" = x ] ; then
    GPRC="$prefix/etc/gprc"
fi

if [ "x$GPHELP" = x ] ; then
    GPHELP="$prefix/bin/gphelp"
fi

if [ "x$GP_DATA_DIR" = x ] ; then
    GP_DATA_DIR="$prefix/share/pari"
fi

"$prefix/bin/gp-2.7-real"
