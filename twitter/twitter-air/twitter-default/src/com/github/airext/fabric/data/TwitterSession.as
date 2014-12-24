/**
 * Created by Max Rozdobudko on 11/26/14.
 */
package com.github.airext.fabric.data
{
public class TwitterSession
{
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function TwitterSession()
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
    //  userName
    //-------------------------------------

    private var _userName:String;

    /** The username associated with the access token. */
    public function get userName():String
    {
        return _userName;
    }

    /** @private */
    public function set userName(value:String):void
    {
        _userName = value;
    }

    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------

    public function toString():String
    {
        return '[TwitterSession ' +
                'authToken="'+authToken+'", ' +
                'authTokenSecret="'+authTokenSecret+'", ' +
                'userId="'+userId+'", ' +
                'userName="'+userName+'"]';
    }
}
}
