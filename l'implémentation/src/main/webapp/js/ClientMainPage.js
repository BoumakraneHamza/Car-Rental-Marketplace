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
							div id=\"details\">\n\
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
	const carList = document.querySelector(".search_result #tab_content");
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
			console.log(json);
			let cars = json[0];
			let size = json[2];
			document.querySelector(".search_result #tab_header #counter").innerHTML = size;
			clearChild(document.querySelector(".search_result #tab_content"));
			for(car in cars){
				createCars(cars[car]);
			}
		}
	}
	xhttp.open("post","CarSearch");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
});
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
	});
}

createSelectMap("map_wrapper",35,6);
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
		carRate = element.querySelector("#value");
		selectRating(element);
	} else {
		var carRates = document.querySelector("#rating").querySelectorAll("#tile");
		for(tile of carRates){
			if(tile.querySelector("input[type=radio]").checked){
				carRate = tile.querySelector("#value");
			}
		}
	}
	const search_form = search_section.querySelector("#search_form");
	var location = search_form.querySelector("#location").value;
	var pickUp_date = search_form.querySelector("#pick_up_date").value;
	var return_date = search_form.querySelector("#return_date").value;
	var pickUp_hour = search_form.querySelector("#pick_up_hour").value;
	var return_hour = search_form.querySelector("#return_hour").value;
	
	console.log(typeFilter + "\n" + carRate);
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		if(xhttp.response){
			let json = JSON.parse(xhttp.responseText);
			clearChild(document.querySelector(".search_result #tab_content"));
			for(car in json){
				createCars(json[car]);
			}
		}
	}
	xhttp.open("GET","AjaxCarFilter?location="+location+"&pickUp_date="+pickUp_date+"&return_date="+return_date
								  +"&pickUp_hour="+pickUp_hour+"&return_hour="+return_hour+"&typeFilter="+typeFilter+"&carRate="+carRate);
	xhttp.send();
}
