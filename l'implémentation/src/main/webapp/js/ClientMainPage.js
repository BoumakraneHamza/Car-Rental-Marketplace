document.querySelector(".toggle-check").querySelector("input[type=checkbox]").checked = true;
$(function() {
	const search_form = document.querySelector("#search_form");
  $('input[name="range_picker"]').daterangepicker({
    timePicker: true,
    startDate: moment().startOf('hour'),
    endDate: moment().startOf('hour').add(32, 'hour'),
    locale: {
      format: 'M/DD hh:mm A'
    }
  });
	$('input[name="range_picker"]').on('apply.daterangepicker', function(picker) {
	  let startDate = new Date($('input[name="range_picker"]').data('daterangepicker').startDate.format('YYYY-MM-DD hh:mm'));
	  let endDate = new Date($('input[name="range_picker"]').data('daterangepicker').endDate.format('YYYY-MM-DD hh:mm'));
	  let pickupdate = startDate.toLocaleString("en-GB",{
		day:"numeric",
		month:"numeric",
		year:"numeric",
	});
	let returndate = endDate.toLocaleString("en-GB",{
		day:"numeric",
		month:"numeric",
		year:"numeric",
	});
	let pickuphour = startDate.toLocaleString("en-GB",{
		hour:"2-digit",
		minute:"2-digit",
	});
	let returnHour = endDate.toLocaleString("en-GB",{
		hour:"2-digit",
		minute:"2-digit",
	});
	search_form.querySelector("#pick_up_date").value = pickupdate;
	search_form.querySelector("#return_date").value = returndate;
	search_form.querySelector("#pick_up_hour").value = pickuphour;
	search_form.querySelector("#return_hour").value = returnHour;
	});
	$(".seach_section #location_input").focusout(function(){
  		search_form.querySelector("#location").value = this.value;
	});
});

