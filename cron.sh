#!/bin/bash

# Check for correct number of arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <table_name> <column_name> <interval_in_minutes>"
    exit 1
fi

TABLE_NAME=$1
COLUMN_NAME=$2
INTERVAL=$3

# Update the cron job
(crontab -l 2>/dev/null; echo "*/$INTERVAL * * * * bash /home/gre13wal/Project/changes.sh $TABLE_NAME $COLUMN_NAME >> /home/gre13wal/Project/logs/cron.log 2>&1") | crontab -

echo "Cron job updated for table $TABLE_NAME, checking every $INTERVAL minutes."

