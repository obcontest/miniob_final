#!/usr/bin/env bash
if [[ "$1" == "gdb"  ]]; then
    echo "running in debug mode $1"
      GDB="gdb --args"
    else
        GDB=""
fi
$GDB rm -rf miniob/db/sys/*
$GDB ./cmake-build-debug/bin/observer -f ./etc/observer.ini
