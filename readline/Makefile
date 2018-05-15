PACKAGE := readline
VERSION := 7.0
DIRNAME := $(PACKAGE)-$(VERSION)
ARCHIVE := $(DIRNAME).tar.gz
URL     := "http://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)"
SHA256  := "750d437185286f40a369e1e4f4764eda932b9459b5ec9a731628393dd3d32334"

VER     := $(subst .,,$(VERSION))
PATCH_URL     := "http://ftp.gnu.org/gnu/readline/readline-$(VERSION)-patches/readline$(VER)-"

CONFIGURE_PARAMS := --disable-static

include ../common.mk

fetch-extra: 
	@mkdir -p $(SRCDIR) && cd $(SRCDIR) \
	    && ../download.sh $(PATCH_URL)001 9ac1b3ac2ec7b1bf0709af047f2d7d2a34ccde353684e57c6b47ebca77d7a376 \
	    && ../download.sh $(PATCH_URL)002 8747c92c35d5db32eae99af66f17b384abaca961653e185677f9c9a571ed2d58 \
	    && ../download.sh $(PATCH_URL)003 9e43aa93378c7e9f7001d8174b1beb948deefa6799b6f581673f465b7d9d4780 \
	    && :

extract-extra:
	cd $(BUILDDIR) && \
	    for file in $(SRCDIR)/readline$(VER)-* ; do \
	        patch -p0 < $$file ; \
	    done
