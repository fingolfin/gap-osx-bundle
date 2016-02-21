PACKAGE := gmp
VERSION := 6.1.0
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.bz2"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)"
MD5     := "86ee6e54ebfc4a90b643a65e402c4048"

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

FILES_TO_FIX := lib/libgmp.10.dylib lib/libgmpxx.4.dylib

include ../common.mk
