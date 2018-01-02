#! /bin/bash

# VAR
Basedir="$(pwd)"
Logdir="${Basedir}/kvm_debian_logs"
Logfile="${Logdir}/$(date +%Y-%m-%d)-kvm_debian_log"

# PRE
mkdir -p ${Logdir}
touch ${Logfile}

# MAIN
#Install QEMU, KVM, LIBVIRT, VIRT-MANAGER
apt-get install -y -q qemu-system-x86 libvirt-clients libvirt-daemon virt-manager

#Load Kernel Modules
modprobe kvm_intel 
modprobe kvm_amd

#Check local KVM via virsh
echo 'Checking KVM with virsh'
virsh list


