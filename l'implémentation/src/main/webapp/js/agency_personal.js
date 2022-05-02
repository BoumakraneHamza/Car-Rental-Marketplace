/*function employeeDetails(element) {
	element = element.firstElementChild;
	document.getElementsByClassName('employeeType')[0].innerHTML = element.innerText;
	document.getElementById('employeeTypeInput').value = element.innerText;
	element = element.nextElementSibling;
	document.getElementById('employeeEmailInput').value = element.innerText;
	element = element.nextElementSibling;
	document.getElementById('employeeDetailsImage').src = contextPath+element.innerText;
	element = element.nextElementSibling;
	document.getElementsByClassName('employeeBuilding')[0].innerHTML = element.innerText;
	element = element.nextElementSibling;
	document.getElementsByClassName('employeeName')[0].innerHTML = element.innerText;
}

function viewProfile(event, element) {
	event.preventDefault();
	var param = new URLSearchParams(new FormData(element)).toString();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var employee = this.responseXML.documentElement.firstElementChild;
		
		document.getElementById("employeeProfileDetails").innerHTML = '';
		if(employee != null) {
			showEmployeeProfile(employee);
			document.getElementById('editEmployeeForm').style.visibility='visible';
		}
		
	}
	xhttp.open("POST","AjaxEmployeeDetails");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
}

function confirmDelete(email, type) {
	var element = document.getElementById('deletingEmployee').firstElementChild;
	element.value = email;
	element.nextElementSibling.value = type;
	document.getElementById('tempFormForDeletingEmployees').style.visibility='visible';
}

function editEmployee(event, element) {
	event.preventDefault();
	var param = new URLSearchParams(new FormData(element)).toString();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var employees = this.responseXML.documentElement.children;
		
		document.getElementById("employees-list").innerHTML = '';
		for(employee of employees){
			createEmployees(employee);
		}
	}
	xhttp.open("POST","AjaxEditEmployee");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
	document.getElementById('editEmployeeForm').style.visibility='hidden';
}

function deleteEmployee(event, element) {
	event.preventDefault();
	var param = new URLSearchParams(new FormData(element)).toString();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var employees = this.responseXML.documentElement.children;
		
		document.getElementById("employees-list").innerHTML = '';
		for(employee of employees){
			createEmployees(employee);
		}
	}
	xhttp.open("POST","AjaxDeleteEmployee");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
	document.getElementById('tempFormForDeletingEmployees').style.visibility='hidden';
}


function createEmployees(employee) {
	const workingLocation = employee.getAttribute('workingLocation');
	const firstName = employee.getAttribute('firstName');
	const lastName = employee.getAttribute('lastName');
	const email = employee.getAttribute('email');
	const type = employee.getAttribute('type');
	const image = employee.getAttribute('image');
	//const  = employee.getAttribute('');
	
	var anEmployee = document.createElement('tr');
	anEmployee.setAttribute('id','employee');
	anEmployee.setAttribute('onclick','employeeDetails(this)');
	
	anEmployee.innerHTML = "\n<td hidden=\"true\" id=\"employeetype\">"+type+"</td>\n\
								<td hidden=\"true\" id=\"employeeEmail\">"+email+"</td>\n\
								<td hidden=\"true\" id=\"employeeImage\">"+image+"</td>\n\
								<td id=\"employeeId\" style=\"width: 20%\">"+(type == 'garagiste' ? 'Depot' : 'Office')+" N° "+workingLocation+"</td>\n\
								<td id=\"employeeName\" style=\"width: 20%\">"+firstName+" "+lastName+"</td>\n\
								<td id=\"employeePhone\" style=\"width: 20%\"><div id=\"wrapper\"><div id=\"status\"></div><p id=\"time\">since 20:00</p></div></td>\n\
								<td id=\"employeeGender\" style=\"width: 20%\">6h 30min</td>\n\
								<td id=\"employeeEmail\" style=\"width: 20%\">169h 55min</td>\n\
								<td><button onclick=\"confirmDelete('"+email+"', '"+type+"')\">delete employee</button></td>"
	
	const EmployeesList = document.getElementById("employees-list");
	EmployeesList.appendChild(anEmployee);
}

function showEmployeeProfile(employee) {
	const email = employee.getAttribute('email');
	const image = employee.getAttribute('image');
	const firstName = employee.getAttribute('firstName');
	const lastName = employee.getAttribute('lastName');
	const workingLocation = employee.getAttribute('workingLocation');
	const type = employee.getAttribute('type');
	//const  = employee.getAttribute('');
	
	var anEmployeeProfile = document.createElement('div');
	anEmployeeProfile.setAttribute('class','main_content');
	
	anEmployeeProfile.innerHTML = "<div class=\"side_bar\">\n\
					<div id=\"profile_image\">\n\
						<img style=\"vertical-align:middle;width: -webkit-fill-available;\" src=\""+contextPath+image+"\">\n\
					</div>\n\
					<div class=\"option\">\n\
						<div id=\"cta\">\n\
							<button onclick=\"document.getElementById('editEmployeeForm').style.visibility='hidden'\" style=\"width:48%;\">Cancel</button>\n\
							<button id=\"save\" type=\"submit\" style=\"width:48%;\">Save</button>\n\
						</div>\n\
				 	</div>\n\
				</div>\n\
				<div class=\"main\">\n\
					<div id=\"main_header\">\n\
						<p id=\"header_title\">Profile Information</p>\n\
					</div>\n\
						<input type=\"hidden\" value=\""+email+"\" name=\"email\">\n\
						<input type=\"hidden\" value=\""+type+"\" name=\"type\">\n\
						<div id=\"tile\">\n\
							<div id=\"title\">First Name</div>\n\
							<input type=\"text\" value=\""+firstName+"\" name=\"firstName\" placeholder=\"first name\">\n\
						</div>\n\
						<div id=\"tile\">\n\
							<div id=\"title\">Last Name</div>\n\
							<input type=\"text\" value=\""+lastName+"\" name=\"lastName\" placeholder=\"last name\">\n\
						</div>\n\
						<div id=\"tile\">\n\
							<div id=\"title\">Working Location</div>\n\
							<input type=\"text\" value=\""+workingLocation+"\" name=\"workingLocation\" placeholder=\"Working Location\">\n\
						</div>\n\
					</div>";
	
	const profileContainer = document.getElementById("employeeProfileDetails");
	
	profileContainer.appendChild(anEmployeeProfile);
}
*/
function clearChild(e){
	var child = e.lastElementChild; 
    while (child) {
        e.removeChild(child);
        child = e.lastElementChild;
    }
}

const stat_wrapper = document.querySelector("#stat_wrapper")
const member_stat = stat_wrapper.querySelector("#member_stat");
function showStat(){
	let chart1 = new Chart(member_stat ,{
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
	}
});
}

const main_frame = document.querySelector(".main-frame");
const side_bar = document.querySelector(".side_bar");

function showDetails(){
	if (main_frame.classList.contains("active")){
		main_frame.classList.remove("active");
	}
	if (!side_bar.classList.contains("active")){
		side_bar.classList.add("active");
	}
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
		xhr.open('GET','AjaxAddEmployee?type='+type);
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
			console.log(param);
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = ()=>{
				if(xhttp.status == 200){
					add_employee.style.display="none";
					console.log("message sent");
				}
			}
			xhttp.open("POST","AjaxAddEmployee");
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send(param);
		}
	}else{
		add_employee.querySelector("#error_banner").querySelector("#text").innerHTML = "Please Make sure that passwords match"
		add_employee.querySelector("#error_banner").style.display="flex";
	}
});