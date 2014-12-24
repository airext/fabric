/**
 * Created by Max Rozdobudko on 11/4/14.
 */
package com.github.airext.fabric
{
import com.github.airext.fabric.core.fabric;
import com.github.airext.fabric.data.FabricKitConfiguration;

import flash.external.ExtensionContext;
import flash.net.registerClassAlias;

use namespace fabric

public class Fabric
{
    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    fabric static const EXTENSION_ID:String = "com.github.airext.fabric.Fabric";

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

    private static var instance:Fabric;

    public static function sharedInstance():Fabric
    {
        if (instance == null)
        {
            instance = new Fabric();
        }

        return instance;
    }

    //-------------------------------------
    //  withKits
    //-------------------------------------

    public static function withKits(...kits):void
    {
        var args:Array = ["with"];

        for (var i:uint = 0, n:uint = kits ? kits.length : 0; i < n; i++)
        {
            var kit:Object = kits[i];

            args.push(String(kit));
        }

        context.call.apply(null, args);
    }

    //--------------------------------------------------------------------------
    //
    //  Static initialization
    //
    //--------------------------------------------------------------------------

    {
        registerClassAlias("com.github.airext.fabric.data.FabricKitConfiguration", FabricKitConfiguration);
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function Fabric()
    {
        super();
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

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
    //  Methods
    //
    //--------------------------------------------------------------------------



}
}
