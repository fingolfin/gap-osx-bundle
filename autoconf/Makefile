PACKAGE := autoconf
VERSION := 2.69
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)"
MD5     := "82d05e03b93e45f5a39b828dc9c6c29b"

include ../common.mk

# Use a custom prefix -- we do not want to ship this package to the
# user, but rather only use it as a build tool.
export PREFIX   := $(BASEDIR)/build-tools
