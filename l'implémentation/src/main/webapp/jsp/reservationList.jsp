<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservationList.css">
<meta charset="UTF-8">
<title>Bookings</title>
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
			<button class="search"><a href="${pageContext.request.contextPath}/CarSearch"><img src="${pageContext.request.contextPath}/assets/search-icon.svg"></a></button>
			<button class="dashboard" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon-white.svg"></a></button>
			<button class="inbox"><a href="${pageContext.request.contextPath}/Inbox"><img src="${pageContext.request.contextPath}/assets/inbox.svg"></a></button>
			<button class="payment"><a href="${pageContext.request.contextPath}/ClientPayment"><img src="${pageContext.request.contextPath}/assets/Wallet.svg"></a></button>
		</div>
		<div class="main-frame">
			<div class="header">
				<div class="left">
				<h4 style="font-size: 25px;font-weight: 500;">Bookings</h4>
					<div id="filters">
						<button id="All">All</button>
						<button id="progress">In Progress</button>
						<button id="Completed">Completed</button>
					</div>
				</div>
				<div class="right">
					<div id="searchBar">
						<img src="${pageContext.request.contextPath}/assets/search-icon.svg">
						<input type="text" placeholder="Search">
					</div>
				</div>
			</div>
			<div class="bookings">
				<div class="table-header">
					<p>Booking No</p>
					<p>Status</p>
					<p>Agency</p>
					<p>Car</p>
					<p>Dates</p>
					<p>Hours</p>
					<p>Total</p>
				</div>
				<div class="table-content">
					<c:choose>
						<c:when test="${reservationList.size() >0}">
							<c:forEach var="i" begin="0" end="${reservationList.size()-1 < 0 ? 0 : reservationList.size()-1}" step="1">
								<div class="full" >
									<div class="Booking" id="${reservationList[i].getStatus()}" onclick="show_details(this)">
										<p>${reservationList[i].getId()}</p>
										<p>${reservationList[i].getStatus()}</p>
										<p>${reservationList[i].getAgence()}</p>
										<p>${reservationList[i].getVehicule()}</p>
										<p>${reservationList[i].getPick_up_date()} - ${reservationList[i].getReturn_date()}</p>
										<p>${reservationList[i].getPick_up_hour()} - ${reservationList[i].getReturn_hour()}</p>
										<p>$ ${reservationList[i].getTotalAmount()}</p>
									</div>
									<div class="details">
										<div id="car-image">
											<img style="width:200px;height:134px;border-radius:10px;"src="${pageContext.request.contextPath}${reservationList[i].getCarImage()}">
										</div>
										<div id="info">
											<div id="field">
														<h4>Payment ID</h4>
														<p>${reservationList[i].getPaymentId()}</p>
											</div>
											<div id="field">
														<h4>Reservation Date</h4>
														<p>${reservationList[i].getReservation_date()}</p>
											</div>
											<div id="field">
														<h4>Pick-up depot</h4>
														<p>depot #13</p>
											</div>
											<div id="field">
														<h4>Pick-up address</h4>
														<p>${reservationList[i].getLocation()}</p>
											</div>
										</div>
										<div id="bill">
													<h4>Contract</h4>
													<a target="_blank" href="${pageContext.request.contextPath}${reservationList[i].contrat}">
														<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
													</a>
										</div>
										<div id="amount">
											<h4>Daily Price</h4>
											<p>${reservationList[i].getPLJ()}</p>
										</div>
									</div>
									</div>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<p id="message">you have no Bookings history</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
</div>
<script src="${pageContext.request.contextPath}/js/reservationList.js"></script>
	<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>