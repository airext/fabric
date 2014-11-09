#!/bin/bash

unzip -o crashlytics.swc

unzip -o default/crashlytics-default.swc -d default

# copy frameworks to be included into ANE

cp -R -L -f ../crashlytics-ios/Crashlytics/Crashlytics.framework/ ios/Crashlytics.framework

adt -package -storetype pkcs12 -keystore $AIR_CERTIFICATE -storepass $AIR_CERTIFICATE_STOREPASS -target ane crashlytics.ane extension.xml -swc crashlytics.swc -platform iPhone-ARM library.swf -platformoptions platform.xml -C ios . -platform default -C default library.swf

# copy  ANE to bin directory 
cp -R crashlytics.ane ../../bin/crashlytics.ane

# copy ANE for Crashlytics debug project
cp -R crashlytics.ane ../crashlytics-air/crashlytics-debug/ane/crashlytics.ane
mkdir -p launch/ext
cp -R crashlytics.ane launch/ext/crashlytics.ane
unzip -o launch/ext/crashlytics.ane -d launch/ext

# copy ANE for Fabric debug project
cp -R crashlytics.ane ../../fabric/fabric-air/fabric-debug/ane/crashlytics.ane
mkdir -p ../../fabric/build/launch/ext
cp -R crashlytics.ane ../../fabric/build/launch/ext/crashlytics.ane

rm library.swf
rm catalog.xml

rm default/library.swf
rm default/catalog.xml