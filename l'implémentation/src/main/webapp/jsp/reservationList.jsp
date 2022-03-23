<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservationList.css">
<meta charset="ISO-8859-1">
<title>Bookings</title>
</head>
<body>
	<div class="header">
		<div id="logo">
			<a href="${pageContext.request.contextPath}/PageAcueil"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
		</div>
		<div class="user">
		<img id="notification" src="${pageContext.request.contextPath}/assets/notification.svg">
		<img src="${pageContext.request.contextPath}/assets/user01.png">
			<div id="user-info">
				<p id="full-name">Nathanial Olson</p>
				<p id="user-name">@Olson2022</p>
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
			<button class="exit"><a href="${pageContext.request.contextPath}/Logout"><img src="${pageContext.request.contextPath}/assets/exit-icon.svg"></a></button>
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
				<div class="full">
					<div class="Booking" onclick="show_details(this)">
						<p>523321</p>
						<p>Completed</p>
						<p>Agence De constantine</p>
						<p>Mini Cooper S</p>
						<p>07 June 2022-Same Date</p>
						<p>07:00 - 17:30</p>
						<p>$120</p>
					</div>
					<div class="details">
						<div id="bill">
									<h4>Contract</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
						</div>
						<div id="info">
							<div id="field">
										<h4>Payment ID</h4>
										<p>012301</p>
							</div>
							<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
							</div>
							<div id="field">
										<h4>Pick-up depot</h4>
										<p>depot #13</p>
							</div>
							<div id="field">
										<h4>Pick-up address</h4>
										<p>constantine</p>
							</div>
						</div>
						<div id="amount">
							<h4>Amount Due</h4>
							<p>$130</p>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
</div>
<script src="${pageContext.request.contextPath}/js/reservationList.js"></script>
</body>
</html>