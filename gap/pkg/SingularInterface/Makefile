PACKAGE := SingularInterface
VERSION := 0.0
DIRNAME := "SingularInterface"

GIT_REPO := "https://github.com/gap-system/SingularInterface"

include ../common.mk

fetch:
	if [ ! -d $(BUILDDIR) ] ; then git clone $(GIT_REPO) $(BUILDDIR) ; fi;
	cd $(BUILDDIR) && git pull --ff-only
