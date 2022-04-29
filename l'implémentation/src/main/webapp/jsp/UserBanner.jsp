<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/UserBanner.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
   integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
   crossorigin=""/>
<title>UserBanner</title>
</head>
<body>
<div class="banner_wrapper" style="display:none;">
</div>
<div class="User_Banner">
	<div class="profile_Banner">
		<div id="map">
			<div id="map_canvas" class="gmap_canvas"></div>
		</div>
		<button id="exit"><img src="${pageContext.request.contextPath}/assets/cancel-black.svg"></button>
	</div>
	<div class="Profile_info">
		<div id="client_image_header">
			<div id="client_image">
				<img style="width:75px;" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
			</div>
		</div>
		<div id="client_info">
			<div id="first_row">
				<div id="client_name">Nathanial Olson</div>
				<div id="status"><img style="width:20px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="value">Active</p></div>
			</div>
			<div id="second_row">
				<div id="client_email">NathanialOlson@email.com</div>
				<div id="client_location">Batna , Algeria</div>
			</div>
			<div id="third_row">
				<div id="tiles">
					<div id="tile">
						<p id="title">Joined In</p>
						<p id="subtitle">10 Dec, 2022</p>
					</div>
					<div id="tile" class="middle">
						<p id="title">N° Bookings</p>
						<p id="subtitle">10</p>
					</div>
					<div id="tile">
						<p id="title">N° Warnings</p>
						<p id="subtitle">0</p>
					</div>
				</div>
				<div id="options">
					<img style="width: 15px;" src="${pageContext.request.contextPath}/assets/3-point-option.svg">
					<div id="report_client" style="display:none;">
						<div id="tile">
							<img src="${pageContext.request.contextPath}/assets/info.svg">
							<p id="title">Report client</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="Reservations_list">
		<div id="list_header">
			<div id="title_div">
				<p id="title">Bookings</p>
				<p id="counter">(8)</p>
			</div>
			<img class="header_icon" src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
		</div>
		<div id="list_content" style="display:none;">
			<div id="booking">
				<img style="width:150px;border-radius: 10px;margin-right: 10px;" id="car_image" src="${pageContext.request.contextPath}/assets/car_pics/car03.jpg">
				<div id="booking_info">
					<div id="first_row">
						<p id="car_name">Porche 911</p>
						<p id="depot_code">Depot: 02</p>
					</div>
					<div id="second_row">
						<div id="tile">
							<p id="title">Booking Date</p>
							<p id="value">10 Dec,2022</p>
						</div>
						<div id="tile">
							<p id="title">Duration</p>
							<p id="value">02 days</p>
						</div>
						<div id="tile" style="align-items: flex-end;">
							<p id="title">Price</p>
							<p id="value">$ 180</p>
						</div>
					</div>
				</div>
			</div>
			<div id="booking">
				<img style="width:150px;border-radius: 10px;margin-right: 10px;" id="car_image" src="${pageContext.request.contextPath}/assets/car_pics/car03.jpg">
				<div id="booking_info">
					<div id="first_row">
						<p id="car_name">Porche 911</p>
						<p id="depot_code">Depot: 02</p>
					</div>
					<div id="second_row">
						<div id="tile">
							<p id="title">Booking Date</p>
							<p id="value">10 Dec,2022</p>
						</div>
						<div id="tile">
							<p id="title">Duration</p>
							<p id="value">02 days</p>
						</div>
						<div id="tile" style="align-items: flex-end;">
							<p id="title">Price</p>
							<p id="value">$ 180</p>
						</div>
					</div>
				</div>
			</div>
			<div id="booking">
				<img style="width:150px;border-radius: 10px;margin-right: 10px;" id="car_image" src="${pageContext.request.contextPath}/assets/car_pics/car03.jpg">
				<div id="booking_info">
					<div id="first_row">
						<p id="car_name">Porche 911</p>
						<p id="depot_code">Depot: 02</p>
					</div>
					<div id="second_row">
						<div id="tile">
							<p id="title">Booking Date</p>
							<p id="value">10 Dec,2022</p>
						</div>
						<div id="tile">
							<p id="title">Duration</p>
							<p id="value">02 days</p>
						</div>
						<div id="tile" style="align-items: flex-end;">
							<p id="title">Price</p>
							<p id="value">$ 180</p>
						</div>
					</div>
				</div>
			</div>
			<div id="booking">
				<img style="width:150px;border-radius: 10px;margin-right: 10px;" id="car_image" src="${pageContext.request.contextPath}/assets/car_pics/car03.jpg">
				<div id="booking_info">
					<div id="first_row">
						<p id="car_name">Porche 911</p>
						<p id="depot_code">Depot: 02</p>
					</div>
					<div id="second_row">
						<div id="tile">
							<p id="title">Booking Date</p>
							<p id="value">10 Dec,2022</p>
						</div>
						<div id="tile">
							<p id="title">Duration</p>
							<p id="value">02 days</p>
						</div>
						<div id="tile" style="align-items: flex-end;">
							<p id="title">Price</p>
							<p id="value">$ 180</p>
						</div>
					</div>
				</div>
			</div>
			<div id="booking">
				<img style="width:150px;border-radius: 10px;margin-right: 10px;" id="car_image" src="${pageContext.request.contextPath}/assets/car_pics/car03.jpg">
				<div id="booking_info">
					<div id="first_row">
						<p id="car_name">Porche 911</p>
						<p id="depot_code">Depot: 02</p>
					</div>
					<div id="second_row">
						<div id="tile">
							<p id="title">Booking Date</p>
							<p id="value">10 Dec,2022</p>
						</div>
						<div id="tile">
							<p id="title">Duration</p>
							<p id="value">02 days</p>
						</div>
						<div id="tile" style="align-items: flex-end;">
							<p id="title">Price</p>
							<p id="value">$ 180</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
   crossorigin=""></script>
<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/Map.js"></script>
<script src="${pageContext.request.contextPath}/js/userBanner.js"></script>

</html>