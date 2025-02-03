#!/bin/bash
# Start a background task (using sleep to simulate a long-running task)
echo "Starting a background task..."
sleep 300 & # Run for 5 minutes in the background
task_pid=$! # Capture the PID of the background task
echo "Background task started with PID: $task_pid"

# Display the jobs running in the background
echo -e "\nListing jobs:"
jobs

# Check if the process is running using ps
echo -e "\nChecking if the task is running..."
ps -p $task_pid

# Pausing the background task
echo -e "\nPausing the background task..."
kill -STOP $task_pid

# Verifying if the task is paused (status should be T - stopped)
echo -e "\nChecking task status after pausing (should be stopped):"
ps -o pid,stat,cmd -p $task_pid # Should show T (stopped) in the status

# **Exercise 2 part:**
# The "T" status indicates the process is paused (stopped). It's a temporary state caused by sending the STOP signal.

# Resuming the background task
echo -e "\nResuming the background task..."
kill -CONT $task_pid

# Verifying if the task is resumed (status should be R - running)
echo -e "\nChecking task status after resuming (should be running):"
ps -o pid,stat,cmd -p $task_pid # Should show R (running) in the status

# **Exercise 2 part:**
# The "R" status indicates the process is running again after the CONT signal was sent.

# Killing the background task
echo -e "\nKilling the background task..."
kill $task_pid

# Confirming the task has been terminated
echo -e "\nChecking task status after termination (should not exist):"
ps -p $task_pid && echo "Process still exists." || echo "Process terminated."

