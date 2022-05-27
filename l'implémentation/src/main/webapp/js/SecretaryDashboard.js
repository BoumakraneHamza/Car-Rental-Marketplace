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
let new_booking_tile = list_add.querySelector(".New_booking");
new_booking_tile.addEventListener("click",function(){
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
function deleteUnBlur(){
	const content = document.querySelector(".content");
	const target = document.querySelector("#booking_completed");
	target.remove();
	content.style.filter="none";
}
function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}
let activities_list = document.querySelector("#schedule_list");
function create_Upcoming_Acts(){
	clearChild(activities_list);
	let keys = Array.from( map.keys());
	for (let i=0;i<keys.length;i++){
		const activity_date = document.createElement("div");
		activity_date.setAttribute("id","activity_date");
		const date = document.createElement("p");
		date.setAttribute("id","date");
		let numericDate = keys[i];
		let ActDate = new Date(numericDate.split("/").reverse().join("/")).toLocaleDateString('en-GB',{
			weekday:'long',
			day:'numeric',
			month:'long',
		});
		date.innerHTML = ActDate;
		activity_date.append(date);
		const activity_list = document.createElement("div");
		activity_list.setAttribute("id","activity_list");
		activities_list.append(activity_date);
		let apptValues = map.get(keys[i]);
		for (let arr in apptValues){
			let ApptArray = apptValues[arr];
			let MeetingDate = ApptArray[1];
			let MTD = new Date(MeetingDate);
			var MTD2 = new Date(MTD.getTime() + 15*60000);
			let StartTime = (MTD.getHours() < 10 ? '0' : '') + MTD.getHours()+":"+(MTD.getMinutes() < 10 ? '0' : '') + (MTD.getMinutes()-1);
			let EndTime = (MTD2.getHours() < 10 ? '0' : '') + MTD2.getHours()+":"+(MTD2.getMinutes() < 10 ? '0' : '') + (MTD2.getMinutes()-1);
			const appt = document.createElement('div');
			appt.setAttribute("id","appt");
			appt.setAttribute("onclick","showProfile(this)");
			const email = document.createElement("input");
			email.setAttribute("type","hidden");
			email.setAttribute("id","client_email");
			email.setAttribute("value",ApptArray[0].email);
			appt.append(email);
			const apptTime = document.createElement('div');
			apptTime.setAttribute("id","time");
			const starttime = document.createElement('p');
			starttime.setAttribute("id","start_time");
			starttime.innerHTML = StartTime;
			apptTime.append(starttime);
			const endtime = document.createElement('p');
			endtime.setAttribute('id','end_time');
			endtime.innerHTML = EndTime;
			apptTime.append(endtime);
			appt.append(apptTime);
			const appt_info = document.createElement("div");
			appt_info.setAttribute("id","appt_info");
			const title = document.createElement('p');
			title.setAttribute('id','title');
			title.innerHTML = "Meeting";
			appt_info.append(title);
			const subtitle = document.createElement('p');
			subtitle.setAttribute('id','subtitle');
			subtitle.innerHTML = ApptArray[0].nom +" "+ApptArray[0].prenom;
			appt_info.append(subtitle);
			appt.append(appt_info);
			const image_wrapper = document.createElement("div");
			image_wrapper.setAttribute("id","image_wrapper");
			const client_image = document.createElement("div");
			client_image.setAttribute("id","client_image");
			const image = document.createElement('img');
			image.style.width="50px";
			image.src="/Atelier"+ApptArray[0].image;
			client_image.append(image);
			image_wrapper.append(client_image);
			appt.append(image_wrapper);
			activity_list.append(appt);
		}
		activities_list.append(activity_list);
	}
}
function getData(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (this.readyState == 4 && this.status == 200) {
			let data = JSON.parse(this.responseText);  
			json = data[0];
			let Upcoming = data[1];
			let firstIndex;
			let n = 0;
			for (let k in Upcoming){
				if (n==0){
					firstIndex = k
				}
				n++;
			}
			let date = new Date(firstIndex).toLocaleDateString('en-GB',{
					day:'numeric',
					month:'numeric',
					year:'numeric',
				});
			let values = []
			let value = [Upcoming[firstIndex] ,firstIndex ];
			values.push(value);
			map = new Map();
			map.set(date,values)
			n=0;
			for (let key in Upcoming){
				if(n>0){
					date = new Date(key).toLocaleDateString('en-GB',{
					day:'numeric',
					month:'numeric',
					year:'numeric',
				});
				if(map.has(date) != true){
					value = [Upcoming[key],key];
					let values = new Array();
					values.push(value);
					map.set(date , values);
				}else{
					let values = map.get(date);
					value = [Upcoming[key],key];
					values.push(value);
					map.set(date,values);
				}
				}
				n++;
			}
			if(map.size>0){
				create_Upcoming_Acts();
			}
		}
	};
	xhr.open("GET","GetMeetings?limit="+3);
	xhr.send();
}
getData();