#!/bin/bash

#fail if one of the commands fails
set -e

#retrieve parameters
APP_PATH=$1
DEVICE_ID=$2
CERTIFICATE_PATH=$3

function info {
	#retrieve message from the parameter
	if [[ -n $1 ]]
	then
		message="$1"
		echo -e "::debug::$message"
	#or read the message directly
	else
		while read -r message
		do
			info "$message"
		done
	fi
}

#override the HOME enviroment variable
#when executing a Docker Action, GitHub overrides the HOME variable in the command used to run the Docker (it is set to the home of the runner user)
#the HOME must be restored to the standard home of the root user because ConnectIQ depends on it (the devices files are stored in the home folder of the root user)
export HOME=/root

#entering folder when the app is stored relatively to the GitHub workspace
if [[ -n $1 ]]
then
	info "Entering folder $APP_PATH..."
	cd "$APP_PATH"
	info "Now in folder $(pwd)"
fi

#run tests
info "Running tests on device [$DEVICE_ID] with certificate [$CERTIFICATE_PATH]..."
tester.sh "$DEVICE_ID" "$CERTIFICATE_PATH" | info
result="${PIPESTATUS[0]}"
info "Test finished with result code $result"

#set output variable
if [[ $result -eq 0 ]];
then
	echo "status=success" >> "$GITHUB_OUTPUT"
else
	echo "status=failure" >> "$GITHUB_OUTPUT"
fi

exit "$result"
