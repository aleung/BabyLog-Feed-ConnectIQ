using Toybox.WatchUi;
using Toybox.System;
using Toybox.Time;

class EntryDelegate extends WatchUi.BehaviorDelegate {

	var mCurrentFeeds;
	var mParentView;

    function initialize(view, refFeeds) {
        
        //! Initialize extended class
        BehaviorDelegate.initialize();
        
        //! Initialize module variables
        mCurrentFeeds = refFeeds;
        mParentView = view;
        
    }

	function onAddFeed() {
		
		//!	get current time and update feed class
		mCurrentFeeds.add(Time.now());
		
		//! update labels
		mParentView.updateLabels();
			
	}
	
    function onNextPage() {
        return showLogView();
    }

    function onSelect() {
        return showLogView();
    }

    function showLogView() {
        var view = new LogView(mCurrentFeeds);
        var delegate = new LogDelegate(view);
        WatchUi.pushView(view, delegate, WatchUi.SLIDE_LEFT);
        return true;
    }
	 
}
