PACKAGE := singular
VERSION := 4.0.1
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://www.mathematik.uni-kl.de/ftp/pub/Math/Singular/SOURCES/4-0-1/$(ARCHIVE)"
MD5     := "c1c2ae10005dfcd699111d1cde63db7d"

CONFIGURE_PARAMS := \
    --disable-maintainer-mode \
    --disable-dependency-tracking \
    --disable-static \
    --with-gmp=$(PREFIX) \
    --with-flint=$(PREFIX) \
    --with-readline=$(PREFIX) \
    --with-ntl=$(PREFIX)

include ../common.mk

shell:
	cd $(BUILDDIR)/$(DIRNAME) && $(RUN) /sw/bin/bash --norc --noprofile
