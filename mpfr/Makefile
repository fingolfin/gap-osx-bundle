PACKAGE := mpfr
VERSION := 3.1.4
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.bz2"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://www.mpfr.org/$(PACKAGE)-$(VERSION)/$(ARCHIVE)"
MD5     := "b8a2f6b0e68bef46e53da2ac439e1cf4"

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libmpfr.*.dylib

include ../common.mk
