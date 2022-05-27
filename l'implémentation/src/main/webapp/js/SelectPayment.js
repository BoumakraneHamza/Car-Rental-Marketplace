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
		let cta = document.createElement("div");
		cta.setAttribute("id","cta");
		let confirm = document.createElement("button");
		confirm.setAttribute("id","confirm");
		confirm.innerHTML = "confirm";
		let custom = document.createElement("button");
		custom.setAttribute("id","custom");
		custom.setAttribute("onclick","selectCustom()");
		custom.innerHTML = "custom";
		cta.append(confirm);
		cta.append(custom);
		mapPopUp.append(cta);
		L.marker([offices[i].lat, offices[i].lon],{icon: marker}).addTo(map).bindPopup(mapPopUp);
	}
}
let calendar_content = document.querySelector(".selectCustomDate").querySelector(".tab_content");
let nav =0;
function load(){
	let dt = new Date();
	let currentYear = dt.getFullYear();
	let month;
	let year;
	for(let i=nav;i<4+nav;i++){
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
			let from = year+"-"+NumericMonth+"-"+NumericDay+" "+date1+":00"+":00";
			let to = year+"-"+NumericMonth+"-"+NumericDay+" "+date2+":00"+":00";
			time.innerHTML = date1+':00 , '+ date2+':00';
			tile.append(time);
			let tile_content = document.createElement('div');
			tile_content.setAttribute("id","tile_content");
			for(let key in json){
				let meetingDate = new Date(key);
				if (meetingDate >= new Date(from) && meetingDate <= new Date(to)){
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
					subtitle.innerHTML = json[key].nom + json[key].prenom;
					appt_info.append(subtitle);
					appt.append(appt_info);
					let appt_image = document.createElement('div');
					appt_image.setAttribute('id','appt_image');
					let image = document.createElement('img');
					image.src = '/Atelier'+json[key].image;
					image.style.width="30px";
					appt_image.append(image);
					appt.append(appt_image);
					tile_content.append(appt);
					delete json[key];
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
			let from = year+"-"+NumericMonth+"-"+NumericDay+" "+date1+":00"+":00";
			let to = year+"-"+NumericMonth+"-"+NumericDay+" "+date2+":00"+":00";
			time.innerHTML = date1+':00 , '+ date2+':00';
			tile.append(time);
			let tile_content = document.createElement('div');
			tile_content.setAttribute("id","tile_content");
			for(let key in json){
				let meetingDate = new Date(key);
				if (meetingDate >= new Date(from) && meetingDate <= new Date(to)){
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
					subtitle.innerHTML = json[key].nom + json[key].prenom;
					appt_info.append(subtitle);
					appt.append(appt_info);
					let appt_image = document.createElement('div');
					appt_image.setAttribute('id','appt_image');
					let image = document.createElement('img');
					image.src = '/Atelier'+json[key].image;
					image.style.width="30px";
					appt_image.append(image);
					appt.append(appt_image);
					tile_content.append(appt);
					delete json[key];
				}
			}
			tile.append(tile_content);
			day_calendar.append(tile);
		}
		dayWrapper.append(day_calendar);
		calendar_content.append(dayWrapper);
		
	}
}
let json;
function getData(){
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
	xhr.open("GET","GetMeetings?email = s01@email.com");
	xhr.send();
}
getData();
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
function selectCustom(){
	if(document.querySelector(".selectCustomDate").style.display=="none"){
		document.querySelector(".selectCustomDate").style.display = "flex";
	}else{
		document.querySelector(".selectCustomDate").style.display = "none";
	}
}