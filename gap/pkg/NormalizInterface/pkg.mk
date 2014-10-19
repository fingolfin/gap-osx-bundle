GAP_PACKAGES += NormalizInterface

gap/pkg/NormalizInterface: normaliz

# We run autogen.sh, so we need the autotools
gap/pkg/NormalizInterface: autoconf automake libtool
