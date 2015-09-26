GAP_VERSION=`cat $(BASEDIR)/GAP/VERSION`

all: dmg

dmg:
	../run-script.sh ./make-dmg.sh

clean:
	rm -f *.dmg


.PHONY: all bundle clean
