# Variant of the global common.mk for GAP packages that come
# bundled with GAP (and hence don't need fetch / extract rules)

export BASEDIR  := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../..)
export PREFIX   := $(BASEDIR)/GAP.app/Contents/Resources
export SRCDIR   := $(BASEDIR)/src
export BUILDDIR := $(PREFIX)/lib/gap/pkg/$(DIRNAME)

RUN:="$(BASEDIR)/run-script.sh"
FETCH:="$(BASEDIR)/download.sh"

all: BUILT

BUILT: build.sh Makefile
	$(MAKE) build

fetch:
	@echo "Nothing to fetch"

build:
	@echo "================================================="
	@echo "Building $(PACKAGE)"
	@echo "================================================="
	@cd $(BUILDDIR) && $(RUN) $(CURDIR)/build.sh
	touch BUILT

install:
	@echo "Nothing to install"

clean:
	rm -f BUILT
	@echo "TODO: implement clean?!?"

.PHONY: all fetch build install clean
