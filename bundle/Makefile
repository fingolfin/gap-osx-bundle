all: bundle

bundle:
	mkdir -p $(BUNDLE)/Contents/Resources
	#cp gap.icns $(BUNDLE)/Contents/Resources/

	mkdir -p $(BUNDLE)/Contents/MacOS
	@install -m 755 gap $(BUNDLE)/Contents/MacOS/
	@install -m 755 gap.start $(BUNDLE)/Contents/MacOS/
	
	cp Info.plist $(BUNDLE)/Contents/

clean:
	rm $(BUNDLE)/Contents/MacOS/*


.PHONY: all bundle clean
