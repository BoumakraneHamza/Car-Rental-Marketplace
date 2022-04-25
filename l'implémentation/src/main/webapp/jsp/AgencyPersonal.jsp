<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyPersonal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/toggle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ViewProfile.css">
<meta charset="UTF-8">
<title>Personal</title>
</head>
<body>
	<div class="header">
			<div id="logo">
				<a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
			</div>
			<div class="user">
			<img id="notification" src="${pageContext.request.contextPath}/assets/notification.svg">
			<div id="user-image">
				<img style="width: 40px;" src="${pageContext.request.contextPath}${user.image}">
			</div>
				<div id="user-info">
					<p id="full-name">${user.nom} ${user.prenom}</p>
					<p id="user-name">${user.user_name}</p>
				</div>
				<div id="dropdownlist">
					<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
				</div>
				
			</div>
		</div>
	<div class="content">
			<div class="menu">
				<button class="dashboard"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></a></button>
				<button class="Personal" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/ViewAgencyPersonal"><img src="${pageContext.request.contextPath}/assets/personal-icon-white.svg"></a></button>
				<button class="Personal"><a href="${pageContext.request.contextPath}/ViewAgencyDepots"><img src="${pageContext.request.contextPath}/assets/building-icon-grey.svg"></a></button>
			</div>
			<div class="main-frame">
				<div class="main-content">
					<div id="DataBase" class="employee">
					<div id="options">
						<div class="toggles">
							<div class="option" id="show_active">
								<div class='toggle-check'>
								  <input type='checkbox'/>
								  <span class='toggle-b'></span>
								  <span class='toggle-bg'></span>
								</div>
								<p>Show non active</p>
							</div>
							<div class="option" id="show_depots">
								<div class='toggle-check'>
								  <input type='checkbox'/>
								  <span class='toggle-b'></span>
								  <span class='toggle-bg'></span>
								</div>
								<p>Show depots</p>
							</div>
							<div class="option" id="show_offices">
								<div class='toggle-check'>
								  <input type='checkbox'/>
								  <span class='toggle-b'></span>
								  <span class='toggle-bg'></span>
								</div>
								<p>Show offices</p>
							</div>
						</div>
						<div class="cta">
							<div id="searchBar">
								<img src="${pageContext.request.contextPath}/assets/search-icon.svg">
								<input type="text" placeholder="Search">
							</div>
							<div id="add" onclick="document.getElementById('tempFormForAddingEmployees').style.visibility='visible'"><button><img style="margin-right: 11px;" src="${pageContext.request.contextPath}/assets/add.svg"><p>Add Personal</p></button></div>
						</div>
					</div>
				      <div id="table_header">
				        <table cellpadding="0" cellspacing="0" style="width: 100%">
				          <thead>
				            <tr>
				              <th style="width: 20%">Location</th>
				              <th style="width: 20%">user</th>
				              <th style="width: 20%">status</th>
				              <th style="width: 20%">session time</th>
				              <th style="width: 20%">total time</th>
				            </tr>
				          </thead>
				        </table>
				      </div>
				      <div class="table-content">
				      	<table cellpadding="0" cellspacing="0">
				      		<tbody id="employees-list">
					      		<c:choose>
									<c:when test="${not empty employees}">
										<c:forEach items="${employees}" var="employee">
								      		<tr id="employee" onclick="employeeDetails(this)">
								      			<td hidden="true" id="employeetype">${employee.type}</td>
								      			<td hidden="true" id="employeeEmail">${employee.email}</td>
								      			<td hidden="true" id="employeeImage">${employee.image}</td>
						      					<td id="employeeId" style="width: 20%">${employee.type eq "garagiste" ? "Depot" : "Office"} N° ${employee.workingLocation}</td>
						              			<td id="employeeName" style="width: 20%">${employee.firstName} ${employee.lastName}</td>
						              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
						              			<td id="employeeGender" style="width: 20%">6h 30min</td>
						              			<td id="employeeMail" style="width: 20%">169h 55min</td>
						              			<td><button onclick="confirmDelete('${employee.email}', '${employee.type}')">delete employee</button></td>
								      		</tr>
							      		</c:forEach>
						      		</c:when>
						      		<c:otherwise>
										<tr id="employee"><td>No Employees <td></tr>
									</c:otherwise>
								</c:choose>
				      		</tbody>
				      	</table>
				      </div>
				    </div>
				    <div class="viewDetails">
				    	<div class="info">
				    		<div id="header">
				    		<div id="employee_info">
				    			<div id="info_header">
				    				<p class="employeeName" id="employeeName">${employees[0].firstName } ${employees[0].lastName }</p>
				    				<div id="cta">
				    					<img style="width:21px;" src="${pageContext.request.contextPath}/assets/sent-icon-black.svg">
				    				</div>
				    			</div>
				    			<div id="employement"><p>Employement :</p><p class="employeeType" id="value">${employees[0].type }</p></div>
				    		</div>
				    		<img id="employeeDetailsImage" style="width:70px;" src="${pageContext.request.contextPath}${employees[0].image}">
				    	</div>
				    	<div id="time">
				    		<div id="monthly_time">
				    			<div id="header_text">
				    				<p>Monthly Report</p>
				    			</div>
				    			<div id="total">
				    				<p>total time</p>
				    				<p id="timer">169h 55min</p>
				    			</div>
				    		</div>
				    		<div id="daily_time">
				    			<div id="report_header">
				    				<div id="header_text">
				    				<p>daily Report</p>
				    			</div>
				    			<div id="total">
				    				<p>daily time</p>
				    				<p id="timer">6h 25min</p>
				    			</div>
				    			</div>
				    			<div id="details">
				    				<div id="started">
				    					<p>started</p>
				    					<p id="value">08:00</p>
				    				</div>
				    				<div id="ended">
				    					<p>ended</p>
				    					<p id="value">-</p>
				    				</div>
				    			</div>
				    		</div>
				    	</div>
				    	<div id="body">
				    		<div id="location">
				    			<p>Working Location :</p>
				    			<p id="value" class="employeeBuilding" >${employee.type eq "garagiste" ? "Depot" : "Office"} N° ${employee.workingLocation}</p>
				    		</div>
				    	</div>
				    	</div>
				    	<form class="details" onsubmit="viewProfile(event, this)">
				    		<input id="employeeEmailInput" type="hidden" name="employeeEmail" value="${employees[0].email }">
				    		<input id="employeeTypeInput" type="hidden" name="employeeType" value="${employees[0].type }">
				    		<button>View Profile</button>
				    	</form>
				    </div>
				</div>
			</div>
	</div>
