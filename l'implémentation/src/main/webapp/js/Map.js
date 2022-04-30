var map
function createMap(lat,lon){
	map = L.map('map', {
	    center: [lat, lon],
		zoom: 8,
		zoomControl:false ,
		attributionControl:false,
		dragging:false,
		boxZoom:false,
		doubleClickZoom:false,
		keyboard:false,
		scrollWheelZoom:false,
	});
	L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	}).addTo(map);
	var marker = L.icon({
	    iconUrl: contextPath+'/assets/map-marker.svg',
	    iconSize: [17, 40],
	});
	L.marker([lat, lon],{icon: marker}).addTo(map);	
}