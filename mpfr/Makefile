PACKAGE := mpfr
VERSION := 3.1.3
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.bz2"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://www.mpfr.org/$(PACKAGE)-$(VERSION)/$(ARCHIVE)"
MD5     := "5fdfa3cfa5c86514ee4a241a1affa138"

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libmpfr.4.dylib

include ../common.mk
