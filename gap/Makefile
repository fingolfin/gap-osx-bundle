PACKAGE := gap
VERSION := 4.7.5
ARCHIVE := "gap4r7p5_2014_05_24-20_02.tar.gz"
DIRNAME := "gap4r7"
URL     := "ftp://ftp.gap-system.org/pub/gap/gap47/tar.bz2/$(ARCHIVE)"
MD5     := "086f2d50529c6150977104cb17f2a108"

# ftp://ftp.gap-system.org/pub/gap/gap4core/gap4r7p5_nopackages.zip

include ../common.mk

HACK:
	@cd $(BUILDDIR)/$(DIRNAME) && $(RUN) $(CURDIR)/compile.sh
