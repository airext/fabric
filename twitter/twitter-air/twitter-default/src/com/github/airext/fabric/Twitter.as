/**
 * Created by Max Rozdobudko on 12/11/14.
 */
package com.github.airext.fabric {
import com.github.airext.fabric.data.TwitterGuestSession;
import com.github.airext.fabric.data.TwitterSession;

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
    //  Properties
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  version
    //-------------------------------------

    public static function get version():String
    {
        trace("Twitter is not supported for " + Capabilities.os);

        return null;
    }

    //-------------------------------------
    //  consumerKey
    //-------------------------------------

    public function get consumerKey():String
    {
        trace("Twitter is not supported for " + Capabilities.os);

        return null;
    }

    //-------------------------------------
    //  consumerSecret
    //-------------------------------------

    public function get consumerSecret():String
    {
        trace("Twitter is not supported for " + Capabilities.os);

        return null;
    }

    //-------------------------------------
    //  session
    //-------------------------------------

    public function get session():TwitterSession
    {
        trace("Twitter is not supported for " + Capabilities.os);

        return null;
    }

    //-------------------------------------
    //  guestSession
    //-------------------------------------

    public function get guestSession():TwitterGuestSession
    {
        trace("Twitter is not supported for " + Capabilities.os);

        return null;
    }

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  Methods: Initialization
    //-------------------------------------

    public function startWith(consumerKey:String, consumerSecret:String):void
    {
        trace("Twitter is not supported for " + Capabilities.os);
    }

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
