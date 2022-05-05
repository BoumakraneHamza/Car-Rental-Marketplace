/*const Bookings_chart = document.querySelector("#booking_chart").getContext("2d");

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
		depotMap.locate({setView: true});
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
		officeMap.locate({setView: true});
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
	buildingInfo.innerHTML = buildingInfo.innerHTML + "\n<div>\n\
															<label>location</label><br>\n\
															<div id=\"modifyingLocation\" style=\"width:200px;height:200px;\"></div>\n\
														</div>\n\
														<input id=\"modifyBuildLat\" type=\"hidden\" value=\""+lat+"\" name=\"lat\">\n\
														<input id=\"modifyBuildLon\" type=\"hidden\" value=\""+lon+"\" name=\"lon\">\n\
														<button type=\"button\" onclick=\"document.getElementById('tempFormForeditingBuildings').style.visibility='hidden'\">Cancel</button><input type=\"submit\">";
	
	const buildingForm = document.getElementById("editingBuilding");
	buildingForm.appendChild(buildingInfo);
	
	var buildMap = L.map('modifyingLocation');
	if (lat!='null' && lon!='null') {
		buildMap.setView([lat, lon], 11);
		L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    	attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	    }).addTo(buildMap);
	    
	    var buildingMarker = L.marker([lat, lon]).addTo(buildMap);
	} else {
		buildMap.locate({setView: true});
		L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    	attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	    }).addTo(buildMap);
	}
	buildMap.on('click', function(e) {
			if(buildingMarker == null)
			buildingMarker = L.marker([e.latlng.lat, e.latlng.lng]).addTo(buildMap);
			else
			buildingMarker.setLatLng(e.latlng);
			
			document.getElementById('modifyBuildLat').value = e.latlng.lat
			document.getElementById('modifyBuildLon').value = e.latlng.lng
		});
}*/
let main_content = document.querySelector(".main-content");
function add_asset_card(){
	const add_asset = document.createElement("div");
	add_asset.setAttribute("id","add_asset");
	add_asset.setAttribute("class","asset_card");
	const add_square = document.createElement("div");
	add_square.setAttribute("id","add_square");
	const add_image = document.createElement("img");
	add_image.src="/Atelier/assets/add-black.svg";
	add_square.append(add_image);
	add_asset.append(add_square);
	const text_content = document.createElement("div");
	text_content.setAttribute("id","text_content");
	const title = document.createElement("p");
	title.setAttribute("id","title");
	title.innerHTML = "New Asset";
	const subtitle = document.createElement("p");
	subtitle.setAttribute("id","subtitle");
	subtitle.innerHTML = "Define a new asset easily.";
	text_content.append(title);
	text_content.append(subtitle);
	add_asset.append(text_content);
	const add_btn = document.createElement("div");
	add_btn.setAttribute("id","add_btn");
	const btn_content = document.createElement("p");
	btn_content.innerHTML = "Create new";
	add_btn.append(btn_content);
	add_asset.append(add_btn);
	main_content.insertBefore(add_asset,main_content.firstChild);
}
add_asset_card();
function selectFilter(element){
	let filters = document.querySelector(".filter").querySelectorAll(".filter_tab");
	for(let key =0 ; key < filters.length;key++){
		if(filters[key].classList.contains("active")){
			filters[key].classList.remove("active");
		}
	}
	element.classList.toggle("active");
}
function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}
function showDetails(element){
	let json;
	let depot_code = element.querySelector("#code").value;
	let building_type = element.querySelector("#building_type").value;
	let back_image = element.querySelector("#card_banner").querySelector("img").src;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if (xhr.status == 200 && xhr.readyState == 4){
				let sidebar = document.querySelector(".sidebar");
				if(!sidebar.classList.contains("active")){
					sidebar.classList.add("active");	
				}
				json = JSON.parse(xhr.responseText);
				console.log(json);
				if(sidebar.querySelector(".map_banner")){
					sidebar.querySelector(".map_banner").remove();
					let map_banner = document.createElement("div");
					map_banner.setAttribute("class","map_banner");
					let map = document.createElement("div");
					map.setAttribute("id","map");
					map_banner.append(map);
					sidebar.insertBefore(map_banner,sidebar.querySelector(".sidebar_header"));
				}
				createMap(json.lat,json.lon);
				let sidebar_header = sidebar.querySelector(".sidebar_header");
				sidebar_header.querySelector("#image_wrapepr").querySelector("img").src=back_image;
				let info = sidebar_header.querySelector("#info");
				let info_header = info.querySelector("#info_header");
				info_header.querySelector("#value").innerHTML = json.type + " "+json.code;
				let tag_list = info.querySelector("#tag_list");
				if(json.type == "depot"){
					if(tag_list.querySelector(".cars")){
						tag_list.querySelector(".cars").querySelector("#value").innerHTML = json.capacite - json.capacite_libre;
					}else{
						let cars_tag = document.createElement("div");
						cars_tag.setAttribute("id","tag");
						cars_tag.setAttribute("class","cars");
						let car_icon = document.createElement("img");
						car_icon.setAttribute("style","width:20px;margin-right:5px;");
						car_icon.src="/Atelier/assets/steering-wheel.svg";
						cars_tag.append(car_icon);
						let value = document.createElement("p");
						value.setAttribute("id","value");
						value.innerHTML = json.capacite - json.capacite_libre;
						cars_tag.append(value);
						let title = document.createElement("p");
						title.setAttribute("id","title");
						title.innerHTML = "Cars";
						cars_tag.append(title);
						tag_list.insertBefore(cars_tag,tag_list.querySelector(".bookings"));
					}
				}
				else{
					if(tag_list.querySelector(".cars")){
						tag_list.querySelector(".cars").remove();
					}
				}
				tag_list.querySelector(".bookings").querySelector("#value").innerHTML = json.bookings;
				let employee = sidebar.querySelector(".employee");
				if(employee){
					employee.remove();
				}
				let car_list = sidebar.querySelector(".car_list");
				if(json.employee != null){
					let employee = document.createElement("div");
					employee.setAttribute("class","employee");
					let image_wrapper = document.createElement("div");
					image_wrapper.setAttribute("id","image_wrapper");
					let employee_image = document.createElement("img");
					employee_image.setAttribute("style","width:60px;height: 60px;object-fit: cover;border-radius: 50%;");
					employee_image.src="/Atelier"+json.employee.image;
					image_wrapper.append(employee_image);
					employee.append(image_wrapper);
					let info = document.createElement("div");
					info.setAttribute("id","info");
					let profile_name = document.createElement("div");
					profile_name.setAttribute("id","profile_name");
					let profile_info = document.createElement("div");
					profile_info.setAttribute("id","profile_info");
					let name = document.createElement("p");
					name.setAttribute("id","name");
					name.innerHTML = json.employee.lastName + json.employee.firstName;
					let email = document.createElement("p");
					email.setAttribute("id","email");
					email.innerHTML = json.employee.email;
					profile_info.append(name);
					profile_info.append(email);
					let button_wrapper = document.createElement("div");
					button_wrapper.setAttribute("id","button_wrapper");
					let button_image = document.createElement("img");
					button_image.setAttribute("style","width:19px;");
					button_image.src="/Atelier/assets/account-black.svg";
					button_wrapper.append(button_image);
					profile_name.append(profile_info);
					profile_name.append(button_wrapper);
					info.append(profile_name);
					let score_line = document.createElement("div");
					score_line.setAttribute("id","score_line");
					let hour_icon = document.createElement("img");
					hour_icon.setAttribute("style","height:20px;");
					hour_icon.src="/Atelier/assets/hour_icon_grey.svg";
					score_line.append(hour_icon);
					for(let i=0;i<2;i++){
						let hor_line = document.createElement("div");
						hor_line.setAttribute("class","hor_line");
						let line_value = document.createElement("div");
						line_value.setAttribute("class","line_value");
						line_value.setAttribute("id","value_1");
						hor_line.append(line_value);
						score_line.append(hor_line);
					}
					let hor_line = document.createElement("div");
					hor_line.setAttribute("class","hor_line");
					let line_value = document.createElement("div");
					line_value.setAttribute("class","line_value");
					line_value.setAttribute("id","value_3");
					hor_line.append(line_value);
					score_line.append(hor_line);
					let text_value= document.createElement("p");
					text_value.setAttribute("id","text_value");
					text_value.innerHTML="80%";
					score_line.append(text_value);
					info.append(score_line);
					employee.append(info);
					sidebar.insertBefore(employee,car_list);
				}
				let cars_list = car_list.querySelector("#cars_list");
				clearChild(cars_list);
				if(json.type=="depot"){
					for(let i=0;i<json.storedCars.length;i++){
						let car = document.createElement("div");
						car.setAttribute("id","car");
						let car_info = document.createElement("div");
						car_info.setAttribute("id","car_info");
						let info = document.createElement("div");
						info.setAttribute("id","info");
						let car_name= document.createElement("p");
						car_name.setAttribute("id","car_name");
						car_name.innerHTML = json.storedCars[i].marque +" "+ json.storedCars[i].modele;
						info.append(car_name);
						let year = document.createElement("p");
						year.setAttribute("id","year");
						year.innerHTML = json.storedCars[i].year;
						info.append(year);
						car_info.append(info);
						let booking = document.createElement("div");
						booking.setAttribute("id","bookings");
						let text = document.createElement("p");
						text.setAttribute("id","text");
						text.innerHTML = "This week :";
						booking.append(text);
						let tag = document.createElement("div");
						tag.setAttribute("id","tag");
						let tag_image = document.createElement("img");
						tag_image.setAttribute("style","width:9px");
						tag_image.src="/Atelier/assets/activity-orange.svg";
						tag.append(tag_image);
						let Booking_counter = document.createElement("p");
						Booking_counter.innerHTML = 8;
						tag.append(Booking_counter);
						booking.append(tag);
						car_info.append(booking);
						car.append(car_info);
						let score_line = document.createElement("div");
						score_line.setAttribute("id","score_line");
						for(let i=0;i<4;i++){
							let hor_line = document.createElement("div");
							hor_line.setAttribute("class","hor_line");
							let line_value = document.createElement("div");
							line_value.setAttribute("class","line_value");
							line_value.setAttribute("id","value_1");
							hor_line.append(line_value);
							score_line.append(hor_line);
						}
						let hor_line = document.createElement("div");
						hor_line.setAttribute("class","hor_line");
						let line_value = document.createElement("div");
						line_value.setAttribute("class","line_value");
						line_value.setAttribute("id","value_3");
						hor_line.append(line_value);
						score_line.append(hor_line);
						car.append(score_line);
						cars_list.append(car);
					}
				}
				else{
					
				}
		}
	}
	xhr.open("Post","ViewAgencyDepots");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("code="+depot_code+"&type="+building_type);
}
function showBuilding_Options(element){
	let options = element.parentNode.querySelector("#option_list");
	if(options.style.display=="none"){
		options.style.display="flex";
	}else{
		options.style.display="none";
	}
}