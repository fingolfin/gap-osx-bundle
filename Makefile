INSTALL = /usr/bin/install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

export BUNDLE=$(CURDIR)/GAP.app
export PREFIX=$(BUNDLE)/Contents/Resources

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

$(PACKAGES):
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

distclean:
	echo TODO
	echo rm -rf src build dst

check:
	@echo "Checking for files containing '$(BUNDLE)'"
	@( cd $(PREFIX) && fgrep -rl $(BUNDLE) . )
	@echo
	@echo "Checking for files containing '/sw/'"
	@( cd $(PREFIX) && fgrep -rl /sw/ . )


.PHONY: subdirs $(PACKAGES)
.PHONY: subdirs $(FETCHPACKAGES)
.PHONY: subdirs $(BUILDPACKAGES)
.PHONY: subdirs $(INSTALLPACKAGES)
.PHONY: subdirs $(CLEANPACKAGES)
.PHONY: subdirs $(DISTCLEANPACKAGES)
.PHONY: all fetch build install clean distclean
.PHONY: check
