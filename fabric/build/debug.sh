#!/bin/bash

cp -R ../fabric-air/fabric-debug/bin-debug/FabricDebug-app.xml launch/FabricDebug-app.xml
cp -R ../fabric-air/fabric-debug/bin-debug/FabricDebug.swf launch/FabricDebug.swf

adt -package -target ipa-debug-interpreter -provisioning-profile $IOS_PROVISION -storetype pkcs12 -keystore $IOS_CERTIFICATE -storepass $IOS_CERTIFICATE_STOREPASS launch/FabricDebug.ipa launch/FabricDebug-app.xml -C launch FabricDebug.swf -extdir launch/ext -platformsdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/