#!/bin/bash
#execute the script with the log directory and directory where you want to archive the logs
#./logs.sh /var/log /tmp - is an example
#This script will archive all the log files in the specified directory and remove the original log files

# Define variables
LOG_DIR=$1
ARCHIVE_DIR=$2
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Create archive directory if it doesn't exist
mkdir -p $ARCHIVE_DIR

# Check if the archive directory exists
if [ -d "$ARCHIVE_DIR" ]; then
    echo "Archive directory already exists."
else
    echo "Creating archive directory."
    mkdir -p $ARCHIVE_DIR
fi

# Archive logs
tar -czf $ARCHIVE_DIR/logs_archieve_$TIMESTAMP.tar.gz $LOG_DIR/*.log

# Remove original log files
rm $LOG_DIR/*.log

echo "Logs have been archived and original files removed."

