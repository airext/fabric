# crashlytics

## Overview
Almost all Crashlytics API are implemented, except callback for crash reports.

## iOS Setup

Add Crashlytics kit info into `<InfoAdditions>` section of your application descriptor:
```xml
<key>Fabric</key>
<dict>
    <key>APIKey</key>
    <string>${YOUR_FABRIC_API_KEY}</string>
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
```

## Available API

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
