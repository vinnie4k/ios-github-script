#!/bin/bash

# First argument is the NetID, Second is the assignment number
create_repo () {
    REPO_NAME="$1-$2"
    DIRECTORY_PATH="$2/$REPO_NAME"
    ORG_NAME="${ORG_NAME}"

    echo "Copying the template in $DIRECTORY_PATH..."
    cp -a ./templates/$2 $DIRECTORY_PATH

    echo "Executing the Python script..."
    python3 src/create_repo.py $1 $2
    cd $DIRECTORY_PATH
    rm .git

    echo "Pushing to remote repository..."
    git init
    git add .
    git commit -m "Starter Code"
    git branch -M main
    git remote add origin git@github.coecis.cornell.edu:$ORG_NAME/$REPO_NAME.git
    git push -u origin main

    cd ..
    cd ..
}

# Import environment variables and activate virtual environment
direnv allow
eval "$(direnv export bash)"
. venv/bin/activate

FILENAME=$1
ASSIGNMENT=$2
mkdir $ASSIGNMENT
while IFS= read -r line; do
    echo "Creating $ASSIGNMENT repository for $line"
    create_repo $line $ASSIGNMENT
done < $FILENAME
    echo "Completed."