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
function createSelectMap(mapWrapper,lat,lon,offices){
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
	    iconUrl: contextPath+'/assets/map-marker.svg',
	    iconSize: [17, 40],
	});
	for(let i=0;i<offices.size;i++){
		L.marker([office.get(i).lat, office.get(i).lon],{icon: marker}).addTo(map);
	}
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
	createSelectMap(document.querySelector(".view_Location").querySelector("#select_map_wrapper"),35,5,offices);
}
function closeSelectMap(){
	document.querySelector(".view_Location").style.display="none";
}