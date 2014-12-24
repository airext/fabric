/**
 * Created by Max Rozdobudko on 11/4/14.
 */
package com.github.airext.fabric
{
import com.github.airext.fabric.core.fabric;
import com.github.airext.fabric.data.CrashReport;

import flash.system.Capabilities;

use namespace fabric;

public class Crashlytics
{
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
        return false;
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
        trace("Crashlytics is not supported for " + Capabilities.os);

        return null;
    }

    //-------------------------------------
    //  version
    //-------------------------------------

    public static function get version():String
    {
        trace("Crashlytics is not supported for " + Capabilities.os);

        return null;
    }

    //-------------------------------------
    //  debug
    //-------------------------------------

    public function get debug():Boolean
    {
        trace("Crashlytics is not supported for " + Capabilities.os);

        return null;
    }

    public function set debug(value:Boolean):void
    {
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    //--------------------------------------------------------------------------
    //
    //  Callbacks
    //
    //--------------------------------------------------------------------------

    //------------------------------------
    //  detectCrashDuringPreviousExecution
    //------------------------------------

//    public function detectCrashDuringPreviousExecution(callback:Function):void
//    {
//        trace("Crashlytics is not supported for " + Capabilities.os);
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
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    //---------------------------------------
    //  Methods: Logging
    //---------------------------------------

    public function log(message:String):void
    {
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    //---------------------------------------
    //  Methods: Identifying
    //---------------------------------------

    public function setUserIdentifier(value:String):void
    {
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    public function setUserName(value:String):void
    {
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    public function setUserEmail(value:String):void
    {
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    //---------------------------------------
    //  Methods: Enhancing
    //---------------------------------------

    public function setObjectValue(key:String, value:String):void
    {
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    public function setIntValue(key:String, value:int):void
    {
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    public function setBoolValue(key:String, value:Boolean):void
    {
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    public function setFloatValue(key:String, value:Number):void
    {
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    //---------------------------------------
    //  Methods: Internal
    //---------------------------------------

    fabric function installCallbacks():void
    {
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    fabric function uninstallCallbacks():void
    {
        trace("Crashlytics is not supported for " + Capabilities.os);
    }

    fabric function pickCrashReport():CrashReport
    {
        trace("Crashlytics is not supported for " + Capabilities.os);

        return null;
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
}
}
