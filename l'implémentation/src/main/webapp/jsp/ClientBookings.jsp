<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservationList.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Bookings</title>
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
	<div class="menu">
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/CarSearch'">
			<img style="width:20px;" src="${pageContext.request.contextPath}/assets/home.svg">
			<p id="title">Explore</p>
		</div>
		<div class="menu-tab" style="background: #C5DCFA;" onclick="location.href='${pageContext.request.contextPath}/ReservationList'">
			<img style="width:21px;" src="${pageContext.request.contextPath}/assets/ledger-purple.svg">
			<p style="color:#0F56B3;" id="title">Bookings</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/ClientPayment'">
			<img style="width:21px;" src="${pageContext.request.contextPath}/assets/payment-icon.svg">
			<p id="title">Payment</p>
		</div>
	</div>
	<div class="main-frame">
		<div class="main_header">
			<div id="section">
				<div id="image_wrapper">
					<img style="width:21px;" src="${pageContext.request.contextPath}/assets/arrow-icon-left-black.svg">
				</div>
				<p id="title">Your Bookings</p>
			</div>
			<div id="section">
				<div id="search_bar">
					<div id="search_icon_wrapper">
						<img style="width: 19px;" src="${pageContext.request.contextPath}/assets/search-icon.svg">
					</div>
					<input type="text" placeholder="search" id="search_field">
				</div>
			</div>
		</div>
		<div class="filters">
			<div class="tile">
				<div id="tile_header">
					<label>Status</label>
					<div id="filter_header">
						<div id="section">
							<img src="${pageContext.request.contextPath}/assets/ledger.svg" style="width: 17px;">
							<p>Show All</p>
						</div>
						<img style="width: 10px;" src="${pageContext.request.contextPath}/assets/up&down-grey.svg">
					</div>
				</div>
			</div>
			<div class="tile">
				<div id="tile_header">
					<label>Show Dates</label>
					<div id="filter_header">
						<div id="section">
							<img style="width: 15px;" src="${pageContext.request.contextPath}/assets/date-icon-grey.svg">
							<p>Show All</p>
						</div>
						<img style="width: 10px;" src="${pageContext.request.contextPath}/assets/up&down-grey.svg">
					</div>
				</div>
			</div>
			<div class="tile">
				<div id="tile_header">
					<label>Filter By Locations</label>
					<div id="filter_header">
						<div id="section">
							<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/location-grey.svg">
							<p>All Locations</p>
						</div>
						<img style="width: 10px;" src="${pageContext.request.contextPath}/assets/up&down-grey.svg">
					</div>
				</div>
			</div>
		</div>
		<div class="tags_list">
			<div class="add_tag_list" style="display:none;">
				<div id="tab_header" style="display:none;">
					<p id="title">Available tags</p>
					<img style="width:11px;" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
				</div>
				<div id="tag_list" style="display:none;">
					<div id="tag_select">Premium</div>
					<div id="tag_select">Compact</div>
					<div id="tag_select">Suv</div>
					<div id="tag_select">Coupe</div>
					<div id="tag_select">Sedan</div>
				</div>
			</div>
			<div class="new_tag" id="tag" onclick="showTags()">
				<p>Add Tag</p>
				<img style="width:10px;" src="${pageContext.request.contextPath}/assets/add-black.svg">
			</div>
			<div id="tag" >
				<p id="text">Premium</p>
				<img onclick="deleteTag(this)" id="cancel" style="width:9px;" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
			</div>
			<div id="tag" >
				<p id="text">Compact</p>
				<img onclick="deleteTag(this)" id="cancel" style="width:9px" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
			</div>
			<div id="tag" >
				<p id="text">Suv</p>
				<img onclick="deleteTag(this)" id="cancel" style="width:9px" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
			</div>
		</div>
		<div class="bookings_List">
			<!--<div id="BookingTile">
				<p id="header_date">April 10th-17th 2022</p>
				<div id="booking_tile_content">
					<div id="booking">
						<div id="booking_info">
							<div id="image_wrapper">
								<img style="width: 110px;height: 70px;object-fit: cover;" src="${pageContext.request.contextPath}/assets/car_pics/car03.jpg">
							</div>
							<div id="text_wrapper">
								<p id="car_name">Porche 911</p>
								<p id="agency_name">Hertz</p>
							</div>
						</div>
						<p id="type">Premium</p>
						<div id="location">
							<img src="${pageContext.request.contextPath}/assets/location-grey.svg">
							<p id="location">Constantine</p>
						</div>
						<div id="date">
							<img style="width: 22px;" src="${pageContext.request.contextPath}/assets/hour_icon_darkgrey.svg">
							<div id="date_range">
								<p>10th -</p>
								<p>13th</p>
							</div>
						</div>
						<div id="payment">
							<img style="width: 20px;" src="${pageContext.request.contextPath}/assets/check-round-white.svg">
							<p>Paid : $200</p>
						</div>
					</div>
				</div>
			</div> -->
		</div>
	</div>
	<div class="sidebar">
		<div class="upcoming_bookings">
			<div id="tab_header">
				<p id="title">Upcoming bookings</p>
				<div id="filter">
					<div id="filter_header">
						<div id="section">
							<img src="${pageContext.request.contextPath}/assets/ledger.svg" style="width: 15px;">
							<p>This Week</p>
						</div>
						<img style="width: 8px;" src="${pageContext.request.contextPath}/assets/up&down-grey.svg">
					</div>
				</div>
			</div>
			<div id="tab_content">
				<div id="booking">
					<div id="image_wrapper">
						<img style="width:75px;height:50px;object-fit:cover;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
					</div>
					<div id="text_wrapper">
						<div id="row">
							<p id="car_name">Porch 911</p>
							<div id="payment">
								<img style="width: 16px;" src="${pageContext.request.contextPath}/assets/check-round-white.svg">
								<p>$200</p>
							</div>
						</div>
						<p id="agency_name">Hertz</p>
					</div>
				</div>
			</div>
			<div id="tab_content">
				<div id="booking">
					<div id="image_wrapper">
						<img style="width:75px;height:50px;object-fit:cover;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
					</div>
					<div id="text_wrapper">
						<div id="row">
							<p id="car_name">Porch 911</p>
							<div id="payment">
								<img style="width: 16px;" src="${pageContext.request.contextPath}/assets/check-round-white.svg">
								<p>$200</p>
							</div>
						</div>
						<p id="agency_name">Hertz</p>
					</div>
				</div>
			</div>
			
		</div>
		<div class="Popular_cars">
			<p id="tab_header">Popular Cars Nearby</p>
			<div id="tab_list">
				<div id="car">
					<div id="image_wrapper">
						<img style="width:75px;height:50px;object-fit:cover;" src="${pageContext.request.contextPath}/assets/car_pics/car03.jpg">
					</div>
					<div id="car_info">
						<div id="tile">
							<p id="car_name">Porche 911</p>
							<p id="likes">287 likes</p>
						</div>
						<p id="address">Constantine - algeria</p>
					</div>
				</div>
				<div id="car">
					<div id="image_wrapper">
						<img style="width:75px;height:50px;object-fit:cover;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
					</div>
					<div id="car_info">
						<div id="tile">
							<p id="car_name">Peugot e-208GT</p>
							<p id="likes">263 likes</p>
						</div>
						<p id="address">Constantine - algeria</p>
					</div>
				</div>
				<div id="car">
					<div id="image_wrapper">
						<img style="width:75px;height:50px;object-fit:cover;" src="${pageContext.request.contextPath}/assets/car_pics/default01.jpg">
					</div>
					<div id="car_info">
						<div id="tile">
							<p id="car_name">Mini Cooper S</p>
							<p id="likes">196 likes</p>
						</div>
						<p id="address">Constantine - algeria</p>
					</div>
				</div>
			</div>
		</div>
		<div class="follow_agencies">
			<p id="tab_header">Agencies to Follow</p>
			<div id="tab_content">
				<div id="agency">
					<div id="image_wrapper">
						<img style="width: 75px;height: 75px;object-fit: cover;" src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<div id="text_wrapper">
						<div id="row">
							<p id="agency_name">Hertz</p>
							<p id="follow_count">200 followers</p>
						</div>
						<p id="address">Constantine - algeria</p>
						<button id="follow">Follow</button>
					</div>
				</div>
				<div id="agency">
					<div id="image_wrapper">
						<img style="width: 75px;height: 75px;object-fit: cover;" src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
					</div>
					<div id="text_wrapper">
						<div id="row">
							<p id="agency_name">Hertz</p>
							<p id="follow_count">200 followers</p>
						</div>
						<p id="address">Constantine - algeria</p>
						<button id="follow">Follow</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="details_wrapper" style="visibility:hidden;">
	<div id="wrapper" style="display:none;"></div>
	<div class="details_banner active">
		<div id="banner_header">
			<div id="text_block">
				<p id="date">10 December 2020</p>
				<div id="details">
					<p id="Price">$ 1200</p>
					<p id="status">pending</p>
				</div>
			</div>
			<div onclick="showDetails()" id="icon_wrapper">
				<img src="${pageContext.request.contextPath}/assets/cancel-black.svg">
			</div>
		</div>
		<div class="card_container">
			<div class="booking_info">
				<div id="tab_header">
					<div id="left">
						<p id="location">Constantine</p>
						<p>view location</p>
					</div>
					<div id="right">
						<div id="date">
							<p id="duration">4 days</p>
							<p>starting</p>
						</div>
						<p id="pick_up_date">10 November 2020</p>
					</div>
				</div>
				<div id="tab_content">
					<div id="tile">
						<div id="left">
							<p id="title">Booked Car</p>
							<p class="car_name" id="value">Mercedes c class</p>
						</div>
						<div id="price">
							<p class="total_price" id="value">$ 1200</p>
							<p id="per_day">$120 /day</p>
						</div>
					</div>
					<div id="tile">
						<div id="left">
							<p id="title">Insurance Policy</p>
							<p class="insuranceP" id="value">No insurance</p>
						</div>
						<p class="insuranceV" id="value">$ 0</p>
					</div>
					<div id="tile">
						<div id="left">
							<p id="title">Service fees</p>
							<p id="value">Booking fee</p>
						</div>
						<p id="value">$ 10</p>
					</div>
					<div id="footer">
						<div onclick="flip(1)" id="icon_wrapper">
							<img style="width: 20px;" src="${pageContext.request.contextPath}/assets/flip-icon-black.svg">
						</div>
						<p id="total">$1210</p>
					</div>
				</div>
			</div>
			<div class="payment_info">
				<p id="tab_title">Payment Information</p>
				<div class="card" style="background-image:url(https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/10.jpeg);">
					<div class="card_info">
						<div class="card_top">
							<img src="https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/chip.png" class="item_chip">
						 <div class="item_type">
						 	<img src="https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/visa.png" alt="" class="item_typeImg">
						 </div>
						</div>
						<div class="card_number">
							<span>**** **** **** 4242</span>
						</div>
						<div class="item_bottom">
							<div id="holder">
								<p>card holder</p>
								<p id="holder_full_name">${user.nom} ${user.prenom}</p>
							</div>
							<div id="card_Expiry_date">
								<p>Expiry date</p>
								<p id="card_expiry_date">07/2025</p>
							</div>
						</div>
					</div>
				</div>
				<div id="footer">
					<div onclick="flip(2)" id="icon_wrapper">
						<img style="width: 20px;" src="${pageContext.request.contextPath}/assets/flip-icon-black.svg">
					</div>
				</div>
			</div>
		</div>
		<div class="contract_list">
			<p id="tab_title">Associated Paper Work</p>
			<a target="_blank" href="${pageContext.request.contextPath}${reservationList[i].contrat}" id="contract">
				PDF
			</a>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/ClientBookings.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>