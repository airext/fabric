# fabric ![License MIT](http://img.shields.io/badge/license-MIT-lightgray.svg)

![iOS](http://img.shields.io/badge/platform-ios-blue.svg)

## Overview

This is [AIR Native Extension](http://www.adobe.com/devnet/air/native-extensions-for-air.html) that enables Twitter's [Fabric](http://fabric.io) platform for AIR projects.

At this moment next Kits are available:
* [Crashlytics Kit](crashlytics)
* [Twitter Kit](twitter)

## Setup
Link [fabric.ane](bin/fabric.ane) and add Fabric API_KEY info into <InfoAdditions> section of your application descriptor:
```xml
<key>Fabric</key>
<dict>
    <key>APIKey</key>
    <string>${FABRIC_API_KEY}</string>
</dict>
```

You need to upload your *.ipa* file to Fabric server if you use Crashlytcis Kit. You can use [tools/FabricAppUpload.app](https://github.com/airext/fabric/wiki/How-To-Use-FabricAppUpload.app) application for this. 

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

