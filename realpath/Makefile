export BUNDLE_NAME := GAP.app
export BASEDIR  := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/..)
export BUNDLE   := $(BASEDIR)/$(BUNDLE_NAME)
export PREFIX   := $(BUNDLE)/Contents/Resources
export SRCDIR   := $(BASEDIR)/src
export BUILDDIR := $(BASEDIR)/build/$(DIRNAME)
export TOOLSDIR := $(BASEDIR)/build-tools

all: install

build: realpath

install: realpath
	install -m 755 -d $(PREFIX)/bin/
	install -m 755 realpath $(PREFIX)/bin/

realpath: realpath.c
	clang -Wall -o $@ $<

clean:
	rm -f realpath

.PHONY: all realpath clean
