#!/bin/bash

# Arguments
TABLE=$1
COLUMN=$2
URL="http://34.68.72.199/Project.php"

# Log file path
LOG_FILE="/home/gre13wal/Project/logs/changes.log"


# Function to log activity
log_activity() {
    echo "$(date): $1" >> $LOG_FILE
}

# Function to get the latest update time
get_latest_update_time() {
	bash /home/gre13wal/Project/sql_conn.sh "SELECT MAX($COLUMN) FROM $TABLE"
}

# Initialize the last known update time
if [ ! -f "/home/gre13wal/Project/Updates/last_update_${TABLE}_${COLUMN}.txt" ]; then
    echo "1970-01-01T00:00:00" > "/home/gre13wal/Project/Updates/last_update_${TABLE}_${COLUMN}.txt"
fi
last_update=$(cat "/home/gre13wal/Project/Updates/last_update_${TABLE}_${COLUMN}.txt")

# Check for updates
latest_update=$(get_latest_update_time)
if [ -z "$latest_update" ]; then
    log_activity "Failed to retrieve latest update time from ${TABLE}."
    exit 1
else 
    log_activity "Successful retrieval of latest update from ${TABLE}."
fi

# Compare and send notification if updated
if [ "$latest_update" != "$last_update" ]; then
    	echo "$(date): Table '$TABLE' was updated within the interval." >> "/var/www/html/messages.txt"
   	echo "$latest_update" > "/home/gre13wal/Project/Updates/last_update_${TABLE}_${COLUMN}.txt"
else
	echo "$(date): Table '$TABLE' was not updated!." >> "/var/www/html/messages.txt"
    
fi

