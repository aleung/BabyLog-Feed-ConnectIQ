using Toybox.WatchUi;
using Toybox.Graphics;

class MainView extends WatchUi.View {

	var mCurrentFeeds;

    function initialize(currentFeeds) {
        View.initialize();
        mCurrentFeeds = currentFeeds;
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));      
        //System.println("Layout loaded for FBLView");
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
        var logType = "log";  // TODO: configurable
		View.findDrawableById("labelLogType").setText(logType);		

        var elapsedField = View.findDrawableById("labelElapsed");
        elapsedField.setColor(Graphics.COLOR_WHITE);

        var warningDuration = -1; // TODO: configurable

        var elapsed = mCurrentFeeds.getElapsed();
        if (elapsed != null) {
            var days = DurationUtils.days(elapsed);
            var hours = DurationUtils.hours(elapsed);
            var minutes = DurationUtils.minutes(elapsed);
            var elapsedString = days > 0
                ? Lang.format("$1$+$2$:", [days.format("%d"), hours.format("%d")]) :
                : Lang.format("$1$:$2$", [hours.format("%d"), minutes.format("%02d")]);	
            elapsedField.setText(elapsedString);
            if (warningDuration > 0 && elapsed > warningDuration) {
                elapsedField.setColor(Graphics.COLOR_ORANGE);
            }
        } else {
            elapsedField.setText("--");	
        }
	}

}
