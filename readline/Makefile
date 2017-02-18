PACKAGE := readline
VERSION := 6.3
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)"
SHA256  := "56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43"

PATCH_URL     := "http://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-"

CONFIGURE_PARAMS := --disable-static

include ../common.mk

fetch-extra: 
	@mkdir -p $(SRCDIR) && cd $(SRCDIR) && \
	    ../download.sh $(PATCH_URL)001 1a79bbb6eaee750e0d6f7f3d059b30a45fc54e8e388a8e05e9c3ae598590146f && \
	    ../download.sh $(PATCH_URL)002 39e304c7a526888f9e112e733848215736fb7b9d540729b9e31f3347b7a1e0a5 && \
	    ../download.sh $(PATCH_URL)003 ec41bdd8b00fd884e847708513df41d51b1243cecb680189e31b7173d01ca52f && \
	    ../download.sh $(PATCH_URL)004 4547b906fb2570866c21887807de5dee19838a60a1afb66385b272155e4355cc && \
	    ../download.sh $(PATCH_URL)005 877788f9228d1a9907a4bcfe3d6dd0439c08d728949458b41208d9bf9060274b && \
	    ../download.sh $(PATCH_URL)006 5c237ab3c6c97c23cf52b2a118adc265b7fb411b57c93a5f7c221d50fafbe556 && \
	    ../download.sh $(PATCH_URL)007 4d79b5a2adec3c2e8114cbd3d63c1771f7c6cf64035368624903d257014f5bea && \
	    ../download.sh $(PATCH_URL)008 3bc093cf526ceac23eb80256b0ec87fa1735540d659742107b6284d635c43787

extract-extra:
	cd $(BUILDDIR) && \
	    for file in $(SRCDIR)/readline63-* ; do \
	        patch -p0 < $$file ; \
	    done
