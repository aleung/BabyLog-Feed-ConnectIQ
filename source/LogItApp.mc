using Toybox.Application;
using Toybox.Application.Storage;

class LogItApp extends Application.AppBase {

	var entries;

    function initialize() {
        AppBase.initialize();
        entries = new Log();
    }

    // onStart() is called on application start up
    function onStart(state) {     
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
    	var initialView = new EntryView(entries);
        return [ initialView, new EntryDelegate(initialView, entries) ];
    }

}