#!/bin/bash

function run_single_test {
    input_file="test/test_case/$1/$2"
    output_file="test/test_out/$1/$2"
    ans="test/test_ans/$1/$2"
    diff_dir="diff"

    if [[ ! -d "test/test_out/$1" ]]; then
        echo "create dir out test/test_out/$1"
        mkdir -p "test/test_out/$1"
    fi

    cat $input_file | ./cmake-build-debug/bin/obclient > $output_file
    sed -i 's/^miniob\ >\ //' $output_file
    
    a=$(diff $output_file $ans)
    if [ $(echo $a | wc -w) -gt 0 ]
    then
	    echo "$1/$2:FAILURE"
        cat $output_file > $1.$2.output
	    cat $ans > $1.$2.ans
    else
	    echo "$1/$2:SUCCESS"
    fi
}

function run_test {    
for file in ` ls test/test_case/$1 `
do
    run_single_test "$1" "$file"
done
}

if [ $# -eq 1 ]; then 
    if [[ "$1" == "all"  ]]; then
        for dir in `ls test/test_case`
        do
            run_test "$dir"
        done
    else 
        run_test "$1"
    fi
else
    run_single_test "$1" "$2"
fi
