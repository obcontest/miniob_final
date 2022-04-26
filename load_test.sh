#!/bin/bash

function load_data {
    desc_ret=$(echo "desc "$1";" | ./cmake-build-debug/bin/obclient)
    if [[ $desc_ret == *"No such table: $1"* ]]; then
        echo "table not exists"
    else
        echo "drop table "$1"; " | ./cmake-build-debug/bin/obclient
    fi
    input_file="test/test_load/$1"

    cat $input_file | ./cmake-build-debug/bin/obclient
    echo ""
    echo "load done!"
}

load_data "$1"
./cmake-build-debug/bin/obclient