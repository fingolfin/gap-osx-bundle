#!/bin/sh -e
#
# Take one or multiple binaries (shared libraries or executables) and
# run install_name_tool on them to adjust the id (for dylibs), the
# default rpath (if necessary), and the location of any dependant shared
# libs, substituting OLDPREFIX by NEWPREFIX.

usage() {
    cat <<EOF
Usage: $0 OLDPREFIX NEWPREFIX  BINARY [BINARIES...]
EOF

    exit $1
}

if [ $# -lt 3 ]; then
    usage 1
fi

OLDPREFIX=$1
NEWPREFIX=$2

shift 2

# Iterate over all arguments
for BINARY ; do

    if [ ! -f $BINARY ] ; then
        usage 1
    fi

    # If it is a shared library, fix its id
    if [[ $BINARY =~ \.dylib$ ]] ; then
        install_name_tool -id $NEWPREFIX/`basename $BINARY` $BINARY
    fi

    # For everything: Fix the default rpath
    # TODO: Some binaries may not have any rpath set; for these, the below command
    # will error out... for now we ignore that.
    # TODO: It is also a bit ugly that we hardcode "../Resources/lib"
    install_name_tool -rpath $OLDPREFIX "../Resources/lib" $BINARY 2>/dev/null || echo "rpath not changed"

    # Finally, fixup the locations of dependant libraries
    libs=`otool -L $BINARY | sed -e 1d | fgrep $OLDPREFIX | sed -E -e 's/[[:space:]]+(.+dylib) .+/\1/'`
    for lib in $libs ; do
        newlib=`echo $lib | sed -e "s,$OLDPREFIX,$NEWPREFIX,"`
        install_name_tool -change $lib $newlib $BINARY
    done

done

exit 0
