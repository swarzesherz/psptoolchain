#!/bin/sh
# check-mpfr.sh by Dan Peori (danpeori@oopo.net)

 ## Check for the mpfr library.
 if [ `uname -s | grep -o "Darwin"` ]; then
  ls /opt/local/include/mpfr.h 1> /dev/null || { echo "ERROR: Install mpfr via MacPorts before continuing."; exit 1; }
 else
  ls /usr/include/mpfr.h 1> /dev/null || { echo "ERROR: Install mpfr before continuing."; exit 1; }
 fi
