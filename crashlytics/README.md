# crashlytics

## Overview
This is [AIR Native Extension](http://www.adobe.com/devnet/air/native-extensions-for-air.html) for Fabric [Crashlytics Kit](https://dev.twitter.com/crashlytics/overview).

## Dependencies
* [fabric.ane](https://github.com/airext/fabric/fabric) - a main extension that initializes this kit;

## Setup
* link [fabric.ane](https://github.com/airext/fabric/tree/master/bin/fabric.ane) with your project;
* link [crashlytics.ane](https://github.com/airext/fabric/tree/master/bin/crashlytics.ane) with your project;
* declare extensions in your application descriptor:
```xml
<extensions> 
    <extensionID>com.github.airext.fabric.Fabric</extensionID>
    <extensionID>com.github.airext.fabric.Crashlytics</extensionID>
</extensions>
```
* add Crashlytics Kit info into `<InfoAdditions>` section of your application descriptor:
```xml
<iPhone>
    <InfoAdditions>
        <key>Fabric</key>
        <dict>
            <key>APIKey</key>
            <string>${FABRIC_API_KEY}</string>
            <key>Kits</key>
            <array>
                <dict>
                    <key>KitName</key>
                    <string>Crashlytics</string>
                    <key>KitInfo</key>
                    <dict/>
                </dict>
            </array>
        </dict>
    </InfoAdditions>
</iPhone>
```

## Available API
Almost all Crashlytics API are implemented, except callback for crash reports.

### Simulate crash
```as3
public function crash():void
```

### Setting Keys:
```as3
public function setObjectValue(key:String, value:String):void;

public function setIntValue(key:String, value:int):void;

public function setBoolValue(key:String, value:Boolean):void;

public function setFloatValue(key:String, value:Number):void;
```
for example:
```as3
Crashlytics.sharedInstance().setIntValue("current_level", 3);
Crashlytics.sharedInstance().setObjectValue("last_UI_action", "logged_in");
```

### Logging
```as3
public function setUserEmail(value:String):void
```

### User Identifiers
```as3
public function setUserIdentifier(value:String):void;

public function setUserName(value:String):void;

public function setUserEmail(value:String):void;
```
