PACKAGE := mpfi
VERSION := 1.5.1
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "https://gforge.inria.fr/frs/download.php/30129/$(ARCHIVE)"
SHA256  := "3fcc6536d117a67fbfbb875ab2d2b3d7fe76cdf0ce85a7e707aae1e89893696e"
# see https://perso.ens-lyon.fr/nathalie.revol/software.html

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libmpfi.*.dylib

include ../common.mk
