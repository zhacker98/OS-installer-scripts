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
apt-get install -y -q ipmitool ipmiutil

modprobe ipmi_si
modprobe ipmi_devintf
modprobe ipmi_msghandler
