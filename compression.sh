#!/bin/bash

table_size="300w"

if [ $# -eq 1 ]; then
    table_size="$1"
fi

echo "create table t1 (c1 int, c2 int, c3 int, v1 char, v2 char, v3 char, v4 char, v5 char, v6 char, v7 char, v8 char, v9 char);" | ./cmake-build-debug/bin/obclient
echo "load data infile '$PWD/data/miniob-${table_size}-v2.table' into table t1;" | ./cmake-build-debug/bin/obclient