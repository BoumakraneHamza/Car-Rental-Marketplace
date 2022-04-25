const stat = document.querySelector("#stat").getContext("2d");
	let char1 = new Chart(stat ,{
	type:'bar',
	data:{
		labels:['Sunday','Monday','Tuesday','Wednesday','Thursday','Sunday','Monday'],
		datasets:[{
            label: "completed",
            backgroundColor:'#b8b08d',
			barThickness:30,
			borderRadius: {topLeft: 100, topRight: 0, bottomLeft: 0, bottomRight: 100,}, 
            data: [3,7,4,3,8,2,4]
        },
        {
            label: "active",
			backgroundColor:'#8FC73E',
			barThickness:30,
			borderRadius: {topLeft: 100, topRight: 0, bottomLeft: 0, bottomRight: 100,},
            data: [4,3,5,3,4,2,5]
        },
        {
            label: "pending",
            backgroundColor:'#3d415c',
			barThickness:30,
			borderRadius: {topLeft: 100, topRight: 0, bottomLeft: 0, bottomRight: 100,},
            data: [7,2,6,1,5,3,4]
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
  }).on('drop', function (el) {
    el.className = el.className.replace(' moving', '');
  }).on('over', function (el, container) {
    container.className += ' ex-over';
  }).on('out', function (el, container) {
    container.className = container.className.replace(' ex-over', '');
  });