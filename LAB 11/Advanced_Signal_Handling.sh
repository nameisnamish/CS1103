#!/bin/bash

# Shell Script for Advanced Signal Handling
# Usage: ./advanced_signal_handling.sh

# Log file to store signal handling messages
LOG_FILE="signal_handling.log"

# Custom signal handler function for SIGINT (Ctrl+C)
handle_sigint() {
	echo "SIGINT (Ctrl+C) received! Cleaning up..."
	echo "$(date): SIGINT received, exiting gracefully." >> "$LOG_FILE"
	exit 0
}

# Custom signal handler function for SIGTERM
handle_sigterm() {
	echo "SIGTERM signal received! Terminating..."
	echo "$(date): SIGTERM received, exiting gracefully." >> "$LOG_FILE"
	exit 0
}

# Custom signal handler function for SIGHUP
handle_sighup() {
	echo "SIGHUP signal received! Reloading configuration..."
	echo "$(date): SIGHUP received, reloading configuration." >> "$LOG_FILE"
}

# Trap multiple signals and link them to their respective handlers
trap 'handle_sigint' SIGINT
trap 'handle_sigterm' SIGTERM
trap 'handle_sighup' SIGHUP

# Main loop
echo "Running... Press Ctrl+C to trigger SIGINT, or send SIGTERM (kill) to terminate."

# Infinite loop to keep the script running
while true; do
	# Simulating some ongoing process
	echo "Working... (Press Ctrl+C to stop, or send SIGTERM to terminate)"
	sleep 2
done
