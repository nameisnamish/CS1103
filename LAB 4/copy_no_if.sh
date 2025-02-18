#!/bin/bash

# Script to copy a file
# Usage: ./copy_file.sh <source_file> <destination_file>

# Function to display usage information
usage() {
    echo "Usage: $0 <source_file> <destination_file>"
    exit 1
}

# Check if both source and destination files are provided
[ "$#" -ne 2 ] && usage

source_file=$1
destination_file=$2

# Perform the copy and handle success or failure without using if
[ -f "$source_file" ] && cp "$source_file" "$destination_file" && echo "File '$source_file' copied to '$destination_file' successfully." || echo "Error: Could not copy file '$source_file' to '$destination_file'."

