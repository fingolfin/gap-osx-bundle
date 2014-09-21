INSTALL = /usr/bin/install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644


export PREFIX="$(PWD)/dst"

PACKAGES = \
	autoconf \
	automake \
	libtool \
	


FIXME: must have installed autoconf before starting to build automake / libtool ?

FIXME: 


#
# Generic code follows, no need to edit
#

FETCHPACKAGES = $(PACKAGES:%=fetch-%)
BUILDPACKAGES = $(PACKAGES:%=build-%)
INSTALLPACKAGES = $(PACKAGES:%=install-%)
CLEANPACKAGES = $(PACKAGES:%=clean-%)
DISTCLEANPACKAGES = $(PACKAGES:%=distclean-%)

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

distclean: $(DISTCLEANPACKAGES)
$(DISTCLEANPACKAGES): 
	$(MAKE) -C $(@:distclean-%=%) distclean


.PHONY: subdirs $(PACKAGES)
.PHONY: subdirs $(FETCHPACKAGES)
.PHONY: subdirs $(BUILDPACKAGES)
.PHONY: subdirs $(INSTALLPACKAGES)
.PHONY: subdirs $(CLEANPACKAGES)
.PHONY: subdirs $(DISTCLEANPACKAGES)
.PHONY: all fetch build install clean distclean
