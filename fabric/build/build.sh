#!/bin/bash

unzip -o fabric.swc

unzip -o default/fabric-default.swc -d default

# copy frameworks to be included into ANE
mkdir -p ios
cp -R -L -f ../fabric-ios/Fabric/Fabric.framework/ ios/Fabric.framework

adt -package -storetype pkcs12 -keystore $AIR_CERTIFICATE -storepass $AIR_CERTIFICATE_STOREPASS -target ane fabric.ane extension.xml -swc fabric.swc -platform iPhone-ARM library.swf -platformoptions platform.xml -C ios . -platform default -C default library.swf

#copy ANE into bin directory
cp -R fabric.ane ../../bin/fabric.ane

# copy ANE for Fabric debug project
cp -R fabric.ane ../fabric-air/fabric-debug/ane/fabric.ane

mkdir -p launch/ext
cp -R fabric.ane launch/ext/fabric.ane
unzip -o launch/ext/fabric.ane -d launch/ext

rm library.swf
rm catalog.xml

rm default/library.swf
rm default/catalog.xml