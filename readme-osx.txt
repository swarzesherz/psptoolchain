## Install MacPorts
Go to http://www.macports.org/install.php and follow the instructions

## Install the required packages.
sudo port install autoconf autogen automake coreutils expat bison flex gmp \ 
gperf guile libiconv libidn libtool libxml2 lzmautils m4 mpfr ncurses ncursesw \
p5-locale-gettext pkgconfig readline texinfo wget zlib perl5 gcc44 libsdl libusb-compat

## Build and install the toolchain + sdk. A login script will automatically 
## be created in /etc/launchd.conf if possible.
sudo ./toolchain-sudo.sh

NOTE: If you do not wish for the toolchain to be installed in /usr/local/pspdev
      then edit toolchain-sudo.sh and change the INSTALLDIR variable.
