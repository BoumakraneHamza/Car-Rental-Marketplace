window.addEventListener('load', function () {
  document.getElementsByTagName("body")[0].style.display="block";
})
function selectTab(element){
	let tabs = document.querySelector("#tabs").querySelectorAll(".tab");
	tabs.forEach((tab)=>{
		if(tab.classList.contains("active")){
			tab.classList.remove("active");
		}
	});
	element.classList.toggle("active");
	if(element.innerHTML == "Pay Now"){
		document.querySelector(".tabs_content").querySelector("#payment-form").style.visibility="visible";
		document.querySelector(".tabs_content").querySelector("#createMeeting").style.visibility="hidden";
	}else{
		document.querySelector(".tabs_content").querySelector("#payment-form").style.visibility="hidden";
		document.querySelector(".tabs_content").querySelector("#createMeeting").style.visibility="visible";
	}
}
function createSelectMap(mapWrapper,lat,lon,offices,size){
	let res = document.querySelector("#reservation_id_selected_payment").value;
	console.log(offices);
	map = L.map(mapWrapper, {
	    center: [lat, lon],
		zoom: 8,
		attributionControl:false,
	});
	L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	}).addTo(map);
	var marker = L.icon({
	    iconUrl: contextPath+'/assets/marker-icon.svg',
	    iconSize: [30, 30],
	});
	for(let i=0;i<size;i++){
		let mapPopUp = document.createElement("div");
		mapPopUp.setAttribute("id","mapPopUp");
		let secretaryHeader = document.createElement("div");
		secretaryHeader.setAttribute("id","secretaryHeader");
		let imageWrapper = document.createElement("div");
		imageWrapper.setAttribute("id","imageWrapper");
		let image = document.createElement("img");
		image.setAttribute("style","width: 60px;object-fit: cover;height: 60px;")
		image.src = "/Atelier"+offices[i]["employee"]["image"];
		imageWrapper.append(image);
		secretaryHeader.append(imageWrapper);
		let secretaryInfo = document.createElement("div");
		secretaryInfo.setAttribute("id","secretaryInfo");
		let secretaryName = document.createElement("p");
		secretaryName.innerHTML = offices[i]["employee"]["nom"] +" "+ offices[i]["employee"]["prenom"];
		secretaryInfo.append(secretaryName);
		let secretaryRating = document.createElement("div");
		secretaryRating.setAttribute("id","rating");
		let star = document.createElement("img");
		star.style.width = "14px;"
		star.src = "/Atelier/assets/star.svg";
		secretaryRating.append(star);
		let rating = document.createElement("p");
		rating.innerHTML = "5.0";
		secretaryRating.append(rating);
		secretaryInfo.append(secretaryRating);
		secretaryHeader.append(secretaryInfo);
		mapPopUp.append(secretaryHeader);
		let Meetingtitle = document.createElement("p");
		Meetingtitle.setAttribute("id","meetingTitle");
		Meetingtitle.innerHTML = "Available Time";
		mapPopUp.append(Meetingtitle);
		let meetingWrapper = document.createElement("div");
		meetingWrapper.setAttribute("id","meeting_wrapper");
		let meetingDate =document.createElement("p");
		let dateTime = new Date(offices[i]["AvailableTime"]).toLocaleString("en-GB",{
			day:"numeric",
			month:"long",
			year:"numeric",
			hour:"2-digit",
			minute:"2-digit"
		});
		meetingDate.innerHTML = dateTime;
		meetingWrapper.append(meetingDate);
		mapPopUp.append(meetingWrapper);
		let cta = document.createElement("form");
		cta.setAttribute("id","cta");
		cta.setAttribute("action","PaymentManager");
		cta.setAttribute("method","GET");
		let status = document.createElement("input");
		status.setAttribute("type","hidden");
		status.setAttribute("name","status");
		status.setAttribute("id","status");
		let reservationId = document.createElement("input");
		reservationId.setAttribute("name","reservationId");
		reservationId.setAttribute("id","reservationId");
		reservationId.setAttribute("type","hidden");
		reservationId.setAttribute("value",res);
		cta.append(status);
		cta.append(reservationId);
		let confirm = document.createElement("button");
		confirm.setAttribute("id","confirm");
		confirm.innerHTML = "confirm";
		confirm.setAttribute("onclick","bookMeeting(this)");
		let custom = document.createElement("button");
		custom.setAttribute("id","custom");
		custom.setAttribute("onclick","selectCustom(this)");
		custom.innerHTML = "custom";
		let sec_email = document.createElement("input");
		sec_email.setAttribute("type","hidden");
		sec_email.setAttribute("id","sec_email");
		sec_email.value = offices[i]["employee"]["email"];
		let MeetingdateInput = document.createElement("input");
		MeetingdateInput.setAttribute("type","hidden");
		MeetingdateInput.setAttribute("id","MeetingdateInput");
		MeetingdateInput.value = new Date(offices[i]["AvailableTime"]).toLocaleString("en-GB",{
			day:"numeric",
			month:"long",
			year:"numeric",
			hour:"2-digit",
			minute:"2-digit"
		});
		cta.append(sec_email);
		cta.append(MeetingdateInput);
		cta.append(confirm);
		cta.append(custom);
		mapPopUp.append(cta);
		L.marker([offices[i].lat, offices[i].lon],{icon: marker}).addTo(map).bindPopup(mapPopUp);
	}
}
let calendar_content = document.querySelector(".selectCustomDate").querySelector(".tab_content");
let nav =0;
function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}
function load(){
	let dt = new Date();
	let currentYear = dt.getFullYear();
	let month;
	let year;
	let sec_header = document.querySelector("#secondary_header");
	clearChild(sec_header);
	clearChild(calendar_content);
	for(let i=nav;i<4+nav;i++){
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
		let day_header = document.createElement("div");
		day_header.setAttribute("id","dayHeader");
		let day_name = document.createElement("p");
		day_name.innerHTML = weekday;
		day_header.append(day_name);
		let day_count = document.createElement("p");
		day_count.innerHTML = NumericDay;
		day_header.append(day_count);
		let borderBottom = document.createElement("div");
		borderBottom.setAttribute("id","borderBottom"); 
		day_header.append(borderBottom);
		sec_header.append(day_header);
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
				for(let key in json){
					let meetingDate = new Date(json[key]);
					if (meetingDate > new Date(from) && meetingDate < new Date(to)){
						let sub_tile = document.createElement("div");
						sub_tile.setAttribute("id","sub_title");
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
						let appt = document.createElement('div');
						appt.setAttribute("id",'appt');
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
					sub_tile.setAttribute("onclick","selectSubTile(this)");
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
				for(let key in json){
					let meetingDate = new Date(json[key]);
					if (meetingDate > new Date(from) && meetingDate < new Date(to)){
						let sub_tile = document.createElement("div");
						sub_tile.setAttribute("id","sub_title");
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
						let appt = document.createElement('div');
						appt.setAttribute("id",'appt');
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
		document.querySelector(".selectCustomDate").querySelector(".tab_content").querySelectorAll("#sub_title").forEach((sub)=>{
			sub.style.border = "none";
		});
		offsets = element.getBoundingClientRect();
		let date = new Date(element.querySelector("#subTile_date").value);
		confirm.querySelector("#date_day").innerHTML = date.toLocaleString("en-GB",{
			day:"numeric",
			month:"long",
			year:"numeric",
		});
		confirm.querySelector("#date_time").innerHTML = date.toLocaleString("en-GB",{
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
let json;
function getData(email){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (this.readyState == 4 && this.status == 200) {
			let data = JSON.parse(this.responseText);
			json = data;
			console.log(json);
			n=0;
			load();
		}
	};
	xhr.open("GET","MeetingsManagement?secretary_email="+email);
	xhr.send();
}
function show_select_location(element){
	let reservationId = element.parentNode.querySelector("#reservationID").value;
	let xhr =new XMLHttpRequest();
	xhr.onload = ()=>{
		if(xhr.status==200 && xhr.readyState == 4){
			let data = JSON.parse(xhr.responseText);
			let json = data["0"];
			let size = data["1"];
			document.querySelector(".view_Location").style.display="block";
			createSelectMap(document.querySelector(".view_Location").querySelector("#select_map_wrapper"),35,5,json,size);
		}
	}
	xhr.open("POST","BookingManagement");
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send("required_action=get_offices&reservation_id="+reservationId);
}
function closeSelectMap(){
	document.querySelector(".view_Location").style.display="none";
}
function selectCustom(element,e){
	e = window.event;
	e.preventDefault();
	if(document.querySelector(".selectCustomDate").style.display=="none"){
		let email = element.parentNode.querySelector("#sec_email").value;
		document.querySelector(".selectCustomDate").style.display = "flex";
		getData(email);
	}else{
		document.querySelector(".selectCustomDate").style.display = "none";
	}
}
let confirmation = document.querySelector(".confirmMeetingSelection");
function ConfirmMeeting(){
	let date = confirmation.querySelector("#date_day").innerHTML +" "+confirmation.querySelector("#date_time").innerHTML;
	let dt = new Date(date).toLocaleString("en-GB",{
		day:"numeric",
		month:"long",
		year:"numeric",
		hour:"2-digit",
		minute:"2-digit"
	});
	confirmation.style.display="none";
	document.querySelector(".selectCustomDate").style.display="none";
	clearChild(document.querySelector("#mapPopUp").querySelector("#meeting_wrapper"));
	document.querySelector("#mapPopUp").querySelector("#meeting_wrapper").innerHTML = dt;
	document.querySelector("#mapPopUp").querySelector("#MeetingdateInput").value = dt;
}
function bookMeeting(element,e){
	e = window.event;
	e.preventDefault();
	let sec_email = element.parentNode.querySelector("#sec_email").value;
	let meeting_Date = element.parentNode.querySelector("#MeetingdateInput").value;
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
	let hours = new Date(meeting_Date).toLocaleString("en-GB",{
		hour:"2-digit",
		minute:"2-digit",
	});
	let date = year+"-"+month+"-"+ day +" "+ hours+":00";
	let res = document.querySelector("#reservation_id_selected_payment").value;
	let params = "sec_email="+sec_email+"&meeting_Date="+date+"&reservation="+res;
	let xhr = new XMLHttpRequest();
	xhr.onload = ()=>{
		document.querySelector("#mapPopUp").querySelector("#cta").submit();
	}
	xhr.open("Post","MeetingsManagement");
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send(params);
}