<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMainPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkbox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/toggle.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
   integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
   crossorigin=""/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dateRangePicker.css"/>
</head>
<body>
<div class="header">
	<div class="logo" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
		<img src="${pageContext.request.contextPath}/assets/logoBlack.svg">
		<p id="logo_title">Unique</p>
	</div>
	<div class="user">
		<c:choose>
			<c:when test="${user != null}">
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
			</c:when>
			<c:otherwise>
				<a style="color:#B8B08D;font-size: 17px;font-weight: 500;margin-left: 30px;" href="${pageContext.request.contextPath}/SignUp">join us</a>
				<a href="/Atelier/Login" style="color: #000;font-size: 17px;font-weight: 500;margin-left: 30px;">login</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<div class="content">
	<c:choose>
		<c:when test="${user != null}">
			<div class="menu">
				<div class="menu-tab" style="background: #C5DCFA;" onclick="location.href='${pageContext.request.contextPath}/CarSearch'">
					<img style="width:20px;" src="${pageContext.request.contextPath}/assets/home-icon-purple.svg">
					<p style="color:#0F56B3;" id="title">Explore</p>
				</div>
				<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/ReservationList'">
					<img style="width:21px;" src="${pageContext.request.contextPath}/assets/ledger.svg">
					<p id="title">Bookings</p>
				</div>
				<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/ClientPayment'">
					<img style="width:21px;" src="${pageContext.request.contextPath}/assets/payment-icon.svg">
					<p id="title">Payment</p>
				</div>
			</div>
		</c:when>
	</c:choose>
	<div class="main-frame">
		<div class="main-frame-header">
			<div class="seach_section">
				<div id="search_bar">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/search-icon.svg">
					</div>
					<input aria-autocomplete="both" aria-haspopup="false" autocapitalize="off" autocomplete="off" autocorrect="off" autofocus="" role="combobox" spellcheck="false" type="text" Placeholder="Search" id="location_input">
					<img id="erase_search" src="${pageContext.request.contextPath}/assets/cancel-fill-circle.svg">
				</div>
				<form id="search_form" style="display:none">
					<input id="location" type="hidden" name="location" value="${filters.location}">
					
					<input id="pick_up_date" type="hidden" name="pickUp_date" value="${filters.pickUp_date}">
					
					<input id="return_date" type="hidden" name="return_date" value="${filters.return_date}">
					
					<input id="pick_up_hour" type="hidden" name="pickUp_hour" value="${filters.pickUp_hour}">
					 
					<input id="return_hour" type="hidden" name="return_hour" value="${filters.return_hour}">
				</form>
				<input type="text" id="range_picker" name="range_picker">
				<div id="minimize_wrapper">
					<img style="width:15px;margin-right:5px;" id="minimize" src="${pageContext.request.contextPath}/assets/check.svg">
					<p>Search</p>
				</div>
			</div>
			<div id="tab_header">
				<div id="title">
					<p id="nearby">Recommended</p>
				</div>
				<div id="section">
					<p>Popular</p>
					<div id="image_wrapper">
						<img style="width: 10px;" src="${pageContext.request.contextPath}/assets/up&down-grey.svg">
					</div>
				</div>
			</div>
		</div>
		<div class="main_content">
			<form class="filter">
				<div id="map_toggle">
					<div style="margin:0px;" id="text">
						<p id="title">Map</p>
						<p>View</p>
					</div>
					<div class='toggle-check' onclick="toggleMap()">
					  <input type='checkbox'/>
					  <span class='toggle-b'></span>
					  <span class='toggle-bg'></span>
					</div>
				</div>
				<div id="car-type"class="checkbox-style">
					<div id="text">
						<p id="title">Car</p>
						<p>Category</p>
					</div>
					<div id="option">
					<label>Compact</label>
					<input type="checkbox" name="typeFilter" value="Compact" onclick="filterCars(this)">
					</div>
					<div id="option">
					<label>Coupe</label>
					<input type="checkbox" name="typeFilter" value="Coupe" onclick="filterCars(this)">
					</div>
					<div id="option">
					<label>Sedan</label>
					<input type="checkbox" name="typeFilter" value="Sedan" onclick="filterCars(this)">
					</div>
					<div id="option">
					<label>Suv</label>
					<input type="checkbox" name="typeFilter" value="Suv" onclick="filterCars(this)">
					</div>
					<div id="option">
					<label>Premium</label>
					<input type="checkbox" name="typeFilter" value="Premium" onclick="filterCars(this)">
					</div>
				</div>
				<div id="price">
					<div id="text">
						<p id="title">Price</p>
						<p>Range</p>
					</div>
					<div id="row">
						<div id="tile">
							<p>minimum</p>
							<div id="display_value">
								<input id="min_value" readonly type="text" value="0">
								<p>USD</p>
							</div>
						</div>
						<div id="tile">
							<p>maximum</p>
							<div id="display_value">
								<input id="max_value" readonly type="text" value="1000">
								<p>USD</p>
							</div>
						</div>
					</div>
					<div id="slider">
						<div id="progress"></div>
					</div>
					<div class="range-input">
						<input step="10" type="range" class="range-min" min="0" max="1000" value="0" onchange="filterCars(this)">
						<input step="10" type="range" class="range-max" min="0" max="1000" value="1000" onchange="filterCars(this)">
					</div>
				</div>
				<div id="rating" class="checkbox-style">
					<div id="text">
						<p id="title">Car</p>
						<p>Rating</p>
					</div>
					<div id="rating_list">
						<div id="tile" onclick="filterCars(this)">
							<input type="radio" name="rating">
							<img src="${pageContext.request.contextPath}/assets/star.svg">
							<p id="value">2</p>
						</div>
					 	<div id="tile" onclick="filterCars(this)">
							<input type="radio" name="rating">
							<img src="${pageContext.request.contextPath}/assets/star.svg">
							<p id="value">3</p>
						</div>
						<div id="tile" onclick="filterCars(this)">
							<input type="radio" name="rating">
							<img src="${pageContext.request.contextPath}/assets/star.svg">
							<p id="value">4</p>
						</div>
						<div id="tile" onclick="filterCars(this)">
							<input type="radio" name="rating">
							<img src="${pageContext.request.contextPath}/assets/star.svg">
							<p id="value">5</p>
						</div>
					</div>
				</div>
			</form>
			<div class="map">
				<div id="map_wrapper"></div>
			</div>
			<div id="tab_content">
				<div id="dashboard">
					<c:choose>
						<c:when test="${vehicules.size()>0}">
							<c:choose>
								<c:when test="${user != null}">
									<div id="recent_tab_header">
										<p id="section_header">Recent searches</p>
										<div id="subtitle"><p>You were looking for</p><p id="filter_location">${filters.location}</p></div>
									</div>
								</c:when>
							</c:choose>
							<div id="recent_tab_content">
							<c:forEach items="${vehicules}" var="vehicule">
								<div id="result">
									<div id="image_wrapper">
										<img id="car_image" style="width: 100%;object-fit: cover;height: 100%;" src="${pageContext.request.contextPath}${vehicule.image}">
										<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
										<form action="ViewCar" method="get" target="_blank">
											<input type="hidden" value="${vehicule.matricule}" name="car">
											<input id="pick_up_date" type="hidden" name="pickUp_date" value="${filters.pickUp_date}">
											<input id="return_date" type="hidden" name="return_date" value="${filters.return_date}">
											<input id="pick_up_hour" type="hidden" name="pickUp_hour" value="${filters.pickUp_hour}">
											<input id="return_hour" type="hidden" name="return_hour" value="${filters.return_hour}">
											<input type="hidden" name="location" value="${filters.location}">
											<button id="details">
												<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
												<p>Details</p>
											</button>
										</form>
									</div>
									<div id="result_info">
										<div id="row">
											<div id="left">
												<div id="rating">
													<div id="icon_wrapper">
														<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
													</div>
													<p id="value">5.0</p>
												</div>
												<p id="car_name">${vehicule.marque} ${vehicule.modele}</p>
											</div>
											<p id="price">$${vehicule.PLJ}</p>
										</div>
										<div id="row">
											<div id="section">
												<p id="agency_name">${vehicule.agence}</p>
												<p id="depot_address">Constantine district - constantine -algeria</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							</div>
						</c:when>
					</c:choose>
				</div>
				<div id="recommended_list">
					<div id="result">
						<div id="image_wrapper">
							<img id="car_image" style="width: 300px;object-fit: cover;height: 180px;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
							<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
							<div id="details">
								<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
								<p>Details</p>
							</div>
						</div>
						<div id="result_info">
							<div id="row">
								<div id="left">
									<div id="rating">
										<div id="icon_wrapper">
											<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
										</div>
										<p id="value">5.0</p>
									</div>
									<p id="car_name">Peugot e-208GT</p>
								</div>
								<p id="price">$200</p>
							</div>
							<div id="row">
								<div id="section">
									<p id="agency_name">Hertz</p>
									<p id="depot_address">Constantine district - constantine -algeria</p>
								</div>
							</div>
						</div>
					</div>
					<div id="result">
							<div id="image_wrapper">
								<img id="car_image" style="width: 300px;object-fit: cover;height: 180px;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
								<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
								<div id="details">
									<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
									<p>Details</p>
								</div>
							</div>
							<div id="result_info">
								<div id="row">
									<div id="left">
										<div id="rating">
											<div id="icon_wrapper">
												<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
											</div>
											<p id="value">5.0</p>
										</div>
										<p id="car_name">Peugot e-208GT</p>
									</div>
									<p id="price">$200</p>
								</div>
								<div id="row">
									<div id="section">
										<p id="agency_name">Hertz</p>
										<p id="depot_address">Constantine district - constantine -algeria</p>
									</div>
								</div>
							</div>
						</div>
						<div id="result">
							<div id="image_wrapper">
								<img id="car_image" style="width: 300px;object-fit: cover;height: 180px;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
								<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
								<div id="details">
									<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
									<p>Details</p>
								</div>
							</div>
							<div id="result_info">
								<div id="row">
									<div id="left">
										<div id="rating">
											<div id="icon_wrapper">
												<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
											</div>
											<p id="value">5.0</p>
										</div>
										<p id="car_name">Peugot e-208GT</p>
									</div>
									<p id="price">$200</p>
								</div>
								<div id="row">
									<div id="section">
										<p id="agency_name">Hertz</p>
										<p id="depot_address">Constantine district - constantine -algeria</p>
									</div>
								</div>
							</div>
						</div>
						<div id="result">
							<div id="image_wrapper">
								<img id="car_image" style="width: 300px;object-fit: cover;height: 180px;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
								<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
								<div id="details">
									<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
									<p>Details</p>
								</div>
							</div>
							<div id="result_info">
								<div id="row">
									<div id="left">
										<div id="rating">
											<div id="icon_wrapper">
												<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
											</div>
											<p id="value">5.0</p>
										</div>
										<p id="car_name">Peugot e-208GT</p>
									</div>
									<p id="price">$200</p>
								</div>
								<div id="row">
									<div id="section">
										<p id="agency_name">Hertz</p>
										<p id="depot_address">Constantine district - constantine -algeria</p>
									</div>
								</div>
							</div>
						</div>
						<div id="result">
							<div id="image_wrapper">
								<img id="car_image" style="width: 300px;object-fit: cover;height: 180px;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
								<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
								<div id="details">
									<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
									<p>Details</p>
								</div>
							</div>
							<div id="result_info">
								<div id="row">
									<div id="left">
										<div id="rating">
											<div id="icon_wrapper">
												<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
											</div>
											<p id="value">5.0</p>
										</div>
										<p id="car_name">Peugot e-208GT</p>
									</div>
									<p id="price">$200</p>
								</div>
								<div id="row">
									<div id="section">
										<p id="agency_name">Hertz</p>
										<p id="depot_address">Constantine district - constantine -algeria</p>
									</div>
								</div>
							</div>
						</div>
						<div id="result">
							<div id="image_wrapper">
								<img id="car_image" style="width: 300px;object-fit: cover;height: 180px;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
								<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
								<div id="details">
									<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
									<p>Details</p>
								</div>
							</div>
							<div id="result_info">
								<div id="row">
									<div id="left">
										<div id="rating">
											<div id="icon_wrapper">
												<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
											</div>
											<p id="value">5.0</p>
										</div>
										<p id="car_name">Peugot e-208GT</p>
									</div>
									<p id="price">$200</p>
								</div>
								<div id="row">
									<div id="section">
										<p id="agency_name">Hertz</p>
										<p id="depot_address">Constantine district - constantine -algeria</p>
									</div>
								</div>
							</div>
						</div>
				</div>
				<!--<div id="result">
					<div id="image_wrapper">
						<img id="car_image" style="width: 300px;object-fit: cover;height: 180px;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
						<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
						<div id="details">
							<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
							<p>Details</p>
						</div>
					</div>
					<div id="result_info">
						<div id="row">
							<div id="left">
								<div id="rating">
									<div id="icon_wrapper">
										<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
									</div>
									<p id="value">5.0</p>
								</div>
								<p id="car_name">Peugot e-208GT</p>
							</div>
							<p id="price">$200</p>
						</div>
						<div id="row">
							<div id="section">
								<p id="agency_name">Hertz</p>
								<p id="depot_address">Constantine district - constantine -algeria</p>
							</div>
						</div>
					</div>
				</div>
				<div id="result">
					<div id="image_wrapper">
						<img id="car_image" style="width: 300px;object-fit: cover;height: 180px;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
						<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
						<div id="details">
							<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
							<p>Details</p>
						</div>
					</div>
					<div id="result_info">
						<div id="row">
							<div id="left">
								<div id="rating">
									<div id="icon_wrapper">
										<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
									</div>
									<p id="value">5.0</p>
								</div>
								<p id="car_name">Peugot e-208GT</p>
							</div>
							<p id="price">$200</p>
						</div>
						<div id="row">
							<div id="section">
								<p id="agency_name">Hertz</p>
								<p id="depot_address">Constantine district - constantine -algeria</p>
							</div>
						</div>
					</div>
				</div>
				<div id="result">
					<div id="image_wrapper">
						<img id="car_image" style="width: 300px;object-fit: cover;height: 180px;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
						<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
						<div id="details">
							<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
							<p>Details</p>
						</div>
					</div>
					<div id="result_info">
						<div id="row">
							<div id="left">
								<div id="rating">
									<div id="icon_wrapper">
										<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
									</div>
									<p id="value">5.0</p>
								</div>
								<p id="car_name">Peugot e-208GT</p>
							</div>
							<p id="price">$200</p>
						</div>
						<div id="row">
							<div id="section">
								<p id="agency_name">Hertz</p>
								<p id="depot_address">Constantine district - constantine -algeria</p>
							</div>
						</div>
					</div>
				</div>
				<div id="result">
					<div id="image_wrapper">
						<img id="car_image" style="width: 300px;object-fit: cover;height: 180px;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
						<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
						<div id="details">
							<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
							<p>Details</p>
						</div>
					</div>
					<div id="result_info">
						<div id="row">
							<div id="left">
								<div id="rating">
									<div id="icon_wrapper">
										<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
									</div>
									<p id="value">5.0</p>
								</div>
								<p id="car_name">Peugot e-208GT</p>
							</div>
							<p id="price">$200</p>
						</div>
						<div id="row">
							<div id="section">
								<p id="agency_name">Hertz</p>
								<p id="depot_address">Constantine district - constantine -algeria</p>
							</div>
						</div>
					</div>
				</div>
				<div id="result">
					<div id="image_wrapper">
						<img id="car_image" style="width: 300px;object-fit: cover;height: 180px;" src="${pageContext.request.contextPath}/assets/car_pics/car02.jpg">
						<img id="like" src="${pageContext.request.contextPath}/assets/heart-icon.svg">
						<div id="details">
							<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
							<p>Details</p>
						</div>
					</div>
					<div id="result_info">
						<div id="row">
							<div id="left">
								<div id="rating">
									<div id="icon_wrapper">
										<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star-grey.svg">
									</div>
									<p id="value">5.0</p>
								</div>
								<p id="car_name">Peugot e-208GT</p>
							</div>
							<p id="price">$200</p>
						</div>
						<div id="row">
							<div id="section">
								<p id="agency_name">Hertz</p>
								<p id="depot_address">Constantine district - constantine -algeria</p>
							</div>
						</div>
					</div>
				</div>
			</div> -->
		</div>
	</div>
</div>
</div>
<c:choose>
	<c:when test="${status.equals('success')}">
		<style>
			.content{
				filter:blur(5px);
			}
		</style>
		<div id="booking_completed">
			<img style="width:100px;" src="${pageContext.request.contextPath}/assets/check-illustration.svg">
			<p id="title">Booking Completed</p>
			<p id="subtitle">Congrats! Your Booking successfully done</p>
			<button id="ok" onclick="deleteUnBlur()"><p>Ok</p></button>
		</div>
	</c:when>
</c:choose>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
   crossorigin="">
</script>
<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/ClientMainPage.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>