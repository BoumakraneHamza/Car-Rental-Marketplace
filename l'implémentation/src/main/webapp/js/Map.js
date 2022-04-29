var map = L.map('map_canvas', {
    center: [35.5468, 6.162],
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
L.marker([35.5468, 6.162],{icon: marker}).addTo(map);