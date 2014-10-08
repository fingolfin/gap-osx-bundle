#PACKAGES += dmg

dmg: realpath

dmg: bundle
	$(MAKE) -C dmg

clean-dmg:
	$(MAKE) -C dmg clean

clean: clean-dmg

.PHONY: dmg clean-dmg
