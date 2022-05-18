$(function() {
	$('input[name="range_picker"]').daterangepicker({
	    "startDate": new Date(SearchStartDate),
	    "endDate": new Date(SearchEndDate),
		"minDate": new Date(),
		"opens": "center",
	  });
});