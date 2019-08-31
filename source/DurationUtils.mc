using Toybox.Math;

const SECONDS_IN_MINUTE = 60;
const SECONDS_IN_HOUR = SECONDS_IN_MINUTE * 60;
const SECONDS_IN_DAY = SECONDS_IN_HOUR * 24;
 
module DurationUtils {

  function days(seconds) {
		return Math.floor(seconds / SECONDS_IN_DAY);
	}

	function hours(seconds) {
		return Math.floor(seconds % SECONDS_IN_DAY / SECONDS_IN_HOUR);
	}
	
	function minutes(seconds) {
		return Math.floor(seconds % SECONDS_IN_HOUR / SECONDS_IN_MINUTE);
	}
	
	function seconds(seconds) {
		return seconds % SECONDS_IN_MINUTE;
	}

}