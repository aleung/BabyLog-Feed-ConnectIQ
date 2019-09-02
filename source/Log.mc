using Toybox.Application.Storage;
using Toybox.Time;
using Toybox.Time.Gregorian;
using DurationUtils;

const NUM_ENTRIES = 10;

class Log {

	var mTimeArray = new [NUM_ENTRIES];     /* Moment */

	function initialize() {
		load();
	}

	function add(moment) {
		// add a new entry to the time array, deleting the oldest
		mTimeArray.add(moment);
		mTimeArray = mTimeArray.slice(1,null);

		save();
	}
	
	function getTimeString(index) {
		if (index < 0 || mTimeArray[index] == null) {
			return null;
		}
		var momNowGreg = Gregorian.info(mTimeArray[index], Time.FORMAT_SHORT);
		return Lang.format(
				"$1$:$2$",
				[
						momNowGreg.hour.format("%02d"),
						momNowGreg.min.format("%02d")
				]
		);
	}

	function getElapsed() {
		var lastLogTime = mTimeArray[NUM_ENTRIES-1];
		return lastLogTime == null ? null : Time.now().subtract(lastLogTime).value();
	}
	
	// return { :days, :hours, :minutes }
	function getInterval(index) {

    var prevIndex = index - 1;
		if (prevIndex < 0 || mTimeArray[prevIndex] == null) {
			return null;
		}

		var seconds = mTimeArray[index].subtract(mTimeArray[prevIndex]).value();
		if (seconds == null) {
			return null;
		} 

		//System.println("Elapsed time in seconds: " + seconds);
		var days = DurationUtils.days(seconds);
		var hours = DurationUtils.hours(seconds);
		var minutes = DurationUtils.minutes(seconds);

		return { :days => days, :hours => hours, :minutes => minutes };
	}

	hidden function save() {
		var tmpArray = new[NUM_ENTRIES];
		for( var i = 0; i < mTimeArray.size(); i++ ) {
			if (mTimeArray[i] != null) {
				tmpArray[i] = mTimeArray[i].value();
			}
		}
		Storage.setValue("TimeArray", tmpArray);		
	}

	hidden function load() {
		try {
			var tmpArray = Storage.getValue("TimeArray");
			for( var i = 0; i < mTimeArray.size(); i++ ) {
				if (tmpArray[i] != null) {
					mTimeArray[i] = new Time.Moment(tmpArray[i]);
				}
			}
		} catch (ex) {
			System.println("Could not load TimeArray from Storage: " + ex.getErrorMessage());
		}		
	}

}