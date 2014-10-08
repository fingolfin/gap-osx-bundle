# Variant of the global common.mk for GAP packages that come
# bundled with GAP (and hence don't need fetch / extract rules)

export BASEDIR  := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../..)
export PREFIX   := $(BASEDIR)/GAP.app/Contents/Resources
export SRCDIR   := $(BASEDIR)/src
export BUILDDIR := $(PREFIX)/lib/gap/pkg/$(DIRNAME)

RUN:="$(BASEDIR)/run-script.sh"
FETCH:="$(BASEDIR)/download.sh"

all: BUILT

BUILT: Makefile
	$(MAKE) build

ifneq ($(wildcard build.sh),) 
BUILT: build.sh
endif

fetch:

build-default: fetch
	@echo "================================================="
	@echo "Building $(PACKAGE)"
	@echo "================================================="
	if [ -f $(CURDIR)/build.sh ] ; then \
	    cd $(BUILDDIR) && $(RUN) $(CURDIR)/build.sh ; \
	else \
	    cd $(BUILDDIR) && $(RUN) ./configure && $(RUN) make ; \
	fi
	$(BASEDIR)/fix_install_names.sh $(PREFIX) $(BUILDDIR)/bin/*/*
	cd $(BUILDDIR) && rm -rf *.la .libs src/.deps config.log config.status Makefile autom4te.cache/ doc/*.log
	touch BUILT

build-extra:

build: build-default build-extra
	touch BUILT

install:
	@echo "Nothing to install"

clean:
	rm -f BUILT
	@echo "TODO: implement clean?!?"

.PHONY: all fetch build build-default build-extra install clean
