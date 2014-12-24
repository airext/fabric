#!/bin/bash

cp -R ../crashlytics-air/crashlytics-debug/bin-debug/CrashlyticsDebug-app.xml launch/CrashlyticsDebug-app.xml
cp -R ../crashlytics-air/crashlytics-debug/bin-debug/CrashlyticsDebug.swf launch/CrashlyticsDebug.swf

adt -package -target ipa-debug-interpreter -provisioning-profile $IOS_PROVISION -storetype pkcs12 -keystore $IOS_CERTIFICATE -storepass $IOS_CERTIFICATE_STOREPASS launch/CrashlyticsDebug.ipa launch/CrashlyticsDebug-app.xml -C launch CrashlyticsDebug.swf -extdir launch/ext -platformsdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/