#!/bin/bash

# Import environment variables and activate virtual environment
direnv allow
eval "$(direnv export bash)"
. venv/bin/activate

# First argument is the file name of student netids
FILENAME=$1
while IFS= read -r line; do
    echo "Adding $line to the organization"
    python3 src/add_member.py $line
done < $FILENAME
    echo "Completed."