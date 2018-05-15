PACKAGE := singular
VERSION := 4.0.2
# TODO: 4.1.1p2 or newer
DIRNAME := $(PACKAGE)-$(VERSION)
ARCHIVE := $(DIRNAME).tar.gz
BASEURL := http://www.mathematik.uni-kl.de/ftp/pub/Math/Singular/SOURCES/4-0-2
URL     := $(BASEURL)/$(ARCHIVE)
SHA256  := c105a2c8ace0b3c9189b782ed63660ce235407d0160907c2cafc2128d36d8cb7
WWW     := https://www.singular.uni-kl.de

CONFIGURE_PARAMS := \
    --disable-maintainer-mode \
    --disable-dependency-tracking \
    --disable-static \
    --with-gmp=$(PREFIX) \
    --with-flint=$(PREFIX) \
    --with-readline=$(PREFIX) \
    --with-ntl=$(PREFIX)

include ../common.mk

fetch-extra:
	@mkdir -p $(SRCDIR) && cd $(SRCDIR) && \
	    ../download.sh $(BASEURL)/singular-$(VERSION)-share.tar.gz fe81cb100f3b73b159eb4a8122a29bc0f7705ef6f62ad55b68b5582c1ec0642d

install-extra:
	cd $(PREFIX) && tar xvf $(SRCDIR)/singular-$(VERSION)-share.tar.gz
