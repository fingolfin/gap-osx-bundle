# Global rules for packages that contain common logic for fetching sources,
# running compile.sh and install.sh scripts and cleanup.

export BUNDLE_NAME := GAP.app
export BASEDIR  := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
export BUNDLE   := $(BASEDIR)/$(BUNDLE_NAME)
export PREFIX   := $(BUNDLE)/Contents/Resources
export SRCDIR   := $(BASEDIR)/src
export BUILDDIR := $(BASEDIR)/build
export TOOLSDIR := $(BASEDIR)/build-tools

RUN   := "$(BASEDIR)/run-script.sh"
FETCH := "$(BASEDIR)/download.sh"

all: INSTALLED

BUILT: #Makefile
	$(MAKE) fetch build

INSTALLED: BUILT Makefile
	$(MAKE) install

ifneq ($(wildcard compile.sh),) 
BUILT: compile.sh
endif

ifneq ($(wildcard install.sh),) 
INSTALLED: install.sh
endif

clean:
	rm -rf $(BUILDDIR)/$(DIRNAME)
	rm -f BUILT INSTALLED

clean-extra:

clean: clean-default clean-extra

fetch-default:
	@echo "================================================="
	@echo "Fetching $(PACKAGE)-$(VERSION)"
	@echo "================================================="
	@( mkdir -p $(SRCDIR) && cd $(SRCDIR) && $(FETCH) $(URL) $(MD5) $(ARCHIVE) )

fetch-extra:

fetch: fetch-default fetch-extra

extract-default: fetch
	@echo "================================================="
	@echo "Extracting $(PACKAGE)-$(VERSION)"
	@echo "================================================="
	@mkdir -p $(PREFIX)
	@mkdir -p $(BUILDDIR)
	@rm -rf $(BUILDDIR)/$(DIRNAME)
	@if [[ $(ARCHIVE) =~ \.zip$$ ]] ; then \
	     unzip $(SRCDIR)/$(ARCHIVE) -d $(BUILDDIR) ; \
	 else \
	     tar xvf $(SRCDIR)/$(ARCHIVE) -C $(BUILDDIR) ; \
	 fi
	@if [ -f $(CURDIR)/patch ] ; then \
		 cd $(BUILDDIR)/$(DIRNAME) && patch -p1 < $(CURDIR)/patch ; \
	 fi

extract-extra:

extract: extract-default extract-extra

build-default: extract
	@echo "================================================="
	@echo "Building $(PACKAGE)-$(VERSION)"
	@echo "================================================="
	if [ -f $(CURDIR)/compile.sh ] ; then \
	     cd $(BUILDDIR)/$(DIRNAME) && $(RUN) $(CURDIR)/compile.sh ; \
	 else \
	     cd $(BUILDDIR)/$(DIRNAME) && \
	     $(RUN) ./configure --prefix=$(PREFIX) $(CONFIGURE_PARAMS) && \
	     $(RUN) make -j8 ; \
	 fi

build-extra:

build: build-default build-extra
	touch BUILT

install-default:
	@echo "================================================="
	@echo "Installing $(PACKAGE)-$(VERSION)"
	@echo "================================================="
	if [ -f $(CURDIR)/install.sh ] ; then \
	     cd $(BUILDDIR)/$(DIRNAME) && $(RUN) $(CURDIR)/install.sh ; \
	 else \
	     cd $(BUILDDIR)/$(DIRNAME) && $(RUN) make install ; \
	 fi
	rm -f $(PREFIX)/lib/*.la
ifdef FILES_TO_FIX
	cd $(PREFIX) && $(BASEDIR)/fix_install_names.sh $(PREFIX) $(FILES_TO_FIX)
endif

install-extra:

install: install-default install-extra
	touch INSTALLED

.PHONY: all
.PHONY: fetch fetch-default fetch-extra
.PHONY: extract extract-default extract-extra
.PHONY: build build-default build-extra
.PHONY: install install-default install-extra
.PHONY: clean clean-default clean-extra
