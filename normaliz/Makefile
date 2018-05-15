PACKAGE := normaliz
VERSION := 3.5.4
DIRNAME := $(PACKAGE)-$(VERSION)
ARCHIVE := $(DIRNAME).tar.gz
URL     := https://github.com/Normaliz/Normaliz/releases/download/v$(VERSION)/$(ARCHIVE)
SHA256  := d65739c43726733f3bb30842442296bfe832eef238935e8729beaebbed231656
WWW     := https://www.normaliz.uni-osnabrueck.de

CONFIGURE_PARAMS := \
    --disable-static \
    CXXFLAGS="-DNDEBUG"

FILES_TO_FIX := lib/libnormaliz.dylib lib/libQnormaliz.dylib bin/normaliz bin/Qnormaliz

include ../common.mk
