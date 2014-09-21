PACKAGE := libtool
VERSION := 2.4
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)"
MD5     := "b32b04148ecdd7344abc6fe8bd1bb021"

include ../common.mk

fetch:
	@echo "Fetching $(PACKAGE)-$(VERSION)"
	@../download $(URL) $(ARCHIVE) $(MD5)

build: fetch
	@echo "Building $(PACKAGE)-$(VERSION)"
	@mkdir -p $(PREFIX)
	@rm -rf $(DIRNAME)
	@tar xvfz $(ARCHIVE)		# -C $(TMP)
	@cd $(DIRNAME) && \
		PATH=$(PREFIX)/bin:"${PATH}" ./configure --prefix=$(PREFIX) && \
		make

install:
	cd $(DIRNAME) && make install
	echo TODO: fix install_name
