/**
 * Created by Max Rozdobudko on 12/11/14.
 */
package com.github.airext.fabric {
import flash.system.Capabilities;

public class Digits
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

    private static var instance:Digits;

    public static function sharedInstance():Digits
    {
        if (instance == null)
        {
            new Twitter();
        }

        return instance;
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function Digits()
    {
        if (instance == null)
        {
            instance = this;
        }
    }

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  Methods: User Authentication
    //-------------------------------------

    public function authenticate(title:String = null, callback:Function = null):void
    {
        trace("Digits is not supported for " + Capabilities.os);
    }

    public function logout():void
    {
        trace("Digits is not supported for " + Capabilities.os);
    }
}
}
