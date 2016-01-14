#!/usr/bin/env bash

set -x
set -e

build=( . vpn/ )

for dir in ${build[@]}; do
    rc=0
    docker build -t ${dir} . ;rc=$?

    if [[ ${rc} -ne 0 ]]; then
        echo
        echo "[FATAL] \"${dir}\" build failed, rc: ${rc}"
        echo
        echo "-----------------------------------------"
        uname -a   2>&1
        env        2>&1
        ps auxwwww 2>&1
        lsmod      2>&1
        dmesg      2>&1
        df         2>&1
        free       2>&1
        echo "-----------------------------------------"
        echo
    else
        echo
        echo "[INFO]: \"${dir}\" Success"
        echo
    fi
done

