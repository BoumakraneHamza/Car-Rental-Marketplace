let add_asset = document.querySelector(".view_Location");
function showAddMap(){
	add_asset.querySelector("#select_map_wrapper").remove();
	let map_wrapper = document.createElement("div");
	map_wrapper.setAttribute("id","select_map_wrapper");
	add_asset.insertBefore(map_wrapper,add_asset.querySelector("#inputs"));
	add_asset.style.display="block";
	createSelectMap(add_asset.querySelector("#select_map_wrapper"),35,5);
}
function closeSelectMap(){
	document.querySelector(".view_Location").style.display="none";
}
function submitSelectedLocation(){
	document.querySelector(".address").value = document.querySelector(".view_Location").querySelector("#inputs_wrapper").value;
	document.querySelector(".view_Location").style.display="none";
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
				document.querySelector("#lat").value = data.lat;
				document.querySelector("#lon").value = data.lon;
			}else{
				lat_input.value = data.lat;
				lon_input.value = data.lon;
			}
		});
	});
}