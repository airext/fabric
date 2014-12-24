#!/bin/bash

sh appify.sh fabric-app-upload.sh "FabricAppUpload"

cp -R fabricupload.xcodeproj FabricAppUpload.app/Contents/MacOS

cp -R ../../../fabric/fabric-ios/Fabric/Fabric.framework FabricAppUpload.app/Contents/MacOS

mv -f FabricAppUpload.app ../../

echo ">>>$DIR"