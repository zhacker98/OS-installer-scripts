#! /bin/bash

######
#
# Quick setup for Portainer
#
######

# VAR
cert_dir="/root/local_certs"

# PRE
cd ${cert_dir}

# Create SSL Certs
openssl genrsa -out portainer.key 2048
openssl ecparam -genkey -name secp384r1 -out portainer.key
openssl req -new -x509 -sha256 -key portainer.key -out portainer.crt -days 3650

# MAIN

# Deploy Portainer
docker volume create portainer_data
docker run -d -p 9443:9000 --name portainer -v /root/local_certs:/certs -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer --ssl --sslcert /certs/portainer.crt --sslkey /certs/portainer.key
