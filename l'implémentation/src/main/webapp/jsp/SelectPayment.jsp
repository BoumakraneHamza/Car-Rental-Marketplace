<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Method</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Finish_Booking.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
<script src="https://js.stripe.com/v3/"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
   integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
   crossorigin=""/>
</head>
<body>
<input type="hidden" id="reservation_id_selected_payment" value="${reservation.id}">
<div class="header">
	<div class="logo" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
		<img src="${pageContext.request.contextPath}/assets/logoBlack.svg">
		<p id="logo_title">Unique</p>
	</div>
	<div class="user">
	<img id="notification" src="${pageContext.request.contextPath}/assets/notification.svg">
	<div id="user-image">
		<c:choose>
			<c:when test="${user.image.substring(0,5).equals(\"https\")}">
				<img style="width: 40px;" src="${user.image}">
			</c:when>
			<c:otherwise>
				<img style="width: 40px;" src="${pageContext.request.contextPath}${user.image}">
			</c:otherwise>
		</c:choose>
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
	<div class="frame">
		<div class="step_slider">
			<div class="Progressline">
				<div class="checkpoint">
					<div class="point active"></div>
					<p>Payment</p>
				</div>
				<div class="checkpoint">
					<div class="point active"></div>
					<p>Identity verification</p>
				</div>
				<div class="checkpoint">
					<div class="point"></div>
					<p>Contract Confirmation</p>
				</div>
				<div class="checkpoint">
					<div class="point"></div>
					<p>Signature</p>
				</div>
			</div>
		</div>
		<div class="main_content">
			<div class="main-frame">
				<p id="tab_header">Payment information</p>
				<div class="main_frame_content">
				<div class="payment_methods">
					<div id="tabs">
						<div class="tab active" onclick="selectTab(this)">Pay Now</div>
						<div class="tab" onclick="selectTab(this)">Meeting</div>
					</div>
					<div class="tabs_content">
						<form id="payment-form">
					      <div id="payment-element">
					        <!--Stripe.js injects the Payment Element-->
					      </div>
					      <button id="submit">
					        <div class="spinner hidden" id="spinner"></div>
					        <span id="button-text">Pay now</span>
					      </button>
					      <div id="payment-message" class="hidden"></div>
					    </form>
						<div id="createMeeting" style="visibility:hidden">
							<p id="text">Please Select a nearby office to make an appointment for you to continue your booking process</p>
							<input value="${reservation.id}" type="hidden" id="reservationID">
							<button id="view_map" onclick="show_select_location(this)"><img src="${pageContext.request.contextPath}/assets/location.svg"></button>
							<button style="display:none;" id="meeting_confirmation"></button>
						</div>
					</div>
					</div>
					<div id="cards_list">
						<c:choose>
							<c:when test="${cardlist.size() >0}">
							<p id="title_header">Your Saved Cards</p>
							<div id="list">
								<c:forEach items="${cardlist}" var="Paymentcard">
									<div onclick="PayWithSaved(this)" class="card" style="background-image:url(https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/6.jpeg);">
										<input id="payment_method_id" type="hidden" name="payment_method" value="">
										<input id="customer_id" type="hidden" name="customer_id" value="${customer_id}"> 
										<div class="card_info">
											<div class="card_top">
												<img src="https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/chip.png" class="item_chip">
											 <div class="item_type">
											 	<img src="https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/visa.png" alt="" class="item_typeImg">
											 </div>
											</div>
											<div class="card_number">
												<span>**** **** **** ${Paymentcard.getCardNumber()}</span>
											</div>
											<div class="item_bottom">
												<div id="holder">
													<p>card holder</p>
													<p id="holder_full_name">${user.getNom()} ${user.getPrenom()}</p>
												</div>
												<div id="card_Expiry_date">
													<p>Expiry date</p>
													<p id="card_expiry_date">${Paymentcard.exp_month}/${Paymentcard.exp_year}</p>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							</c:when>
							<c:otherwise>
								<p id="title_header">No saved cards</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<div class="main_tab_header" id="tab_header">
					<div id="left">
						<img style="width: 25px;" src="${pageContext.request.contextPath}/assets/cart-purple.svg">
						<p id="title">Order Summary</p>
					</div>
				</div>
				<div id="card">
					<div id="tab_header">
						<p id="title">About Your Car</p>
						<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
					</div>
					<div id="info_list">
						<div id="tile">
							<p id="title">Your vehicle :</p>
							<p id="value">${reservation.vehicule.marque} ${reservation.vehicule.modele}</p>
						</div>
						<div id="tile">
							<p id="title">Daily Rate</p>
							<p id="value">$ ${reservation.vehicule.PLJ}</p>
						</div>
					</div>
				</div>
				<div id="card">
					<div id="tab_header">
						<p id="title">About Your Booking</p>
						<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
					</div>
					<div id="info_list">
						<div id="tile">
							<p id="title">Car Insurance :</p>
							<p id="value">$ ${reservation.payment.insurance}</p>
						</div>
						<div id="tile">
							<p id="title">Pick up date :</p>
							<p id="value">${reservation.pick_up_date}</p>
						</div>
						<div id="tile">
							<p id="title">Return date :</p>
							<p id="value">${reservation.return_date}</p>
						</div>
					</div>
				</div>
				<div id="card">
					<div id="tab_header">
						<p id="title">Total Price (VAT included) :</p>
					</div>
					<div id="info_list">
						<div id="tile">
							<p id="title">regular price :</p>
							<p id="value">$ ${price}</p>
						</div>
						<div id="perklist">
							<div id="tile">
								<div id="image_wrapper">
									<img style="width: 27px;" src="${pageContext.request.contextPath}/assets/percentage-icon.svg">
								</div>
								<p id="perk_text">Best Price Guarantee</p>
							</div>
							<div id="tile">
								<div id="image_wrapper">
									<img style="width: 15px;" src="${pageContext.request.contextPath}/assets/lock.svg">
								</div>
								<p id="perk_text">100% secure purchase</p>
							</div>
						</div>
						<div id="promo_code">
							<p>Do you have a promo_code</p>
							<p id="submit">Click here</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="view_Location" style="display:none;">
	<div id="select_map_wrapper"></div>
	<div id="inputs">
		<div id="right">
			<button onclick="submitSelectedLocation()" id="select_location"><img src="${pageContext.request.contextPath}/assets/check.svg"><p>Select</p></button>
			<img onclick="closeSelectMap()" style="cursor:pointer;" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
		</div>
	</div>
