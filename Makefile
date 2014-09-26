INSTALL = /usr/bin/install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644


export PREFIX=$(PWD)/dst

PACKAGES :=

include */pkg.mk

.PHONY: $(PACKAGES)


#
# Generic code follows, no need to edit
#

FETCHPACKAGES = $(PACKAGES:%=fetch-%)
BUILDPACKAGES = $(PACKAGES:%=build-%)
INSTALLPACKAGES = $(PACKAGES:%=install-%)
CLEANPACKAGES = $(PACKAGES:%=clean-%)

all: $(PACKAGES)

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


.PHONY: subdirs $(PACKAGES)
.PHONY: subdirs $(FETCHPACKAGES)
.PHONY: subdirs $(BUILDPACKAGES)
.PHONY: subdirs $(INSTALLPACKAGES)
.PHONY: subdirs $(CLEANPACKAGES)
.PHONY: subdirs $(DISTCLEANPACKAGES)
.PHONY: all fetch build install clean distclean
