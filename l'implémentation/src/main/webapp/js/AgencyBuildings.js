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
				let option_list = sidebar_header.querySelector("#option_list");
				option_list.querySelector("#code").value = depot_code;
				option_list.querySelector("#type").value = building_type;
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
					name.innerHTML = json.employee.nom +" "+ json.employee.prenom;
					let email = document.createElement("p");
					email.setAttribute("id","email");
					email.innerHTML = json.employee.email;
					profile_info.append(name);
					profile_info.append(email);
					let redirect = document.createElement("form");
					redirect.setAttribute("id","redirect_to_employee");
					redirect.setAttribute("action","ViewAgencyPersonal");
					redirect.setAttribute("method","get");
					let inputredirect = document.createElement("input");
					inputredirect.setAttribute("type","hidden");
					inputredirect.setAttribute("name","redirected");
					redirect.append(inputredirect);
					let selected_email = document.createElement("input");
					selected_email.setAttribute("type","hidden");
					selected_email.setAttribute("name","selected_Employee_email");
					selected_email.setAttribute("id","selected_Employee_email");
					let selected_type = document.createElement("input");
					selected_type.setAttribute("type","hidden");
					selected_type.setAttribute("name","selected_Employee_type");
					selected_type.setAttribute("id","selected_Employee_type");
					redirect.append(selected_email);
					redirect.append(selected_type);
					let button_wrapper = document.createElement("button");
					button_wrapper.setAttribute("id","button_wrapper");
					button_wrapper.setAttribute("type","submit");
					let button_image = document.createElement("img");
					button_image.setAttribute("style","width:19px;");
					button_image.src="/Atelier/assets/account-black.svg";
					button_wrapper.append(button_image);
					redirect.append(button_wrapper);
					profile_name.append(profile_info);
					profile_name.append(redirect);
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
					sidebar.querySelector("#selected_Employee_email").value = json.employee.email;
					sidebar.querySelector("#selected_Employee_type").value = json.employee.type;
				}
				let add_car= car_list.querySelector("#add_car");
				add_car.querySelector("#depot_code").value = json.code;
				let cars_list = car_list.querySelector("#cars_list");
				if(json.type=="depot"){
					document.querySelector(".car_list").querySelector("#tab_header").querySelector("#title").innerHTML ="cars / "+json.capacite;
				}else{
					document.querySelector(".car_list").querySelector("#tab_header").querySelector("#title").innerHTML ="cars";
				}
				clearChild(cars_list);
				if(json.type=="depot"){
					for(let i=0;i<json.storedCars.length;i++){
						let car = document.createElement("div");
						car.setAttribute("id","car");
						car.setAttribute("onmouseenter","showHoverDetails(this)");
						car.setAttribute("onmouseleave","HideHoverDetails()");
						let input = document.createElement("input");
						input.setAttribute("type","hidden");
						input.setAttribute("id","carMatricule");
						input.value = json.storedCars[i].matricule;
						car.append(input);
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
	xhr.send("code="+depot_code+"&type="+building_type+"&required_action=Building_details");
}
function showBuilding_Options(element){
	let options = element.parentNode.querySelector("#option_list");
	if(options.style.display=="none"){
		options.style.display="flex";
	}else{
		options.style.display="none";
	}
}
let delete_confirmation = document.querySelector(".delete_confirmation");
let cancels = delete_confirmation.querySelectorAll("#cancel");
function addEventListenerList(list) {
    for (var i = 0, len = list.length; i < len; i++) {
        list[i].addEventListener("click",(event)=>{
			event.preventDefault();
			delete_confirmation.style.display="none";
		});
    }
}
addEventListenerList(cancels);
function deletePopUp(element){
	let code = element.parentNode.querySelector("#code").value;
	let type = element.parentNode.querySelector("#type").value;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			if(delete_confirmation.style.display == "none"){
				delete_confirmation.style.display = "flex";
				let options = document.querySelector(".sidebar").querySelector("#option_list");
				options.style.display = "none";
			}
			let json = JSON.parse(xhr.responseText);
			console.log(json);
			if(json.type =="depot"){
				if(json.storedCars.length > 0){
					delete_confirmation.querySelector("#delete").setAttribute("disabled","disabled");
				}else{
					if(delete_confirmation.querySelector("#delete").hasAttribute("disabled")){
						delete_confirmation.querySelector("#delete").removeAttribute("disabled");
					}
				}	
			}
			delete_confirmation.querySelector("#delete_code").value = code;
			delete_confirmation.querySelector("#delete_type").value = type;
			delete_confirmation.querySelector("#selected_building").innerHTML = type + " " +code;
			if(json.employee){
				delete_confirmation.querySelector(".warning").style.display = "flex";
				delete_confirmation.querySelector("#employee_name").innerHTML = json.employee.prenom + " "+ json.employee.nom;
			}else{
				delete_confirmation.querySelector(".warning").style.display = "none";
			}
			
		}	
	}
	xhr.open("POST","ViewAgencyDepots");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("&required_action=Building_details&code="+code+"&type="+type);
}
delete_confirmation.querySelector("#delete").addEventListener("click",(event)=>{
	event.preventDefault();
	var param = new URLSearchParams(new FormData(delete_confirmation)).toString();
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = ()=>{
		if(xhttp.status == 200 && xhttp.readyState == 4){
			delete_confirmation.style.display="none";
			clearChild($(".main-content"));
			$(".main-content").load("ViewAgencyDepots .main-content .asset_card");
			document.querySelector(".sidebar").classList.toggle("active");
		}
	}
	xhttp.open("POST","BuildingManagement");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
});
let add_asset = document.querySelector(".add_asset");
let lat_input = add_asset.querySelector("#inputs").querySelector("#lat");
let lon_input = add_asset.querySelector("#inputs").querySelector("#lon");
var map;
let edit_asset= document.querySelector(".edit_asset");
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
let inputs_wrapper = add_asset.querySelector("#inputs_wrapper");
let search = add_asset.querySelector("#search_address");
search.addEventListener("click",(e)=>{
	let address = inputs_wrapper.value;
	e.preventDefault();
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			let json = JSON.parse(xhr.responseText);
			console.log(json);
			var marker = L.icon({
			    iconUrl: contextPath+'/assets/map-marker.svg',
			    iconSize: [17, 40],
			});
			map.setView(new L.LatLng(json[0].lat, json[0].lon), 10);
			map.eachLayer((layer) => {
		     if(layer['_latlng']!=undefined)
		         layer.remove();
			 });
			L.marker([json[0].lat, json[0].lon],{icon: marker}).addTo(map);
			lat_input.value = json[0].lat;
			lon_input.value = json[0].lon;
		}	
	}
	xhr.open("GET","https://nominatim.openstreetmap.org/search/"+address+"?format=json&accept-language=fr&limit=1");
	xhr.send();
});
function closeAddMap(){
	add_asset.style.display="none";
}
function showAddMap(){
	add_asset.querySelector("#map_wrapper").remove();
	let map_wrapper = document.createElement("div");
	map_wrapper.setAttribute("id","map_wrapper");
	add_asset.insertBefore(map_wrapper,add_asset.querySelector("#inputs"));
	add_asset.style.display="block";
	createSelectMap(add_asset.querySelector("#map_wrapper"),35,5);
}
function selectType(element){
	let inputs = add_asset.querySelector("#inputs");
	let types = inputs.querySelector("#type").querySelectorAll("p");
	let building_type = inputs.querySelector("#building_type");
	for(let key in types){
		types.item(key).style.background = "#fff";
		types.item(key).style.color = "#000";
	}
	if(element.innerHTML == "Office"){
		if(inputs.querySelector("#capacite")){
			inputs.querySelector("#capacite").remove();
		}
	}else{
		if(inputs.querySelector("#capacite")){
			
		}else{
			let capacity = document.createElement("input");
			capacity.setAttribute("required","required");
			capacity.setAttribute("type","number");
			capacity.setAttribute("min","0");
			capacity.setAttribute("max","40");
			capacity.setAttribute("id","capacite");
			capacity.setAttribute("placeholder","capacity");
			capacity.setAttribute("name","capacity");
			inputs.querySelector("#left").insertBefore(capacity,inputs.querySelector("#left").querySelector("#inputs_wrapper"));	
		}
	}
	element.style.background="#C5DCFA";
	element.style.color="#0F56B3";
	building_type.value = element.innerHTML;
}
add_asset.querySelector("#sb_btn").addEventListener("click",(event)=>{
	event.preventDefault();
	var param = new URLSearchParams(new FormData(add_asset)).toString();
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = ()=>{
		if(xhttp.status == 200 && xhttp.readyState == 4){
			add_asset.style.display="none";
			clearChild($(".main-content"));
			$(".main-content").load("ViewAgencyDepots .main-content .asset_card");
		}
	}
	xhttp.open("POST","BuildingManagement");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
});
function EditAsset(element){
	let select_header = edit_asset.querySelector("#select_header");
	let building_code = element.parentNode.querySelector("#code").value;
	let building_type = element.parentNode.querySelector("#type").value;
	edit_asset.querySelector("#Building_type").value = building_type;
	edit_asset.querySelector("#building_code").value = building_code;
	edit_asset.querySelector(".edit_header").querySelector("#title").innerHTML = "Edit "+building_type +" "+building_code;
	let xhr = new XMLHttpRequest()
	xhr.onreadystatechange = ()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			let json = JSON.parse(xhr.responseText);
			console.log(json);
			edit_asset.querySelector("#lon").value = json["lon"];
			edit_asset.querySelector("#lat").value = json["lat"];
			edit_asset.querySelector(".address").value = json["adress"];
			if(building_type == "office"){
				edit_asset.querySelector(".capacity").style.display="none";
			}else{
				edit_asset.querySelector(".capacity").style.display="grid";
				edit_asset.querySelector(".capacity").querySelector("input").value = json["capacite"];
			}
			if(json["employee"]){
				clearChild(select_header);
				let tile = document.createElement("div");
				tile.setAttribute("id","tile");
				tile.setAttribute("onclick","SelectEmployee(this)");
				let employee_email = document.createElement("input");
				employee_email.setAttribute("type","hidden");
				employee_email.setAttribute("id","employee_Email");
				employee_email.value = json["employee"].email;
				tile.append(employee_email);
				let employee_image = document.createElement("div");
				employee_image.setAttribute("id","employee_image");
				let image = document.createElement("img");
				image.setAttribute("style","width: 40px;height: 40px;object-fit: cover;");
				image.src="/Atelier"+ json["employee"].image;
				employee_image.append(image);
				tile.append(employee_image);
				let name = document.createElement("p");
				name.innerHTML = json["employee"].nom + " "+json["employee"].prenom;
				name.setAttribute("id","name");
				tile.append(name);
				select_header.append(tile);
				edit_asset.querySelector("#employee").value = json["employee"].email;
			}
			edit_asset.style.display="flex";
			let options = document.querySelector(".sidebar").querySelector("#option_list");
			options.style.display = "none";
		}	
	}
	xhr.open("GET","BuildingManagement?required_action=getBuildingInfo&type="+building_type+"&code="+building_code);
	xhr.send();
}
function show_select_location(){
	document.querySelector(".view_Location").style.display="block";
	createSelectMap(document.querySelector(".view_Location").querySelector("#select_map_wrapper"),35,5);
}
function closeSelectMap(){
	document.querySelector(".view_Location").style.display="none";
}
function closeEditAsset(){
	edit_asset.style.display = "none";
}
edit_asset.querySelector(".footer").querySelector("#cancel").addEventListener("click",(e)=>{
	e.preventDefault();
	edit_asset.style.display = "none";
})
function submitSelectedLocation(){
	edit_asset.querySelector(".address").value = document.querySelector(".view_Location").querySelector("#inputs_wrapper").value;
	document.querySelector(".view_Location").style.display="none";
}
function showAvailableWorkers(element){
	let select_list = element.parentNode.querySelector("#select_list");
	if(select_list.style.display=="none"){
		select_list.style.display="flex";
	}else{
		select_list.style.display="none"
	}
	let type = edit_asset.querySelector("#Building_type").value;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			let json = JSON.parse(xhr.responseText);
			console.log(json);
			for (let key in json){
				clearChild(select_list);
				let tile = document.createElement("div");
				tile.setAttribute("id","tile");
				tile.setAttribute("onclick","SelectEmployee(this)");
				let employee_email = document.createElement("input");
				employee_email.setAttribute("type","hidden");
				employee_email.setAttribute("id","employee_Email");
				employee_email.value = json[key].email;
				tile.append(employee_email);
				let employee_image = document.createElement("div");
				employee_image.setAttribute("id","employee_image");
				let image = document.createElement("img");
				image.setAttribute("style","width: 40px;height: 40px;object-fit: cover;");
				image.src="/Atelier"+ json[key].image;
				employee_image.append(image);
				tile.append(employee_image);
				let name = document.createElement("p");
				name.innerHTML = json[key].nom + " "+json[key].prenom;
				name.setAttribute("id","name");
				tile.append(name);
				select_list.append(tile);
			}
			
		}
	}
	xhr.open("GET","BuildingManagement?required_action=getAvailableEmployees&type="+type);
	xhr.send();
}
function SelectEmployee(element){
	let email = element.querySelector("#employee_Email").value;
	edit_asset.querySelector("#employee").value = email;
	let select_list = edit_asset.querySelector("#select_list");
	select_list.style.display="none";
	let select_header = edit_asset.querySelector("#select_header");
	clearChild(select_header);
	select_header.append(element);
}
edit_asset.querySelector("#sbt_btn").addEventListener("click",(e)=>{
	e.preventDefault();
	var param = new URLSearchParams(new FormData(edit_asset)).toString();
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = ()=>{
		if(xhttp.status == 200 && xhttp.readyState == 4){
			edit_asset.style.display="none";
			clearChild($(".main-content"));
			$(".main-content").load("ViewAgencyDepots .main-content .asset_card");
			document.querySelector(".sidebar").classList.toggle("active");
		}
	}
	xhttp.open("POST","BuildingManagement");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
});
let car_hover_popUp = document.querySelector(".pop_upContainer");
car_hover_popUp.addEventListener("mouseover",()=>{
		car_hover_popUp.classList.remove("hidden");
		car_hover_popUp.classList.add("displayed");
});
car_hover_popUp.addEventListener("mouseleave",()=>{
		car_hover_popUp.classList.add("hidden");
		car_hover_popUp.classList.remove("displayed");
});
function showHoverDetails(element){
	if(car_hover_popUp.classList.contains("hidden")){
		let matricule = element.querySelector("#carMatricule").value;
		let params = "required_action=car_details&matricule="+matricule;
		console.log(matricule);
		let xhr = new XMLHttpRequest();
		xhr.onload = ()=>{
				if(xhr.status == 200 && xhr.readyState == 4){
					let json = JSON.parse(xhr.responseText);
					console.log(json);
					car_hover_popUp.querySelector("#car_image").src="/Atelier"+json["image"];
					car_hover_popUp.querySelector("#car_name").innerHTML = json["marque"] +" "+json["modele"];
					car_hover_popUp.querySelector("#plj").innerHTML ="$ "+ json["PLJ"];
					car_hover_popUp.querySelector("#rating_counter").innerHTML = json["AverageRating"]; 
					car_hover_popUp.querySelector("#pop_up_description").innerHTML=json["carDescription"];
					let offsets=element.getBoundingClientRect();
					car_hover_popUp.style.top = (offsets.top - element.offsetHeight/2 - 20) +"px";
					car_hover_popUp.querySelector("#car_image").addEventListener("load",()=>{
						car_hover_popUp.classList.remove("hidden");
						car_hover_popUp.classList.add("displayed");
					});
				}	
		}
		xhr.open("POST","ViewAgencyDepots");
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.send(params);
	}
}
function HideHoverDetails(){
	if(!car_hover_popUp.classList.contains("hidden")){
		car_hover_popUp.classList.add("hidden");
		car_hover_popUp.classList.remove("displayed");
	}
}
function readURL(input) {
 	if (input.files && input.files[0]) {
		let selectedImages;
		if(input.getAttribute("id") == "customMainImage"){
			selectedImages = document.querySelector("#main_image").querySelectorAll("#car_main_image");
		}else if(input.getAttribute("id") == "custom_sec_image"){
			selectedImages = document.querySelector("#sec_images").querySelectorAll("#sec_image");
		}
		let p = Promise.resolve();
		for (let x=0;x<selectedImages.length;x++){
			p.then(()=>{
				ReadFile(input.files[x]).then(url =>{
					selectedImages[x].src=url;
				})
			});
		}
	}
};
function ReadFile(file){
	return new Promise((resolve , reject)=>{
		let reader = new FileReader();
		reader.onload = ()=>{
			resolve(reader.result)
		}
		reader.onerror = reject;
		reader.readAsDataURL(file);
	});
}
function showAddCar(element){
	let code= element.querySelector("#depot_code").value;
	console.log(code);
	let xhr = new XMLHttpRequest();
	let params = "required_action=check_available&depot_code="+code;
	xhr.onload= ()=>{
		if(xhr.status ==200 && xhr.readyState == 4){
			console.log("success");
			document.querySelector(".add_car_wrapper").style.display="flex";
			document.querySelector(".add_car_wrapper").querySelector("#depot_code").value=code;
		}
	}
	xhr.open("Post","CarManagement");
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send(params);
}
function hideAddCar(){
	document.querySelector(".add_car_wrapper").style.display="none";
}