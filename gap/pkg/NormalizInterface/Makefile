PACKAGE := NormalizInterface

GIT_REPO := "https://github.com/fingolfin/NormalizInterface"

include ../common.mk

fetch:
	if [ ! -d $(BUILDDIR) ] ; then git clone $(GIT_REPO) $(BUILDDIR) ; fi;
	cd $(BUILDDIR) && git pull --ff-only

build-extra:
	cd $(BUILDDIR) && rm -rf src/.libs
