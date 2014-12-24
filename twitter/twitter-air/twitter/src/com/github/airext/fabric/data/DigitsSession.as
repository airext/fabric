/**
 * Created by Max Rozdobudko on 12/12/14.
 */
package com.github.airext.fabric.data {
public class DigitsSession
{
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function DigitsSession()
    {
        super();
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  authToken
    //-------------------------------------

    private var _authToken:String;

    /** The authorization token. */
    public function get authToken():String
    {
        return _authToken;
    }

    /** @private */
    public function set authToken(value:String):void
    {
        _authToken = value;
    }

    //-------------------------------------
    //  authTokenSecret
    //-------------------------------------

    private var _authTokenSecret:String;

    /** The guest access token. */
    public function get authTokenSecret():String
    {
        return _authTokenSecret;
    }

    /** @private */
    public function set authTokenSecret(value:String):void
    {
        _authTokenSecret = value;
    }

    //-------------------------------------
    //  userId
    //-------------------------------------

    private var _userId:String;

    /** The user ID associated with the access token. */
    public function get userId():String
    {
        return _userId;
    }

    /** @private */
    public function set userId(value:String):void
    {
        _userId = value;
    }

    //-------------------------------------
    //  phoneNumber
    //-------------------------------------

    private var _phoneNumber:String;

    /** The phoneNumber associated with the access token. */
    public function get phoneNumber():String
    {
        return _phoneNumber;
    }

    /** @private */
    public function set phoneNumber(value:String):void
    {
        _phoneNumber = value;
    }

    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------

    public function toString():String
    {
        return '[DigitsSession ' +
                'authToken="'+authToken+'", ' +
                'authTokenSecret="'+authTokenSecret+'", ' +
                'userId="'+userId+'", ' +
                'phoneNumber="'+phoneNumber+'"]';
    }
}
}
