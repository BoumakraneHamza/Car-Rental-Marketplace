var today = new Date();
var d;
var months = new Array();
for(var i = 6; i > 0; i -= 1) {
  d = new Date(today.getFullYear(), today.getMonth() - i, 1);
  months.push(d.toLocaleString('en-US', {month: 'short'}));
}
let stat_history = document.querySelector("#score_history").getContext("2d");
let history_chart = new Chart(stat_history ,{
	type:'line',
	data:{
		labels:months,
		datasets:[{
			label:'Score',
			borderColor:'#53d991',
			backgroundColor:'#53d991',
			data:[
				1,2,4,2,5,6,3
			],
		}]
	},
	options:{
		plugins:{
			legend:{
				labels:{
					usePointStyle:true,
					pointStyle:'circle',
				}
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
	}
});