#!/bin/bash

#Shell Script for Piping Commands
# Usage: ./piping_commands.sh

# Function to display the contents of the current directory
list_directory_contents() {
	echo "Listing contents of the current directory:"
	ls -l
	echo ""
}

# Function to filter and sort directory contents
filter_and_sort_contents() {
	read -p "Enter a pattern to filter files (e.g., .txt for text files): " pattern
	echo "Filtering and sorting files with pattern '$pattern'..."
	# Use ls, grep, and sort in a pipeline
	ls -l | grep "$pattern" | sort
	echo ""
}

# Function to search a file or folder
search_file_folder() {
    read -p "Enter a name of the file or folder: " name
    echo "Searching for the file or folder with name '$name'..."
    # Use ls and grep in a pipeline, checking for results
    result=$(ls -l | grep "$name")
    if [[ -n "$result" ]]; then
        echo "$result"
    else
        echo "No such file or folder found."
    fi
    echo ""
}

# Function to print the number of files and folders
number_of_files_folders() {
    echo "Counting files and directories..."
    # Use ls and wc to count files and directories
    num_files=$(ls -l | grep -v ^d | wc -l) # Count files
    num_dirs=$(ls -l | grep ^d | wc -l)     # Count directories
    echo "Number of files: $num_files"
    echo "Number of directories: $num_dirs"
    echo ""
}

# Main menu for user interaction
echo "Piping Commands Manager"
echo "1. List contents of the current directory"
echo "2. Filter and sort directory contents"
echo "3. Search a file or folder"
echo "4. Print the number of files and directories"
echo "5. Exit"

# Loop until the user chooses to exit
while true; do
	read -p "Select an option (1-5): " option
	
	case $option in
		1) # List directory contents
		list_directory_contents
		;;
		2) # Filter and sort directory contents
		filter_and_sort_contents
		;;
		3) # Search a file or folder
		search_file_folder
		;;
		4) # Print the number of files and folders
		number_of_files_folders
		;;
		5) # Exit the script
		echo "Exiting the Piping Commands Manager. Goodbye!"
		exit 0
		;;
		*) # Invalid option
		echo "Invalid option. Please select 1-5."
		;;
	esac
	echo "" # Print a newline for better readability
done
