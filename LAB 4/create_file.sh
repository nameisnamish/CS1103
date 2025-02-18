#!/bin/bash

# Script to create a file
# Usage: ./create_file.sh <file_name>

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

# Create the file
touch "$file_name"
if [ $? -eq 0 ]; then
    echo "File '$file_name' created successfully."
else
    echo "Error: Could not create file '$file_name'."
fi

