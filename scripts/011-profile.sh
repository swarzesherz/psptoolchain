#!/bin/sh

set -e

if [ `uname -s | grep -o "Darwin"` ]; then
	HAVE_PSPDEV_ENV=`eval cat /etc/launchd.conf | sed -n 's/setenv\ PSPDEV\ //p'`
	if [ $HAVE_PSPDEV_ENV ]; then
		echo "PSPDEV env SET"
	else
		echo "setenv PSPDEV $PSPDEV" >> /etc/launchd.conf
		export PSPSDK=$PSPDEV/psp/sdk
		echo "setenv PSPSDK $PSPSDK" >> /etc/launchd.conf
		echo "setenv PATH $PATH:$PSPDEV/bin:$PSPSDK/bin" >> /etc/launchd.conf
		echo "PSPDEV env SET on Reboot"
	fi
else
	if [ -d /etc/profile.d/ ] && [ "$(id -u)" -eq "0" ];
	then
		echo "export PSPDEV=$PSPDEV" > /etc/profile.d/psptoolchain.sh
		echo "export PATH=\$PATH:\$PSPDEV/bin" >> /etc/profile.d/psptoolchain.sh
		echo "$PSPDEV/bin added to your systems login scripts!"
	else
		echo "Remember to add $PSPDEV/bin to your path..."
	fi
fi
