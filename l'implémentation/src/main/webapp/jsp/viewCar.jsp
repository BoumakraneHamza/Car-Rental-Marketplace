<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkbox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewCar.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dateRangePicker.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script><title>View Car</title>
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
	<div class="main-frame">
		<div class="image_wrapper">
			<div id="main_image">
				<img style="width: -webkit-fill-available;height: -webkit-fill-available;object-fit: cover;" src="${pageContext.request.contextPath}${vehicule.image}">
			</div>
			<div id="sec_images">
				<c:forEach items="${vehicule.getSecImages().keySet()}" var="key">
					<img src="${pageContext.request.contextPath}${vehicule.getSecImages().get(key)}">
				</c:forEach>
			</div>
			<button id="view_all"><img style="width: 13px;" src="${pageContext.request.contextPath}/assets/application-black.svg"><p>Show all photos</p></button>
		</div>
		<div class="banner">
			<div id="car_header">
				<div id="left">
					<div id="row">
						<div id="rating">
							<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/star.svg">
							<p id="value">${vehicule.getAverageRating()}</p>
							<p id="counter">(96 reviews)</p>
						</div>
						<p id="address">Constantine district constantine Algeria</p>
					</div>
					<p id="car_name">${vehicule.fullName}</p>
				</div>
				<div id="price"><p id="value">$ ${vehicule.PLJ}</p><p id="unit">day</p></div>
			</div>
			<div class="features"></div>
		</div>
		<div class="info_wrapper">
			<div class="car_features">
				<p id="tab_header">Whats's include</p>
				<div class="features-list">
					<div id="feature">
						<div id="icon_wrapper">
							<img style="width:20px;" src="${pageContext.request.contextPath}/assets/car-icon.svg">
						</div>
						<div id="text_wrapper">
							<p id="title">${vehicule.type}</p>
							<p id="subtitle">Body type</p>
						</div>
					</div>
					<div id="feature">
						<div id="icon_wrapper">
							<img style="width:16px;" src="${pageContext.request.contextPath}/assets/suit-case-icon.svg">
						</div>
						<div id="text_wrapper">
							<p id="title">${vehicule.getNumberSuitCase()} (Large case)</p>
							<p id="subtitle">Suite cases</p>
						</div>
					</div>
					<div id="feature">
						<div id="icon_wrapper">
							<img style="width:20px;" src="${pageContext.request.contextPath}/assets/car-doors-icon.svg">
						</div>
						<div id="text_wrapper">
							<p id="title">${vehicule.getNumberDoors()} doors</p>
							<p id="subtitle">Car doors</p>
						</div>
					</div>
					<div id="feature">
						<div id="icon_wrapper">
							<img style="width:20px;" src="${pageContext.request.contextPath}/assets/gas-pump-icon.svg">
						</div>
						<div id="text_wrapper">
							<p id="title">${vehicule.getMileage()}</p>
							<p id="subtitle">Car mileage</p>
						</div>
					</div>
				</div>
				<div class="car_description">
					<p id="tab_header">Car description</p>
					<p id="tab_content">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus, lorem eget maximus efficitur,
						purus lectus sagittis sem, ac fringilla orci massa ac felis. Phasellus non ex at purus placerat placerat.
						Mauris at est semper, lacinia ante nec, interdum orci. Vestibulum quis rutrum eros. Suspendisse potenti.
						Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque efficitur
						tellus ut luctus vulputate. Praesent congue fermentum nisl,
					</p>
				</div>
			</div>
			<div class="car_owner">
				<div id="owner">
					<p id="tab_header">Owning Agency</p>
					<div id="tab_content">
						<div id="left">
							<div id="image_wrapper">
								<img style="width:55px; height:55px;object-fit:cover;" src="${pageContext.request.contextPath}/assets/agency_pics/hertz-logo.png">
							</div>
							<div id="agency_info">
								<p id="agency_name">${vehicule.getAgence()}</p>
								<p id="followers">267 followers</p>
							</div>
						</div>
						<div id="cta">
							<div id="image_wrapper">
								<img style="width: 18px;" src="${pageContext.request.contextPath}/assets/follow-icon.svg">
							</div>
							<div id="image_wrapper">
								<img style="width: 18px;" src="${pageContext.request.contextPath}/assets/message-icon-purple.svg">
							</div>
						</div>
					</div>
				</div>
				<div id="insurance">
					<p id="tab_header">Insurance Options</p>
					<div id="tab_content">
						<div id="option">
							<div id="left">
								<input type="radio" name="insurance" checked>
								<div id="option_text">
									<p id="title">No insurance</p>
									<p id="subtitle">No insurance Selected</p>
								</div>
							</div>
							<div id="price">
								<p id="total">$0.00</p>
								<div id="perday">
									<p id="value">$0</p>
									<p>/day</p>
								</div>
							</div>
						</div>
						<div id="option">
							<div id="left">
								<input type="radio" name="insurance">
								<div id="option_text">
									<p id="title">No Worries on the vehicle</p>
									<p id="subtitle">Collision protection on the vehicle only</p>
								</div>
							</div>
							<div id="price">
								<p id="total">$52.00</p>
								<div id="perday">
									<p id="value">$13</p>
									<p>/day</p>
								</div>
							</div>
						</div>
						<div id="option">
							<div id="left">
								<input type="radio" name="insurance">
								<div id="option_text">
									<p id="title">Full Insurance</p>
									<p id="subtitle">Full protection</p>
								</div>
							</div>
							<div id="price">
								<p id="total">$87.00</p>
								<div id="perday">
									<p id="value">$18</p>
									<p>/day</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sidebar">
		<div id="sidebar_header">
			<p id="header">${vehicule.fullName}</p>
			<div id="right">
				<img style="width: 19px;" src="${pageContext.request.contextPath}/assets/heart-icon-black.svg">
				<p>Save</p>
			</div>
		</div>
		<form class="bill" action="initReservation" method="post">
			<input type="hidden" name="agence" value="${vehicule.getAgence()}">
			<input type="hidden" name="matricule" value="${vehicule.matricule}">
			<input type="hidden" name="pickUp_date" value="${filter.pickUp_date}">
			<input type="hidden" name="return_date" value="${filter.return_date}">
			<input type="hidden" name="pickUp_hour" value="${filter.pickUp_hour}">
			<input type="hidden" name="return_hour" value="${filter.return_hour}">
			<input type="hidden" name="location" value="${filter.location}">
			<div id="bill_content">
				<div id="dates">
					<div id="dates_header">
						<p>Check-in</p>
						<p>Check-out</p>
					</div>
					<input type="text" id="range_picker" name="range_picker">
				</div>
				<div id="duration">
					<div id="title">
						<p id="dur">3</p>
						<p id="text">days @ $210
					</div>
					<p id="value">$ 630.0</p>
				</div>
				<div id="tile">
					<p id="title">No worries for the vehicle</p>
					<p id="value">$ 52.0</p>
				</div>
				<div id="tile">
					<p id="title">Booking fee</p>
					<p id="value">$ 10.0</p>
				</div>
			</div>
			<div id="tile">
				<p id="title">total</p>
				<p id="value">$ 1023</p>
			</div>
			<button type="submit" id="cta">Book Now</button>
		</form>
		<div class="reviews">
			<p id="reviews_header">Reviews</p>
			<div id="review_list">
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var SearchStartDate = "${filter.pickUp_date}";
	console.log(SearchStartDate);
	SearchStartDate = SearchStartDate.substr(6, 4)+"-"+SearchStartDate.substr(3, 2)+"-"+SearchStartDate.substr(0, 2);
	var SearchEndDate = "${filter.return_date}";
	SearchEndDate = SearchEndDate.substr(6, 4)+"-"+SearchEndDate.substr(3, 2)+"-"+SearchEndDate.substr(0, 2);
	
</script>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/viewCar.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>