<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<button class="search"><a href="${pageContext.request.contextPath}/CarSearch"><img src="${pageContext.request.contextPath}/assets/search-icon.svg"></a></button>
			<button class="dashboard" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon-white.svg"></a></button>
			<button class="inbox"><a href="${pageContext.request.contextPath}/Inbox"><img src="${pageContext.request.contextPath}/assets/inbox.svg"></a></button>
			<button class="payment"><a href="${pageContext.request.contextPath}/ClientPayment"><img src="${pageContext.request.contextPath}/assets/Wallet.svg"></a></button>
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
								<h4>MailBox</h4>
							</div>
							<div id="messages">
								<c:forEach var="i" begin="0" end="3" step="1">
									<c:choose>
										<c:when test="${messages[i].status == 'not read' && messages[i].source != user.email}">
											<div id="email"  style="background:#fff;">
												<div id="image">
													<img id="imageSrc" style="width:50px;"src="${pageContext.request.contextPath}${messages[i].sourceImage}">
												</div>
												<div id="email-content">
													<div id="email_header">
														<input id="id" type="hidden" value="${messages[i].id}">
														<input id="title" type="hidden" value="${messages[i].title}">
														<p id="sender">${messages[i].sourceName}</p>
														<p id="time">${messages[i].time}</p>
													</div>
													<div id="content">
														<p id="text">${messages[i].content}</p>
													</div>
													<div id="tags">
														<p id="tag">${messages[i].tags}</p>
														<div id="status"><p>1</p></div>
													</div>
												</div>
											</div>
										</c:when>
									</c:choose>
								</c:forEach>
							</div>
						</div>					
					</div>
					<div class="cols-1">
							<div id="header">
								<h4>Bookings</h4>
								<div id="details"><a href="${pageContext.request.contextPath}/ReservationList">Details</a><img src="${pageContext.request.contextPath}/assets/angle-right-solid-blue.svg"></div>
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
					<div id="details"><a href="${pageContext.request.contextPath}/ClientPayment">Details</a><img src="${pageContext.request.contextPath}/assets/angle-right-solid-blue.svg"></div>
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
	<%@include file="/jsp/dropdownList.jsp"%>
	<script src="${pageContext.request.contextPath}/js/ClientDashboard.js"></script>
</body>
</html>