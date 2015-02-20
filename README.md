# fabric ![License MIT](http://img.shields.io/badge/license-MIT-lightgray.svg)

![iOS](http://img.shields.io/badge/platform-ios-blue.svg)

## Overview
This is [AIR Native Extension](http://www.adobe.com/devnet/air/native-extensions-for-air.html) that enables Twitter's [Fabric](http://fabric.io) platform for AIR projects.

Like the original Fabric, this project is divided on main Fabric extension and set of independed Kits:
* [Fabric](fabric) - the main native extension that initializes kits;
* [Crashlytics Kit](crashlytics) - native extension for Crashlytics platform;
* [Twitter Kit](twitter) - native extension for Twitter API;

## Upload Application
You need to upload your *.ipa* file to Fabric server if you use Crashlytcis Kit. You can use [tools/FabricAppUpload.app](https://github.com/airext/fabric/wiki/How-To-Use-FabricAppUpload.app) application to do this. 