<%@include file="/jsp/dropdownList.jsp"%>

		<div id="tempFormForAddingEmployees" style="visibility:hidden;background-color:grey;position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);border: 5px solid #000000;padding: 10px;">
			<div id="addingGaragisteForm"><p>adding garagiste</p>
				<form id="addingGaragiste" onsubmit="submitEmployee(event, this)">
					<div>
						<label>first name</label><br>
						<input required type="text" name="firstName">
					</div>
					<div>
						<label>last name</label><br>
						<input required type="text" name="lastName">
					</div>
					<div>
						<label>email</label><br>
						<input required type="email" name="email">
					</div>
					<div>
						<label>image</label><br>
						<input required type="text" name="image">
					</div>
					<div>
						<label>working location</label><br>
						<input required type="text" name="workingLocation">
					</div>
						<input required type="hidden" name="agency" value="${user.nom}">
						<input required type="hidden" name="type" value="garagiste">
					<input type="reset"><input type="submit">
				</form>
			</div>
			<br><br><br>
			<div id="addingSercetaryForm"><p>adding secretary</p>
				<form id="addingSecretary" onsubmit="submitEmployee(event, this)">
					<div>
						<label>first name</label><br>
						<input required type="text" name="firstName">
					</div>
					<div>
						<label>last name</label><br>
						<input required type="text" name="lastName">
					</div>
					<div>
						<label>email</label><br>
						<input required type="email" name="email">
					</div>
					<div>
						<label>image</label><br>
						<input required type="text" name="image">
					</div>
					<div>
						<label>working location</label><br>
						<input required type="text" name="workingLocation">
					</div>
						<input required type="hidden" name="agency" value="${user.nom}">
						<input required type="hidden" name="type" value="secretary">
					<input type="reset"><input type="submit">
				</form>
			</div>
		</div>
		<div id="tempFormForDeletingEmployees" style="visibility:hidden;background-color:grey;position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);border: 5px solid #000000;padding: 10px;">
			<div id="deleteEmployeeForm"><p>delete employee?</p>
				<form id="deletingEmployee" onsubmit="deleteEmployee(event, this)">
					<input type="hidden" name="email">
					<input type="hidden" name="type">
					<button type="button" onclick="document.getElementById('tempFormForDeletingEmployees').style.visibility='hidden'">Cancel</button><input type="submit">
				</form>
			</div>
		</div>
		<form id="editEmployeeForm" class="info" onsubmit="editEmployee(event, this)" style="visibility:hidden;position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);border: 5px solid #000000;padding: 10px;">
		<div class="wrapper" id="employeeProfileDetails">
		
		</div>
		</form>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/agency_personal.js"></script>
</body>
</html>