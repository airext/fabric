/**
 * Created by Max Rozdobudko on 11/26/14.
 */
package com.github.airext.fabric
{
import com.github.airext.bridge.bridge;
import com.github.airext.fabric.core.fabric;
import com.github.airext.fabric.data.TwitterGuestSession;
import com.github.airext.fabric.data.TwitterSession;

import flash.events.StatusEvent;

import flash.external.ExtensionContext;
import flash.net.registerClassAlias;

use namespace fabric;

public class Twitter
{
    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    fabric static const EXTENSION_ID:String = "com.github.airext.fabric.Twitter";

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
    //  Static initialization
    //
    //--------------------------------------------------------------------------

    {
        registerClassAlias("com.github.airext.fabric.data.TwitterSession", TwitterSession);
        registerClassAlias("com.github.airext.fabric.data.TwitterGuestSession", TwitterGuestSession);
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

        context.addEventListener(StatusEvent.STATUS, statusHandler);
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
        bridge(context).call("login").callback(callback);
    }

    public function logout():void
    {
        context.call("logout");
    }

    public function loginGuest(callback:Function):void
    {
        bridge(context).call("loginGuest").callback(callback);
    }

    public function logoutGuest():void
    {
        context.call("logoutGuest");
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

    //--------------------------------------------------------------------------
    //
    //  Handlers
    //
    //--------------------------------------------------------------------------

    public function statusHandler(event:StatusEvent):void
    {
        switch (event.code)
        {
            case "Fabric.Twitter.Login.Success" :



                break;

            case "Fabric.Twitter.LoginGuest.Success" :



                break;
        }
    }
}
}
