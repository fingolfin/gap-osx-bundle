#!/bin/sh -e

usage() {
    cat <<EOF
Usage: $0 URL MD5 [FILENAME]
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
MD5="$2"
if [ $# = 2 ]; then
    FILE=`basename $URL`
else
    FILE="$3"
fi

/bin/echo -n "Fetching $FILE..."

while : ; do
    if [ ! -e $FILE ] ; then
        echo "   downloading from $URL"
        curl -O $URL
    fi;
    COMPUTED_MD5=`/usr/bin/openssl md5 $FILE | /usr/bin/cut -d' ' -f2`
    case $COMPUTED_MD5 in
       *$MD5* )
           echo "   valid MD5 checksum"
           break
           ;;
       *)  echo "   invalid MD5 checksum, expected $MD5 but got $COMPUTED_MD5"
           echo "     retrying in 5 seconds..."
           sleep 5
           # TODO: instead, prompt the user what to do, with
           # a longer timeout, say 30 seconds?
           rm -f $FILE
           ;;
    esac
done;

exit 0


