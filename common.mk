.PHONY: fetch fetch-default fetch-extra
.PHONY: extract extract-default extract-extra
.PHONY: build build-default build-extra
.PHONY: install install-default install-extra
.PHONY: clean clean-default clean-extra

.PHONY: all distclean


RUN:="$(CURDIR)/../run-script.sh"

all: fetch build install

clean:
	rm -rf $(DIRNAME)

clean-extra:

clean: clean-default clean-extra

distclean: clean
	rm -f $(ARCHIVE)

fetch-default:
	@echo "================================================="
	@echo "Fetching $(PACKAGE)-$(VERSION)"
	@echo "================================================="
	@../download $(URL) $(MD5) $(ARCHIVE)

fetch-extra:

fetch: fetch-default fetch-extra

extract-default: fetch
	@echo "================================================="
	@echo "Extracting $(PACKAGE)-$(VERSION)"
	@echo "================================================="
	@mkdir -p $(PREFIX)
	@rm -rf $(DIRNAME)
	@tar xvf $(ARCHIVE)		# -C $(TMP)

extract-extra:

extract: extract-default extract-extra

build-default: extract
	@echo "================================================="
	@echo "Building $(PACKAGE)-$(VERSION)"
	@echo "================================================="
	@cd $(DIRNAME) && $(RUN) $(CURDIR)/compile.sh

build-extra:

build: build-default build-extra

install-default:
	@echo "================================================="
	@echo "Installing $(PACKAGE)-$(VERSION)"
	@echo "================================================="
	@cd $(DIRNAME) && $(RUN) $(CURDIR)/install.sh

install-extra:

install: install-default install-extra
