# fabric ![License MIT](http://img.shields.io/badge/license-MIT-lightgray.svg)

![iOS](http://img.shields.io/badge/platform-ios-blue.svg)

## Overview

This is [AIR Native Extension](http://www.adobe.com/devnet/air/native-extensions-for-air.html) that enables Twitter's [Fabric](http://fabric.io) platform for AIR projects.

At this moment next Kits are available:
* [Crashlytics Kit](crashlytics)
* [Twitter Kit](twitter)

## Setup

You may need to upload your *.ipa* file to crashlytics server if you use Crashlytcis Kit. You can use tools/FabricAppUpload.app application for do this. But notice that it is only for MAC and is not stable, more info you can find in [tools](tools) section.

## Usage

Like original [Fabric](https://dev.twitter.com/fabric/overview), this extension separated into kits. The main Fabric extension only initializes the kits. Its API is very simple:

```as3
if (Fabric.isSupported)
{
  Fabric.withKits(new Crashlytics(), new Twitter());
  
  Fabric.sharedInstance().debug = true;
}
```

