const Performance_chart = document.querySelector("#Performance_chart").getContext("2d");
let char1 = new Chart(Performance_chart ,{
	type:'bar',
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
const Bookings_chart = document.querySelector("#Bookings_chart").getContext("2d");

let char2 = new Chart(Bookings_chart ,{
	type:'line',
	data:{
		labels:['Sun',"Mon","Tue","Wed","Thu","Fri","Sat"],
		datasets:[{
			label:'Bookings',
			data:[
				1,2,4,2,5,6,3
			],
		}]
	},
	options:{
		responsive:true,
		maintainAspectRatio: false,
		//borderJoinStyle: 'round',
		lineTension: 0.3,
	}
});
