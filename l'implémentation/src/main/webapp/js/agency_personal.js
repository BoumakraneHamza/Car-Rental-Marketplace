function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}


const stat_wrapper = document.querySelector("#stat_wrapper")
const member_stat = stat_wrapper.querySelector("#member_stat");
let chart1;
function showStat(){
	if(typeof chart1 == "undefined"){
		chart1 = new Chart(stat_wrapper.querySelector("#member_stat").getContext("2d") ,{
		type:'radar',
		data:{
			labels:['Comfort','Cleanliness','Pick_up&Return'],
			datasets:[{
				label:'Reviews',
				data:[
					6,7,3,
				],
				backgroundColor:'rgba(177, 150, 234, 0.2)',
				borderColor:'rgb(177, 150, 234)',
				pointBorderColor: '#fff',
	   			pointHoverBackgroundColor: '#fff',
	    		pointHoverBorderColor: 'rgb(177, 150, 234)',
			}]
		},
		options:{
			fill:true,
			responsive:true,
			maintainAspectRatio: false,
			plugins:{
				legend:{
					display: false,
				}
			},
			scale: {
		      ticks: {
				beginAtZero:true,
		        min: 0,
		        max: 10,
		      }
	    	}
		}
	});		
	}else{
		chart1.destroy();
		let stat = stat_wrapper.querySelector("#member_stat").cloneNode();
		stat_wrapper.querySelector("#member_stat").remove();
		stat_wrapper.append(stat);
		chart1 = new Chart(stat_wrapper.querySelector("#member_stat").getContext("2d") ,{
		type:'radar',
		data:{
			labels:['Comfort','Cleanliness','Pick_up&Return'],
			datasets:[{
				label:'Reviews',
				data:[
					6,7,3,
				],
				backgroundColor:'rgba(177, 150, 234, 0.2)',
				borderColor:'rgb(177, 150, 234)',
				pointBorderColor: '#fff',
	   			pointHoverBackgroundColor: '#fff',
	    		pointHoverBorderColor: 'rgb(177, 150, 234)',
			}]
		},
		options:{
			fill:true,
			responsive:true,
			maintainAspectRatio: false,
			plugins:{
				legend:{
					display: false,
				}
			},
			scale: {
		      ticks: {
				beginAtZero:true,
		        min: 0,
		        max: 10,
		      }
	    	}
		}
	});
	}
}

const main_frame = document.querySelector(".main-frame");
const side_bar = document.querySelector(".side_bar");

