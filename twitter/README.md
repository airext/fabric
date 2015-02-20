# twitter

## Overview
This is [AIR Native Extension](http://www.adobe.com/devnet/air/native-extensions-for-air.html) for Fabric [Twitter Kit](https://dev.twitter.com/twitter-kit/overview).

## Dependencies
* [fabric.ane](https://github.com/airext/fabric/fabric) - a main extension that initializes this kit;
* [anx-bridge.ane](https://github.com/airext/anx-bridge) - an extension that used for asynchronous calls;

## Setup
* link [fabric.ane](https://github.com/airext/fabric/tree/master/bin/fabric.ane) with your project;
* link [anx-bridge.ane](https://github.com/airext/anx-bridge/tree/master/bin/anx-bridge.ane) with your project;
* link [twitter.ane](https://github.com/airext/fabric/tree/master/bin/twitter.ane) with your project;
* declare extensions in your application descriptor:
```xml
<extensions> 
    <extensionID>com.github.airext.Bridge</extensionID>
    <extensionID>com.github.airext.fabric.Fabric</extensionID>
    <extensionID>com.github.airext.fabric.Crashlytics</extensionID>
</extensions>
```
* add Twitter Kit keys into `<InfoAdditions>` section of your application descriptor:
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
    </InfoAdditions>
</iPhone>
```

## API
Only authentication methods are implemented.

### Twitter Authentication
```as3
public function login(callback:Function):void;

public function logout():void;

public function loginGuest(callback:Function):void;

public function logoutGuest():void;
```
for example:
```as3
if (Twitter.isSupported())
{
    Twitter.sharedInstance().login(
        function callback(error:Error = null, session:TwitterSession = null):void
        {
            if (error != null)
            {
                trace("Error:", String(error));
            }
            else
            {
                trace("Logged in as:", session.userName);
            }
        }
    );
}
```

### Digits Authentication
```as3
public function authenticate(title:String = null, callback:Function = null):void;

public function logout():void
```
for example:
```as3
if (Digits.isSupported())
{
    Digits.sharedInstace().authenticate("Title", 
        function callback(error:Error = null, session:DigitsSession = null):void
        {
            if (error != null)
            {
                trace("Error:", String(error));
            }
            else
            {
                trace("Logged in as:", session.userId);
            }
        }
    );
}
```