function createCars(car){
	const image = car["image"];
	const marque = car["marque"];
	const modele = car["modele"];
	const agence = car["agence"];
	const matricule = car["matricule"];
	const PLJ = car["plj"];
	const averageRating = car["averageRating"];
	
	var aCar = document.createElement('div');
	aCar.setAttribute('id','result');
	
	aCar.innerHTML = "\n<div id=\"image_wrapper\">\n\
							<img id=\"car_image\" style=\"width: 300px;object-fit: cover;height: 180px;\" src=\""+contextPath+image+"\">\n\
							<img id=\"like\" src=\""+contextPath+"/assets/heart-icon.svg\">\n\
							<div id=\"details\">\n\
								<img style=\"width: 12px;\" src=\""+contextPath+"/assets/activity-purple.svg\">\n\
								<p>Details</p>\n\
							</div>\n\
						</div>\n\
						<div id=\"result_info\">\n\
							<div id=\"row\">\n\
								<div id=\"left\">\n\
									<div id=\"rating\">\n\
										<div id=\"icon_wrapper\">\n\
											<img style=\"width: 12px;\" src=\""+contextPath+"/assets/star-grey.svg\">\n\
										</div>\n\
										<p>\""+averageRating+"</p>\n\
									</div>\n\
								<p id=\"car_name\">"+marque+" "+modele+"</p>\n\
								</div>\n\
								<p id=\"price\">$"+PLJ+"</p>\n\
								<input type=\"hidden\" id=\"matricule\" value=\""+matricule+"\"></input>\n\
							</div>\n\
							<div id=\"row\">\n\
								<div id=\"section\">\n\
									<p id=\"agency_name\">"+agence+"</p>\n\
									<p id=\"depot_address\">Constantine district - constantine</p>\n\
								</div>\n\
							</div>\n\
						</div>";
	const carList = document.querySelector("#tab_content");
	carList.appendChild(aCar);
}
function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}
const search_section = document.querySelector(".seach_section");
search_section.querySelector("#minimize_wrapper").addEventListener("click",()=>{
	const search_form = document.querySelector("#search_form");
	var param = new URLSearchParams(new FormData(search_form)).toString();
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = ()=>{
		if(xhttp.status == 200 && xhttp.readyState == 4){
			let json = JSON.parse(xhttp.responseText);
			document.querySelector(".toggle-check").querySelector("input[type=checkbox]").checked = false;
			toggleMap();
			console.log(json);
			let cars = json[0];
			let depots= json[1];
			console.log(depots);
			let size = json[2];
			let counter = document.createElement("p");
			counter.setAttribute("id","counter");
			counter.innerHTML = size;
			let text = document.createElement("p");
			text.innerHTML = "Results";
			clearChild(document.querySelector(".main-frame-header #tab_header #title"));
			document.querySelector(".main-frame-header #tab_header #title").append(counter);
			document.querySelector(".main-frame-header #tab_header #title").append(text);
			clearChild(document.querySelector("#tab_content"));
			for(car in cars){
				createCars(cars[car]);
			}
			map.eachLayer((layer) => {
		     if(layer['_latlng']!=undefined)
		         layer.remove();
			 });
			for(depot in depots){
				if(depots[depot]["lat"]){
					map.setView(new L.LatLng(depots[depot]["lat"], depots[depot]["lon"]), 13);	
					break;
				}
			}
			for (depot in depots){
				createMapIcons(depots[depot]["lat"],depots[depot]["lon"],depots[depot]);
			}
		}
	}
	xhttp.open("post","CarSearch");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
});
let map;
function createSelectMap(mapWrapper,lat,lon){
	var container = L.DomUtil.get(mapWrapper);
      if(container != null){
        container._leaflet_id = null;
		document.querySelector(".map").remove();
		let map_banner = document.createElement("div");
		map_banner.setAttribute("class","map");
		let map = document.createElement("div");
		map.setAttribute("id","map_wrapper");
		map_banner.append(map);
		document.querySelector(".main_content").insertBefore(map_banner,document.querySelector(".main_content").querySelector("#tab_content"));
    }
	map = L.map(document.querySelector("#map_wrapper"), {
	    center: [lat, lon],
		zoom: 13,
		attributionControl:false,
	});
	L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	}).addTo(map);
	/*map.on('click', function(e) {
		map.eachLayer((layer) => {
		     if(layer['_latlng']!=undefined)
		         layer.remove();
		 });
	});*/
	document.querySelector(".map").style.display="none";
}

