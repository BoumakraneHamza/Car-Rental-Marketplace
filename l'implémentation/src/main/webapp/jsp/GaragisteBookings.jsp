<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/toggle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/GaragisteBookings.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<title>Bookings</title>
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
					<input id="range_picker" type="text" name="range_picker">
				</div>
			</div>
			<div class="main-frame-content">
				<div class="content-header">
					<span>Renter</span>
					<span>Vehicule</span>
					<span>Pick_up date</span>
					<span>Return date</span>
				</div>
				<div class="database-content">
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					<div id="booking">
						<span>Nathanial Olson</span>
						<span>Mini cooper S</span>
						<span>20 Dec , 10:00 AM</span>
						<span>25 Dec , 12:00 AM</span>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/GaragiteBooking.js"></script>
	<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>