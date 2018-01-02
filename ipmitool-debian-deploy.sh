#! /bin/bash

######
#
# A Script to install ipmitool on Debian
#
#   Written by Joel E White
#
######

# VAR


# PRE


# MAIN

#Installing ipmitool and ipmiutil
apt-get install -y -q ipmitool ipmiutil

#Loading Kernel Modules
modprobe ipmi_si
modprobe ipmi_devintf
modprobe ipmi_msghandler

echo 'Checking local ipmi'
ipmitool sdr
echo
ipmitool fru
echo '------'
ipmiutil health
