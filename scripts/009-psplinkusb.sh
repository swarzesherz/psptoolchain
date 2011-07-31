#!/bin/sh
# psplinkusb.sh by Dan Peori (danpeori@oopo.net)

 ## Exit on errors
 set -e

 ## Darwin build extras
 if [ `uname -s | grep -o "Darwin"` ]; then
	export CC=gcc-4.2
	wget --continue --no-check-certificate http://sourceforge.net/projects/libusb/files/libusb-compat-0.1/libusb-compat-0.1.3/libusb-compat-0.1.3.tar.bz2/download -O libusb.tar.gz
 	rm -Rf libusb && mkdir libusb && tar --strip-components=1 --directory=libusb -xvzf libusb.tar.gz
	cd libusb
	./configure
	make
	make install
 fi

 ## Download the source code.
 wget --continue --no-check-certificate https://github.com/pspdev/psplinkusb/tarball/master -O psplinkusb.tar.gz

 ## Unpack the source code.
 rm -Rf psplinkusb && mkdir psplinkusb && tar --strip-components=1 --directory=psplinkusb -xvzf psplinkusb.tar.gz

 ## Enter the source directory.
 cd psplinkusb

 ## Build and install.
 make -f Makefile.clients clean
 make -f Makefile.clients
 make -f Makefile.clients install
 make -f Makefile.clients clean

