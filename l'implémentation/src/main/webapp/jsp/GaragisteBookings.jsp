<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/GaragisteBookings.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<title>Bookings</title>
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
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/dashboard2-icon.svg">
			<p id="title">Dashboard</p>
		</div>
		<div class="menu-tab" style="background: #C5DCFA;" onclick="location.href='${pageContext.request.contextPath}/GaragisteBookings'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/ledger-purple.svg">
			<p style="color:#0F56B3;" id="title">Bookings</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/GaragisteCars'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/coffee_cup.svg">
			<p id="title">Reviews</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/jsp/GaragisteProblems.jsp'">
			<img style="width:13px;" src="${pageContext.request.contextPath}/assets/activity.svg">
			<p id="title">Problems</p>
		</div>
	</div>
	<div class="main-frame">
			<div class="main-frame-header">
				<div id="left">
					<p id="header_title">Bookings</p>
					<div id="searchBar">
						<img src="${pageContext.request.contextPath}/assets/search-icon.svg">
						<input type="text" placeholder="Search">
					</div>
				</div>
				<div id="right">
					<div class="cta">
						<button>
							<img style="margin-right: 11px;" src="${pageContext.request.contextPath}/assets/download-blue.svg">
							<p>Export CSV</p>
						</button>
					</div>
					<input id="range_picker" type="text" name="range_picker" onchange="filterByDate(this.value)">
				</div>
			</div>
			<div class="main-frame-content">
				<div class="content-header">
					<span>Renter</span>
					<span>Vehicule</span>
					<span>Pick_up date</span>
					<span>Return date</span>
				</div>
				<div id="reservationsContainer" class="database-content">
					<c:forEach items="${reservations}" var="reservation">
						<div id="booking">
							<span>${reservation.renterName }</span>
							<span>${reservation.carName }</span>
							<span>${reservation.pick_up_date }, ${reservation.pick_up_hour }</span>
							<span>${reservation.return_date }, ${reservation.return_hour }</span>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
	<script src="${pageContext.request.contextPath}/js/GaragiteBooking.js"></script>
	<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>