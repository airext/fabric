# crashlytics

## Overview
This is [AIR Native Extension](http://www.adobe.com/devnet/air/native-extensions-for-air.html) for Fabric [Crashlytics Kit](https://dev.twitter.com/crashlytics/overview).

## Setup
* setup fabric.ane as described [here](https://github.com/airext/fabric);
* link [crashlytics.ane](bin/fabric.ane) to your project ([details](http://help.adobe.com/en_US/air/build/WS597e5dadb9cc1e0253f7d2fc1311b491071-8000.html));
* declare extension in your application descriptor:
```xml
<extensions> 
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
