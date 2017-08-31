PACKAGES += gap

gap: gmp readline normaliz fplll mpc mpfi mpfr

# Include build rules for GAP packages
GAP_PACKAGES :=
include gap/pkg/*/pkg.mk

# Transform packages names
GAP_PACKAGES := $(addprefix gap/pkg/, $(GAP_PACKAGES))

# All GAP packages also are also packages depending on GAP
PACKAGES += $(GAP_PACKAGES)
$(GAP_PACKAGES): gap

# Target for building all packages at once:
gap-allpkgs: $(GAP_PACKAGES)
