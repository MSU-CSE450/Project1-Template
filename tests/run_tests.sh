#!/bin/bash

# Initialize a counter for differing files
pass_count=0
fail_count=0
test_count=29
ec_count=5

# Loop through all the file pairs
for i in $(seq -w 01 $test_count); do
    # Set the file names
    code_file="test-${i}.mc"
    expected_file="expected/output-${i}.txt"
    out_file="current/output-${i}.txt"

    # Generate the output file for Project1
    if [[ -f "../Project1" && -f "$code_file" ]]; then
        ../Project1 "$code_file" > "$out_file"
    else
        echo "Executable ../Project1 or code file $code_file does not exist."
        continue
    fi

    # Make sure files exist
    if [[ -f "$expected_file" && -f "$out_file" ]]; then
        # Compare the files
        if ! diff -q "$expected_file" "$out_file" > /dev/null; then
            echo "Test $i ... Failed.  Files $expected_file and $out_file differ."
            ((fail_count++))
        else
            echo "Test $i ... Passed!"
            ((pass_count++))
            # echo "Files $expected_file and $out_file are the same."
        fi
    else
        echo "One of the files $expected_file or $out_file does not exist."
    fi
done

# Report the final count of differing files
echo "Passed $pass_count of $test_count tests (Failed $fail_count)"
