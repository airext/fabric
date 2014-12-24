/**
 * Created by Max Rozdobudko on 11/6/14.
 */
package com.github.airext.fabric.events
{
import flash.events.Event;

public class CrashlyticsEvent extends Event
{
    public static const DETECT_CRASH_DURING_PREVIOUS_EXECUTION:String = "detectCrashDuringPreviousExecution";

    public static function createDetectCrash(crash:Object = null):CrashlyticsEvent
    {
        return new CrashlyticsEvent(DETECT_CRASH_DURING_PREVIOUS_EXECUTION, false, false, crash);
    }

    public function CrashlyticsEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, crash:Object = null)
    {
        super(type, bubbles, cancelable);

        _crash = crash;
    }

    private var _crash:Object;

    public function get crash():Object
    {
        return _crash;
    }

    override public function clone():Event
    {
        return new CrashlyticsEvent(type, bubbles, cancelable, crash);
    }
}
}
