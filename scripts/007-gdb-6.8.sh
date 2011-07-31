#!/bin/sh
# gdb-6.8.3.sh by Dan Peori (danpeori@oopo.net)

 ## Exit on errors
 set -e

 ## Download the source code.
 wget --continue ftp://ftp.gnu.org/pub/gnu/gdb/gdb-6.8.tar.bz2

 ## Unpack the source code.
 rm -Rf gdb-6.8
 tar xfvj gdb-6.8.tar.bz2

 ## Enter the source directory and patch the source code.
 cd gdb-6.8
 patch -p1 < ../../patches/gdb-6.8-PSP.patch

 ## Create and enter the build directory.
 mkdir build-psp
 cd build-psp

 ## Darwin specific patches.
 if [ `uname -s | grep -o "Darwin"` ]; then
  patch -p1 < ../../patches/gdb-6.8-fix-darwin11.patch
 fi

 ## Configure the build.
 ../configure --prefix="$PSPDEV" --target="psp" --disable-werror --disable-nls

 ## Compile and install.
 make clean
 make -j 2
 make install
 make clean
