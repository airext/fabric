/**
 * Created by Max Rozdobudko on 11/26/14.
 */
package com.github.airext.fabric.data
{
public class TwitterGuestSession
{
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function TwitterGuestSession()
    {
        super();
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  accessToken
    //-------------------------------------

    private var _accessToken:String;

    /** The bearer access token for guest auth. */
    public function get accessToken():String
    {
        return _accessToken;
    }

    /** @private */
    public function set accessToken(value:String):void
    {
        _accessToken = value;
    }

    //-------------------------------------
    //  guestToken
    //-------------------------------------

    private var _guestToken:String;

    /** The guest access token. */
    public function get guestToken():String
    {
        return _guestToken;
    }

    /** @private */
    public function set guestToken(value:String):void
    {
        _guestToken = value;
    }

    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------

    public function toString():String
    {
        return '[TwitterGuestSession ' +
                'accessToken="'+accessToken+'", ' +
                'guestToken="'+guestToken+'"]';
    }
}
}
