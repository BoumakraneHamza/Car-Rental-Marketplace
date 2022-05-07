<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/GaragisteCars.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<title>Cars</title>
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
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/dashboard2-icon.svg">
			<p id="title">Dashboard</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/GaragisteBookings'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/ledger.svg">
			<p id="title">Bookings</p>
		</div>
		<div class="menu-tab" style="background: #C5DCFA;" onclick="location.href='${pageContext.request.contextPath}/GaragisteCars'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/coffee_cup_purple.svg">
			<p style="color:#0F56B3;" id="title">Reviews</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/jsp/GaragisteProblems.jsp'">
			<img style="width:13px;" src="${pageContext.request.contextPath}/assets/activity.svg">
			<p id="title">Problems</p>
		</div>
	</div>
	<div class="main-frame">
		<div id="main-header-wrapper">
			<p id="main-frame-header">Depot vehicles</p>
			<select name="Filter" id="filter">
				<option value="all">Show All</option>
			    <option value="depots">Show Rented</option>
			    <option value="offices">Show Available</option>
			</select>
		</div>
		<div class="content-frame">
		<div class="content_header">
			<div id="left">
				<div id="searchBar">
					<img src="${pageContext.request.contextPath}/assets/search-icon.svg">
					<input type="text" placeholder="Search">
				</div>
			</div>
		</div>
			<div class="content_body">
			<c:forEach items="${cars}" var="car">
			<div id="car">
				<div id="car_image">
					<div id="cta">
						<img id="calendar" src="${pageContext.request.contextPath}/assets/date-checked-white.svg">
						<img onclick="showStat(this)" id="stats"src="${pageContext.request.contextPath}/assets/chart-pie-white.svg">
					</div>
					<img style="width:240px;height:151px;border-radius: 10px 10px 0px 0px ;" src="${pageContext.request.contextPath}${car.image}">
				</div>
				<div id="car_info">
					<div id="names">
						<p id="carName">${car.marque} ${car.modele}</p>
						<input type="hidden" id="matricule" value="${car.matricule}"></input>
					</div>
					<div id="rating">
						<img style="width: 18px;margin-right: 5Px;" src="${pageContext.request.contextPath}/assets/star.svg">
						<p id="score">${car.getAverageRating()}</p>
					</div>
				</div>
			</div>	
			</c:forEach>					
			</div>
		</div>
	</div>
	<div class="sidebar" style="display:none">
		<div id="sidebar_header">
		<p id="tab_header">Car review stats</p>
		<button id="exit" onclick="hideStat()">X</button>
		</div>
		<div id="canvas_wrapper">
			<canvas id="stat1"></canvas>
		</div>
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
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/GaragisteCars.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>