</div>
<div class="selectCustomDate" style="display:none;">
	<div class="tab_header">
		<div id="primary_header">
			<p id="title">Book a Meeting</p>
			<img onclick="selectCustom()" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
		</div>
		<div id="secondary_header">
			<div id="dayHeader">
				<p id="day_name">Wednesday</p>
				<p id="day_count">6</p>
				<div id="borderBottom"></div>
			</div>
			<div id="dayHeader">
				<p id="day_name">Thursday</p>
				<p id="day_count">7</p>
				<div id="borderBottom"></div>
			</div>
			<div id="dayHeader">
				<p id="day_name">Sunday</p>
				<p id="day_count">8</p>
				<div id="borderBottom"></div>
			</div>
			<div id="dayHeader">
				<p id="day_name">Monday</p>
				<p id="day_count">9</p>
				<div id="borderBottom"></div>
			</div>
		</div>
	</div>
	<div class="tab_content">
	</div>
</div>
<div class="confirmMeetingSelection" style="display:none">
	<div id="tab_header">
		<img style="cursor:pointer;" onclick="hideConfirmMeetingSelection()" src="${pageContext.request.contextPath}/assets/cancel.svg">
	</div>
	<div id="tab_content">
		<p id="date_day">20 December 2022</p>
		<p id="date_time">10:00 to 10:30</p> 	
	</div>
	<div id="cta">
		<button onclick="ConfirmMeeting()" id="confirm">Save</button>
	</div>
</div>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
   crossorigin="">
</script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/checkout.js"></script>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/SelectPayment.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>