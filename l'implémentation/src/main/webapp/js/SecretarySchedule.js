let nav = 0;
let json;
let map = null;
function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}
let calendar_content = document.querySelector("#calendar_content");
const days_header = document.querySelector('#calendar_sec_header');
function load(){
	clearChild(calendar_content);
	let dt = new Date();
	let currentYear = dt.getFullYear();
	let month;
	let year;
	for(let i=nav;i<5+nav;i++){
		let day_count = document.createElement('div');
		day_count.setAttribute('id','day_count');
		let weekday = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			weekday:'long',
		});
		let day = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			day:'numeric',
			month:'long',
		});
		let NumericDay = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			day:'numeric',
		});
		month = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			month:'long',
		});
		NumericMonth = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			month:'numeric',
		});
		year = new Date(currentYear,dt.getMonth(),dt.getDate()+i).toLocaleDateString('en-GB',{
			year:'numeric',
		});
		if(i == nav){	
			let CurrDate = month +", "+ year;
			let month_year = document.querySelector("#calendar_month");
			month_year.innerHTML = CurrDate;	
		}
		let weektext = document.createElement("p");
		weektext.setAttribute("id","weekday");
		weektext.innerHTML = weekday;
		let day_month = document.createElement("p");
		day_month.setAttribute("id","day_month");
		day_month.innerHTML = day;
		day_count.append(weektext);
		day_count.append(day_month);
		days_header.append(day_count);
		let dayWrapper = document.createElement('div');
		dayWrapper.setAttribute("id","day");
		let day_calendar = document.createElement('div');
		day_calendar.setAttribute("id","day_calendar");
		for (let j=0;j<4;j++){
			let tile = document.createElement('div');
			tile.setAttribute("id","tile");
			let time = document.createElement('p');
			time.setAttribute("id","time");
			let date1 = 8+j;
			let date2 = 8+j+1;
			time.innerHTML = date1+':00 , '+ date2+':00';
			tile.append(time);
			let tile_content = document.createElement('div');
			tile_content.setAttribute("id","tile_content");
			for(let x=0;x<4;x++){
				let y =1;
				let to ;
				let from = year+"-"+NumericMonth+"-"+NumericDay+" "+date1+":"+x*15+":00";
				if((x+1)*15 != 60){
					to = year+"-"+NumericMonth+"-"+NumericDay+" "+date1+":"+(x+1)*15+":00";
				}else{
					to = year+"-"+NumericMonth+"-"+NumericDay+" "+date2+":00"+":00";
				}
				//this inner loop verifies if a value is compatible with the tile values
				for(let key in json){
					let meetingDate = new Date(key);
					if (meetingDate > new Date(from) && meetingDate < new Date(to)){
						let sub_tile = document.createElement("div");
						sub_tile.setAttribute("id","sub_title");
						let appt = document.createElement('div');
						appt.setAttribute("id",'appt');
						let appt_info = document.createElement('div');
						appt_info.setAttribute('id','appt_info');
						let title = document.createElement('p');
						title.setAttribute('id','title');
						title.innerHTML = json[key].meetingType;
						appt_info.append(title);
						let subtitle = document.createElement('p');
						subtitle.setAttribute('id','subtitle');
						subtitle.innerHTML = json[key].client.nom + json[key].client.prenom;
						appt_info.append(subtitle);
						appt.append(appt_info);
						let appt_image = document.createElement('div');
						appt_image.setAttribute('id','appt_image');
						let image = document.createElement('img');
						image.src = '/Atelier'+json[key].client.image;
						image.style.width="30px";
						appt_image.append(image);
						appt.append(appt_image);
						sub_tile.setAttribute("onclick","selectSubTile(this)");
						let hiddenInput = document.createElement("input");
						hiddenInput.setAttribute("id","subTile_date");
						hiddenInput.setAttribute("type","hidden");
						hiddenInput.value = new Date(from).toLocaleString("en-GB",{
							year:"numeric",
							month:"long",
							day:"numeric",
							hour:"2-digit",
							minute:"2-digit"
						}).toString();
						sub_tile.append(hiddenInput);
						sub_tile.append(appt);
						tile_content.append(sub_tile);
						delete json[key];
						y = 0;
						break;
					}
				}
				if(y == 1){
					let sub_tile = document.createElement("div");
					sub_tile.setAttribute("id","sub_title");
					sub_tile.setAttribute("onclick","selectSubTile(this)");
					let hiddenInput = document.createElement("input");
					hiddenInput.setAttribute("id","subTile_date");
					hiddenInput.setAttribute("type","hidden");
					hiddenInput.value = new Date(from).toLocaleString("en-GB",{
						year:"numeric",
						month:"long",
						day:"numeric",
						hour:"2-digit",
						minute:"2-digit"
					}).toString();
					sub_tile.append(hiddenInput);
					tile_content.append(sub_tile);
				}
			}
			tile.append(tile_content);
			day_calendar.append(tile);
		}
		for (let j=0;j<4;j++){
			let tile = document.createElement('div');
			tile.setAttribute("id","tile");
			let time = document.createElement('p');
			time.setAttribute("id","time");
			let date1 = 13+j;
			let date2 = 13+j+1;
			time.innerHTML = date1+':00 , '+ date2+':00';
			tile.append(time);
			let tile_content = document.createElement('div');
			tile_content.setAttribute("id","tile_content");
			for(let x=0;x<4;x++){
				let y =1;
				let to ;
				let from = year+"-"+NumericMonth+"-"+NumericDay+" "+date1+":"+x*15+":00";
				if((x+1)*15 != 60){
					to = year+"-"+NumericMonth+"-"+NumericDay+" "+date1+":"+(x+1)*15+":00";
				}else{
					to = year+"-"+NumericMonth+"-"+NumericDay+" "+date2+":00"+":00";
				}
				//this inner loop verifies if a value is compatible with the tile values
				for(let key in json){
					let meetingDate = new Date(key);
					if (meetingDate > new Date(from) && meetingDate < new Date(to)){
						let sub_tile = document.createElement("div");
						sub_tile.setAttribute("id","sub_title");
						let appt = document.createElement('div');
						appt.setAttribute("id",'appt');
						let appt_info = document.createElement('div');
						appt_info.setAttribute('id','appt_info');
						let title = document.createElement('p');
						title.setAttribute('id','title');
						title.innerHTML = json[key].meetingType;
						appt_info.append(title);
						let subtitle = document.createElement('p');
						subtitle.setAttribute('id','subtitle');
						subtitle.innerHTML = json[key].client.nom + json[key].client.prenom;
						appt_info.append(subtitle);
						appt.append(appt_info);
						let appt_image = document.createElement('div');
						appt_image.setAttribute('id','appt_image');
						let image = document.createElement('img');
						image.src = '/Atelier'+json[key].client.image;
						image.style.width="30px";
						appt_image.append(image);
						appt.append(appt_image);
						sub_tile.setAttribute("onclick","selectSubTile(this)");
						let hiddenInput = document.createElement("input");
						hiddenInput.setAttribute("id","subTile_date");
						hiddenInput.setAttribute("type","hidden");
						hiddenInput.value = new Date(from).toLocaleString("en-GB",{
							year:"numeric",
							month:"long",
							day:"numeric",
							hour:"2-digit",
							minute:"2-digit"
						}).toString();
						sub_tile.append(hiddenInput);
						sub_tile.append(appt);
						tile_content.append(sub_tile);
						delete json[key];
						y = 0;
						break;
					}
				}
				if(y == 1){
					let sub_tile = document.createElement("div");
					sub_tile.setAttribute("id","sub_title");
					sub_tile.setAttribute("onclick","selectSubTile(this)");
					let hiddenInput = document.createElement("input");
					hiddenInput.setAttribute("id","subTile_date");
					hiddenInput.setAttribute("type","hidden");
					hiddenInput.value = new Date(from).toLocaleString("en-GB",{
						year:"numeric",
						month:"long",
						day:"numeric",
						hour:"2-digit",
						minute:"2-digit"
					}).toString();
					sub_tile.append(hiddenInput);
					tile_content.append(sub_tile);
				}
			}
			tile.append(tile_content);
			day_calendar.append(tile);
		}
		dayWrapper.append(day_calendar);
		calendar_content.append(dayWrapper);
	}
}
function selectSubTile(element){
	let confirm = document.querySelector(".confirmMeetingSelection");
	if(element.childNodes.length === 1){
		document.querySelector("#calendar_content").querySelectorAll("#sub_title").forEach((sub)=>{
			sub.style.border = "none";
		});
		offsets = element.getBoundingClientRect();
		let date = new Date(element.querySelector("#subTile_date").value);
		confirm.querySelector("#Date_time").innerHTML = date.toLocaleString("en-GB",{
			day:"numeric",
			month:"long",
			year:"numeric",
			hour:"2-digit",
			minute:"2-digit",
		});
		confirm.style.top = (offsets.top - confirm.clientHeight - 20)+"px";
		confirm.style.left = (offsets.left)+"px";
		element.style.border = "3px solid blue";
		confirm.style.display="flex";
	}
}
function hideConfirmMeetingSelection(){
	let confirm = document.querySelector(".confirmMeetingSelection");
	confirm.style.display = "none";
}
function selectConfirmMeetingType(element){
	let confirm = document.querySelector(".confirmMeetingSelection");
	confirm.querySelectorAll(".option").forEach((option)=>{
		option.classList.remove("selected");
	});
	element.classList.add("selected");
	confirm.querySelector("#selected_Option").value = element.querySelector("p").innerHTML;
}
function initButtons(){
	document.querySelector("#back").addEventListener("click",function(){
		nav--;
		clearChild(days_header);
		clearChild(calendar_content);
		getData();
	});
	document.querySelector("#today").addEventListener("click",function(){
		nav=0;
		clearChild(days_header);
		clearChild(calendar_content);
		getData();
	});
	document.querySelector("#next").addEventListener("click",function(){
		nav++;
		clearChild(days_header);
		clearChild(calendar_content);
		getData();
	});
	
}
const activities_list = document.querySelector("#activities_list");
function create_Upcoming_Acts(){
	let keys = Array.from(map.keys());
	clearChild(activities_list);
	console.log(keys);
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
		console.log(apptValues);
		for (let arr in apptValues){
			let ApptArray = apptValues[arr];
			let MeetingDate = ApptArray[1];
			let MTD = new Date(MeetingDate);
			var MTD2 = new Date(MTD.getTime() + 15*60000);
			let StartTime = (MTD.getHours() < 10 ? '0' : '') + MTD.getHours()+":"+(MTD.getMinutes() < 10 ? '0' : '') + (MTD.getMinutes()-1);
			let EndTime = (MTD2.getHours() < 10 ? '0' : '') + MTD2.getHours()+":"+(MTD2.getMinutes() < 10 ? '0' : '') + (MTD2.getMinutes()-1);
			const appt = document.createElement('div');
			appt.setAttribute("id","appt");
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
			title.innerHTML = ApptArray[0].meetingType;
			appt_info.append(title);
			const subtitle = document.createElement('p');
			subtitle.setAttribute('id','subtitle');
			subtitle.innerHTML = ApptArray[0].client.nom +" "+ApptArray[0].client.prenom;
			appt_info.append(subtitle);
			appt.append(appt_info);
			const image_wrapper = document.createElement("div");
			image_wrapper.setAttribute("id","image_wrapper");
			const client_image = document.createElement("div");
			client_image.setAttribute("id","client_image");
			const image = document.createElement('img');
			image.style.width="50px";
			image.src="/Atelier"+ApptArray[0].client.image;
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
			console.log(data);
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
			load();
		}
	};
	xhr.open("GET","MeetingsManagement?limit="+4);
	xhr.send();
}
$( document ).ready(function() {
	clearChild(days_header);
	clearChild(calendar_content);
	getData();
	initButtons();
});
dragElement(document.querySelector(".confirmMeetingSelection"));

