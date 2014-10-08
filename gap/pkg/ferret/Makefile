PACKAGE := ferret
VERSION := 0.0
DIRNAME := "ferret"

HG_REPO := "https://bitbucket.org/ChrisJefferson/ferret"

include ../common.mk

fetch:
	if [ ! -d $(BUILDDIR) ] ; then hg clone $(HG_REPO) $(BUILDDIR) ; fi;
	cd $(BUILDDIR) && hg update
