#!/bin/bash
source ~/.bash_profile


SERVER=""
DATABASE=""
USERNAME=""
PASSWORD=""
QUERY="$1"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 'QUERY'"
    exit 1
fi

QUERY="$1"
/opt/mssql-tools/bin/sqlcmd -S $SERVER -U $USERNAME -P $PASSWORD -d $DATABASE -Q "$QUERY"
