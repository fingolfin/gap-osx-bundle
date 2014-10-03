#!/bin/sh -e
#
# Take one or multiple binaries (shared libraries or executables) and
# run install_name_tool on them to adjust the id (for dylibs), the
# default rpath (if necessary), and the location of any dependant shared
# libs.

usage() {
    cat <<EOF
Usage: $0 PREFIX BINARY [BINARIES...]
EOF

    exit $1
}

if [ $# -lt 2 ]; then
    usage 1
fi

PREFIX=$1
shift

# Use python to turn absolute paths into relative ones:
# "relpath /a/b /a/c"  returns  ../b
relpath() {
  python -c "import os.path; print os.path.relpath('$1','${2:-$PWD}')" ;
}

# Iterate over all arguments
for BINARY ; do

    if [ ! -f $PREFIX/$BINARY ] ; then
        usage 1
    fi
    
    # Strip debug symbols. This makes it easier to find instances
    # of hardcoded paths.
    strip -S $PREFIX/$BINARY

    # If it is a shared library, update its id
    if [[ $BINARY =~ \.dylib$ ]] ; then
        install_name_tool -id @rpath/$BINARY $PREFIX/$BINARY
    fi

    # Change the default LC_RPATH value to use @loader_path, in order to
    # make things relocatable. Note that some binaries may not have any
    # rpath set, or at least not the one we expect; for these, the 
    # first install_name_tool invocation below will error out. In that
    # case, we still try to add a suitable rpath. If that also fails,
    # we give up and print a warning.
    #
    # TODO: We could be more clever and generate a list of all rpaths
    # set for the binary, then use that to update the first (if any) and
    # remove the others; or to add one (if none exists so far). Note
    # that simply removing all rpaths and then adding a new one does not
    # work in practice, as install_name_tool ends up garbling certain
    # binaries (a bug?).
    tmp=`dirname $BINARY`
    NEW_RPATH="@loader_path/`relpath $PREFIX $PREFIX/$tmp`"
    install_name_tool -rpath $PREFIX $NEW_RPATH $PREFIX/$BINARY ||
        install_name_tool -add_rpath $NEW_RPATH $PREFIX/$BINARY ||
        echo "WARNING: unable to set rpath $NEW_RPATH"

    # Finally, update the locations of dependant libraries
    libs=`otool -L $PREFIX/$BINARY | sed -e 1d | fgrep $PREFIX | sed -E -e 's/[[:space:]]+(.+dylib) .+/\1/'`
    for lib in $libs ; do
        newlib=`echo $lib | sed -e "s,$PREFIX,@rpath,"`
        install_name_tool -change $lib $newlib $PREFIX/$BINARY
    done

done

exit 0
