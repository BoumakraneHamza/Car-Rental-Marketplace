<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/OwnerDashboard.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<title>Dashboard</title>
</head>
<body>
<div class="header">
	<div class="logo" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
		<img src="${pageContext.request.contextPath}/assets/logoBlack.svg">
		<p id="logo_title">Unique</p>
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
		<div class="menu-tab" style="background: #C5DCFA;" onclick="location.href='${pageContext.request.contextPath}/CarSearch'">
			<img style="width:20px;" src="${pageContext.request.contextPath}/assets/home-icon-purple.svg">
			<p style="color:#0F56B3;" id="title">Explore</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/ReservationList'">
			<img style="width:21px;" src="${pageContext.request.contextPath}/assets/ledger.svg">
			<p id="title">Bookings</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/ClientPayment'">
			<img style="width:21px;" src="${pageContext.request.contextPath}/assets/payment-icon.svg">
			<p id="title">Payment</p>
		</div>
	</div>
	<div class="main-frame">
		<div class="main_content">
			<div class="best_performing_agencies">
				<div id="agency">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<p id="agency_name">Hertz</p>
				</div>
				<div id="agency">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<p id="agency_name">Hertz</p>
				</div>
				<div id="agency">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<p id="agency_name">Hertz</p>
				</div>
				<div id="agency">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<p id="agency_name">Hertz</p>
				</div>
				<div id="agency">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<p id="agency_name">Hertz</p>
				</div>
				<div id="agency">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<p id="agency_name">Hertz</p>
				</div>
				<div id="agency">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<p id="agency_name">Hertz</p>
				</div>
				<div id="agency">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<p id="agency_name">Hertz</p>
				</div>
				<div id="agency">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<p id="agency_name">Hertz</p>
				</div>
				<div id="agency">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<p id="agency_name">Hertz</p>
				</div>
			</div>
			<div class="Monthly_performance">
				<p id="tab_title">30 days performance</p>
				<div class="performance_list">
					<div class="metric">
						<p id="title">Bookings</p>
						<div id="stat">
							<p id="value">2434</p>
							<p id="exchange">+ 30%</p>
						</div>
					</div>
					<div class="metric">
						<p id="title">Revenue</p>
						<div id="stat">
							<p id="value">$ 34.940</p>
							<p id="exchange">+ 12%</p>
						</div>
					</div>
					<div class="metric">
						<p id="title">New Clients</p>
						<div id="stat">
							<p id="value">232</p>
							<p id="exchange">+ 10%</p>
						</div>
					</div>
				</div>
			</div>
			<div class="analytics">
				<p id="tab_title">Analytics</p>
				<div class="content_wrapper">
					<div class="section">
						<div class="graph_stat" id="visitors">
							<p id="graph_title">Yearly visits</p>
							<div id="stat_wrapper">
								<canvas id="stat"></canvas>
							</div>
						</div>
						<div class="location_stat" id="visitors_location">
							<p id="sec_tab_title">visits by location</p>
							<div id="location_list">
								<div id="location">
									<div id="tab_header">
										<div id="image_wrapper">
											<img src="${pageContext.request.contextPath}/assets/location-grey.svg">
										</div>
									</div>
									<div id="visits">
										<p id="couter">231</p>
										<p>visit</p>
									</div>
									<p id="locationAddress">Constantine - Algeria</p>
								</div>
								<div id="location">
									<div id="tab_header">
										<div id="image_wrapper">
											<img src="${pageContext.request.contextPath}/assets/location-grey.svg">
										</div>
									</div>
									<div id="visits">
										<p id="couter">231</p>
										<p>visit</p>
									</div>
									<p id="locationAddress">Constantine - Algeria</p>
								</div>
								<div id="location">
									<div id="tab_header">
										<div id="image_wrapper">
											<img src="${pageContext.request.contextPath}/assets/location-grey.svg">
										</div>
									</div>
									<div id="visits">
										<p id="couter">231</p>
										<p>visit</p>
									</div>
									<p id="locationAddress">Constantine - Algeria</p>
								</div>
							</div>
						</div>
					</div>
					<div class="section">
						<div class="graph_stat" id="bookings">
							<p id="graph_title">Yearly Bookings</p>
							<div id="stat_wrapper">
								<canvas id="stat"></canvas>
							</div>
						</div>
						<div class="location_stat" id="visitors_location">
							<p id="sec_tab_title">Bookings by location</p>
							<div id="location_list">
								<div id="location">
									<div id="tab_header">
										<div id="image_wrapper">
											<img src="${pageContext.request.contextPath}/assets/location-grey.svg">
										</div>
									</div>
									<div id="visits">
										<p id="couter">231</p>
										<p>visit</p>
									</div>
									<p id="locationAddress">Constantine - Algeria</p>
								</div>
								<div id="location">
									<div id="tab_header">
										<div id="image_wrapper">
											<img src="${pageContext.request.contextPath}/assets/location-grey.svg">
										</div>
									</div>
									<div id="visits">
										<p id="couter">231</p>
										<p>visit</p>
									</div>
									<p id="locationAddress">Constantine - Algeria</p>
								</div>
								<div id="location">
									<div id="tab_header">
										<div id="image_wrapper">
											<img src="${pageContext.request.contextPath}/assets/location-grey.svg">
										</div>
									</div>
									<div id="visits">
										<p id="couter">231</p>
										<p>visit</p>
									</div>
									<p id="locationAddress">Constantine - Algeria</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>
<%@include file="/jsp/dropdownList.jsp"%>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/OwnerDashboard.js"></script>
</body>
</html>