function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.querySelector(".confirmMeetingSelection").querySelector("#tab_header")) {
    /* if present, the header is where you move the DIV from:*/
	console.log("dragging");
    document.querySelector(".confirmMeetingSelection").querySelector("#tab_header").onmousedown = dragMouseDown;
  } else {
    /* otherwise, move the DIV from anywhere inside the DIV:*/
    elmnt.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    /* stop moving when mouse button is released:*/
    document.onmouseup = null;
    document.onmousemove = null;
  }
}
function bookMeeting(){
	let confirm = document.querySelector(".confirmMeetingSelection");
	let meeting_Date = confirm.querySelector("#Date_time").innerHTML;
	let client_email = confirm.querySelector("#client_email").value;
	let day = new Date(meeting_Date).toLocaleString("en-GB",{
		day:"numeric",
	});
	let month = new Date(meeting_Date).toLocaleString("en-GB",{
		month:"numeric",
	});
	if(month<10){month = "0" +month;}
	let year = new Date(meeting_Date).toLocaleString("en-GB",{
		year:"numeric",
	});
	let hours = new Date(new Date(meeting_Date).getTime() + 60000).toLocaleString("en-GB",{
		hour:"2-digit",
		minute:"2-digit",
	});
	let option = confirm.querySelector("#selected_Option").value;
	let date = year+"-"+month+"-"+ day +" "+ hours+":00";
	let params = "required_action=add_meeting&client_email="+client_email+"&meeting_Date="+date+"&meeting_type="+option;
	let xhr = new XMLHttpRequest();
	xhr.onload = ()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			let json = JSON.parse(xhr.responseText);
			console.log(json);
			let appt = document.createElement('div');
			appt.setAttribute("id",'appt');
			let appt_info = document.createElement('div');
			appt_info.setAttribute('id','appt_info');
			let title = document.createElement('p');
			title.setAttribute('id','title');
			title.innerHTML = "Meeting";
			appt_info.append(title);
			let subtitle = document.createElement('p');
			subtitle.setAttribute('id','subtitle');
			subtitle.innerHTML = json.nom + json.prenom;
			appt_info.append(subtitle);
			appt.append(appt_info);
			let appt_image = document.createElement('div');
			appt_image.setAttribute('id','appt_image');
			let image = document.createElement('img');
			image.src = '/Atelier'+json.image;
			image.style.width="30px";
			appt_image.append(image);
			appt.append(appt_image);
			let selectedElement;
			let subs = document.querySelector("#calendar_content").querySelectorAll("#sub_title");
			for(let i=0; i<subs.length;i++){
				let sub = subs[i];
				if(sub.style.border == "3px solid blue"){
					selectedElement = sub;
					sub.style.border ="none";
					break;
				}
			}
			selectedElement.append(appt);
			confirm.style.display="none";
		}
	}
	xhr.open("Post","MeetingsManagement");
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send(params);
}