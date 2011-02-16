#!/bin/sh

if [ \! -f build/version ]; then
    echo 'Must run the clean script from the top-level dir of the libarchive distribution' 1>&2
    exit 1
fi

#
# The automake-generated 'maintainer-clean' target does clean up a
# lot.  If that fails, try plain 'clean' in case we're using the cmake
# or other makefile.  But don't worry if we can't...
#
if [ -e Makefile ]; then
	make maintainer-clean || make clean || true
fi

# If we're on BSD, blow away the build dir under /usr/obj
rm -rf /usr/obj`pwd`

#
# Try to clean up a bit more...
#

find . -name '*.So' | xargs rm -f
find . -name '*.a' | xargs rm -f
find . -name '*.la' | xargs rm -f
find . -name '*.lo' | xargs rm -f
find . -name '*.o' | xargs rm -f
find . -name '*.orig' | xargs rm -f
find . -name '*.po' | xargs rm -f
find . -name '*.rej' | xargs rm -f
find . -name '*~' | xargs rm -f
find . -name '.depend' | xargs rm -f
find . -name '.deps' | xargs rm -rf
find . -name '.dirstamp' | xargs rm -f
find . -name '.libs' | xargs rm -rf

rm -rf autom4te.cache

rm -f Makefile.in
rm -f aclocal.m4
rm -f bsdcpio
rm -f bsdcpio_test
rm -f bsdtar
rm -f bsdtar_test
rm -f build/autoconf/compile
rm -f build/autoconf/config.*
rm -f build/autoconf/depcomp
rm -f build/autoconf/install-sh
rm -f build/autoconf/libtool.m4
rm -f build/autoconf/ltmain.sh
rm -f build/autoconf/ltoptions.m4
rm -f build/autoconf/ltsugar.m4
rm -f build/autoconf/ltversion.m4
rm -f build/autoconf/lt~obsolete.m4
rm -f build/autoconf/missing
rm -f build/pkgconfig/libarchive.pc
rm -f build/version.old
rm -f config.h
rm -f config.h.in
rm -f config.log
rm -f config.status
rm -f configure
rm -f cpio/*.1.gz
rm -f cpio/bsdcpio
rm -f cpio/test/bsdcpio_test
rm -f cpio/test/list.h
rm -f doc/html/*
rm -f doc/man/*
rm -f doc/pdf/*
rm -f doc/text/*
rm -f doc/wiki/*
rm -f libarchive/*.[35].gz
rm -f libarchive/libarchive.so*
rm -f libarchive/test/libarchive_test
rm -f libarchive/test/list.h
rm -f libarchive_test
rm -f libtool
rm -f stamp-h1
rm -f tar/*.1.gz
rm -f tar/bsdtar
rm -f tar/test/bsdtar_test
rm -f tar/test/list.h
