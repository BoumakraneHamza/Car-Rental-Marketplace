const stat = document.querySelector("#stat").getContext("2d");

var pendingData = [], activeData = [], completedData = [];
for(dayStat of weeklyStat) {
	pendingData.push(dayStat.dailyPending);
	activeData.push(dayStat.dailyActive);
	completedData.push(dayStat.dailyCompleted);
}

let char1 = new Chart(stat ,{
	type:'bar',
	data:{
		labels:['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'],
		datasets:[{
            label: "completed",
            backgroundColor:'#b8b08d',
			barThickness:30,
			borderRadius: {topLeft: 100, topRight: 0, bottomLeft: 0, bottomRight: 100,}, 
            data: completedData
        },
        {
			label: "active",
        	backgroundColor:'#8FC73E',
			barThickness:30,
			borderRadius: {topLeft: 100, topRight: 0, bottomLeft: 0, bottomRight: 100,},
            data: activeData
        },
        {
			label: "pending",
            backgroundColor:'#3d415c',
			barThickness:30,
			borderRadius: {topLeft: 100, topRight: 0, bottomLeft: 0, bottomRight: 100,},
            data: pendingData
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
		fill:true,
		responsive:true,
		maintainAspectRatio: false,
		borderSkipped:false,
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
			grace:'50%',
			},
		},
	}
});

dragula([
	document.getElementById('pending'),
	document.getElementById('active'),
	document.getElementById('completed'),
]) .on('drag', function (el) {
    el.className += ' moving';
  }).on('dragend', function (el) {
    el.className = el.className.replace(' moving', '');
  }).on('over', function (el, container) {
    container.className += ' ex-over';
  }).on('out', function (el, container) {
    container.className = container.className.replace(' ex-over', '');
  });

var today = new Date();
var d;
var months = new Array();
for(var i = 6; i > 0; i -= 1) {
  d = new Date(today.getFullYear(), today.getMonth() - i, 1);
  months.push(d.toLocaleString('en-US', {month: 'short'}));
}
let stat_history = document.querySelector("#stat_history").getContext("2d");
let history_chart = new Chart(stat_history ,{
	type:'line',
	data:{
		labels:months,
		datasets:[{
			label:'Completed',
			borderColor:'#53d991',
			backgroundColor:'#53d991',
			data:Object.values(halfYearStat),
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