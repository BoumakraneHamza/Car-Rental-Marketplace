function submitCar(event){
	event.preventDefault();
	var param = new URLSearchParams(new FormData(document.getElementById('addingCar'))).toString();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var cars = this.responseXML.getElementsByTagName("car");
		
		document.getElementsByClassName("content_body")[0].innerHTML = '';
		for(car of cars){
			createCars(car);
		}
	}
	xhttp.open("POST","AjaxAddCar");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
	document.getElementById('tempFormForAddingCars').style.visibility='hidden';
}

function deleteCar(event) {
	event.preventDefault();
	var param = new URLSearchParams(new FormData(document.getElementById('deletingCar'))).toString();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var cars = this.responseXML.getElementsByTagName("car");
		
		document.getElementsByClassName("content_body")[0].innerHTML = '';
		for(car of cars){
			createCars(car);
		}
	}
	xhttp.open("POST","AjaxDeleteCar");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
	document.getElementById('tempFormForDeletingCars').style.visibility='hidden';
}

function confirmDelete(matricule) {
	var x = document.getElementById('deletingCar').firstElementChild.value = matricule;
	document.getElementById('tempFormForDeletingCars').style.visibility='visible';
}

function createCars(car) {
	const image = car.getElementsByTagName("image")[0].childNodes[0].nodeValue;
	const marque = car.getElementsByTagName("marque")[0].childNodes[0].nodeValue;
	const modele = car.getElementsByTagName("modele")[0].childNodes[0].nodeValue;
	const matricule = car.getElementsByTagName("matricule")[0].childNodes[0].nodeValue;
	const PLJ = car.getElementsByTagName("PLJ")[0].childNodes[0].nodeValue;
	const PLH = car.getElementsByTagName("PLH")[0].childNodes[0].nodeValue;
	const averageRating = car.getElementsByTagName("averageRating")[0].childNodes[0].nodeValue;
	
	var aCar = document.createElement('div');
	aCar.setAttribute('id','car');
	
	aCar.innerHTML = "\n<div id=\"car_image\"><img style=\"width:240px;height:151px;border-radius: 10px 10px 0px 0px ;\" src=\""+contextPath+image+"\"></div>\n\
							<div id=\"car_info\">\n\
								<div id=\"names\">\n\
									<p id=\"carName\">"+marque+" "+modele+"</p>\n\
									<input type=\"hidden\" id=\"matricule\" value=\""+matricule+"\"></input>\n\
								</div>\n\
								<div id=\"rating\">\n\
									<img style=\"width: 18px;margin-right: 5Px;\" src=\""+contextPath+"/assets/star.svg\">\n\
									<p id=\"score\">"+averageRating+"</p>\n\
								</div>\n\
							</div>\n\
							<h4 style=\"font-size: 15px;font-weight: 600;color: #C4C4C4;margin-top: 5px;margin-left: 10px;\">Features :</h4>\n\
							<div id=\"car_features\">\n\
								<div id=\"features\">\n\
									<span>Daily Rate : "+PLJ+"</span>\n\
									<span>Hourly Rate : "+PLH+"</span>\n\
								</div>\n\
							</div>\n\
							<div id=\"deal\">\n\
								<img src=\""+contextPath+"/assets/delete-icon.svg\" onclick=\"confirmDelete('"+matricule+"')\">\n\
								<div id=\"cta\" onclick=\"show_details('"+matricule+"')\">\n\
									<button>View Details</button>\n\
								</div>\n\
							</div>"
	
	const catList = document.getElementsByClassName("content_body")[0];
	catList.appendChild(aCar);
}