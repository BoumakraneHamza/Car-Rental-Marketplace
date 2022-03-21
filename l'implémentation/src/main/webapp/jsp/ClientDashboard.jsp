<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientDashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tabs.css">
<title>Dashboard</title>
</head>
<body>
	<div class="header">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/assets/logoBlack.svg">
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
	<button class="search"><img src="${pageContext.request.contextPath}/assets/search-icon.svg"></button>
	<button class="dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></button>
	<button class="inbox"><img src="${pageContext.request.contextPath}/assets/inbox.svg"></button>
	<button class="exit"><img src="${pageContext.request.contextPath}/assets/exit-icon.svg"></button>
	</div>
		<div class="main-frame">
			<div class="col">
				<div class="cols-3">
					<div class="cols-2">
						<div id="greeting">
							<div id="title">
							<h3>Good evening ,</h3>
							<p>Nathanial</p>
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
								<h4>Reservations</h4>
								<div id="details"><a>Details</a><img src="${pageContext.request.contextPath}/assets/angle-right-solid-blue.svg"></div>
							</div>
							<ul class="tabs" role="tablist">
								    <li>
								        <input type="radio" name="tabs" id="tab1" checked />
								        <label for="tab1" 
								               role="tab" 
								               aria-selected="true" 
								               aria-controls="panel1" 
								               tabindex="0">Reserved</label>
								        <div id="tab-content1" 
								             class="tab-content" 
								             role="tabpanel" 
								             aria-labelledby="Reserved" 
								             aria-hidden="false">
								             <div id="reservations">
								             	<div id="reservation">
								             		<img alt="car" src="${pageContext.request.contextPath}/assets/Compact Peugeot e-208GT.jpg">
								             		<div id="info">
								             			<div id="titles">
								             				<div id="CarName">Mini Cooper S</div>
								             				<div id="AgencyName">Agence De constantine</div>
								             			</div>
								             		<div id="price">$120 / day</div>
								             		</div>
								             	</div>
								             	<div id="reservation">
								             		<img alt="car" src="${pageContext.request.contextPath}/assets/compact mini cooper S.jpg">
								             	<div id="info">
								             		<div id="titles">
								             			<div id="CarName">Mini Cooper S</div>
								             			<div id="AgencyName">Agence De constantine</div>
								             		</div>
								             		<div id="price">$120 / day</div>
								             	</div>
								             	</div>
								             </div>
								          </div>
								    </li>  
								    <li>
								        <input type="radio" name="tabs" id="tab2" />
								        <label for="tab2"
								               role="tab" 
								               aria-selected="false" 
								               aria-controls="panel2" 
								               tabindex="0">Completed</label>
								        <div id="tab-content2" 
								             class="tab-content"
								             role="tabpanel" 
								             aria-labelledby="Completed" 
								             aria-hidden="true">
								             <div id="reservations">
								             	<div id="reservation">
								             		<img alt="car" src="${pageContext.request.contextPath}/assets/compact mini cooper S.jpg">
								             	<div id="info">
								             		<div id="titles">
								             			<div id="CarName">Mini Cooper S</div>
								             			<div id="AgencyName">Agence De constantine</div>
								             		</div>
								             		<div id="price">$120 / day</div>
								             	</div>
								             	</div>
								             	<div id="reservation">
								             		<img alt="car" src="${pageContext.request.contextPath}/assets/Compact Peugeot e-208GT.jpg">
								             	<div id="info">
								             		<div id="titles">
								             			<div id="CarName">Mini Cooper S</div>
								             			<div id="AgencyName">Agence De constantine</div>
								             		</div>
								             		<div id="price">$120 / day</div>
								             	</div>
								             	</div>
								             </div>
								          </div>
								    </li>
								    <li>
								        <input type="radio" name="tabs" id="tab3" checked />
								        <label for="tab3" 
								               role="tab" 
								               aria-selected="false" 
								               aria-controls="panel3" 
								               tabindex="0">Canceled</label>
								        <div id="tab-content3" 
								             class="tab-content" 
								             role="tabpanel" 
								             aria-labelledby="Canceled" 
								             aria-hidden="true">
								             <div id="reservations">
								             	<p id="no-data">No reservations canceled</p>
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