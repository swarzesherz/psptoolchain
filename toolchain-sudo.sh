#!/bin/bash
# toolchain-sudo.sh by Dan Peori (danpeori@oopo.net)
 
 INSTALLDIR=/usr/local/pspdev
 
 ## Enter the psptoolchain directory.
 cd "`dirname $0`" || { echo "ERROR: Could not enter the psptoolchain directory."; exit 1; }

 ## Set up the environment.
 export PSPDEV=$INSTALLDIR
 export PATH=$PATH:$PSPDEV/bin

 if [ `uname -s | grep -o "Darwin"` ]; then
  if test -e "/opt/local/bin/port"; then
   export CC=gcc-mp-4.4
   export C_INCLUDE_PATH=/opt/local/include
   export CPLUS_INCLUDE_PATH=/opt/local/include
   export LIBRARY_PATH=/opt/local/lib
  else
   echo "ERROR: Install MacPorts before continuing.";
   exit 1;
  fi
 fi

 ## Run the toolchain script.
 ./toolchain.sh $@ || { echo "ERROR: Could not run the toolchain script."; exit 1; }
