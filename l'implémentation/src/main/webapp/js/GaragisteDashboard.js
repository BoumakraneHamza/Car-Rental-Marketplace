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
function randomColorArray(len) {
	let arr = [];
	for (let i = 0; i < len; i++) {
		var r = Math.floor(Math.random() * 255);
		var g = Math.floor(Math.random() * 255);
		var b = Math.floor(Math.random() * 255);
		arr.push("rgb(" + r + "," + g + "," + b + ")");
	}
	return arr;
}
const stat1 = document.querySelector("#stat1");
let char1 = new Chart(stat1 ,{
	type:'doughnut',
	data:{
		labels:Object.keys(stat1Data),
		datasets:[{
			label:'active hours',
			data:Object.values(stat1Data),
			backgroundColor:randomColorArray(Object.keys(stat1Data).length),
			hoverOffset: 6,
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
			data:[6,7,3],
			backgroundColor: [
		      '#8fc73e',
		      '#527c85',
		      '#9cb5ba',
			  '#B56576',
			  '#E56B6F',
		    ],
			hoverOffset: 6,
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
		labels:Object.keys(stat3Data),
		datasets:[{
			label:'active hours',
			data:Object.values(stat3Data),
			backgroundColor: [
		      '#8fc73e',
		      '#527c85',
		      '#9cb5ba',
			  '#B56576',
			  '#E56B6F',
		    ],
			hoverOffset: 6,
		}]
	},
	options:{
		responsive:true,
		maintainAspectRatio: false,
	}
});
function showProfile(){
	const User_Banner = document.querySelector(".User_Banner");
	const banner_wrapper = document.querySelector(".banner_wrapper");
	banner_wrapper.style.display="block";
	User_Banner.classList.toggle("active");
}