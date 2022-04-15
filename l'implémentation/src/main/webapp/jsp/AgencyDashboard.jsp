<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyDashboard.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<meta charset="UTF-8">
<title>Dashboard</title>
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
			<button class="dashboard" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon-white.svg"></a></button>
			<button class="dashboard"><a href="${pageContext.request.contextPath}/jsp/AgencyPersonal.jsp"><img src="${pageContext.request.contextPath}/assets/personal-icon.svg"></a></button>
			<button class="Personal"><a href="${pageContext.request.contextPath}/ViewAgencyDepots"><img src="${pageContext.request.contextPath}/assets/building-icon-grey.svg"></a></button>
		</div>
		<div class="main-frame">
			<div class="main">
				<div class="team_Performance">
					<div id="title">Team Performance</div>
					<div id="chart">
						<canvas id="Performance_chart"></canvas>
					</div>
					
				</div>
				<div class="secondary_charts">
					<div class="Week_bookings">
						<div id="title">Weekly Bookings</div>
						<div id="chart">
							<canvas id="Bookings_chart"></canvas>
						</div>
						
					</div>
					<div class="Clients_reviews">
						<div id="tab_header">
							<div id="title">Client reviews</div>
							<div class="select">
								<select name="Filter" id="filter">
									<option value="hide">--filter--</option>
								    <option value="depots">Depots</option>
								    <option value="offices">offices</option>
								</select>
							</div>
						</div>
						<div id="list"></div>
					</div>
				</div>
			</div>
			<div class="side_bar">
				<div class="tab">
					<div id="tab_header">
							<div id="title">Personal</div>
							<div class="select">
								<select name="Filter" id="filter">
									<option value="hide">--filter--</option>
								    <option value="depots">Depots</option>
								    <option value="offices">offices</option>
								</select>
							</div>
						</div>
				<div id="list">
					<div id="employee">
						<div id="info">
							<img style="width:40px;"src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
							<div id="employee_info">
								<div id="full_name">
									<p id="first_name" style="margin-right:4px;">Hamza</p>
									<p id="last_name">Boumakrane</p>
								</div>
								<p id="employement">Garagiste</p>
							</div>
						</div>
						<div id="status">
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>	
	</div>
	<script src="${pageContext.request.contextPath}/js/AgencyDashboard.js"></script>
	<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>