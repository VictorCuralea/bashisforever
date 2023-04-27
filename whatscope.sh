#!/bin/bash
# This script extracts lines from FileB that contain domain names from FileA

# Check that the correct number of parameters were provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <FileA> <FileB> <FileC>"
    exit 1
fi

# Read the domain names from FileA into an array
readarray -t domains < "$1"

# Construct a regular expression that matches any of the domains in FileA
regex=$(printf "|%s" "${domains[@]}")
regex=${regex:1}  # Remove the leading pipe character

# Use grep to extract lines from FileB that contain domain names from FileA,
# and save the results to FileC
grep -E "$regex" "$2" > "$3"
