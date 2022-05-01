var today = new Date();
var d;
var months = new Array();
for(var i = 12; i > 0; i -= 1) {
  d = new Date(today.getFullYear(), today.getMonth() - i, 1);
  months.push(d.toLocaleString('en-US', {month: 'short'}));
}
const Bookings_chart = document.querySelector("#Bookings_chart").getContext("2d");

let char2 = new Chart(Bookings_chart ,{
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
function incNbrRec(i, endNbr, elt) {
  if (i <= endNbr) {
	if (i*100/endNbr <= 70){
		elt.innerHTML = i;
	    setTimeout(function() {//Delay a bit before calling the function again.
	      incNbrRec(i + 1, endNbr, elt);
	    }, 30);
	}else{
		elt.innerHTML = i;
	    setTimeout(function() {//Delay a bit before calling the function again.
	      incNbrRec(i + 1, endNbr, elt);
	    }, 100);
	}
  }
}
let card_1 = document.querySelector("#card_1");
let counter1 = card_1.querySelector("#review_counter_title");
let card_2 = document.querySelector("#card_2");
let counter2 = card_2.querySelector("#review_counter_title");
incNbrRec(0,counter1.innerHTML,counter1);
incNbrRec(0,counter2.innerHTML,counter2);