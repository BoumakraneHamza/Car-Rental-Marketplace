const cancel = document.querySelector("#cancel");
const car_details = document.querySelector(".CarDetail");
cancel.addEventListener("click",function(e){
	e.preventDefault();
	car_details.style.visibility="hidden";
});
function show_details(matricule){
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var car = this.responseXML.getElementsByTagName("car")[0];
		contextPath
		document.getElementsByName('matricule')[0].value = car.getElementsByTagName('matricule')[0].childNodes[0].nodeValue;
		document.getElementById('image').src = contextPath+car.getElementsByTagName('image')[0].childNodes[0].nodeValue;
		document.getElementById('marque').innerHTML = car.getElementsByTagName('marque')[0].childNodes[0].nodeValue;
		document.getElementById('modele').innerHTML = car.getElementsByTagName('modele')[0].childNodes[0].nodeValue;
		document.getElementById('year').innerHTML = car.getElementsByTagName('year')[0].childNodes[0].nodeValue;
		document.getElementById('color').innerHTML = car.getElementsByTagName('color')[0].childNodes[0].nodeValue;
		document.getElementById('PLH').innerHTML = car.getElementsByTagName('PLH')[0].childNodes[0].nodeValue;
		document.getElementById('PLJ').innerHTML = car.getElementsByTagName('PLJ')[0].childNodes[0].nodeValue;
//		document.getElementById('comfort-number-value').innerHTML = car.getElementsByTagName('')[0].childNodes[0].nodeValue;
//		document.getElementById('cleanliness-number-value').innrHTML = car.getElementsByTagName('')[0].childNodes[0].nodeValue;
//		document.getElementById('pickReturn-number-value').innerHTML = car.getElementsByTagName('')[0].childNodes[0].nodeValue;
//		document.getElementById('valueMoney-umber-value').innerHTML = car.getElementsByTagName('')[0].childNodes[0].nodeValue;
		var seats = car.getElementsByTagName('seats')[0].childNodes[0].nodeValue;
		document.getElementById('seat_value'+seats).checked = true;
		var doors = car.getElementsByTagName('doors')[0].childNodes[0].nodeValue;
		document.getElementById('door_value'+doors).checked = true;
		var suitcase = car.getElementsByTagName('suitcase')[0].childNodes[0].nodeValue;
		if (suitcase != 0){
			document.getElementById('suitcase_value'+suitcase).checked = true;
		}
		var mileage = car.getElementsByTagName('mileage')[0].childNodes[0].nodeValue;
		//document.getElementById('mileage_value').;
		var carType = car.getElementsByTagName('type')[0].childNodes[0].nodeValue.toLowerCase();
		document.getElementById(carType).checked = true;
	}
	xhttp.open("POST","AjaxCarDetails",false);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("matricule="+matricule);
	
	car_details.style.visibility="visible";
}

function editInfo(id) {
	document.getElementById(id).outerHTML = '<input type="text" class="carInputs" name="'+id+'" value="'+document.getElementById(id).innerHTML+'">';
}

function editCar(event) {
	event.preventDefault();
	car_details.style.visibility = 'hidden';
	var inputs = document.getElementsByClassName("carTexts");
	
	for (let i=inputs.length-1; i>=0;i--) {
		inputs[i].outerHTML = '<input type="text" class="carInputs" name="'+inputs[i].id+'" value="'+inputs[i].innerHTML+'">';
	}
	var param = new URLSearchParams(new FormData(document.getElementById('editingCar'))).toString();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var cars = this.responseXML.getElementsByTagName("car");
		
		document.getElementsByClassName("content_body")[0].innerHTML = '';
		for(car of cars){
			createCars(car);
		}
	}
	xhttp.open("POST","AjaxEditCar");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
	inputs = document.getElementsByClassName("carInputs");
	for (let i=inputs.length-1; i>=0;i--) {
		inputs[i].outerHTML = '<p class="carTexts" id="'+inputs[i].name+'">'+inputs[i].value+'</p>';
	}
}

