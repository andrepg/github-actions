#/bin/bash

LOCAL_PATH=$1      # Current path to deploy
REMOTE_USER=$2     # Remote user to connect
REMOTE_SERVER=$3   # Server to connect
REMOTE_PATH=$4     # Remote path to deploy
CUSTOM_EXCLUDE=$5  # Custom exclude patterns args

rsync  	--verbose --recursive \
	--fuzzy --checksum --delete \
	--force --compress --human-readable --mkpath \
	--exclude='.git**' \
	--exclude='.vscode' \
	--exclude='docker' \
	--exclude='storage' \
	--exclude='node_modules' \
	--exclude='tests' \
	--exclude='vendor' \
	--exclude='.env.**' \
	--exclude='docker-compose.yml' \
	--exclude='phpunit.xml' \
	--exclude='*.code-workspace' \
	--exclude='*.config.js' \
	--exclude='**/*.sqlite' \
	--exclude='**/*.md' \
	--exclude='tsconfig.json' \
	$LOCAL_PATH \
	-e "ssh -i ~/.ssh/id" \
	$REMOTE_USER@$REMOTE_SERVER:$REMOTE_PATH
