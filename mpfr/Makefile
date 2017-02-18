PACKAGE := mpfr
VERSION := 3.1.5
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.bz2"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://www.mpfr.org/$(PACKAGE)-$(VERSION)/$(ARCHIVE)"
SHA256  := "ca498c1c7a74dd37a576f353312d1e68d490978de4395fa28f1cbd46a364e658"

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libmpfr.*.dylib

include ../common.mk
