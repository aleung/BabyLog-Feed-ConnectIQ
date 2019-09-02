using Toybox.WatchUi;
using Toybox.Timer;

class LoggedView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.LoggedLayout(dc));      
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
      var timer = new Timer.Timer();
      timer.start(method(:popView), 800, false);
    }

    function popView() {
      WatchUi.popView(WatchUi.SLIDE_UP);
    }

    // Update the view
    function onUpdate(dc) {
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
}
