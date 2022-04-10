const map_switch = document.querySelector(".toggle-check");
const map = document.querySelector("#map");
const cancel = document.querySelector("#cancel");
const view = document.querySelector(".view");

map_switch.addEventListener("click", function(){
		if(map.style.display=="none"){
			map.style.display="block";
		}
		else{
			map.style.display="none"
		}
});
cancel.addEventListener("click",function(){
	view.style.display="none";
});

function show_details(element){
	const name = element.parentNode.parentNode.querySelector("#carName");
	const ViewName = view.querySelector("#modele");
	ViewName.innerHTML = name.innerHTML;
	const imageSrc = element.parentNode.parentNode.querySelector("#car_image").querySelector("img").src;
	const imageView = view.querySelector(".images").getElementsByTagName("img");

	for (let i = 0; i < imageView.length; i++){
		imageView[i].src = imageSrc;
	}
	const price = element.parentNode.parentNode.querySelector("#price").querySelector("#amount");
	const priceView = view.querySelector("#daily_price").innerHTML = price.innerHTML;
	
	let duration = parseInt(view.querySelector("#V_duration").innerHTML);
	let total_rate = duration * parseInt(price.innerHTML);
	const total = view.querySelector("#total_rate").innerHTML = total_rate;
	const totalinput = view.querySelector("#total_rate").parentNode.querySelector("input");
	console.log(totalinput);
	totalinput.value=total_rate;
	
	const agence = view.querySelector("#agence").value=element.parentNode.parentNode.querySelector("#AgencyName").innerHTML;
	const matricule = view.querySelector("#matricule_vehicule").value=element.parentNode.parentNode.querySelector("#matricule").value;
	view.style.display="flex";
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
	if(element.name == 'carRate' && element.checked){
		carRate = element.value
		uncheckOthers(element)
	} else {
		var carRates = document.getElementsByName("carRate");
		for(rate of carRates){
			if(rate.checked){
				carRate = rate.value;
			}
		}
	}
	var location = document.getElementsByName("location")[0].value;
	var pickUp_date = document.getElementsByName("pickUp_date")[0].value;
	var return_date = document.getElementsByName("return_date")[0].value;
	var pickUp_hour = document.getElementsByName("pickUp_hour")[0].value;
	var return_hour = document.getElementsByName("return_hour")[0].value;
	
	console.log(typeFilter + "\n" + carRate);
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		//console.log(this.responseText);
		var cars = this.responseXML.getElementsByTagName("car");
		document.getElementById("result-list").innerHTML = '';
		for(car of cars){
			createCars(car);
		}
		
	}
	xhttp.open("GET","ajaxCarFilter?location="+location+"&pickUp_date="+pickUp_date+"&return_date="+return_date
								  +"&pickUp_hour="+pickUp_hour+"&return_hour="+return_hour+"&typeFilter="+typeFilter);
	xhttp.send();
}

function uncheckOthers(element){
	var elements = document.getElementsByName("carRate");
	for(el of elements){
		if(el != element){
			el.checked = false
		}
	}
}

function createCars(car){
	const image = car.getElementsByTagName("image")[0].childNodes[0].nodeValue;
	const marque = car.getElementsByTagName("marque")[0].childNodes[0].nodeValue;
	const modele = car.getElementsByTagName("modele")[0].childNodes[0].nodeValue;
	const agence = car.getElementsByTagName("agence")[0].childNodes[0].nodeValue;
	const matricule = car.getElementsByTagName("matricule")[0].childNodes[0].nodeValue;
	const PLJ = car.getElementsByTagName("PLJ")[0].childNodes[0].nodeValue;
	
	var aCar = document.createElement('div');
	aCar.setAttribute('id','car');
	
	aCar.innerHTML = "\n<div id=\"car_image\"><img style=\"width:240px;height:151px;border-radius: 10px 10px 0px 0px ;\" src=\""+contextPath+image+"\"></div>\n\
						<div id=\"car_info\">\n\
							<div id=\"names\">\n\
								<p id=\"carName\">"+marque+" "+modele+"</p>\n\
								<p id=\"AgencyName\">"+agence+"</p>\n\
								<input type=\"hidden\" id=\"matricule\" value=\""+matricule+"\"></input>\n\
							</div>\n\
							<div id=\"rating\">\n\
								<img src=\""+contextPath+"/assets/star.svg\">\n\
								<p id=\"score\">4.2</p>\n\
							</div>\n\
						</div>\n\
						<h4 style=\"font-size: 15px;font-weight: 600;color: #C4C4C4;margin-top: 5px;\">Features :</h4>\n\
						<div id=\"car_features\">\n\
							<div id=\"features\">\n\
								<span><img src=\""+contextPath+"/assets/mileage-icon.svg\">Unlimited mileage</span>\n\
								<span><img src=\""+contextPath+"/assets/passenger-icon.svg\">2</span>\n\
							</div>\n\
							<div id=\"promotion\">\n\
								<p id=\"promotion-value\">-30%</p>\n\
							</div>\n\
						</div>\n\
						<div id=\"deal\">\n\
							<div id=\"price\"><p>$</p><p id=\"amount\">"+PLJ+"</p><p>per day</p></div>\n\
							<div id=\"cta\" onclick=\"show_details(this)\"><button>View Deal</button></div>\n\
						</div>\n\
					</div>";
	const carList = document.getElementById("result-list");
	carList.appendChild(aCar);
}
