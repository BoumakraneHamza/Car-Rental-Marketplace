function employeeDetails(element) {
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
		showEmployeeProfile(employee)
	}
	xhttp.open("POST","AjaxEmployeeDetails");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
	document.getElementById('editEmployeeForm').style.visibility='visible';
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

function submitEmployee(event, form) {
	event.preventDefault();
	var param = new URLSearchParams(new FormData(form)).toString();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var employees = this.responseXML.documentElement.children;
		
		document.getElementById("employees-list").innerHTML = '';
		for(employee of employees){
			createEmployees(employee);
		}
	}
	xhttp.open("POST","AjaxAddEmployee");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
	document.getElementById('tempFormForAddingEmployees').style.visibility='hidden';
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
