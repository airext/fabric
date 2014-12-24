/**
 * Created by Max Rozdobudko on 12/11/14.
 */
package com.github.airext.fabric {
import flash.system.Capabilities;

public class Twitter
{
    //--------------------------------------------------------------------------
    //
    //  Class properties
    //
    //--------------------------------------------------------------------------


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

    private static var instance:Twitter;

    public static function sharedInstance():Twitter
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

    public function Twitter()
    {
        super();

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

    public function login(callback:Function):void
    {
        trace("Twitter is not supported for " + Capabilities.os);
    }

    public function logout():void
    {
        trace("Twitter is not supported for " + Capabilities.os);
    }

    public function loginGuest(callback:Function):void
    {
        trace("Twitter is not supported for " + Capabilities.os);
    }

    public function logoutGuest():void
    {
        trace("Twitter is not supported for " + Capabilities.os);
    }

    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------

    public function toString():String
    {
        return "Twitter";
    }

}
}
