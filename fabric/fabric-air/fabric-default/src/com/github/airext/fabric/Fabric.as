/**
 * Created by Max Rozdobudko on 11/4/14.
 */
package com.github.airext.fabric
{
import flash.system.Capabilities;

public class Fabric
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

    public static function withKits(...kits:Array):void
    {
        trace("Fabric is not supported for " + Capabilities.os);
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
        trace("Fabric is not supported for " + Capabilities.os);

        return false;
    }

    public function set debug(value:Boolean):void
    {
        trace("Fabric is not supported for " + Capabilities.os);
    }

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------
}
}
