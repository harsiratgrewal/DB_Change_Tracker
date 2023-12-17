#!/bin/bash

# Backup directories
backup_dirs="/home/gre13wal/Project/Updates /home/gre13wal/Project/logs"

# Backup destination
backup_dest="/usr/local/CSI3660ProjectBackup"

# Backup file name with date
backup_file="$backup_dest/backup_$(date +%Y_%m_%d).tar.gz"

# Create a compressed tar archive
tar -czf "$backup_file" $backup_dirs

# Print completion message
echo "Backup completed: $backup_file"

