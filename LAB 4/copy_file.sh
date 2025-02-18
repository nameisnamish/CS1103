#!/bin/bash

# Script to copy a file
# Usage: ./copy_file.sh <source_file> <destination_file>

# Function to display usage information
usage() {
    echo "Usage: $0 <source_file> <destination_file>"
    exit 1
}

# Check if both source and destination files are provided
if [ "$#" -ne 2 ]; then
    usage
fi

source_file=$1
destination_file=$2

# Check if the source file exists
if [ -f "$source_file" ]; then
    cp "$source_file" "$destination_file"
    if [ $? -eq 0 ]; then
        echo "File '$source_file' copied to '$destination_file' successfully."
    else
        echo "Error: Could not copy file '$source_file' to '$destination_file'."
    fi
else
    echo "Error: Source file '$source_file' does not exist."
fi

