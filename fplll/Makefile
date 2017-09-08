PACKAGE := fplll
VERSION := 5.0.3
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "https://github.com/fplll/fplll/releases/download/$(VERSION)/$(ARCHIVE)"
SHA256  := "d2b11b7dcb26c30ac1aab9ff75aca9b3dd6e0b0b40c382af16017a717dfe05c2"
# https://github.com/dstehle/fplll

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libfplll.*.dylib bin/fplll bin/latticegen bin/latsieve

include ../common.mk
