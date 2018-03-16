#!/bin/sh
#
# printer-install
#
# Installs lpr and cups drivers for Brother MFC-J625DW printer/fax/scanner/copier.
#
#

# Run as root or superuser.
test $( id -u )  -eq 0 || exec sudo $0 "$@"


# Prerequisites
# Mine
# [define variable for directory]
mkdir -p $HOME/printer-install
cd $HOME/printer-install
# Theirs
# [add tests]
mkdir -p /var/spool/lpd
apt-get install -y tcsh

# [check to see if version numbers can be replaced by *]
# These are for x86 and may cause problems on 64-bit machines.
#wget http://www.brother.com/pub/bsc/linux/dlf/mfcj625dwlpr-3.0.1-1.i386.deb
#wget http://www.brother.com/pub/bsc/linux/dlf/mfcj625dwcupswrapper-3.0.0-1.i386.deb

dpkg -i --force-all mfcj625dw*.i386.deb
dpkg -l | grep Brother

# Add user to lpadmin group
# sudo adduser <user> lpadmin

# Modify /etc/rc.local with the line:
# /usr/sbin/cupsd

# [add some kind of test for this]
#sed 's/#\/bin\/sh/#\!\/bin\/sh/' /usr/local/Brother/lpd/psconvertij2

# [remove working directory]
