using Toybox.WatchUi;
using Toybox.System;
using Toybox.Time;

const SCROLL_ITEMS = 4;

class LogDelegate extends WatchUi.BehaviorDelegate {

	var mLogStartPoint = 9;
	var mParentView = null;

  function initialize(view) {
      
      //! Initialize extended class
      BehaviorDelegate.initialize();
      mParentView = view;
      
      //! Initialize module variables
      
  }
  
  function onNextPage() {
    scrollUp();
  }
  
  function onPreviousPage() {
    scrollDown();
  } 

  function onSelect() {
    WatchUi.popView(SLIDE_RIGHT);
    return true;
  }
	 
	hidden function scrollUp() {

		mLogStartPoint = mLogStartPoint - SCROLL_ITEMS;
		if (mLogStartPoint < 5) {  // one page can show 5 entries
			mLogStartPoint = 5;
		}
		
		//System.println("Scrolled down. Starting Point: " + mLogStartPoint);	
		mParentView.updateLogLabels(mLogStartPoint);
		
	}
	
	hidden function scrollDown() {

		mLogStartPoint = mLogStartPoint + SCROLL_ITEMS;
		if (mLogStartPoint >= NUM_ENTRIES) {
			mLogStartPoint = NUM_ENTRIES - 1;
		}
		
		//System.println("Scrolled up. Starting Point: " + mLogStartPoint);	
		mParentView.updateLogLabels(mLogStartPoint);
		
	}
		
}
