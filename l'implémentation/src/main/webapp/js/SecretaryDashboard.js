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
let add_btn = document.querySelector("#add");
let list_add= document.querySelector(".add_client_booking");
add_btn.addEventListener("click",function(){
	if(list_add.style.display=="none"){
		list_add.style.display="flex";
	}
	else{
		list_add.style.display="none"
	}
});
let new_booking_form = document.querySelector(".new_Booking_form");
let cancel = new_booking_form.querySelector("#cancel");
cancel.addEventListener("click",function(e){
	e.preventDefault();
	if(new_booking_form.style.display=="flex"){
		new_booking_form.style.display="none";
	}
});
let new_client_tile = list_add.querySelector(".New_client");
new_client_tile.addEventListener("click",function(){
	if(new_booking_form.style.display=="none"){
		new_booking_form.style.display="flex";
		list_add.style.display="none"
	}
});
new_booking_form.addEventListener("submit",function(e){
	e.preventDefault();
	console.log("submiting");
	let email = new_booking_form.querySelector("#client_email").value;
	let password = new_booking_form.querySelector("#client_password").value;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200){
			new_booking_form.submit();
		}else if(this.status== 404){
			console.log("user not found");
		}
	};
	xhr.open('Get','Authenticate?email='+email+'&password='+password);
	xhr.send();
});