#! /bin/bash

#####
#
# Quick install of Minio with TLS
#
# Written by Joel White
#
#####

# VAR


# PRE
mkdir /root/local_certs/minio/
cd /root/local_certs/minio/

openssl genrsa -out private.key 2048
openssl req -new -x509 -days 3650 -key private.key -out public.crt -subj "/C=US/ST=state/L=location/O=organization/CN=domain"


# MAIN

docker run -d -p 9000:443 --name minio -e "MINIO_ACCESS_KEY=3820398GhSn" -e "MINIO_SECRET_KEY=T1m3T0Rid3" \
-v minio_data:/data \
-v minio_config:/root/.minio \
-v /root/local_certs/minio/:/root/.minio/certs \
minio/minio server --address ":443" /data  
