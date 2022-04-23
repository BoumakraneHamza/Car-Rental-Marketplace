<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/GaragisteDashboard.css">
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
		</div>
		<div class="main-frame">
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
					<button id="cta">Full List</button>
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
						<p id="renter_name">Nathanial Olson</p>
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
						<p id="renter_name">Nathanial Olson</p>
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
						<p id="renter_name">Nathanial Olson</p>
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
						<p id="renter_name">Nathanial Olson</p>
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
						<p id="renter_name">Nathanial Olson</p>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>