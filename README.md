# fabric ![License MIT](http://img.shields.io/badge/license-MIT-lightgray.svg)

![iOS](http://img.shields.io/badge/platform-ios-blue.svg)

## Overview

This is [AIR Native Extension](http://www.adobe.com/devnet/air/native-extensions-for-air.html) that enables Twitter's [Fabric](http://fabric.io) platform for AIR projects.

At this moment the next Kits are available:
* [Crashlytics Kit](crashlytics)
* [Twitter Kit](twitter)

## Setup
* link [fabric.ane](bin/fabric.ane) with your project ([details](http://help.adobe.com/en_US/air/build/WS597e5dadb9cc1e0253f7d2fc1311b491071-8000.html));
* declare extension in your application descriptor:
```xml
<extensions> 
    <extensionID>com.github.airext.Fabric</extensionID> 
</extensions>
```
* add Fabric API_KEY into `<InfoAdditions>` section of your application descriptor:
```xml
<iPhone>
    <InfoAdditions>
        <key>Fabric</key>
        <dict>
            <key>APIKey</key>
            <string>${FABRIC_API_KEY}</string>
        </dict>
    </InfoAdditions>
</iPhone>
```

## Upload Application
You also need to upload your *.ipa* file to Fabric server if you use Crashlytcis Kit. You can use [tools/FabricAppUpload.app](https://github.com/airext/fabric/wiki/How-To-Use-FabricAppUpload.app) application to do this. 

## API
Like original [Fabric](https://dev.twitter.com/fabric/overview), this extension separated into kits. The main Fabric extension only initializes the kits:

```as3
public static function withKits(...kits):void;
```
for example:
```as3
if (Fabric.isSupported)
{
  Fabric.withKits(new Crashlytics(), new Twitter());
}
```

