function employeeDetails(element) {
	element = element.firstElementChild;
	document.getElementsByClassName('employeeType')[0].innerHTML = element.innerText;
	element = element.nextElementSibling.nextElementSibling;
	document.getElementsByClassName('employeeName')[0].innerHTML = element.innerText;
	
}

function submitEmployee(event, form) {
	event.preventDefault();
	var param = new URLSearchParams(new FormData(form)).toString();
	
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		var employees = this.responseXML.getElementsByTagName("employee");
		
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
	//const  = employee.;
	
	var anEmployee = document.createElement('tr');
	anEmployee.setAttribute('id','employee');
	
	anEmployee.innerHTML = "\n<td id=\"employeeId\" style=\"width: 20%\">"+workingLocation+"</td>\n\
								<td id=\"employeeName\" style=\"width: 20%\">"+firstName+" "+lastName+"</td>\n\
								<td id=\"employeePhone\" style=\"width: 20%\"><div id=\"wrapper\"><div id=\"status\"></div><p id=\"time\">since 20:00</p></div></td>\n\
								<td id=\"employeeGender\" style=\"width: 20%\">6h 30min</td>\n\
								<td id=\"employeeEmail\" style=\"width: 20%\">169h 55min</td>"
	
	const EmployeesList = document.getElementById("employees-list");
	EmployeesList.appendChild(anEmployee);
}
		
		