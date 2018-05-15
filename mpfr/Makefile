PACKAGE := mpfr
VERSION := 4.0.1
DIRNAME := $(PACKAGE)-$(VERSION)
ARCHIVE := $(DIRNAME).tar.bz2
URL     := https://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)
SHA256  := a4d97610ba8579d380b384b225187c250ef88cfe1d5e7226b89519374209b86b
WWW     := http://www.mpfr.org

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libmpfr.*.dylib

include ../common.mk
