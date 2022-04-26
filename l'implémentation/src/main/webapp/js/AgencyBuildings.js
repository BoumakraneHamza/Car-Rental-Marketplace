const Bookings_chart = document.querySelector("#booking_chart").getContext("2d");

let char2 = new Chart(Bookings_chart ,{
	type:'line',
	data:{
		labels:['Sun',"Mon","Tue","Wed","Thu","Fri","Sat"],
		datasets:[{
			label:'Bookings',
			data:[
				1,2,4,2,5,6,3
			],
		}]
	},
	options:{
		responsive:true,
		
		//borderJoinStyle: 'round',
		lineTension: 0.3,
	},
});

function viewBuilding(code, type) {
	event.preventDefault();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var employee = this.responseXML.documentElement.firstElementChild;
		
		document.getElementById("editingBuilding").innerHTML = '';
		if(employee != null) {
			BuildingInformation(employee);
			document.getElementById('tempFormForeditingBuildings').style.visibility='visible';
		}
	}
	xhttp.open("GET","AjaxBuildingDetails"+"?code="+code+"&type="+type);
	xhttp.send();
}

var depotMap;
var officeMap;
function addingBuilding() {
	
	if (depotMap == null){
		depotMap = L.map('depotLocationInputMap');
		depotMap.setView([36.24600, 6.57083], 11);
		L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    	attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	    }).addTo(depotMap);
	}
    
    var depotMarker;
    depotMap.on('click', function(e) {
		if(depotMarker == null)
		depotMarker = L.marker([e.latlng.lat, e.latlng.lng]).addTo(depotMap);
		else
		depotMarker.setLatLng(e.latlng);
		
		document.getElementById('depotLat').value = e.latlng.lat
		document.getElementById('depotLon').value = e.latlng.lng
	});    
    
    if (officeMap == null){
	    officeMap = L.map('officeLocationInputMap');
		officeMap.setView([36.24600, 6.57083], 11);
		L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	    }).addTo(officeMap);
    }
    
    var officeMarker;
    officeMap.on('click', function(e) {
		if(officeMarker == null)
		officeMarker = L.marker([e.latlng.lat, e.latlng.lng]).addTo(officeMap);
		else
		officeMarker.setLatLng(e.latlng);
		
		document.getElementById('officeLat').value = e.latlng.lat
		document.getElementById('officeLon').value = e.latlng.lng
	});
    
	document.getElementById('tempFormForAddingBuilding').style.visibility='visible'
}

function depotDetails(element) {
	element = element.firstElementChild;
	document.getElementById('code').innerHTML = element.innerHTML;
	if(element.nextElementSibling.innerText == "depot")
	document.getElementsByName('depot')[0].value = element.innerHTML;
	else
	document.getElementsByName('depot')[0].value = "";
	element = element.nextElementSibling;
	document.getElementById('type').innerHTML = element.innerText+":";
	element = element.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
	document.getElementById('batteryLevel').style.width = element.innerText;
	document.getElementsByClassName('batteryValue')[0].innerHTML = element.innerText;
	element = element.nextElementSibling;
	document.getElementsByClassName('capaciteValue')[0].innerHTML = element.innerText;
	element = element.nextElementSibling;
	document.getElementById('employeeName').innerHTML = element.innerText;
	element = element.nextElementSibling;
	document.getElementsByClassName('employeeType')[0].innerHTML = element.innerText;
	element = element.nextElementSibling;
	document.getElementById('employeeImage').src = contextPath+element.innerText;
}

function confirmDelete(code, type) {
	var element = document.getElementById('deletingBuilding').firstElementChild;
	element.value = code;
	element.nextElementSibling.value = type;
	document.getElementById('tempFormForDeletingBuildings').style.visibility='visible';
}

function deleteBuilding(event, element) {
	event.preventDefault();
	var param = new URLSearchParams(new FormData(element)).toString();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var buildings = this.responseXML.documentElement.children;
		
		document.getElementById("BuildingList").innerHTML = '';
		for(build of buildings){
			createBuildings(build);
		}
	}
	xhttp.open("POST","AjaxDeleteBuilding");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
	document.getElementById('tempFormForDeletingBuildings').style.visibility='hidden';
}


function editBuilding(event, element) {
	event.preventDefault();
	var param = new URLSearchParams(new FormData(element)).toString();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var buildings = this.responseXML.documentElement.children;
		
		document.getElementById("BuildingList").innerHTML = '';
		for(build of buildings){
			createBuildings(build);
		}
	}
	xhttp.open("POST","AjaxEditBuilding");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);console.log(param)
	
	document.getElementById('tempFormForeditingBuildings').style.visibility='hidden'
}

function submitBuilding(event, element){
	event.preventDefault();
	var param = new URLSearchParams(new FormData(element)).toString();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var buildings = this.responseXML.documentElement.children;
		
		document.getElementById("BuildingList").innerHTML = '';
		for(build of buildings){
			createBuildings(build);
		}
	}
	xhttp.open("POST","AjaxAddBuilding");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
	document.getElementById('tempFormForAddingBuilding').style.visibility='hidden';
}

