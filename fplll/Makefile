PACKAGE := fplll
VERSION := 5.2.0
DIRNAME := $(PACKAGE)-$(VERSION)
ARCHIVE := $(DIRNAME).tar.gz
URL     := https://github.com/fplll/fplll/releases/download/$(VERSION)/$(ARCHIVE)
SHA256  := 75e17fcaa4fc5fdddbe6eb42aca5f38c4c169a4b52756e74fbe2d1769737ac9c
WWW     := https://github.com/fplll/fplll

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libfplll.*.dylib bin/fplll bin/latticegen bin/latsieve

include ../common.mk
