const stat1 = document.querySelector("#stat1").getContext("2d");
const sidebar = document.querySelector(".sidebar");
function showStat(element){
	sidebar.style.display="flex";
	let char1 = new Chart(stat1 ,{
	type:'radar',
	data:{
		labels:['Comfort','Cleanliness','Pick_up&Return'],
		datasets:[{
			label:'Reviews',
			data:[
				6,7,3,
			],
			backgroundColor:'rgba(177, 150, 234, 0.2)',
			borderColor:'rgb(177, 150, 234)',
			pointBorderColor: '#fff',
   			pointHoverBackgroundColor: '#fff',
    		pointHoverBorderColor: 'rgb(177, 150, 234)',
		}]
	},
	options:{
		fill:true,
		responsive:true,
		maintainAspectRatio: false,
	}
});
}
function hideStat(){
	sidebar.style.display="none";
}