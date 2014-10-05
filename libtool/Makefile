PACKAGE := libtool
VERSION := 2.4.2
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)"
MD5     := "d2f3b7d4627e69e13514a40e72a24d50"

include ../common.mk

# Use a custom prefix -- we do not want to ship this package to the
# user, but rather only use it as a build tool.
export PREFIX   := $(BASEDIR)/build-tools
