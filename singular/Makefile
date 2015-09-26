PACKAGE := singular
VERSION := 4.0.2
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
BASEURL := "http://www.mathematik.uni-kl.de/ftp/pub/Math/Singular/SOURCES/4-0-2"
URL     := "$(BASEURL)/$(ARCHIVE)"
MD5     := "24ee3b18adcf1cffa9016622f5707db6"

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
	    ../download.sh $(BASEURL)/singular-$(VERSION)-share.tar.gz e69ad9daf0070715daf1defb03dcaed6

install-extra:
	cd $(PREFIX) && tar xvf $(SRCDIR)/singular-$(VERSION)-share.tar.gz