function createMapIcons(lat,lon,depots){
	var marker = L.icon({
	    iconUrl: contextPath+'/assets/marker-icon.svg',
	    iconSize: [30, 30],
	});
	/*
	<div id=\"secondary_image\">\n\
		<img style=\"width:95px\" src=\""+contextPath+"/assets/car_pics/car02.jpg\">\n\
		<img style=\"width:95px\" src=\""+contextPath+"/assets/car_pics/car02.jpg\">\n\
	</div>\n\
	*/
	let Map_pop_up = document.createElement("div");
	Map_pop_up.setAttribute("id","Map_pop_Up");
	let image_wrapper = document.createElement("div");
	image_wrapper.setAttribute("id","image_wrapper");
	let image_slider = document.createElement("div");
	image_slider.setAttribute("id","image_slider");
	for(let key in depots.storedCars){
		let image = document.createElement("img");
		image.setAttribute("style","width: 180px;height: 119px;object-fit: cover;");
		image.src= contextPath + depots.storedCars[key].image;
		image_slider.append(image);
	}
	image_wrapper.append(image_slider);
	Map_pop_up.append(image_wrapper);
	console.log(depots.storedCars.length);
	if(depots.storedCars.length > 1){
		let nextBtn = document.createElement("button");
		nextBtn.setAttribute("id","next");
		nextBtn.setAttribute("onclick","ManagePopUpSlider(this)");
		let leftimg = document.createElement("img");
		leftimg.setAttribute("style","width:8px;");
		leftimg.src=contextPath + "/assets/angle-left-solid.svg";
		let backBtn = document.createElement("button");
		backBtn.setAttribute("id","back");
		backBtn.setAttribute("onclick","ManagePopUpSlider(this)");
		let rightimg = document.createElement("img");
		rightimg.setAttribute("style","width:8px;");
		rightimg.src = contextPath + "/assets/angle-right-solid.svg";
		backBtn.append(leftimg);
		nextBtn.append(rightimg);
		Map_pop_up.append(backBtn);
		Map_pop_up.append(nextBtn);
	}
	let info_wrapper = document.createElement("div");
	info_wrapper.setAttribute("id","info_wrapper");
	let info_list = document.createElement("div");
	info_list.setAttribute("id","info_list");
	for(let i=0;i<depots.storedCars.length;i++){
		let depot_info = document.createElement("div");
		depot_info.setAttribute("id","depot_info");
		let row = document.createElement("div");
		row.setAttribute("id","row");
		let car_name = document.createElement("p");
		car_name.setAttribute("id","car_name");
		car_name.innerHTML = depots.storedCars[i].marque +" "+depots.storedCars[i].modele;
		row.append(car_name);
		let rating = document.createElement("div");
		rating.setAttribute("id","rating");
		let icon_wrapper = document.createElement("div");
		icon_wrapper.setAttribute("id","icon_wrapper");
		let icon_image = document.createElement("img");
		icon_image.setAttribute("style","width:12px;");
		icon_image.src= contextPath +"/assets/star-grey.svg";
		icon_wrapper.append(icon_image);
		rating.append(icon_wrapper);
		let valueRating = document.createElement("p");
		valueRating.setAttribute("id","value");
		valueRating.innerHTML = depots.storedCars[i].averageRating;
		rating.append(valueRating);
		row.append(rating);
		depot_info.append(row);
		let row2 = document.createElement("div");
		row2.setAttribute("id","row");
		let agency_name = document.createElement("p");
		agency_name.setAttribute("id","agency_name");
		agency_name.innerHTML = depots.agence_nom;
		row2.append(agency_name);
		let price = document.createElement("p");
		price.setAttribute("id","price");
		price.innerHTML = "$"+depots.storedCars[i].plj;
		row2.append(price);
		depot_info.append(row2);
		let view_details = document.createElement("div");
		view_details.setAttribute("id","view_details");
		let text = document.createElement("p");
		text.innerHTML="See details";
		view_details.append(text);
		depot_info.append(view_details);
		info_list.append(depot_info);
	}
	info_wrapper.append(info_list);
	Map_pop_up.append(info_wrapper);
	
	L.marker([lat, lon],{icon: marker}).addTo(map).bindPopup(Map_pop_up);
}
let counter = 0;
function ManagePopUpSlider(element){
	let image_wrapper = document.querySelector("#Map_pop_Up #image_slider");
	let images = document.querySelectorAll("#Map_pop_Up #image_slider img");
	let info = document.querySelector("#Map_pop_Up #info_list");
	let size = image_wrapper.clientWidth;
	if(element.id == "next"){
		if(counter +1 > images.length-1){
			counter = 0
		}else{
			counter ++;
		}
		image_wrapper.style.transition = "transform 0.4s ease-in-out";
		info.style.transition = "transform 0.4s ease-in-out";
		image_wrapper.style.transform = "translateX("+(-size * counter)+"px)";
		info.style.transform = "translateX("+(-size * counter)+"px)";
		console.log(counter);
	}
	if(element.id == "back"){
		image_wrapper.style.transition = "transform 0.4s ease-in-out";
		info.style.transition = "transform 0.4s ease-in-out";
		if(counter - 1 < 0){
			counter = images.length - 1;
		}else{
			counter--;
		}
		image_wrapper.style.transform = "translateX("+(-size * counter)+"px)";
		info.style.transform = "translateX("+(-size * counter)+"px)";
		console.log(counter);
	}
}

