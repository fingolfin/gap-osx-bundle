PACKAGE := pari
VERSION := 2.7.2
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://pari.math.u-bordeaux.fr/pub/$(PACKAGE)/unix/$(ARCHIVE)"
MD5     := "5bf3947918a882df5168740b9796e0c5"

FILES_TO_FIX := bin/gp-2.7 lib/libpari-gmp.dylib

include ../common.mk

# TODO: libpari-gmp.dylib references the path
#   $PREFIX/share/pari

# TODO: bin/gp-2.7 references the path
#   $PREFIX/bin/gbhelp

# TODO: the BUNDLE path is also being referenced in the following files:
# bin/gphelp
# include/pari/paricfg.h
# lib/pari/pari.cfg
# share/pari/doc/paricfg.tex
# share/pari/examples/Makefile
