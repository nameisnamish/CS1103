#!/bin/bash

# Script to delete a file
# Usage: ./delete_file.sh <file_name>

# Function to display usage information
usage() {
    echo "Usage: $0 <file_name>"
    exit 1
}

# Check if a file name is provided
if [ "$#" -ne 1 ]; then
    usage
fi

file_name=$1

# Check if the file exists
if [ -f "$file_name" ]; then
    rm "$file_name"
    if [ $? -eq 0 ]; then
        echo "File '$file_name' deleted successfully."
    else
        echo "Error: Could not delete file '$file_name'."
    fi
else
    echo "Error: File '$file_name' does not exist."
fi

