PACKAGE := mpfi
VERSION := 1.5.3
DIRNAME := $(PACKAGE)-$(VERSION)
ARCHIVE := $(DIRNAME).tar.bz2
URL     := https://gforge.inria.fr/frs/download.php/file/37331/$(ARCHIVE)
SHA256  := 2383d457b208c6cd3cf2e66b69c4ce47477b2a0db31fbec0cd4b1ebaa247192f
WWW     := https://perso.ens-lyon.fr/nathalie.revol/software.html
# https://gforge.inria.fr/projects/mpfi/

CONFIGURE_PARAMS := --disable-static
FILES_TO_FIX := lib/libmpfi.*.dylib

include ../common.mk
