PACKAGE := mpc
VERSION := 1.0.3
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://www.multiprecision.org/$(PACKAGE)/download/$(ARCHIVE)"
SHA256  := "617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3"

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libmpc.*.dylib

include ../common.mk
