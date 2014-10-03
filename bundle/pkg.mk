#PACKAGES += bundle

bundle:
	$(MAKE) -C bundle

clean-bundle:
	$(MAKE) -C bundle clean

clean: clean-bundle

.PHONY: bundle clean-bundle
