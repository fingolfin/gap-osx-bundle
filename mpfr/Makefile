PACKAGE := mpfr
VERSION := 3.1.4
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.bz2"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://www.mpfr.org/$(PACKAGE)-$(VERSION)/$(ARCHIVE)"
SHA256  := "d3103a80cdad2407ed581f3618c4bed04e0c92d1cf771a65ead662cc397f7775"

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libmpfr.*.dylib

include ../common.mk
