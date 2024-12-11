#/bin/bash

LOCAL_PATH=$1      # Current path to deploy
REMOTE_USER=$2     # Remote user to connect
REMOTE_SERVER=$3   # Server to connect
REMOTE_PATH=$4     # Remote path to deploy
CUSTOM_EXCLUDE=$5  # Custom exclude patterns args

rsync --recursive --fuzzy --compress --human-readable --mkpath \
	--exclude='**/.git*/**' \
	--exclude='**/.vscode/**' \
	--exclude='./docker' \
	--exclude='./node_modules' \
	--exclude='./tests' \
	--exclude='./vendor' \
	--exclude='.env' \
	--exclude='.env.**' \
	--exclude='.git**' \
	--exclude='docker-compose.yml' \
	--exclude='*.code-workspace' \
	--exclude='phpunit.xml' \
	--exclude='*.config.js' \
	--exclude='*.md' \
	--exclude='tsconfig.json' \
 	--verbose \
	$LOCAL_PATH \
	-e "ssh -i ~/.ssh/id" \
	$REMOTE_USER@$REMOTE_SERVER:$REMOTE_PATH
