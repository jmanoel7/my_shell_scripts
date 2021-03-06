#!/bin/bash

[ -z "$codename" ] && codename="$(lsb_release -cs)"
[ -z "$distname" ] && distname="$(lsb_release -is)"

march="$(arch)"
if [ "$march" = "x86_64" ]; then
    march="amd64"
elif [ "$march" = "i686" -o "$march" = "i586" -o "$march" = "i486" -o "$march" = "i386" ]; then
    march="i386"
else
    echo -en "\a\n\tSorry, but virtualbox is not available for architecture $march\n\n"
    exit 1
fi

a="$(echo $1 | cut -d '.' -f 1)"
b="$(echo $1 | cut -d '.' -f 2)"

mkdir -p ~/src/virtualbox/
cd ~/src/virtualbox/
wget -c "http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc"
wget -c "http://download.virtualbox.org/virtualbox/${1}/MD5SUMS"
wget -c "http://download.virtualbox.org/virtualbox/${1}/Oracle_VM_VirtualBox_Extension_Pack-${1}-${2}.vbox-extpack"
wget -c "http://download.virtualbox.org/virtualbox/${1}/SDKRef.pdf"
wget -c "http://download.virtualbox.org/virtualbox/${1}/UserManual.pdf"
wget -c "http://download.virtualbox.org/virtualbox/${1}/VBoxGuestAdditions_${1}.iso"
wget -c "http://download.virtualbox.org/virtualbox/${1}/VirtualBoxSDK-${1}-${2}.zip"
wget -c "http://download.virtualbox.org/virtualbox/${1}/virtualbox-${a}.${b}_${1}-${2}~${distname}~${codename}_${march}.deb"

exit 0
