PACKAGE := flint
VERSION := 2.5.2
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://www.flintlib.org/$(ARCHIVE)"
MD5     := "cda885309362150196aed66a5e0f0383"

CONFIGURE_PARAMS := --with-gmp=$(PREFIX) --with-mpfr=$(PREFIX) \
	--disable-static 

FILES_TO_FIX := lib/libflint.dylib

include ../common.mk
