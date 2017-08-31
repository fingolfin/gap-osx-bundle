PACKAGE := normaliz
VERSION := 3.4.0
DIRNAME := "$(PACKAGE)-$(VERSION)"
ARCHIVE := "$(DIRNAME).tar.gz"
URL     := "https://github.com/Normaliz/Normaliz/releases/download/v$(VERSION)/$(ARCHIVE)"
SHA256  := "01eae802621beb3bdbde57bae32a1251d40ecc4a01660a50540c1e1f5eeb9c24"

CONFIGURE_PARAMS := \
    --disable-static \
    CXXFLAGS="-DNDEBUG"

FILES_TO_FIX := lib/libnormaliz.dylib lib/libQnormaliz.dylib bin/normaliz bin/Qnormaliz

include ../common.mk
