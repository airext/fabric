#!/bin/sh
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function file_dialog()
{
	local file_path=$(osascript << EOT
		return POSIX path of (choose file with prompt "$1" of type {"$2"})
	EOT)
	
	echo $file_path
}

function input_dialog()
{
	local file_path=$(osascript << EOT
		return text returned of (display dialog "$2" with title "$1" default answer "$3")
	EOT)
	
	echo $file_path
}

export FABRIC_PATH=$SCRIPT_DIR/Fabric.framework

export FABRIC_API_KEY=$(input_dialog "Enter Fabric API Key" "The Fabric API Key you can fing on the Organization Setting page." "$FABRIC_API_KEY")

export FABRIC_BUILD_SECRET=$(input_dialog "Enter Fabric Build Secret" "The Fabric Build Secret you can fing on the Organization Setting page." "$FABRIC_BUILD_SECRET")

if [ -z "$IPA_PATH" ]; then
export IPA_PATH=$(file_dialog "Select your .IPA file:" "IPA")
fi

if [ -z "$DSYM_PATH" ]; then
export DSYM_PATH=$(file_dialog "Select your .dSYM file:" "com.apple.xcode.dsym")
fi

xcodebuild -project $SCRIPT_DIR/fabricupload.xcodeproj > ~/tmp/log.txt

# Cleanup
rm -rf $SCRIPT_DIR/build
