const Bookings_chart = document.querySelector("#booking_chart").getContext("2d");

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
		
		//borderJoinStyle: 'round',
		lineTension: 0.3,
	},
});