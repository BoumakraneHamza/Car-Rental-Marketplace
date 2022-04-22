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

function depotDetails(element) {
	element = element.firstElementChild;
	document.getElementById('code').innerHTML = element.innerHTML;
	document.getElementsByName('depot')[0].value = element.innerHTML;
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
	const code = build.getElementsByTagName("code")[0].childNodes[0].nodeValue;
	const adress = build.getElementsByTagName("adress")[0].childNodes[0].nodeValue;
	const bookings = build.getElementsByTagName("bookings")[0].childNodes[0].nodeValue;
	const buildType = build.nodeName
	const capacityPercentile = buildType == "depot" ? build.getElementsByTagName("capacityPercentile")[0].childNodes[0].nodeValue : 0;
	const capacite = buildType == "depot" ? build.getElementsByTagName("capacite")[0].childNodes[0].nodeValue : 0;
	const employeeFirstName = build.getElementsByTagName("employeeFirstName")[0].childNodes[0].nodeValue;
	const employeeType = build.getElementsByTagName("employeeType")[0].childNodes[0].nodeValue;
	const employeeImage = build.getElementsByTagName("employeeImage")[0].childNodes[0].nodeValue;
	
	var aBuilding = document.createElement('tr');
	aBuilding.setAttribute('id','Building');
	aBuilding.setAttribute('onclick','depotDetails(this)');
	
	aBuilding.innerHTML = "\n<td id=\"BuildingCode\" style=\"width: 10%\">"+code+"</td>\n\
		<td id=\"BuildingType\" style=\"width: 15%\"><p id=\"value\">"+buildType+"</p></td>\n\
		<td id=\"BuildingStatus\" style=\"width: 15%\"><div id=\"wrapper\"><div id=\"status\"></div><p>Active</p></div></td>\n\
		<td id=\"BuildingLocation\" style=\"width: 25%\">"+adress+"</td>\n\
		<td id=\"BuildingBookings\" style=\"width: 15%\"><p id=\"value\">+"+bookings+"</p></td>\n\
		<td id=\"BuildingCapacity\" style=\"width: 20%\"><div class=\"battery\"><div class=\"level\" style=\"width:"+capacityPercentile+"%;\"></div></div>"+capacityPercentile+"%</td>\n\
		<td hidden=\"true\" id=\"BuildingTotalCapacity\">"+capacite+"</td>\n\
		<td hidden=\"true\" >"+employeeFirstName+"</td>\n\
		<td hidden=\"true\" >"+employeeType+"</td>\n\
		<td hidden=\"true\" >"+employeeImage+"</td>"
	
	const buildList = document.getElementById("BuildingList");
	buildList.appendChild(aBuilding);
}