function createBuildings(build) {
	const code = build.getAttribute('code');
	const adress = build.getAttribute('adress');
	const bookings = build.getAttribute('bookings');
	const buildType = build.nodeName
	const capacityPercentile = buildType == "depot" ? build.getAttribute('capacityPercentile') : 0;
	const capacite = buildType == "depot" ? build.getAttribute('capacite') : 0;
	const employeeFirstName = build.getAttribute('employeeFirstName');
	const employeeType = build.getAttribute('employeeType');
	const employeeImage = build.getAttribute('employeeImage');
	
	
	var aBuilding = document.createElement('tr');
	aBuilding.setAttribute('id','Building');
	aBuilding.setAttribute('onclick','depotDetails(this)');
	
	aBuilding.innerHTML = "\n<td id=\"BuildingCode\" style=\"width: 10%\">"+code+"</td>\n\
		<td id=\"BuildingType\" style=\"width: 15%\"><p id=\"value"+(buildType == 'office' ? '2' : '')+"\">"+buildType+"</p></td>\n\
		<td id=\"BuildingStatus\" style=\"width: 15%\"><div id=\"wrapper\"><div id=\"status\"></div><p>Active</p></div></td>\n\
		<td id=\"BuildingLocation\" style=\"width: 25%\">"+adress+"</td>\n\
		<td id=\"BuildingBookings\" style=\"width: 15%\"><p id=\"value\">+"+bookings+"</p></td>\n\
		<td id=\"BuildingCapacity\" style=\"width: 20%\"><div class=\"battery\"><div class=\"level\" style=\"width:"+capacityPercentile+"%;\"></div></div>"+capacityPercentile+"%</td>\n\
		<td hidden=\"true\" id=\"BuildingTotalCapacity\">"+capacite+"</td>\n\
		<td hidden=\"true\" >"+employeeFirstName+"</td>\n\
		<td hidden=\"true\" >"+employeeType+"</td>\n\
		<td hidden=\"true\" >"+employeeImage+"</td>\n\
		<td><button onclick=\"confirmDelete("+code+", '"+buildType+"')\">delete building</button></td>\n\
	    <td><button onclick=\"viewBuilding("+code+", '"+buildType+"')\">edit building</button></td>"
	
	const buildList = document.getElementById("BuildingList");
	buildList.appendChild(aBuilding);
}

function BuildingInformation(build) {
	const code = build.getAttribute('code');
	const adress = build.getAttribute('adress');
	const bookings = build.getAttribute('bookings');
	const type = build.nodeName
	const capacityPercentile = type == "depot" ? build.getAttribute('capacityPercentile') : 0;
	const capacity = type == "depot" ? build.getAttribute('capacite') : 0;
	const freeCapacity = type == "depot" ? build.getAttribute('capacite_libre') : 0;
	const employeeEmail = build.getAttribute('employee_email');
	const lat = build.getAttribute('lat');
	const lon = build.getAttribute('lon');
	//const  = build.getAttribute('');
	
	
	
	var buildingInfo = document.createElement('div');
	
	buildingInfo.innerHTML = "\n<input type=\"hidden\" value=\""+code+"\" name=\"code\">\n\
								<input type=\"hidden\" value=\""+type+"\" name=\"type\">\n\
								<div>\n\
									<label>adress</label><br>\n\
									<input type=\"text\" value=\""+adress+"\" name=\"adress\">\n\
								</div>\n\
								<div>\n\
									<label>employee email</label><br>\n\
									<input type=\"text\" value=\""+employeeEmail+"\" name=\"employeeEmail\">\n\
								</div>\n\
								<div>\n\
									<label>bookings</label><br>\n\
									<input type=\"text\" value=\""+bookings+"\" name=\"bookings\">\n\
								</div>";
	if (type == "depot") {
		buildingInfo.innerHTML = buildingInfo.innerHTML + "\n<div>\n\
																<label>capacity</label><br>\n\
																<input type=\"text\" value=\""+capacity+"\" name=\"capacity\">\n\
															</div>\n\
															<div>\n\
																<label>free capacity</label><br>\n\
																<input type=\"text\" value=\""+freeCapacity+"\" name=\"freeCapacity\">\n\
															</div>";
	}
	buildingInfo.innerHTML = buildingInfo.innerHTML + "\n<input type=\"hidden\" value=\""+lat+"\" name=\"lat\">\n\
														<input type=\"hidden\" value=\""+lon+"\" name=\"lon\">\n\
														<button type=\"button\" onclick=\"document.getElementById('tempFormForeditingBuildings').style.visibility='hidden'\">Cancel</button><input type=\"submit\">";
	
	const buildingForm = document.getElementById("editingBuilding");
	buildingForm.appendChild(buildingInfo);
}