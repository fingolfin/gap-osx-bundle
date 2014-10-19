GAP_PACKAGES += SingularInterface

gap/pkg/SingularInterface: singular

# We run autogen.sh, so we need the autotools
gap/pkg/SingularInterface: autoconf automake libtool
