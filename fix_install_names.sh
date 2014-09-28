#!/bin/sh -ex
#
# Take a binary (shared library or executable) and run install_name_tool
# on it to fixup its id (if it is a dylib), its default rpath, and
# the location of any dependant shared libs, substituting OLDPREFIX by NEWPREFIX.

usage() {
    cat <<EOF
Usage: $0 BINARY OLDPREFIX NEWPREFIX
EOF

    exit $1
}

if [ $# -ne 3 ]; then
    usage 1
fi

BINARY=$1
OLDPREFIX=$2
NEWPREFIX=$3

if [ ! -f $BINARY ] ; then
    usage 1
fi

# If it is a shared library, fix its id
if [[ $BINARY =~ \.dylib$ ]] ; then
    install_name_tool -id $NEWPREFIX/`basename $BINARY` $BINARY
fi

# For everything: Fix the default rpath
# TODO: Some binaries may not have any rpath set; for these, the below command
# will error out... ignore that???
# It is also a bit ugly that we hardcode "../Resources/lib"
install_name_tool -rpath $OLDPREFIX "../Resources/lib" $BINARY

# Finally, fixup the locations of dependant libraries

libs=`otool -L $BINARY | sed -e 1d | fgrep $OLDPREFIX | sed -E -e 's/[[:space:]]+(.+dylib) .+/\1/'`
for lib in $libs ; do
    newlib=`echo $lib | sed -e "s,$OLDPREFIX,$NEWPREFIX,"`
    install_name_tool -change $lib $newlib $BINARY
done

exit 0
