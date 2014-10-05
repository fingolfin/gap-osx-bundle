PACKAGE := 4ti2
VERSION := 1.6.2
ARCHIVE := "$(PACKAGE)-$(VERSION).tar.gz"
DIRNAME := "$(PACKAGE)-$(VERSION)"
URL     := "http://www.4ti2.de/version_$(VERSION)/$(ARCHIVE)"
MD5     := "b4c10243725aa964c041453058e15942"

include ../common.mk

# TODO: add a GLPK package and let 4ti2 use that.

# TODO: fix gmpxx detection
# configure:22480: result: yes
# configure:22483: checking whether GMP was compiled with --enable-cxx
# configure:22497: g++ -o conftest -O3 -Wall -std=c++0x  -isystem /Users/mhorn/Projekte/GAP/OSX-distro/gap-osx-bundle/GAP.app/Contents/Resources/include -L/Users/mhorn/Projekte/GAP/OSX-distro/gap-osx-bundle/GAP.app/Contents/Resources/lib -Wl,-rpath,/Users/mhorn/Projekte/GAP/OSX-distro/gap-osx-bundle/GAP.app/Contents/Resources conftest.cpp  -lgmp >&5
# In file included from conftest.cpp:73:
# /Users/mhorn/Projekte/GAP/OSX-distro/gap-osx-bundle/GAP.app/Contents/Resources/include/gmpxx.h:66:10: fatal error: 'type_traits' file not found
# #include <type_traits> // for common_type
#          ^
# 1 error generated.
# configure:22497: $? = 1
# configure: program exited with status 1
# configure: failed program was:
# | /* confdefs.h */
# | #define PACKAGE_NAME "4ti2"
# | #define PACKAGE_TARNAME "4ti2"
# | #define PACKAGE_VERSION "1.6.2"
# | #define PACKAGE_STRING "4ti2 1.6.2"
# | #define PACKAGE_BUGREPORT ""
# | #define PACKAGE_URL ""
# | #define PACKAGE "4ti2"
# | #define VERSION "1.6.2"
# | #define STDC_HEADERS 1
# | #define HAVE_SYS_TYPES_H 1
# | #define HAVE_SYS_STAT_H 1
# | #define HAVE_STDLIB_H 1
# | #define HAVE_STRING_H 1
# | #define HAVE_MEMORY_H 1
# | #define HAVE_STRINGS_H 1
# | #define HAVE_INTTYPES_H 1
# | #define HAVE_STDINT_H 1
# | #define HAVE_UNISTD_H 1
# | #define __EXTENSIONS__ 1
# | #define _ALL_SOURCE 1
# | #define _DARWIN_C_SOURCE 1
# | #define _GNU_SOURCE 1
# | #define _POSIX_PTHREAD_SEMANTICS 1
# | #define _TANDEM_SOURCE 1
# | #define HAVE_GETOPT_H 1
# | #define HAVE_UNISTD_H 1
# | #define HAVE_GETOPT_H 1
# | #define HAVE_GETOPT_LONG_ONLY 1
# | #define __GETOPT_PREFIX rpl_
# | #define HAVE_DECL_GETENV 1
# | #define HAVE_WCHAR_T 1
# | #define GNULIB_TEST_GETOPT_GNU 1
# | #define __GETOPT_PREFIX rpl_
# | #define HAVE_RAW_DECL_CHDIR 1
# | #define HAVE_RAW_DECL_CHOWN 1
# | #define HAVE_RAW_DECL_DUP 1
# | #define HAVE_RAW_DECL_DUP2 1
# | #define HAVE_RAW_DECL_FCHDIR 1
# | #define HAVE_RAW_DECL_FSYNC 1
# | #define HAVE_RAW_DECL_FTRUNCATE 1
# | #define HAVE_RAW_DECL_GETCWD 1
# | #define HAVE_RAW_DECL_GETDOMAINNAME 1
# | #define HAVE_RAW_DECL_GETDTABLESIZE 1
# | #define HAVE_RAW_DECL_GETGROUPS 1
# | #define HAVE_RAW_DECL_GETHOSTNAME 1
# | #define HAVE_RAW_DECL_GETLOGIN 1
# | #define HAVE_RAW_DECL_GETLOGIN_R 1
# | #define HAVE_RAW_DECL_GETPAGESIZE 1
# | #define HAVE_RAW_DECL_GETUSERSHELL 1
# | #define HAVE_RAW_DECL_SETUSERSHELL 1
# | #define HAVE_RAW_DECL_ENDUSERSHELL 1
# | #define HAVE_RAW_DECL_ISATTY 1
# | #define HAVE_RAW_DECL_LCHOWN 1
# | #define HAVE_RAW_DECL_LINK 1
# | #define HAVE_RAW_DECL_LSEEK 1
# | #define HAVE_RAW_DECL_PIPE 1
# | #define HAVE_RAW_DECL_PREAD 1
# | #define HAVE_RAW_DECL_PWRITE 1
# | #define HAVE_RAW_DECL_READLINK 1
# | #define HAVE_RAW_DECL_RMDIR 1
# | #define HAVE_RAW_DECL_SETHOSTNAME 1
# | #define HAVE_RAW_DECL_SLEEP 1
# | #define HAVE_RAW_DECL_SYMLINK 1
# | #define HAVE_RAW_DECL_TTYNAME_R 1
# | #define HAVE_RAW_DECL_UNLINK 1
# | #define HAVE_RAW_DECL_USLEEP 1
# | #define HAVE_TRAPV_INT 1
# | #define HAVE_DLFCN_H 1
# | #define LT_OBJDIR ".libs/"
# | #define HAVE_GMP 1
# | /* end confdefs.h.  */
# | #include <gmpxx.h>
# | 					int main () { mpz_class a(2),b(3),c(5); if ( a+b == c ) return 0; else return -1; }
# | 
# configure:22508: result: no
# configure:22591: WARNING: Unable to use the GNU MP C++ library.
