#!/bin/bash

# Your local folder to sync with the remote server
LOCAL_FOLDER="/Users/john/local_folder_to_sync/" 

# Your test environment
TEST_SERVER_URL="test.myserver.com"
TEST_SERVER_LOGIN="testlogin"
TEST_SERVER_PATH="/path_on_test_server/"
TEST_SSH_KEY_PATH="/Users/john/.ssh/id_dsa"

# Your production environment
PROD_SERVER_URL="prod.myserver.com"
PROD_SERVER_LOGIN="prodlogin"
PROD_SERVER_PATH="/path_on_production_server/"
PROD_SSH_KEY_PATH="/Users/john/.ssh/id_dsa"

# Just to be sure an environment was given by the user
if [ "$1" != "production" -a "$1" != "test" ]; then
	echo "Please enter the name of the environment you want to deploy to (production or test)"
	exit
fi

if [ "$1" = "test" ]; then
	SERVER_URL=$TEST_SERVER_URL
	LOGIN=$TEST_SERVER_LOGIN
	SERVER_PATH=$TEST_SERVER_PATH
	SSH_KEY_PATH=$TEST_SSH_KEY_PATH
fi

if [ "$1" == "production" ]; then
	SERVER_URL=$PROD_SERVER_URL
	LOGIN=$PROD_SERVER_LOGIN
	SERVER_PATH=$PROD_SERVER_PATH
	SSH_KEY_PATH=$PROD_SSH_KEY_PATH
fi

echo "The deployment will start shortly on "$1" environment"

rsync -avz --progress -e "ssh -i $SSH_KEY_PATH" $LOCAL_FOLDER $LOGIN"@"$SERVER_URL:$SERVER_PATH 2>/dev/null --exclude-from "exclude.rsync"