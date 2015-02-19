# twitter

## Overview
Only authentication methods are implemented.

**NOTE**: This ANE is use [anx-bridge](http://github.com/airext/anx-bridge) native extension for callbacks.

## Setup
Link [twitter.ane](bin/twitter.ane) and [anx-bridge.ane](https://github.com/airext/anx-bridge/tree/master/bin/anx-bridge.ane) to your project and add Twitter Kit keys into `<InfoAdditions>` section of your application descriptor:

```xml
<key>Fabric</key>
<dict>
    <key>APIKey</key>
    <string>${FABRIC_API_KEY}</string>
    <key>Kits</key>
    <array>
      <dict>
          <key>KitName</key>
          <string>Twitter</string>
          <key>KitInfo</key>
          <dict>
              <key>consumerKey</key>
              <string>${TWITTER_CONSUMER_KEY}</string>
              <key>consumerSecret</key>
              <string>${TWITTER_CONSUMER_KSECRET}</string>
          </dict>
      </dict>
    </array>
</dict>
```

## API

### Twitter Authentication
```as3
public function login(callback:Function):void;

public function logout():void;

public function loginGuest(callback:Function):void;

public function logoutGuest():void;

```

### Digits Authentication
```as3
public function authenticate(title:String = null, callback:Function = null):void;

public function logout():void
```
