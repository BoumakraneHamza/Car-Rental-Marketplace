let i = 1;
let card_number = document.querySelector("#card_number");
let ccv = document.querySelector(".ccv");
let ClientName = document.querySelector("#holder_card");
ClientName.addEventListener("input",()=>{
	let input = ClientName.value.slice(ClientName.value.length-1, ClientName.value.length);
	if(isNaN(input)==false && input != " "){
		ClientName.value = ClientName.value.substring(0,ClientName.value.length-1);
	}
});
ccv.addEventListener("input",()=>{
	if(isNaN(ccv.value.slice(ccv.value.length-1, 4))==false){
		if (ccv.value.length > 4){
			ccv.value = ccv.value.slice(0, 4);
		}
	}else{
		ccv.value = ccv.value.substring(0,ccv.value.length-1);
	}
});
card_number.addEventListener("input",()=>{
	console.log(card_number.value.slice(card_number.value.length-1, 25));
	console.log(i);
	if(isNaN(card_number.value.slice(card_number.value.length-1, 25))==false){
		if (card_number.value.length > 25){
			card_number.value = card_number.value.slice(0, 25);
		}else if (i == 4){
			card_number.value = card_number.value + ' - ',
			i=1;
		}else{
			i++;
		} 
	}else{
		card_number.value = card_number.value.substring(0,card_number.value.length-1);
	}
});
function selectTab(element){
	let tabs = document.querySelector("#tabs").querySelectorAll(".tab");
	tabs.forEach((tab)=>{
		if(tab.classList.contains("active")){
			tab.classList.remove("active");
		}
	});
	element.classList.toggle("active");
	if(element.innerHTML == "Pay Now"){
		document.querySelector(".tabs_content").querySelector(".pay_info_form").style.visibility="visible";
		document.querySelector(".tabs_content").querySelector("#createMeeting").style.visibility="hidden";
	}else{
		document.querySelector(".tabs_content").querySelector(".pay_info_form").style.visibility="hidden";
		document.querySelector(".tabs_content").querySelector("#createMeeting").style.visibility="visible";
	}
}
function createSelectMap(mapWrapper,lat,lon){
	map = L.map(mapWrapper, {
	    center: [lat, lon],
		zoom: 8,
		attributionControl:false,
	});
	L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	}).addTo(map);
	var marker = L.icon({
	    iconUrl: contextPath+'/assets/map-marker.svg',
	    iconSize: [17, 40],
	});
	L.marker([lat, lon],{icon: marker}).addTo(map);
	map.on('click', function(e) {
		map.eachLayer((layer) => {
		     if(layer['_latlng']!=undefined)
		         layer.remove();
		 });
		L.marker([e.latlng.lat, e.latlng.lng],{icon: marker}).addTo(map);
		$.getJSON("https://nominatim.openstreetmap.org/reverse?format=json&lat="+e.latlng.lat+"&lon="+e.latlng.lng,(data)=>{
			let inputs_wrapper = mapWrapper.parentNode.querySelector("#inputs_wrapper");
			let location ;
			if (data.address.state != undefined){
				location = data.address.state + " "+ data.address.country;
			}else{
				location = data.address.state_district + " "+ data.address.country;
			}
			
			var arabic = /[\u0600-\u06FF]/;
			if(data.address.county != undefined){
				if (arabic.test(data.address.county)){
					inputs_wrapper.value = location;
				}else{
					location = data.address.county +" "+ location; 
				}
			}
			inputs_wrapper.value = location;
			if(mapWrapper == document.querySelector(".view_Location").querySelector("#select_map_wrapper")){
				edit_asset.querySelector("#lat").value = data.lat;
				edit_asset.querySelector("#lon").value = data.lon;
			}else{
				lat_input.value = data.lat;
				lon_input.value = data.lon;
			}
		});
	});
}
function show_select_location(){
	document.querySelector(".view_Location").style.display="block";
	createSelectMap(document.querySelector(".view_Location").querySelector("#select_map_wrapper"),35,5);
}
function closeSelectMap(){
	document.querySelector(".view_Location").style.display="none";
}
function selectCard(element){
	let name = element.querySelector("#name").value;
	let number = element.querySelector("#number").value;
	let ccv = element.querySelector("#ccv").value;
	let expyear = element.querySelector("#expyear").value;
	let expmonth = element.querySelector("#expmonth").value;
	
	let pay_form = document.querySelector(".pay_info_form");
	pay_form.querySelector("#holder_card").value =name;
	pay_form.querySelector(".ccv").value = ccv;
	pay_form.querySelector("#card_number").value = number;
	pay_form.querySelector(".expmonth").value=expmonth;
	pay_form.querySelector(".expyear").value =expyear;
}