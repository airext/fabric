/**
 * Created by mobitile on 11/4/14.
 */
package com.github.airext.fabric
{
import com.github.airext.fabric.core.fabric;
import com.github.airext.fabric.data.CrashReport;

import flash.events.StatusEvent;
import flash.external.ExtensionContext;
import flash.net.registerClassAlias;

use namespace fabric;

public class Crashlytics
{
    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    fabric static const EXTENSION_ID:String = "com.github.airext.fabric.Crashlytics";

    //--------------------------------------------------------------------------
    //
    //  Class properties
    //
    //--------------------------------------------------------------------------

    private static var _context:ExtensionContext;

    fabric static function get context():ExtensionContext
    {
        if (_context == null)
        {
            _context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
        }

        return _context;
    }

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  isSupported
    //-------------------------------------

    public static function isSupported():Boolean
    {
        return context != null && context.call("isSupported");
    }

    //-------------------------------------
    //  sharedInstance
    //-------------------------------------

    private static var instance:Crashlytics;

    public static function sharedInstance():Crashlytics
    {
        if (instance == null)
        {
            new Crashlytics();
        }

        return instance;
    }

    //--------------------------------------------------------------------------
    //
    //  Static initialization
    //
    //--------------------------------------------------------------------------

    {
        registerClassAlias("com.github.airext.fabric.data.CrashReport", CrashReport);
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function Crashlytics()
    {
        super();

        if (instance == null)
        {
            instance = this;
        }

        context.addEventListener(StatusEvent.STATUS, statusHandler);
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  apiKey
    //-------------------------------------

    public static function get apiKey():String
    {
        return context.call("apiKey") as String;
    }

    //-------------------------------------
    //  version
    //-------------------------------------

    public static function get version():String
    {
        return context.call("version") as String;
    }

    //-------------------------------------
    //  debug
    //-------------------------------------

    public function get debug():Boolean
    {
        return context.call("getDebug") as Boolean;
    }

    public function set debug(value:Boolean):void
    {
        context.call("setDebug", value);
    }

    //--------------------------------------------------------------------------
    //
    //  Callbacks
    //
    //--------------------------------------------------------------------------

    //------------------------------------
    //  detectCrashDuringPreviousExecution
    //------------------------------------

    private var _detectCrashDuringPreviousExecution:Function;

//    public function detectCrashDuringPreviousExecution(calback:Function):void
//    {
//        _detectCrashDuringPreviousExecution = calback;
//
//        if (_detectCrashDuringPreviousExecution != null)
//        {
//            installCallbacks();
//        }
//        else
//        {
//            uninstallCallbacks();
//        }
//    }

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    //---------------------------------------
    //  Methods: Crashing
    //---------------------------------------

    public function crash():void
    {
        context.call("crash");
    }

    //---------------------------------------
    //  Methods: Logging
    //---------------------------------------

    public function log(message:String):void
    {
        context.call("log", message);
    }

    //---------------------------------------
    //  Methods: Identifying
    //---------------------------------------

    public function setUserIdentifier(value:String):void
    {
        context.call("setUserIdentifier", value);
    }

    public function setUserName(value:String):void
    {
        context.call("setUserName", value);
    }

    public function setUserEmail(value:String):void
    {
        context.call("setUserEmail", value);
    }

    //---------------------------------------
    //  Methods: Enhancing
    //---------------------------------------

    public function setObjectValue(key:String, value:String):void
    {
        context.call("setObjectValue", key, value);
    }

    public function setIntValue(key:String, value:int):void
    {
        context.call("setIntValue", key, value);
    }

    public function setBoolValue(key:String, value:Boolean):void
    {
        context.call("setBoolValue", key, value);
    }

    public function setFloatValue(key:String, value:Number):void
    {
        context.call("setFloatValue", key, value);
    }

    //---------------------------------------
    //  Methods: Internal
    //---------------------------------------

    fabric function installCallbacks():void
    {
        context.call("installCallbacks");
    }

    fabric function uninstallCallbacks():void
    {
        context.call("uninstallCallbacks");
    }

    fabric function pickCrashReport():CrashReport
    {
        return context.call("pickCrashReport") as CrashReport;
    }

    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------

    public function toString():String
    {
        return "Crashlytics";
    }

    //--------------------------------------------------------------------------
    //
    //  Handlers
    //
    //--------------------------------------------------------------------------

    public function statusHandler(event:StatusEvent):void
    {
        switch (event.code)
        {
            case "Fabric.Crashlytics.DetectCrashDuringPreviousExecution" :

                if (_detectCrashDuringPreviousExecution != null)
                {
                    switch (_detectCrashDuringPreviousExecution.length)
                    {
                        case 0 :
                                _detectCrashDuringPreviousExecution();
                            break;

                        case 1 :
                                _detectCrashDuringPreviousExecution(null);
                            break;
                    }
                }

                break;
        }
    }
}
}
