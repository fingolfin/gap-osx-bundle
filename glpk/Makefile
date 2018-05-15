PACKAGE := glpk
VERSION := 4.61
DIRNAME := $(PACKAGE)-$(VERSION)
ARCHIVE := $(DIRNAME).tar.gz
URL     := "http://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)"
SHA256  := "9866de41777782d4ce21da11b88573b66bb7858574f89c28be6967ac22dfaba9"
# https://www.gnu.org/software/glpk/

CONFIGURE_PARAMS := --with-gmp --enable-dl=dlfcn --disable-static

FILES_TO_FIX := bin/glpsol lib/libglpk.*.dylib

include ../common.mk
