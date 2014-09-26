all: bundle

bundle:
	mkdir -p $(BUNDLE)/Contents/Resources
	#cp gap.icns $(BUNDLE)/Contents/Resources/

	mkdir -p $(BUNDLE)/Contents/MacOS
	@install -m 550 gap $(BUNDLE)/Contents/MacOS/
	@install -m 550 gap.start $(BUNDLE)/Contents/MacOS/
	
	cp Info.plist $(BUNDLE)/Contents/


.PHONY: all bundle