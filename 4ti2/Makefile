PACKAGE := 4ti2
VERSION := 1.6.7
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://www.4ti2.de/version_$(VERSION)/$(ARCHIVE)"
SHA256  := "d4833a831d8d437f595d2e234a4471d7adbe1523fc63aa46cacea56af3e831bb"

CONFIGURE_PARAMS := \
    --enable-shared \
    --disable-static

FILES_TO_FIX := \
    bin/4ti2gmp \
    bin/4ti2int32 \
    bin/4ti2int64 \
    bin/genmodel \
    bin/gensymm \
    bin/output \
    bin/ppi \
    bin/zsolve \
    lib/lib4ti2*.dylib \
    lib/libzsolve.dylib

include ../common.mk