function showDetails(element){
	if (!side_bar.classList.contains("active")){
		side_bar.classList.add("active");
	}
	let employee_card = element.parentNode;
	side_bar.querySelector("#member_name").innerHTML = employee_card.querySelector("#client_name").innerHTML;
	side_bar.querySelector("#member_email").innerHTML = employee_card.querySelector("#client_email").innerHTML;
	side_bar.querySelector("#sidebar_member_image").src = employee_card.querySelector("#client_specific_image").src;
	let type= employee_card.querySelector("#position").querySelector("p").innerHTML;
	let location = employee_card.querySelector("#location").value;
	console.log(location);
	let position ; 
	if(type == "depot manager"){
		if(location === null || location === "" || location.length === 0){
			position = "not Asigned";
		}else{
			position = "Depot " + location;
		}
	}else{
		if(location === null || location === "" || location.length === 0){
			position = "not Asigned";
		}else{
			position = "Office " + location;
		}
		
	}
	side_bar.querySelector("#member_location").innerHTML = position;
	showStat();
}
function hideDetails(){
	if (!main_frame.classList.contains("active")){
		main_frame.classList.add("active");
	}
	if (side_bar.classList.contains("active")){
		side_bar.classList.remove("active");
	}	
}
function showRedirected(){
	let redirected = document.querySelector("#redirected");
	if (!side_bar.classList.contains("active")){
		side_bar.classList.add("active");
	}
	side_bar.querySelector("#member_name").innerHTML = redirected.querySelector("#redirected_employee_name").value;
	side_bar.querySelector("#member_email").innerHTML = redirected.querySelector("#redirected_employee_email").value;
	side_bar.querySelector("#sidebar_member_image").src =  "/Atelier"+redirected.querySelector("#redirected_employee_image").value;
	let type= redirected.querySelector("#redirected_employee_type").value;
	let location = redirected.querySelector("#redirected_employee_location").value;
	console.log(location);
	let position ; 
	if(type == "depot manager"){
		if(location === null || location === "" || location.length === 0){
			position = "not Asigned";
		}else{
			position = "Depot " + location;
		}
	}else{
		if(location === null || location === "" || location.length === 0){
			position = "not Asigned";
		}else{
			position = "Office " + location;
		}
		
	}
	side_bar.querySelector("#member_location").innerHTML = position;
	showStat();
}
const add_employee = document.querySelector(".add_employee");
function Add(){
	if (add_employee.style.display=="none"){
		add_employee.style.display="flex";
	}else{
		add_employee.style.display="none";
	}
}
const location_select = add_employee.querySelector("#location_select");
location_select.addEventListener("click",function(){
	let type = document.querySelector("#filter").value;
	let json;
	let locations_List = add_employee.querySelector("#locations_List");
	clearChild(locations_List);
	if(locations_List.style.display=="none"){
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = ()=>{
			if(xhr.status == 200 && xhr.readyState == 4){
				locations_List.style.display="block";
				json = JSON.parse(xhr.responseText);
				for(let key in json){
					let location_tile = document.createElement("div");
					location_tile.setAttribute("id","location_tile");
					location_tile.setAttribute("onclick","selectLocation(this)");
					let name = document.createElement("p");
					name.setAttribute("id","name");
					name.innerHTML = json[key].code;
					location_tile.append(name);
					let location = document.createElement("p");
					location.setAttribute("id","location");
					location.innerHTML = json[key].adress;
					location_tile.append(location);
					locations_List.append(location_tile);
				}
			}
		}
		xhr.open('GET','EmployeeManagement?type='+type);
		xhr.send();
	}else{
		locations_List.style.display="none";
	}
});
function selectLocation(element){
	location_select.querySelector("#title").value = element.querySelector("#name").innerHTML;
	let locations_List = add_employee.querySelector("#locations_List");
	locations_List.style.display="none";
}
let sub_btn = add_employee.querySelector("#sub_btn");
let form = sub_btn.parentNode;
form.addEventListener("submit",(event)=>{
	event.preventDefault();
	let password_field = document.querySelector("#passwords");
	if(password_field.querySelector("#password").value == password_field.querySelector("#confirmation_password").value){
		if (location_select.querySelector("#title").value == "Select Working location"){
			add_employee.querySelector("#error_banner").style.display="flex";
			add_employee.querySelector("#error_banner").querySelector("#text").innerHTML = "please Select a Working Locations"
		}else{
			add_employee.querySelector("#error_banner").style.display="none";
			let form = sub_btn.parentNode;
			var param = new URLSearchParams(new FormData(form)).toString();
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = ()=>{
				if(xhttp.status == 200){
					add_employee.style.display="none";
				}
			}
			xhttp.open("POST","EmployeeManagement");
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send(param);
		}
	}else{
		add_employee.querySelector("#error_banner").querySelector("#text").innerHTML = "Please Make sure that passwords match"
		add_employee.querySelector("#error_banner").style.display="flex";
	}
});
function showCardOptions(element){
	let options = element.querySelector(".employeeTabOptions");
	if(options.style.display == "none"){
		//always only one option list is active
		let AllOptions = document.querySelectorAll(".employeeTabOptions");
		for (option in AllOptions){
			AllOptions.item(option).style.display="none";
		}
		options.style.display="flex";
	}else{
		options.style.display="none";
	}
}
let delete_confirmation = document.querySelector(".delete_confirmation");
function DeletePopUp(element){
	let json;
	if(delete_confirmation.style.display=="none"){
		let email = element.parentNode.querySelector("#email").value;
		delete_confirmation.querySelector("#delete_email").value = email;
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = ()=>{
			if(xhr.status == 200 && xhr.readyState == 4){
				json = JSON.parse(xhr.responseText);
				delete_confirmation.querySelector("#team_member_name").innerHTML = json["nom"] +" "+ json["prenom"];	
				delete_confirmation.style.display="flex";
			}
		}
		xhr.open("GET","GetProfile?client_email="+email);
		xhr.send()
	}else{
		delete_confirmation.style.display="none"
	}
}
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
let main_content = document.querySelector("#main_content");
delete_confirmation.querySelector("#delete").addEventListener("click",(event)=>{
	event.preventDefault();
	var param = new URLSearchParams(new FormData(delete_confirmation)).toString();
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = ()=>{
		if(xhttp.status == 200){
			delete_confirmation.style.display="none";
			$("#main_content").load("ViewAgencyPersonal #main_content #employee_card");
		}
	}
	xhttp.open("POST","EmployeeManagement");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
});
let edit_employee = document.querySelector(".edit_employee")
const edit_location_select = edit_employee.querySelector("#location_select");
edit_location_select.addEventListener("click",function(){
	let type = document.querySelector(".edit_employee").querySelector("#filter").value;
	let json;
	let locations_List = edit_employee.querySelector("#locations_List");
	clearChild(locations_List);
	if(locations_List.style.display=="none"){
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = ()=>{
			if(xhr.status == 200 && xhr.readyState == 4){
				locations_List.style.display="block";
				json = JSON.parse(xhr.responseText);
				for(let key in json){
					let location_tile = document.createElement("div");
					location_tile.setAttribute("id","location_tile");
					location_tile.setAttribute("onclick","selectEditedLocation(this)");
					let name = document.createElement("p");
					name.setAttribute("id","name");
					name.innerHTML = json[key].code;
					location_tile.append(name);
					let location = document.createElement("p");
					location.setAttribute("id","location");
					location.innerHTML = json[key].adress;
					location_tile.append(location);
					locations_List.append(location_tile);
				}
			}
		}
		xhr.open('GET','EmployeeManagement?type='+type);
		xhr.send();
	}else{
		locations_List.style.display="none";
	}
});
function selectEditedLocation(element){
	edit_location_select.querySelector("#title").value = element.querySelector("#name").innerHTML;
	let locations_List = edit_employee.querySelector("#locations_List");
	locations_List.style.display="none";
}
function ShowEdit(element){
	let json ;
	let email = element.parentNode.querySelector("#email").value;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			json = JSON.parse(xhr.responseText);
			edit_employee.querySelector("#selected_employee_email").value = json["email"];
			edit_employee.querySelector("#email").value = json["email"];
			edit_employee.querySelector("#filter").value = json["type"];
			console.log(json);
			if(json["type"]=="depot manager"){
				if(json["employement"]["workingLocation"]){
					edit_employee.querySelector("#location_select").querySelector("#title").value = "Depot " + json["employement"]["workingLocation"];
				}else{
					edit_employee.querySelector("#location_select").querySelector("#title").value = "Not Assigned";
				}
			}else{
				if(json["employement"]["workingLocation"]){
					edit_employee.querySelector("#location_select").querySelector("#title").value = "Office " + json["employement"]["workingLocation"];
				}else{
					edit_employee.querySelector("#location_select").querySelector("#title").value = "Not Assigned";
				}
			}
			edit_employee.style.display="flex";
		}
	}
	xhr.open("GET","GetProfile?client_email="+email);
	xhr.send()
}
//THIS function checks if the entered password is correct
//and enables the edit button
$(function(){ 
  $(".edit_confirmation #password").focusout(function(){
  	let xhr = new XMLHttpRequest();
	let email = document.querySelector(".edit_confirmation").querySelector("#agency_email").value;
	xhr.onreadystatechange = ()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			let json = JSON.parse(xhr.responseText);
			console.log(json);
			console.log($(this).val());
			if($(this).val() == json.password){
				document.querySelector(".edit_confirmation").querySelector("#sbt_btn").removeAttribute("disabled");
			}	
		}
	}
	xhr.open("Get","GetProfile?client_email="+email);
	xhr.send();
});
});
let edit_confirmation = document.querySelector(".edit_confirmation");
function BackToEditForm(){
	edit_confirmation.style.display = "none";
	edit_confirmation.querySelector("#password").value= null;
}
function cancelEdit(){
	BackToEditForm();
	edit_employee.style.display="none";
}
let submit_edit_btn = edit_employee.querySelector("#sub_btn");
submit_edit_btn.addEventListener("click",(e)=>{
	e.preventDefault();
	let json ;
	let email = edit_employee.querySelector("#selected_employee_email").value;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			json = JSON.parse(xhr.responseText);
			if(edit_employee.querySelector("#password").value != json["password"]){
				edit_employee.querySelector("#error_banner").style.display="flex";
			}else{
				edit_employee.querySelector("#error_banner").style.display="none";
				show_confirm_edit(json["nom"]+" "+json["prenom"]);
			}
			
		}
	}
	xhr.open("GET","GetProfile?client_email="+email);
	xhr.send()
});
function show_confirm_edit(name){
	edit_confirmation.querySelector("#team_member_name").innerHTML = name;
	edit_confirmation.style.display="flex";
}
let edit_confirmation_btn = edit_confirmation.querySelector("#sbt_btn");
edit_confirmation_btn.addEventListener("click",()=>{
	var param = new URLSearchParams(new FormData(edit_employee)).toString();
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = ()=>{
		if(xhttp.status == 200 && xhttp.readyState == 4){
			cancelEdit();
			if (side_bar.classList.contains("active")){
				side_bar.classList.remove("active");
			}
			$("#main_content").load("ViewAgencyPersonal #main_content #employee_card");
		}
	}
	xhttp.open("post","EmployeeManagement");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
})