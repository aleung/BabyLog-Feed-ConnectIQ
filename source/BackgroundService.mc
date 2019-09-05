using Toybox.Background;
using Toybox.System;

(:background)
class BackgroundServiceDelegate extends System.ServiceDelegate {

    function initialize() {
        ServiceDelegate.initialize();
    }

    function onTemporalEvent() {
        var logType = Application.Properties.getValue("logType");
        System.println("Wake up on temporal event");
        Background.requestApplicationWake("Time to " + logType);
        Background.exit(null);
    }
}