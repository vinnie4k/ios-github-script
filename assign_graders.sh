#!/bin/bash

# Import environment variables and activate virtual environment
direnv allow
eval "$(direnv export bash)"
. venv/bin/activate

# First argument is the file name of student netids
# Second is the assignment number
# Third is the grader's netid
FILENAME=$1
ASSIGNMENT=$2
GRADER=$3

while IFS= read -r line; do
    echo "Assigning $GRADER to $line-$ASSIGNMENT"
    python3 src/assign_graders.py $line $ASSIGNMENT $GRADER
done < $FILENAME
    echo "Completed."