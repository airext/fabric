# fabric

## Overview
This is [AIR Native Extension](http://www.adobe.com/devnet/air/native-extensions-for-air.html) for [Fabric](https://dev.twitter.com/fabric/overview) framework.

## Setup
* link [fabric.ane](https://github.com/airext/fabric/tree/master/bin/fabric.ane) with your project ([details](http://help.adobe.com/en_US/air/build/WS597e5dadb9cc1e0253f7d2fc1311b491071-8000.html));
* declare extension in your application descriptor:
```xml
<extensions> 
    <extensionID>com.github.airext.fabric.Fabric</extensionID> 
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
