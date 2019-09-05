using Toybox.WatchUi;
using Toybox.System;
using Toybox.Time;
using Toybox.Background;

class MainDelegate extends WatchUi.BehaviorDelegate {

	var log;

    function initialize(refLog) {
        
        //! Initialize extended class
        BehaviorDelegate.initialize();
        
        //! Initialize module variables
        log = refLog;
    }

	function onAddLogEntry() {
		log.add(Time.now());
        showLoggedView();
        setAlert();
	}
	
    function onNextPage() {
        showHistoryView();
        return true;
    }

    function onSelect() {
        showHistoryView();
        return true;
    }

    function showHistoryView() {
        var view = new HistoryView(log);
        var delegate = new HistoryDelegate(view);
        WatchUi.pushView(view, delegate, WatchUi.SLIDE_LEFT);
    }
	 
    function showLoggedView() {
        var view = new LoggedView();
        WatchUi.pushView(view, null, WatchUi.SLIDE_DOWN);
    }

    private function setAlert() {
        if (!Application.Properties.getValue("alert")) {
            System.println("alert is disabled");
            return;
        }
        var timeoutMinutes = Application.Properties.getValue("timeoutMinutes");
        var eventTime = Time.now().add(new Time.Duration(timeoutMinutes * 60));
        System.println("Register for temporl event in " + timeoutMinutes + " minutes");
        Background.registerForTemporalEvent(eventTime);
    }
}
