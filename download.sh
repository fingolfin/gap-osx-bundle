#!/bin/sh -e

usage() {
    cat <<EOF
Usage: $0 URL SHA256 [FILENAME]
EOF

    exit $1
}

if [ $# -lt 2 ]; then
    usage 1
fi
if [ $# -gt 3 ]; then
    usage 1
fi

URL="$1"
SHA256="$2"
if [ $# = 2 ]; then
    FILE=`basename $URL`
else
    FILE="$3"
fi

/bin/echo -n "Fetching $FILE..."

while : ; do
    if [ ! -e $FILE ] ; then
        echo "   downloading from $URL"
        curl -L -O $URL
    fi;
    COMPUTED_SHA256=`shasum -a 256 $FILE | /usr/bin/cut -d' ' -f1`
    case $COMPUTED_SHA256 in
       *$SHA256* )
           echo "   valid SHA256 checksum"
           break
           ;;
       *)  echo "   invalid SHA256 checksum, expected $SHA256 but got $COMPUTED_SHA256"
           echo "     retrying in 30 seconds..."
           sleep 30
           rm -f $FILE
           ;;
    esac
done;

exit 0


