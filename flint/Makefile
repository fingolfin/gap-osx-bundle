PACKAGE := flint
VERSION := 2.5.2
DIRNAME := $(PACKAGE)-$(VERSION)
ARCHIVE := $(DIRNAME).tar.gz
URL     := http://www.flintlib.org/$(ARCHIVE)
SHA256  := cbf1fe0034533c53c5c41761017065f85207a1b770483e98b2392315f6575e87

CONFIGURE_PARAMS := --with-gmp=$(PREFIX) --with-mpfr=$(PREFIX) \
	--disable-static 

FILES_TO_FIX := lib/libflint.dylib

include ../common.mk
