BUNDLE_VERSION=0.3
GAP_VERSION=`cat $(BASEDIR)/GAP/VERSION`


all: bundle

Info.plist: Info.plist.in
	sed -e "s/@BUNDLE_VERSION@/$(BUNDLE_VERSION)/" -e "s/@GAP_VERSION@/$(GAP_VERSION)/" < $< > $@

gap.start: gap.start.in
	sed -e "s/@BUNDLE_VERSION@/$(BUNDLE_VERSION)/" -e "s/@GAP_VERSION@/$(GAP_VERSION)/" < $< > $@

bundle: Info.plist gap.start
	@mkdir -p $(BUNDLE)/Contents
	@install -m 644 Info.plist $(BUNDLE)/Contents/

	@mkdir -p $(BUNDLE)/Contents/Resources
	@install -m 644 gap.icns $(BUNDLE)/Contents/Resources/

	@mkdir -p $(BUNDLE)/Contents/MacOS
	@install -m 755 gap $(BUNDLE)/Contents/MacOS/
	@install -m 755 gap.start $(BUNDLE)/Contents/MacOS/
	

clean:
	rm -f $(BUNDLE)/Contents/MacOS/*


.PHONY: all bundle clean
