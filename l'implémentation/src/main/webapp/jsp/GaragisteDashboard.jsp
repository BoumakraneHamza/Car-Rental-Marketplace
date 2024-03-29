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
	<div class="logo" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
		<img src="${pageContext.request.contextPath}/assets/logoBlack.svg">
		<p id="logo_title">Unique</p>
	</div>
	<div class="user">
	<img id="notification" src="${pageContext.request.contextPath}/assets/notification.svg">
	<div id="user-image">
		<c:choose>
			<c:when test="${user.image.substring(0,5).equals(\"https\")}">
				<img style="width: 40px;" src="${user.image}">
			</c:when>
			<c:otherwise>
				<img style="width: 40px;" src="${pageContext.request.contextPath}${user.image}">
			</c:otherwise>
		</c:choose>
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
		<div class="menu-tab" style="background: #C5DCFA;" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/dashboard2-icon-purple.svg">
			<p style="color:#0F56B3;" id="title">Dashboard</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/GaragisteBookings'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/ledger.svg">
			<p id="title">Bookings</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/GaragisteCars'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/coffee_cup.svg">
			<p id="title">Reviews</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/GaragisteProblems'">
			<img style="width:13px;" src="${pageContext.request.contextPath}/assets/activity.svg">
			<p id="title">Problems</p>
		</div>
	</div>
	<div class="main-frame">
	<div class="top_main_frame">
	<div class="reservations">
		<div id="tab_header">
			<div id="tab_header_title">
				<img style="width:23px;" src="${pageContext.request.contextPath}/assets/ledger-black.svg">
				<p>Bookings</p>
			</div>
			<div id="tab_right_corner">
				<div id="summary">
					<div id="tile">
						<p id="value">${reservationStat.today }</p>
						<p id="title">Today</p>
					</div>
					<div id="tile">
						<p id="value">${reservationStat.week }</p>
						<p id="title">This Week</p>
					</div>
					<div id="tile">
						<p id="value">${reservationStat.month }</p>
						<p id="title">This Month</p>
					</div>
				</div>
				<button onclick="window.location.href='${pageContext.request.contextPath}/GaragisteBookings'" id="cta">Full List</button>
			</div>
		</div>
		<div class="tab_slider">
			<c:forEach items="${reservations}" var="reservation">
				<div class="booking_card">
					<div class="date">
						<div id="pick_up"><p id="main_date">${reservation.pick_up_date }</p></div>
						<p id="remaining_time">${reservation.timeLeft }</p>
					</div>
					<div id="vehicule">
						<p id="card_tab_title">vehicule</p>
						<p id="car_name">${reservation.vehicule.marque } ${reservation.vehicule.modele }</p>
					</div>
					<div id="renter">
						<p id="card_tab_title">Renter</p>
						<div id="renter_tile" onclick="showProfile(this)">
						<input id="client_email" type="hidden" value="${reservation.email }">
							<div id="renter_image">
								<img style="width:40px;" src="${pageContext.request.contextPath}${reservation.renterImage }">
							</div>
							<p id="renter_name">${reservation.renterName }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="performance_card">
		<div class="card_header">
			<img style="width:23px;" src="${pageContext.request.contextPath}/assets/coffee_cup_black.svg">
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
					<p id="stat_header">By the Car brand</p>
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
				<img style="width: 10px;" src="${pageContext.request.contextPath}/assets/activity-black.svg">
				<p id="title">Recent Problems</p>
			</div>
			<div class="Report_list">carProblems
				
				<c:forEach items="${carProblems }" var="carProblem">
					<div class="report">
						<p id="title">${carProblem.description }</p>
						<div id="tags">
							<div id="tag">${carProblem.type }</div>
						</div>
					</div>
				</c:forEach>
				
			</div>
			<button onclick="window.location.href='${pageContext.request.contextPath}/GaragisteProblems'" id="SeeReviews">View All</button>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
	var stat1Data = ${stat1}
	var stat2Data = ${stat2}
	var stat3Data = ${stat3}
</script>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/GaragisteDashboard.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
<%@include file="/jsp/UserBanner.jsp"%>
<%@include file="/jsp/ReportClient.jsp"%>
</body>
</html>