PACKAGE := gap
VERSION := 4.7.5
ARCHIVE := "gap4r7p5_2014_05_24-20_02.tar.bz2"
DIRNAME := "gap4r7"
URL     := "ftp://ftp.gap-system.org/pub/gap/gap47/tar.bz2/$(ARCHIVE)"
MD5     := "e3cfd08c8ed09cc28314a7e6c40d06ab"

# ftp://ftp.gap-system.org/pub/gap/gap4core/gap4r7p5_nopackages.zip

include ../common.mk

HACK:
	@cd $(BUILDDIR)/$(DIRNAME) && $(RUN) $(CURDIR)/compile.sh
