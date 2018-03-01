PACKAGE := mpc
VERSION := 1.1.0
DIRNAME := $(PACKAGE)-$(VERSION)
ARCHIVE := $(DIRNAME).tar.gz
URL     := https://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)
SHA256  := 6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e
WWW     := http://www.multiprecision.org/mpc/

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libmpc.*.dylib

include ../common.mk
