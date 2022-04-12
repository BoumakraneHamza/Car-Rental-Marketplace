<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyBuildings.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/toggle.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<meta charset="UTF-8">
<title>Buildings</title>
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
				<button class="Personal" ><a href="${pageContext.request.contextPath}/jsp/AgencyPersonal.jsp"><img src="${pageContext.request.contextPath}/assets/personal-icon.svg"></a></button>
				<button class="Personal" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/ViewAgencyDepots"><img src="${pageContext.request.contextPath}/assets/building-icon-white.svg"></a></button>
				
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
							<div id="add"><button><img style="margin-right: 11px;" src="${pageContext.request.contextPath}/assets/add.svg"><p>Add Building</p></button></div>
						</div>
					</div>
				      <div id="table_header">
				        <table cellpadding="0" cellspacing="0" style="width: 100%">
				          <thead>
				            <tr>
				              <th style="width: 10%">Code</th>
				              <th style="width: 15%">Type</th>
				              <th style="width: 15%">status</th>
				              <th style="width: 25%">Address</th>
				              <th style="width: 15%">Bookings</th>
				              <th style="width: 20%">capacity</th>
				            </tr>
				          </thead>
				        </table>
				      </div>
				      <div class="table-content">
				      	<table cellpadding="0" cellspacing="0">
				      		<tbody>
				      		<c:forEach items="${Buildings}" var="Building">
			      				<tr id="Building">
			      					<td id="BuildingCode" style="width: 10%">${Building.code}</td>
			              			<td id="BuildingType" style="width: 15%"><p id="value">depot</p></td>
			              			<td id="BuildingStatus" style="width: 15%"><div id="wrapper"><div id="status"></div><p>Active</p></div></td>
			              			<td id="BuildingLocation" style="width: 25%">${Building.adress}</td>
			              			<td id="BuildingBookings" style="width: 15%"><p id="value">+${Building.bookings}</p></td>
			              			<td id="BuildingCapacity" style="width: 20%"><div class="battery"><div class="level" style="width:${Building.getCapacityPercentile()}%;"></div></div>${Building.getCapacityPercentile()}%</td>
					      		</tr>
					      	</c:forEach>
				      		</tbody>
				      	</table>
				      </div>
				    </div>
				    <div class="viewDetails">
				    	<div class="data">
				    		<div class="details_header">
					    		<div id="BuildingName">
					    			<div id="type">Depot</div>
					    			<div id="code">${Buildings[0].code}</div>
					    		</div>
					    		<div id="Capacity">
					    			<div class="battery"><div class="level" style="width:${Buildings[0].getCapacityPercentile()}%;"></div></div><p id="value">${Buildings[0].getCapacityPercentile()}%</p>
					    		</div>
					    	</div>
					    	<div class="responsable_personal">
					    		<div id="employee_info">
					    			<div id="info_header">
					    				<p id="employeeName">${Buildings[0].garagiste.prenom}</p>
					    				<div id="cta">
					    					<img style="width:21px;" src="${pageContext.request.contextPath}/assets/sent-icon-black.svg">
					    				</div>
					    			</div>
					    			<div id="employement"><p>Employement :</p><p id="value">Garagiste</p></div>
					    		</div>
					    		<img style="width:70px;" src="${pageContext.request.contextPath}${Buildings[0].garagiste.image}">
					    	</div>
					    	<div class="stats">
					    		<div id="detailed_capacity">
					    		<p id="stat_header">Total Capacity :</p>
					    		<p id="value">${Buildings[0].capacite}</p>
					    		</div>
					    		<p id="stat_header">Weekly Bookings</p>
					    		<canvas id="booking_chart"></canvas>
					    	</div>
				    	</div>
				    	<div class="cta">
				    		<form action="ViewAgencyDepots" method="post">
				    			<input type="hidden" value="${user.nom}" name="agency">
				    			<input type="hidden" value="${Buildings[0].code}" name="depot">
				    			<input type="submit" value="View Stored Cars">
				    		</form>
				    	</div>
				    </div>
				</div>
			</div>
	</div>
		<script src="${pageContext.request.contextPath}/js/AgencyBuildings.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>
</body>
</html>