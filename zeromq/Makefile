PACKAGE := zeromq
VERSION := 4.2.3
DIRNAME := $(PACKAGE)-$(VERSION)
ARCHIVE := $(DIRNAME).tar.gz
URL     := https://github.com/zeromq/libzmq/releases/download/v$(VERSION)/$(ARCHIVE)
SHA256  := 8f1e2b2aade4dbfde98d82366d61baef2f62e812530160d2e6d0a5bb24e40bc0

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libzmq.*.dylib bin/curve_keygen

include ../common.mk

# HACK: delete pkg-config .pc file, as it hard codes the build path
install-extra:
	rm -f $(PREFIX)/lib/pkgconfig/libzmq.pc
