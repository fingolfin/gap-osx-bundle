PACKAGE := fplll
VERSION := 4.0.4
ARCHIVE := "lib$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "lib$(PACKAGE)-$(VERSION)"
URL     := "http://perso.ens-lyon.fr/damien.stehle/$(PACKAGE)/$(ARCHIVE)"
MD5     := "5f418674e20908a9e105b999fa4ab3a6"
# https://github.com/dstehle/fplll

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libfplll.0.dylib bin/fplll bin/latticegen

include ../common.mk
