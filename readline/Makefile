PACKAGE := readline
VERSION := 6.3
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://ftp.gnu.org/gnu/$(PACKAGE)/$(ARCHIVE)"
MD5     := "33c8fb279e981274f485fd91da77e94a"

PATCH_URL     := "http://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-"


include ../common.mk

fetch-extra: 
	@../download $(PATCH_URL)001 4343f5ea9b0f42447f102fb61576b398
	@../download $(PATCH_URL)002 700295212f7e2978577feaee584afddb
	@../download $(PATCH_URL)003 af4963862f5156fbf9111c2c6fa86ed7
	@../download $(PATCH_URL)004 11f9def89803a5052db3ba72394ce14f
	@../download $(PATCH_URL)005 93721c31cd225393f80cb3aadb165544
	@../download $(PATCH_URL)006 71dc6ecce66d1489b96595f55d142a52
	@../download $(PATCH_URL)007 062a08ed60679d3c4878710b3d595b65
	@../download $(PATCH_URL)008 ee1c04072154826870848d8b218d7b04

# TODO: Download and apply patches
#   http://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-NNN
#   where right now NNN is 001 till 008
