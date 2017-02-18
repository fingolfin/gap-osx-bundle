PACKAGE := gmp
VERSION := 6.1.0
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.bz2"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)"
SHA256  := "498449a994efeba527885c10405993427995d3f86b8768d8cdf8d9dd7c6b73e8"

# We override the host type to build a GMP version that works across a
# wide range of OS X machines, avoiding CPU specific optimizations. Of
# course this produces somewhat slower binaries, but at least it should
# work everywhere.
# In particular, we fake a Core Duo CPU with Mac OS X 10.6
CONFIGURE_PARAMS := \
    --host=core2-apple-darwin10.0.0 \
    --disable-static \
    --enable-cxx \
    --with-pic

FILES_TO_FIX := lib/libgmp.*.dylib lib/libgmpxx.*.dylib

include ../common.mk
