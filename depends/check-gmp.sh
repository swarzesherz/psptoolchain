#!/bin/sh
# check-gmp.sh by Dan Peori (danpeori@oopo.net)

 ## Check for the gmp library.
 if [ `uname -s | grep -o "Darwin"` ]; then
  ls /opt/local/include/gmp.h 1> /dev/null || { echo "ERROR: Install gmp via MacPorts before continuing."; exit 1; }
 else
  ls /usr/include/gmp.h 1> /dev/null || { echo "ERROR: Install gmp before continuing."; exit 1; }
 fi
