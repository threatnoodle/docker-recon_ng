#!/bin/sh

set -x

rc=0
docker build -t recon-ng . ;rc=$?
if [ ${rc} -ne 0 ]; then
    echo
    echo "-----------------------------------------"
    echo
    echo "[FATAL] \"${dir}\" build failed, rc: ${rc}"
    echo
    echo "-----------------------------------------"
    echo
else
    echo
    echo "-----------------------------------------"
    echo
    echo "[INFO]: \"${dir}\" Success; building openvpn"
    echo
    echo "-----------------------------------------"
    echo
    cd vpn/
    docker build -t vpn:latest . ;rc=$?
    echo "[INFO]: vpn:latest -> ${rc}"
fi
