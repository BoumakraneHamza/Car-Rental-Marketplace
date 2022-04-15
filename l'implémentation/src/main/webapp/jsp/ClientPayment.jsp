<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bills</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientPayment.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
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
			<button class="dashboard"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></a></button>
			<button class="inbox"><a href="${pageContext.request.contextPath}/Inbox"><img src="${pageContext.request.contextPath}/assets/inbox.svg"></a></button>
			<button class="payment" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/ClientPayment"><img src="${pageContext.request.contextPath}/assets/Wallet-white.svg"></a></button>
		</div>
		<div class="main-frame">
			<div class="payment-content">
				<div id="payment_details">
						<p id="main-title">Personal Cards</p>
					<div id="cards">
						<div class="card" style="background-image:url(https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/${random}.jpeg);">
							<div class="card_info">
								<div class="card_top">
									<img src="https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/chip.png" class="item_chip">
								 <div class="item_type">
								 	<img src="https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/visa.png" alt="" class="item_typeImg">
								 </div>
								</div>
								<div class="card_number">
									<span>${card.getCardNumber()}</span>
								</div>
								<div class="item_bottom">
									<div id="holder">
										<p>card holder</p>
										<p id="holder_full_name">${user.getNom()} ${user.getPrenom()}</p>
									</div>
									<div id="card_Expiry_date">
										<p>Expiry date</p>
										<p id="card_expiry_date">${card.getExp()}</p>
									</div>
								</div>
							</div>
						</div>
						<div id="add-card" onclick="addCard()">
							<button>Add Card</button>
						</div>
					</div>
				</div>
				<div id="payment_history">
						<p id="sec_title">Last Transactions<p>
					<div class="scroll">
					<div id=table_content>
						<c:choose>
							<c:when test="${payments.size()>0}">
								<c:forEach items="${payments}" var="payment">
									<div id="full">
										<div class="transaction" onclick="ShowDetails(this)">
											<p>${payment.value.car_name}</p>
											<input type="hidden" id="payment_id" value="${payment.value.payment_id}">
											<c:choose>
												<c:when test="${payment.value.method.equals('cash')}">
													<div id="method">
														<div id="cash_box">
															<div id="cash_dot"></div>
														</div>
														<p>Cash</p>
													</div>
												</c:when>
												<c:otherwise>
													<div id="method">
														<div id="card_box">
															<div id="card_dot"></div>
														</div>
														<p>Credit</p>
													</div>
												</c:otherwise>
											</c:choose>
											<p>${payment.value.date}</p>
											<p id="amount">${payment.value.montant}</p>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p id="message">you have no transaction history</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
			<div class=side_bar>
				<p id="main_title">Payment Detail</p>
				<div class="reciever">
					<div id="agency_image">
						<img style="width:150px;" src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<p id="agency_name">Hertz</p>
					<p id="agency_phone">012031023</p>
				</div>
				<div class="payment_info">
					<div id="tile">
						<div id="title">
							<img id="date_img" src="${pageContext.request.contextPath}/assets/date-grey.svg">
							<p id="date">Date</p>
						</div>
						<p id="date_value">2022-04-20</p>
					</div>
					<div id="tile">
						<div id="title">
							<img src="${pageContext.request.contextPath}/assets/card-grey.svg">
							<p id="amount">Amount</p>
						</div>
						<p id="amount_value">$120</p>
					</div>
					<div id="tile">
						<div id="title">
							<img id="invoice_img" src="${pageContext.request.contextPath}/assets/paperclip.svg">
							<p id="invoice">Invoice</p>
						</div>
						<p id="invoice_id">3</p>
					</div>
				</div>
				<div class="summary">
					<div class="summary_header">
						<p>Bill Summary</p>
						<img class="summary_toggle" src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
					</div>
					<div class="summary_body" style="display:none;">
						<div id="tile">
							<p id="title">Car modele</p>
							<p class="car_name" id="value">Mini Cooper S</p>
						</div>
						<div id="tile">
							<p id="title">Daily Rate</p>
							<p class="rate" id="value">$100</p>
						</div>
						<div id="tile">
							<p id="title">Duration</p>
							<p class="duration" id="value">10</p>
						</div>
						<div id="tile">
							<p id="title">Discount</p>
							<p id="value">30%</p>
						</div>
						<div id="tile">
							<p id="title">Fees</p>
							<p id="value">$10</p>
						</div>
						<div id="tile">
							<p id="title">Insurance</p>
							<p id="value">$40</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${pageContext.request.contextPath}/js/ClientPayment.js"></script>
	<%@include file="/jsp/dropdownList.jsp"%>
	<%@include file="/jsp/addCard.jsp"%>
</body>
</html>