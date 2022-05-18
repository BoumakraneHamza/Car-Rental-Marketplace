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
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
   integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
   crossorigin=""/>
</head>
<body>
<div class="header">
	<div class="logo" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
		<img src="${pageContext.request.contextPath}/assets/logoBlack.svg">
		<p id="logo_title">Unique</p>
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
						<form class="pay_info_form" action="ContractManagement" method="post">
						<input name="reservationId" type="hidden" value="${reservationId}">
						<div id="row">
							<div id="input_field">
								<p id="title">Holder Card</p>
								<input required id="holder_card" type="text">
							</div>
							<div id="input_field">
								<p id="title">CCV</p>
								<input required type="text" autocomplete="off" class="ccv" id="input_s">
							</div>
						</div>
						<div id="row">
							<div id="input_field">
								<p id="title">Card Number</p>
								<div id="inputField">
									<input required type="text" id="card_number">
									<img src="${pageContext.request.contextPath}/assets/visa_blue.svg">
								</div>
							</div>
						</div>
						<div id="row">
							<div id="input_field">
								<p id="title">Expiration</p>
								<div id="select_row">
									<select required id="selectCard" class="expmonth">
									<option value="" disabled="disabled" selected="selected">Month</option>
										 <option value="01">
							                    01
							                </option><option value="02">
							                    02
							                </option><option value="03">
							                    03
							                </option><option value="04">
							                    04
							                </option><option value="05">
							                    05
							                </option><option value="06">
							                    06
							                </option><option value="07">
							                    07
							                </option><option value="08">
							                    08
							                </option><option value="09">
							                    09
							                </option><option value="10">
							                    10
							                </option><option value="11">
							                    11
							                </option><option value="12">
							                    12
							                </option></select> 
									<select required id="selectCard" class="expyear">
							                <option value="" disabled="disabled" selected="selected">Year</option>
							                <option value="2022">
							                    2022
							                </option><option value="2023">
							                    2023
							                </option><option value="2024">
							                    2024
							                </option><option value="2025">
							                    2025
							                </option><option value="2026">
							                    2026
							                </option><option value="2027">
							                    2027
							                </option><option value="2028">
							                    2028
							                </option><option value="2029">
							                    2029
							                </option><option value="2030">
							                    2030
							                </option><option value="2031">
							                    2031
							                </option><option value="2032">
							                    2032
							                </option><option value="2033">
							                    2033
							                </option>
							                </select>
								</div>
							</div>
						</div>
						<p id="notify_text">i authorise Unique company to charge my debit/credit <br> card for a total set amount</p>
						<div id="cta">
							<button id="cancel">Back</button>
							<button id="confirm"><img style="width:10px;" src="${pageContext.request.contextPath}/assets/lock-white.svg"><p>Confirm payment:</p><p>$ ${price}</p></button>
						</div>
						</form>
						<form class="back_form" action="BookingManagement" method="post">
							<input type="hidden" name="matricule" value="${matricule}">
							<input type="hidden" name="required_action" value="delete">
							<input type="hidden" name="pick_up_date" value="${reservation.pick_up_date}">
							<input type="hidden" name="return_date" value="${reservation.return_date}">
							<input type="hidden" name="reservationId" value="${reservationId}">
						</form>
						<div id="createMeeting" style="visibility:hidden">
							<p id="text">Please Select a nearby office to make an appointment for you to continue your booking process</p>
							<button id="view_map" onclick="show_select_location()"><img src="${pageContext.request.contextPath}/assets/location.svg"></button>
							<button style="display:none;" id="meeting_confirmation"></button>
						</div>
					</div>
					</div>
					<div id="cards_list">
						<p id="title_header">Your Saved Cards</p>
						<div id="list">
							<div onclick="selectCard(this)" class="card" style="background-image:url(https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/6.jpeg);">
								<input type="hidden" id="number" value="1122 3344 5566 7788">
								<input type="hidden" id="name" value="Nathanial olson">
								<input type="hidden" id="expyear" value="2024">
								<input type="hidden" id="expmonth" value="11">
								<input type="hidden" id="ccv" value="3041">
								<div class="card_info">
									<div class="card_top">
										<img src="https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/chip.png" class="item_chip">
									 <div class="item_type">
									 	<img src="https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/visa.png" alt="" class="item_typeImg">
									 </div>
									</div>
									<div class="card_number">
										<span>1122 3344 5566 7788</span>
									</div>
									<div class="item_bottom">
										<div id="holder">
											<p>card holder</p>
											<p id="holder_full_name">Nathanial  Olson</p>
										</div>
										<div id="card_Expiry_date">
											<p>Expiry date</p>
											<p id="card_expiry_date">11/24</p>
										</div>
									</div>
								</div>
							</div>
							<div id="card"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<div id="tab_header">
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
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
   crossorigin="">
</script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/Finish_booking.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>