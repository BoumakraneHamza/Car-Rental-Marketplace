<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientDashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tabs.css">
<title>Dashboard</title>
</head>
<body>
	<div class="header">
		<div id="logo">
			<a href="${pageContext.request.contextPath}/PageAcueil"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
		</div>
		<div class="user">
		<img id="notification" src="${pageContext.request.contextPath}/assets/notification.svg">
		<img src="${pageContext.request.contextPath}/${user.getImage()}">
			<div id="user-info">
				<p id="full-name">${user.getNom()} ${user.getPrenom()}</p>
				<p id="user-name">${user.getUser_name()}</p>
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
			<div class="col">
				<div class="cols-3">
					<div class="cols-2">
						<div id="greeting">
							<div id="title">
							<h3>Good evening ,</h3>
							<p>${user.getPrenom()}</p>
							</div>
							<div id="subtitle">
								<h5>Welcome Back !</h5>
							</div>
						</div>
						<div id="inbox">
							<div id="header">
								<h4>Inbox</h4>
								<div id="details"><a>Details</a><img src="${pageContext.request.contextPath}/assets/angle-right-solid-blue.svg"></div>
							</div>
							<div id="messages">
								<div id="emails">
									<div id="image">
										<img src="${pageContext.request.contextPath}/assets/customer-service-email.svg">
									</div>
									<div id="email-content">
										<div id="header">
											<p id="title">Customer Service</p>
											<p id="time">10:00 PM</p>
										</div>
										<div id="content">
											<p>Hi , there Nathanial Thank you for you message . 
												we have recieved  your Problem report ...</p>
										</div>
										<div id="tags">
											<p>Problem report</p>
										</div>
									</div>
								</div>
							</div>
						</div>					
					</div>
					<div class="cols-1">
							<div id="header">
								<h4>Bookings</h4>
								<div id="details"><a href="${pageContext.request.contextPath}/jsp/reservationList.jsp">Details</a><img src="${pageContext.request.contextPath}/assets/angle-right-solid-blue.svg"></div>
							</div>
							<ul class="timeline">
								<!-- Item 1 -->
								<li>
									<div class="direction-r">
										<div class="flag-wrapper">
											<span class="flag">07 June</span>
										</div>
										<div class="Bookings">
											<div id="booking">
												<p>Mini Cooper S</p>
												<p>Same day</p>
												<p>07:00 - 17:30</p>
											</div>
										</div>
									</div>
								</li>
							  
								<!-- Item 2 -->
								<li>
									<div class="direction-r">
										<div class="flag-wrapper">
											<span class="flag">10 June</span>
										</div>
										<div class="Bookings">
											<div id="booking">
												<p>Mini Cooper S</p>
												<p>Same day</p>
												<p>07:00 - 17:30</p>
											</div>
										</div>
									</div>
								</li>
							</ul>						
						</div>
					</div>
				</div>
			<div class="Payment">
				<div id="header">
					<h4>Payment</h4>
					<div id="details"><a>Details</a><img src="${pageContext.request.contextPath}/assets/angle-right-solid-blue.svg"></div>
				</div>
				<div class="Card">
					<div id="change">
						<p>Change default Card </p>
						<img src="${pageContext.request.contextPath}/assets/angle-right-solid-blue.svg">
					</div>
					<div id="default-card">
						<div id="ClientName">${user.getNom()} ${user.getPrenom()}</div>
						<div id="Card-Number">${card.getCardNumber()}</div>
						<div id="exp">${card.getExp()}</div>		
					</div>
				</div>
				<div class="history">
					<div id="title">
						<p>Transaction History :</p>
					</div>
					<div id="transaction-history">
						<div id="date-transaction">
							<div id="date">
								<p>07 June</p>
							</div>
							<div id="line"></div>
							<div id="transactions">
								<div id="transaction">
								<div id="image">
									<img src="${pageContext.request.contextPath}/assets/agency logo.svg">
									<div id="title">
										<p id="carName">Porche 911</p>
										<p id="AgencyName">Agence De constantine</p>
									</div>
								</div>
									<div id="amount">
									<p>-$400</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/ClientDashboard.js"></script>
</body>
</html>