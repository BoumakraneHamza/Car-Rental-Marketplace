var today = new Date();
var d;
var months = new Array();
for(var i = 12; i > 0; i -= 1) {
  d = new Date(today.getFullYear(), today.getMonth() - i, 1);
  months.push(d.toLocaleString('en-US', {month: 'short'}));
}
const visitor_chart = document.querySelector("#visitors").querySelector("#stat").getContext("2d");

let chart1 = new Chart(visitor_chart ,{
	type:'line',
	data:{
		labels:months,
		datasets:[{
			label:'Booking',
			borderColor:'#53d991',
			backgroundColor:'#53d991',
			data:[
				60,45,70,80,55,90,35,75,60,45,70,80
			],
		}]
	},
	options:{
		plugins:{
			legend:{
				display: false,
			}
		},
		responsive:true,
		maintainAspectRatio: false,
		scales: {
		    x: {
		      grid: {
		        display: false,
		      },
			},
			y: {
		      grid: {
		        color:'#E4E4E4',
		      },
			beginAtZero:true,
			grace:'10%',
			},
		},
	},
});
const booking_chart = document.querySelector("#bookings").querySelector("#stat").getContext("2d");

let chart2 = new Chart(booking_chart ,{
	type:'line',
	data:{
		labels:months,
		datasets:[{
			label:'Booking',
			borderColor:'#53d991',
			backgroundColor:'#53d991',
			data:[
				60,45,70,80,55,90,35,75,60,45,70,80
			],
		}]
	},
	options:{
		plugins:{
			legend:{
				display: false,
			}
		},
		responsive:true,
		maintainAspectRatio: false,
		scales: {
		    x: {
		      grid: {
		        display: false,
		      },
			},
			y: {
		      grid: {
		        color:'#E4E4E4',
		      },
			beginAtZero:true,
			grace:'10%',
			},
		},
	},
});