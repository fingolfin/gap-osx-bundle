all: bundle

bundle:
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
