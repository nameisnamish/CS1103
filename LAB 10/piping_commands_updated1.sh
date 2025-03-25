#!/bin/bash
# Shell Script for Piping Commands
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

# Function to search for a file or folder
search_file_or_folder() {
	read -p "Enter a keyword to search for files or folders: " keyword
	echo "Searching for files or folders containing '$keyword'..."
	# Use find to search for files or directories containing the keyword
	find . -name "*$keyword*" -print | sort
	echo ""
}

# Function to print the number of files and folders
count_files_and_folders() {
    echo "Counting the number of files and folders in the current directory..."
    # Use `find` to count files and directories, excluding the hidden ones
    file_count=$(find . -type f | wc -l)
    folder_count=$(find . -type d | wc -l)
    echo "Number of files: $file_count"
    echo "Number of folders: $folder_count"
    echo ""
}

# Main menu for user interaction
echo "Piping Commands Manager"
echo "1. List contents of the current directory"
echo "2. Filter and sort directory contents"
echo "3. Search a file or folder"
echo "4. Number of files and folders"
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
		search_file_or_folder
		;;
		4) # Count files and folders
        	count_files_and_folders
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

