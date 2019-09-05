using Toybox.WatchUi;
using Toybox.Graphics;

class MainView extends WatchUi.View {

	var log;

    function initialize(refLog) {
        View.initialize();
        log = refLog;
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));      
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    	updateLabels();
    }

    // Update the view
    function onUpdate(dc) {
    
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

	function updateLabels() {
        var logType = Application.Properties.getValue("logType");
		View.findDrawableById("labelLogType").setText(logType);		

        var elapsedField = View.findDrawableById("labelElapsed");
        elapsedField.setColor(Graphics.COLOR_WHITE);

        var elapsed = log.getElapsed();
        if (elapsed != null) {
            var days = DurationUtils.days(elapsed);
            var hours = DurationUtils.hours(elapsed);
            var minutes = DurationUtils.minutes(elapsed);
            var elapsedString = days > 0
                ? Lang.format("$1$+$2$:", [days.format("%d"), hours.format("%d")]) :
                : Lang.format("$1$:$2$", [hours.format("%d"), minutes.format("%02d")]);	
            elapsedField.setText(elapsedString);
            var timeoutMinutes = Application.Properties.getValue("timeoutMinutes");
            if (timeoutMinutes > 0 && elapsed > timeoutMinutes * 60) {
                elapsedField.setColor(Graphics.COLOR_ORANGE);
            }
        } else {
            elapsedField.setText("--");	
        }
	}

}
