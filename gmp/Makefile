PACKAGE := gmp
VERSION := 6.1.2
DIRNAME := $(PACKAGE)-$(VERSION)
ARCHIVE := $(DIRNAME).tar.bz2
URL     := "http://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)"
SHA256  := "5275bb04f4863a13516b2f39392ac5e272f5e1bb8057b18aec1c9b79d73d8fb2"

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