function selectRating(element){
	let ratings = document.querySelector(".filter").querySelector("#rating").querySelectorAll("#tile");
	for(let i=0 ;i<ratings.length;i++){
		ratings.item(i).style.background="#fff";
		ratings.item(i).style.color="#000";
		ratings.item(i).style.width="45px";	
	}
	element.style.background="#0071ff";
	element.style.color="#fff";
	element.style.width="75px";
}
const range_inputs= document.querySelectorAll(".range-input input");
const progress_bar = document.querySelector("#slider #progress");
progress_bar.style.left = ( parseInt(range_inputs[0].value) / range_inputs[0].max)*100 + "%";
progress_bar.style.right = 100 - (parseInt(range_inputs[1].value) / range_inputs[1].max)*100 + "%";
range_inputs.forEach(input=>{
	input.addEventListener("input",(e)=>{
		let minVal = parseInt(range_inputs[0].value);
		let maxVal = parseInt(range_inputs[1].value);
		if(maxVal - minVal < 200){
			if(e.target.className==="range-min"){
				range_inputs[0].value  = maxVal-200;
			}else{
				range_inputs[1].value  = minVal+200;
			}
		}else{
			progress_bar.style.left = (minVal / range_inputs[0].max)*100 + "%";
			progress_bar.style.right = 100 - (maxVal / range_inputs[1].max)*100 + "%";
		}
		document.querySelector("#price").querySelector("#min_value").value = range_inputs[0].value;
		document.querySelector("#price").querySelector("#max_value").value = range_inputs[1].value;
		
	});
})
function filterCars(element){
	var typeFilters = document.getElementsByName("typeFilter");
	var typeFilter = [];
	for(type of typeFilters){
		if(type.checked){
			typeFilter.push(type.value);
		}
	}
	var carRate = 0;
	if(element.querySelector("input[type=radio]") && element.querySelector("input[type=radio]").checked){
		carRate = element.querySelector("#value").innerHTML;
		selectRating(element);
	} else {
		var carRates = document.querySelector("#rating").querySelectorAll("#tile");
		for(tile of carRates){
			if(tile.querySelector("input[type=radio]").checked){
				carRate = tile.querySelector("#value").innerHTML;;
			}
		}
	}
	const search_form = search_section.querySelector("#search_form");
	var location = search_form.querySelector("#location").value;
	var pickUp_date = search_form.querySelector("#pick_up_date").value;
	var return_date = search_form.querySelector("#return_date").value;
	var pickUp_hour = search_form.querySelector("#pick_up_hour").value;
	var return_hour = search_form.querySelector("#return_hour").value;
	
	var minPrice = document.querySelector(".filter #price .range-min").value;
	var maxPrice = document.querySelector(".filter #price .range-max").value;

	console.log(typeFilter + "\n" + carRate);
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		if(xhttp.response){
			let json = JSON.parse(xhttp.responseText);
			clearChild(document.querySelector("#tab_content"));
			for(car in json){
				createCars(json[car]);
			}
		}
	}
	xhttp.open("GET","AjaxCarFilter?location="+location+"&pickUp_date="+pickUp_date+"&return_date="+return_date
								  +"&pickUp_hour="+pickUp_hour+"&return_hour="+return_hour+"&typeFilter="+typeFilter+"&carRate="+carRate+"&MinPrice="+minPrice+"&MaxPrice="+maxPrice);
	xhttp.send();
}
function toggleMap(){
	let results = document.querySelector("#tab_content");
	let main_content = document.querySelector(".main-frame .main_content");
	let map = document.querySelector(".map");
	if(document.querySelector(".toggle-check").querySelector("input[type=checkbox]").checked == false){
		createSelectMap(map.querySelector("#map_wrapper"),35,6);
		main_content.style.gridTemplateColumns = "1fr 3fr 1fr";
		main_content.style.gridTemplateRows = "1fr";
		results.style.width="24vw";
		results.style.justifyContent="center";
		document.querySelector(".map").style.display = "block";
	}else{
		map.style.display = "none";
		main_content.style.gridTemplateColumns = "277px calc(100% - 277px)";
		main_content.style.gridTemplateRows = "1fr";
		results.style.width="calc(100vw - 327px)";
		results.style.justifyContent="normal";
	}
}
toggleMap();