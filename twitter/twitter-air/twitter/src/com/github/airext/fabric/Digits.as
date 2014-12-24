/**
 * Created by Max Rozdobudko on 11/27/14.
 */
package com.github.airext.fabric
{
import com.github.airext.bridge.bridge;
import com.github.airext.fabric.core.fabric;
import com.github.airext.fabric.data.DigitsSession;

import flash.net.registerClassAlias;

use namespace fabric;

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
        return Twitter.context != null && Twitter.context.call("isSupported");
    }

    //-------------------------------------
    //  sharedInstance
    //-------------------------------------

    private static var instance:Digits;

    public static function sharedInstance():Digits
    {
        if (instance == null)
        {
            new Digits();
        }

        return instance;
    }

    //--------------------------------------------------------------------------
    //
    //  Static initialization
    //
    //--------------------------------------------------------------------------

    {
        registerClassAlias("com.github.airext.fabric.data.DigitsSession", DigitsSession);
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
        if (title)
        {
            bridge(Twitter.context).call("digitsAuthenticate", title).callback(callback);
        }
        else
        {
            bridge(Twitter.context).call("digitsAuthenticate").callback(callback);
        }
    }

    public function logout():void
    {
        Twitter.context.call("digitsLogout");
    }
}
}
