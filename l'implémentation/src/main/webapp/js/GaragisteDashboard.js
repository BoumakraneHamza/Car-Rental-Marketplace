$(function() {
  $('input[name="range_picker"]').daterangepicker({
    timePicker: true,
    startDate: moment().startOf('hour'),
    endDate: moment().startOf('hour').add(32, 'hour'),
    locale: {
      format: 'M/DD hh:mm A'
    }
  });
});
const stat1 = document.querySelector("#stat1");
let char1 = new Chart(stat1 ,{
	type:'doughnut',
	data:{
		labels:['Hamza','Oussama','Nathanial'],
		datasets:[{
			label:'active hours',
			data:[
				6,7,3
			],
		}]
	},
	options:{
		responsive:true,
		maintainAspectRatio: false,
	}
});
const stat2 = document.querySelector("#stat2");
let char2 = new Chart(stat2 ,{
	type:'doughnut',
	data:{
		labels:['Hamza','Oussama','Nathanial'],
		datasets:[{
			label:'active hours',
			data:[
				6,7,3
			],
		}]
	},
	options:{
		responsive:true,
		maintainAspectRatio: false,
	}
});
const stat3 = document.querySelector("#stat3");
let char3 = new Chart(stat3 ,{
	type:'doughnut',
	data:{
		labels:['Hamza','Oussama','Nathanial'],
		datasets:[{
			label:'active hours',
			data:[
				6,7,3
			],
		}]
	},
	options:{
		responsive:true,
		maintainAspectRatio: false,
	}
});