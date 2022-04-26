<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/GaragisteDashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/circleProgressBar.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<title>Dashboard</title>
<style>
	.graph:after {
	  transform: rotate(90deg);
	}
	.multigraph:before{
		border:30px solid #8fc73e;
		border-bottom:none;
	}
	.graph:before, .graph:after{
		border:30px solid #3d415c;
		border-top:none;
	}
</style>
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
		</div>
		<div class="main-frame">
			<div class="top_main_frame">
			<div class="reservations">
				<div id="tab_header">
					<div id="tab_header_title">Bookings</div>
					<div id="tab_right_corner">
						<div id="summary">
							<div id="tile">
								<p id="value">3</p>
								<p id="title">Today</p>
							</div>
							<div id="tile">
								<p id="value">17</p>
								<p id="title">This Week</p>
							</div>
							<div id="tile">
								<p id="value">194</p>
								<p id="title">This Month</p>
							</div>
						</div>
						<button onclick="window.location.href='${pageContext.request.contextPath}/jsp/GaragisteBookings.jsp'" id="cta">Full List</button>
					</div>
				</div>
				<div class="tab_slider">
					<div class="booking_card">
						<div class="date">
							<div id="pick_up"><p id="main_date">Dec 10, 10:00</p><p>AM</p></div>
							<p id="remaining_time">2 hours</p>
						</div>
						<div id="vehicule">
							<p id="card_tab_title">vehicule</p>
							<p id="car_name">Mini Cooper Modele S</p>
						</div>
						<div id="renter">
							<p id="card_tab_title">Renter</p>
							<div id="renter_tile">
								<div id="renter_image">
									<img style="width:40px;" src="${pageContext.request.contextPath}/assets/profile_pics/hamzagmail.jpg">
								</div>
								<p id="renter_name">Nathanial Olson</p>
							</div>
						</div>
					</div>
					
					<div class="booking_card">
						<div class="date">
							<div id="pick_up"><p id="main_date">Dec 10, 10:00</p><p>AM</p></div>
							<p id="remaining_time">2 hours</p>
						</div>
						<div id="vehicule">
							<p id="card_tab_title">vehicule</p>
							<p id="car_name">Mini Cooper Modele S</p>
						</div>
						<div id="renter">
							<p id="card_tab_title">Renter</p>
							<div id="renter_tile">
								<div id="renter_image">
									<img style="width:40px;" src="${pageContext.request.contextPath}/assets/profile_pics/hamzagmail.jpg">
								</div>
								<p id="renter_name">Nathanial Olson</p>
							</div>
						</div>
					</div>
					<div class="booking_card">
						<div class="date">
							<div id="pick_up"><p id="main_date">Dec 10, 10:00</p><p>AM</p></div>
							<p id="remaining_time">2 hours</p>
						</div>
						<div id="vehicule">
							<p id="card_tab_title">vehicule</p>
							<p id="car_name">Mini Cooper Modele S</p>
						</div>
						<div id="renter">
							<p id="card_tab_title">Renter</p>
							<div id="renter_tile">
								<div id="renter_image">
									<img style="width:40px;" src="${pageContext.request.contextPath}/assets/profile_pics/hamzagmail.jpg">
								</div>
								<p id="renter_name">Nathanial Olson</p>
							</div>
						</div>
					</div>
					<div class="booking_card">
						<div class="date">
							<div id="pick_up"><p id="main_date">Dec 10, 10:00</p><p>AM</p></div>
							<p id="remaining_time">2 hours</p>
						</div>
						<div id="vehicule">
							<p id="card_tab_title">vehicule</p>
							<p id="car_name">Mini Cooper Modele S</p>
						</div>
						<div id="renter">
							<p id="card_tab_title">Renter</p>
							<div id="renter_tile">
								<div id="renter_image">
									<img style="width:40px;" src="${pageContext.request.contextPath}/assets/profile_pics/hamzagmail.jpg">
								</div>
								<p id="renter_name">Nathanial Olson</p>
							</div>
						</div>
					</div>
					<div class="booking_card">
						<div class="date">
							<div id="pick_up"><p id="main_date">Dec 10, 10:00</p><p>AM</p></div>
							<p id="remaining_time">2 hours</p>
						</div>
						<div id="vehicule">
							<p id="card_tab_title">vehicule</p>
							<p id="car_name">Mini Cooper Modele S</p>
						</div>
						<div id="renter">
							<p id="card_tab_title">Renter</p>
							<div id="renter_tile">
								<div id="renter_image">
									<img style="width:40px;" src="${pageContext.request.contextPath}/assets/profile_pics/hamzagmail.jpg">
								</div>
								<p id="renter_name">Nathanial Olson</p>
							</div>
						</div>
					</div>
					</div>
			</div>
			<div class="performance_card">
				<div class="card_header">
					<p id="title">Reviews Target</p>
				</div>
				<div class="multigraph">
				  <span class="graph"></span>
				</div>
				<p id="percentile">50%</p>
				<p id="subtitle">
					You need to make an efforts
					to reach your goal
				</p>
				<button onclick="location.href='GaragisteCars'" id="SeeReviews">View Statistics</button>
			</div>
		</div>
			<div class="bottom_main_frame">
				<div class="stats">
					<div class="tab_header">
						<p id="title">Reported Problems</p>
						<input id="range_picker" type="text" name="range_picker">
					</div>
					<div class="stats_wrapper">
						<div class="stat">
							<p id="stat_header">By the Car model</p>
							<div id="canvas_wrapper">
								<canvas id="stat1"></canvas>
							</div>
						</div>
						<div class="stat">
							<p id="stat_header">By the defect Type</p>
							<div id="canvas_wrapper">
								<canvas id="stat2"></canvas>
							</div>
						</div>
						<div class="stat">
							<p id="stat_header">By the Car Rating</p>
							<div id="canvas_wrapper">
								<canvas id="stat3"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="Reported_problems">
					<div class="reported_tab_header">
						<p id="title">Recent Problems</p>
					</div>
					<div class="Report_list">
						<div class="report">
							<p id="title">Problem with the engine</p>
							<div id="tags">
								<div id="tag">Engine</div>
							</div>
						</div>
						<div class="report">
							<p id="title">Accident Accured</p>
							<div id="tags">
								<div id="tag">Accident</div>
							</div>
						</div>
					</div>
					<button onclick="window.location.href='${pageContext.request.contextPath}/jsp/GaragisteProblems.jsp'" id="SeeReviews">View All</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/GaragisteDashboard.js"></script>
	<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>