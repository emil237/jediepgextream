#!/bin/bash

# SCRIPT : DOWNLOAD AND INSTALL jediepgextream #

##setup command=wget https://raw.githubusercontent.com/emil237/jediepgextream/main/installer.sh -O - | /bin/sh
#
echo " download and install plugin jediepgextream "
################################################################################
version=2.07
MY_URL="https://raw.githubusercontent.com/emiln237/jediepgextream/main" 
TEMPATH=/tmp
OPKGINSTALL="opkg install --force-overwrite"
MY_IPK="enigma2-plugin-extensions-jediepgxtream_2.07_all.ipk"

MY_DEB="enigma2-plugin-extensions-jediepgxtream_2.07_all.deb"
####################################################
if [ -f /etc/apt/apt.conf ] ; then
    STATUS='/var/lib/dpkg/status'
    OS='DreamOS'
elif [ -f /etc/opkg/opkg.conf ] ; then
   STATUS='/var/lib/opkg/status'
   OS='Opensource'
fi

# remove old version #
rm -r /usr/lib/enigma2/python/Plugins/Extensions/JediEPGXtream

echo ""
# Download and install plugin
cd /tmp
set -e
 if which dpkg > /dev/null 2>&1; then
  wget "https://github.com/emil237/jediepgextream/raw/main/enigma2-plugin-extensions-jediepgxtream_2.07_all.deb"
		dpkg -i --force-overwrite enigma2-plugin-extensions-jediepgxtream_2.07_all.deb; apt-get install -f -y
wait
rm -f enigma2-plugin-extensions-jediepgxtream_2.07_all.deb
	else
  wget "https://github.com/emil237/jediepgextream/raw/main/enigma2-plugin-extensions-jediepgxtream_2.07_all.ipk"
  wait
opkg install --force-overwrite enigma2-plugin-extensions-jediepgxtream_2.07_all.ipk
wait
rm -f enigma2-plugin-extensions-jediepgxtream_2.07_all.ipk
	fi
echo "================================="
set +e
cd ..
wait
	if [ $? -eq 0 ]; then
echo ">>>>  SUCCESSFULLY INSTALLED <<<<"
fi
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 4;
		echo "#                Restart Enigma2 GUI                    #"
echo "#########################################################"
sleep 2
if [ $OS = 'DreamOS' ]; then
    systemctl restart enigma2
else
    killall -9 enigma2
fi
exit 0




