PACKAGE := fplll
VERSION := 4.0.4
ARCHIVE := "lib$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "lib$(PACKAGE)-$(VERSION)"
URL     := "http://perso.ens-lyon.fr/damien.stehle/$(PACKAGE)/$(ARCHIVE)"
SHA256  := "cba8b0ded43f235003a58bcd4b2973105749b3f69732ae09fa44c7e98f5f71b1"
# https://github.com/dstehle/fplll

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libfplll.*.dylib bin/fplll bin/latticegen

include ../common.mk
