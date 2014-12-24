#!/bin/bash

unzip -o twitter.swc

unzip -o default/twitter-default.swc -d default

# copy frameworks to be included into ANE
mkdir ios
cp -R -L -f ../twitter-ios/Twitter/TwitterKit.framework/ ios/TwitterKit.framework

#copy TwtitterKit resources
cp -R -L -f ../twitter-ios/Twitter/TwitterKit.framework/Versions/A/Resources/TwitterKitResources.bundle ios/TwitterKitResources.bundle
cp -R -L -f ../twitter-ios/Twitter/TwitterKit.framework/Versions/A/Resources/TwitterKitResources.bundle/DigitsResources.bundle ios/DigitsResources.bundle

adt -package -storetype pkcs12 -keystore $AIR_CERTIFICATE -storepass $AIR_CERTIFICATE_STOREPASS -target ane twitter.ane extension.xml -swc twitter.swc -platform iPhone-ARM library.swf -platformoptions platform.xml -C ios . -platform default -C default library.swf

# copy  ANE to bin directory 
cp -R twitter.ane ../../bin/twitter.ane

# copy ANE for Fabric debug project
cp -R twitter.ane ../../fabric/fabric-air/fabric-debug/ane/twitter.ane
mkdir -p ../../fabric/build/launch/ext
cp -R twitter.ane ../../fabric/build/launch/ext/twitter.ane

rm library.swf
rm catalog.xml

rm default/library.swf
rm default/catalog.xml