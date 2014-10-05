PACKAGE := flint
VERSION := 2.4.4
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://www.flintlib.org/$(ARCHIVE)"
MD5     := "b527fe3a49fd02a0367227fe8ec9cbe4"

CONFIGURE_PARAMS := --with-gmp=$(PREFIX) --with-mpfr=$(PREFIX)
FILES_TO_FIX := lib/libflint.dylib

include ../common.mk

install-extra:
	rm -f $(PREFIX)/lib/libflint.a

# TODO: libflint.dylib references the file
#    $PREFIX/share/flint/CPimport.txt
