#! /bin/bash

# A Script written by Joel E White
# Following these instructions
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/

#VARIABLES
base_dir=$(pwd)
log_dir=${base_dir}/docker_deploy_ubuntu-logs
log_file=${log_dir}/$(date +%Y-%m-%d_%H:%M)-docker_deploy_ubuntu-log

# PRELIMINARY
mkdir -p ${log_dir}
touch ${log_file}

# Remove old docker stuff
sudo apt-get remove -y -q docker docker-engine docker.io

if [[ $(cat /etc/issue|cut -d " " -f 2) = "14.04" ]]; then
  sudo apt-get update
  sudo apt-get install -y -q \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
fi

# Update and Install prereq's
sudo apt-get update

sudo apt-get install -y -q \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Install Key for Docker Repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker Repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker.CE
sudo apt-get update

# Pick a version
echo 'Pick a version of Docker to Install' | tee ${log_file}
apt-cache madison docker-ce | tee ${log_file}

# apt-get install -y -q docker-ce=
echo "RUN THE FOLLOWING TO INSTALL DOCKER"
echo "sudo apt-get install -y -q docker-ce=<version>"
