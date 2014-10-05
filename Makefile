INSTALL = /usr/bin/install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

export BUNDLE_NAME := GAP.app
export BASEDIR  := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
export BUNDLE   := $(BASEDIR)/$(BUNDLE_NAME)
export PREFIX   := $(BUNDLE)/Contents/Resources
export SRCDIR   := $(BASEDIR)/src
export BUILDDIR := $(BASEDIR)/build
export TOOLSDIR := $(BASEDIR)/build-tools

all:
	@echo Use 'make pkg', where pkg is one of
	@for pkg in $(PACKAGES) ; do echo "  $$pkg" ; done

PACKAGES :=

include */pkg.mk

.PHONY: $(PACKAGES)

FETCHPACKAGES = $(PACKAGES:%=fetch-%)
BUILDPACKAGES = $(PACKAGES:%=build-%)
INSTALLPACKAGES = $(PACKAGES:%=install-%)
CLEANPACKAGES = $(PACKAGES:%=clean-%)

$(PACKAGES): bundle
	$(MAKE) -C $@

fetch: $(FETCHPACKAGES)
$(FETCHPACKAGES):
	$(MAKE) -C $(@:fetch-%=%) fetch

build: $(BUILDPACKAGES)
$(BUILDPACKAGES):
	$(MAKE) -C $(@:build-%=%) build

install: $(INSTALLPACKAGES)
$(INSTALLPACKAGES):
	$(MAKE) -C $(@:install-%=%) install

clean: $(CLEANPACKAGES)
$(CLEANPACKAGES): 
	$(MAKE) -C $(@:clean-%=%) clean

clean:
	rm -rf $(BUNDLE)
	rm -rf $(TOOLSDIR)

distclean: clean
	rm -rf src build

check:
	@echo "Checking for files containing '$(BUNDLE)'"
	@fgrep -rl $(BUNDLE) $(BUNDLE_NAME) || :
	@echo
	@echo "Checking for files containing '$(PWD)/build'"
	@fgrep -rl $(PWD)/build $(BUNDLE_NAME) || :
	@echo
	@echo "Checking for files containing '/sw/'"
	@fgrep -rl /sw/ $(BUNDLE_NAME) || :


.PHONY: subdirs $(PACKAGES)
.PHONY: subdirs $(FETCHPACKAGES)
.PHONY: subdirs $(BUILDPACKAGES)
.PHONY: subdirs $(INSTALLPACKAGES)
.PHONY: subdirs $(CLEANPACKAGES)
.PHONY: subdirs $(DISTCLEANPACKAGES)
.PHONY: all fetch build install clean distclean
.PHONY: check
