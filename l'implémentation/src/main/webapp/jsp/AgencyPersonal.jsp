<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyPersonal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/toggle.css">
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
			<img src="${pageContext.request.contextPath}${user.image}">
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
				<button class="Personal" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/jsp/AgencyPersonal.jsp"><img src="${pageContext.request.contextPath}/assets/personal-icon-white.svg"></a></button>
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
							<div id="add"><button><img style="margin-right: 11px;" src="${pageContext.request.contextPath}/assets/add.svg"><p>Add Personal</p></button></div>
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
				      		<tbody>
			      				<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
					      		<tr id="employee">
			      					<td id="employeeId" style="width: 20%">Constantine-algeria</td>
			              			<td id="employeeName" style="width: 20%">Hamza Boumakrane</td>
			              			<td id="employeePhone" style="width: 20%"><div id="wrapper"><div id="status"></div><p id="time">since 20:00</p></div></td>
			              			<td id="employeeGender" style="width: 20%">6h 30min</td>
			              			<td id="employeeEmail" style="width: 20%">169h 55min</td>
					      		</tr>
				      		</tbody>
				      	</table>
				      </div>
				    </div>
				    <div class="viewDetails">
				    	<div class="info">
				    		<div id="header">
				    		<div id="employee_info">
				    			<div id="info_header">
				    				<p id="employeeName">Hamza</p>
				    				<div id="cta">
				    					<img style="width:21px;" src="${pageContext.request.contextPath}/assets/sent-icon-black.svg">
				    				</div>
				    			</div>
				    			<div id="employement"><p>Employement :</p><p id="value">Garagiste</p></div>
				    		</div>
				    		<img style="width:70px;" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
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
				    			<p id="value">Depot N° 12</p>
				    		</div>
				    	</div>
				    	</div>
				    	<button>View Profile</button>
				    </div>
				</div>
			</div>
	</div>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>