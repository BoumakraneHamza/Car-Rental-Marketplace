/*<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
   integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
   crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
   crossorigin=""></script>*/
   
var latLong;
const theMap = L.map('map_canvas');
theMap.setView([36.24600, 6.57083], 11);


//theMap.locate({setView: true}); // to get user location
//theMap.panTo(new L.LatLng(35.5, 6.25));

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(theMap);

const ntic = L.marker([36.24476,6.56997]).addTo(theMap).bindPopup('this is a test <h1>NTIC</h1><br> <p>information tech</p>');
ntic.openPopup();


function setCoordinates(inp) {
 var xmlhttp = new XMLHttpRequest();
 var url = "https://nominatim.openstreetmap.org/search?format=json&limit=3&q=" + inp;
 
 xmlhttp.onreadystatechange = function() {
   if (this.readyState == 4 && this.status == 200) {
    var result = JSON.parse(this.responseText);
    
    result = result[0]; //to take the first search result "there might be many results"
    setLocation(result);
   }
 };
 xmlhttp.open("GET", url, true);
 xmlhttp.send();
}

function setLocation(location) {
	if(location != null) {
   		var out = "LatLon : (" + location.lat + ", " + location.lon + ") adress : " + location.display_name;
  		console.log(out)
  		latLong = [location.lat, location.lon];
  		theMap.panTo(new L.LatLng(location.lat, location.lon));
 	} else {
  		console.log("no results..." + latLong)
 	}
}
