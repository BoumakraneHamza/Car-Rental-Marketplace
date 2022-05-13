$(function() {
	$('input[name="range_picker"]').daterangepicker({
	    startDate: moment().startOf('hour'),
	    endDate: moment().startOf('hour').add(32, 'hour'),
		"minDate": new Date(),
	  });
});