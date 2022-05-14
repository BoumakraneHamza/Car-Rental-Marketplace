$(function() {
	$('input[name="range_picker"]').daterangepicker({
		timePicker: true,
		"timePicker24Hour": true,
	    "startDate": new Date(ChangeFormat(SearchStartDate)),
	    "endDate": new Date(ChangeFormat(SearchEndDate)),
		"minDate": new Date(),
		locale: {
	      format: 'MM/DD hh:mm'
	    },
		"opens": "center",
	  });
});
function ChangeFormat(date){
	let dt = new Date(date);
	var mm = dt.getMonth()+1; // getMonth() is zero-based
  	var dd = dt.getDate();

  return [dt.getFullYear(),
          (mm>9 ? '' : '0') + mm,
          (dd>9 ? '' : '0') + dd
         ].join('-');
}
console.log(ChangeFormat(SearchStartDate));
console.log(ChangeFormat(SearchEndDate));