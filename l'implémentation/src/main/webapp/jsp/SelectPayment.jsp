<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Method</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Finish_Booking.css">
</head>
<body>
<div class="header">
		<div id="logo">
			<a href="${pageContext.request.contextPath}/PageAcueil"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
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
			<button class="dashboard"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></a></button>
			<button class="inbox"><a href="${pageContext.request.contextPath}/Inbox"><img src="${pageContext.request.contextPath}/assets/inbox.svg"></a></button>
			<button class="payment" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/ClientPayment"><img src="${pageContext.request.contextPath}/assets/Wallet-white.svg"></a></button>
			<button class="exit"><a href="${pageContext.request.contextPath}/Logout"><img src="${pageContext.request.contextPath}/assets/exit-icon.svg"></a></button>
		</div>
		<div class="main-frame">
		 <div class="sec-header">
		 	<div id="step">
		 	<p style="font-size: 12px;margin: 0px;font-weight: 600; color: #C4C4C4;">Step 01</p>
		 	<h3 style="margin: 0px;font-size: 16px;font-weight: 600;">Select Payment Method</h3>
		 	</div>
		 </div>
		 <div class="main-content">
		 	<div class="main-tab">
		 		<div class="methods">
		 			<div class="By_card">
		 				<div id="card_checkbox">
		 					<input id="checkbox_1" type="checkbox" onclick="PayBy_card()">
		 					<label for="checkbox_1">Use a new card</label> 
		 				</div>
		 				<div id="card_info">
		 					<div id="card_type">
		 						<button id="visa"><img src="${pageContext.request.contextPath}/assets/visa_blue.svg"/></button>
		 						<button id="master_card"><img src="${pageContext.request.contextPath}/assets/master_card.svg"/></button>
		 						<button id="3"><img src="${pageContext.request.contextPath}/assets/cash.svg"/></button>
		 					</div>
		 					<div class="pay_form">
		 						<div id="number">
		 							<div id="title">
		 								<p id="main_text">Card Number</p>
		 								<p id="sec-text">Enter the 16-digit card number on the card</p>
		 							</div>
		 							<div id="card_number">
		 								<img id= "marque"src="${pageContext.request.contextPath}/assets/master_card.svg">
		 								<input type="number">
		 							</div>
		 						</div>
		 						<div id="input_row">
		 							<div id="title">
			 							<p id="main_text">CCV Number</p>
			 							<p id="sec-text">Enter the 4 digit number of the card</p>
		 							</div>
		 							<input type="number">
		 						</div>
		 						<div id="input_row">
		 							<div id="title">
		 								<p id="main_text">Expiry Date</p>
		 								<p id="sec-text">Enter the Experation date of the card</p>
		 							</div>
		 							<input type="number">
		 						</div>
		 						<div id="input_row">
		 							<div id="title">
		 								<p id="main_text">Password</p>
		 								<p id="sec-text">Enter the card password</p>
		 							</div>
		 							<input type="password">
		 						</div>
		 					</div>
		 				</div>
		 			</div>
		 			<div class="by_cash">
		 				<div id="cash_checkbox">
		 					<input id="checkbox_2" type="checkbox" onclick="PayBy_cash()">
		 					<label for="checkbox_2" >Pay with cash</label>
		 				</div>
		 				<div id="cash_info">
		 					<div id="sec_text">
		 						<p>To Continue Paying Cash for your Booking . Please make sure to 
									visit one of our offices in the next 24 hours </p>
		 					</div>
		 					<div id="office">
		 							<div id="title">
		 								<p id="main_text">Choose an office</p>
		 								<p id="desc_text">Finish your Booking in a nearby office</p>
		 							</div>
		 							<button><img src="${pageContext.request.contextPath}/assets/location.svg"></button>
		 					</div>
		 					<div id="confirmation">
		 						<button>Confirm Meeting</button>
		 					</div>
		 				</div>
		 			</div>
		 		</div>
		 		<div class="cards">
		 			<p id="title">Use saved cards</p>
		 			<div class="cardlist">
		 				<div id="card">
		 					<img src="${pageContext.request.contextPath}/assets/paymentCard2.svg"/>
		 				</div>
		 				<div id="card">
		 					<img src="${pageContext.request.contextPath}/assets/paymentCard3.svg"/>
		 				</div>
		 			</div>
		 			<div id="cta">
		 				<input id="cancel" type="submit" value="Cancel">
		 				<input id="next" type="submit" value="Next">
		 			</div>
		 		</div>
		 	</div>
		 	<div class="Bill">
		 		<h3>Bill Summary</h3>
		 		<div id="line"></div>
		 		<div id="row">
		 			<p id="title">car model</p>
		 			<p class="amount" id="model">Mini Cooper S</p>
		 		</div>
		 		<div id="row">
		 			<p id="title">daily rate</p>
		 			<p class="amount" id="rate">$ 100</p>
		 		</div>
		 		<div id="row">
		 			<p id="title">company fees</p>
		 			<p class="amount" id="fees">$ 10</p>
		 		</div>
		 		<div id="row">
		 			<p id="title">discount</p>
		 			<p class="amount" id="discount">-30%</p>
		 		</div>
		 		<div id="line"></div>
		 		<div id="insurance">
		 			<p id="title">Insurance</p>
		 			
		 			<div id="option">
		 				<p id="insurance_amount">$40</p>
		 				<input type="checkbox" id="_checkbox">
						<label for="_checkbox" id="insurance_value">
						  <div id="tick_mark"></div>
						</label>
		 			</div>
		 		</div>
		 		<div id="line"></div>
		 		<div id="row">
		 			<p id="title">Booking duration</p>
		 			<p class="amount" id="duration">8 days</p>
		 		</div>
		 		<div id="savings">
		 			<p>total savings $</p><p id="saving">240</p>
		 		</div>
		 		<div id="row">
		 			<p id="title">Booking Total</p>
		 			<p class="amount" id="total">$ 570</p>
		 		</div>
		 	</div>
		 </div>
		</div>
</div>
<script src="${pageContext.request.contextPath}/js/Finish_booking.js"></script>
</body>
</html>