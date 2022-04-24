const stat1 = document.querySelector("#stat1");
let char1 = new Chart(stat1 ,{
	type:'radar',
	data:{
		labels:['Comfort','Cleanliness','Pick_up&Return'],
		datasets:[{
			label:'Reviews',
			data:[
				6,7,3,
			],
		}]
	},
	options:{
		responsive:true,
		maintainAspectRatio: false,
	}
});