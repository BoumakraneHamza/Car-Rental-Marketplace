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
			<button class="dashboard"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></a></button>
		<button class="Personal" ><a href="${pageContext.request.contextPath}/ViewAgencyPersonal"><img src="${pageContext.request.contextPath}/assets/personal-icon.svg"></a></button>
		<button class="Personal" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/ViewAgencyDepots"><img src="${pageContext.request.contextPath}/assets/building-icon-white.svg"></a></button>
		
	</div>
	<div class="main-frame">
		<div class="content_header">
			<div id="left">
				<div id="title_header">
					<div id="back" onclick="location.href='Dashboard'" style="cursor:pointer;">
						<img src="${pageContext.request.contextPath}/assets/angle-left-solid.svg">
					</div>
					<div id="title">
						<p>Depot N° </p>
						<p id="value">${depotcode}</p>
					</div>
				</div>
				<div id="searchBar">
					<img src="${pageContext.request.contextPath}/assets/search-icon.svg">
					<input type="text" placeholder="Search">
				</div>
			</div>
			<div id="right">
				<select name="Filter" id="filter">
					<option value="all">Show All</option>
				    <option value="depots">Show Rented</option>
				    <option value="offices">Show Available</option>
				</select>
			</div>
		</div>
		<div class="content-frame">
			<div class="content_body">
			<c:forEach items="${cars}" var="car">
			<div id="car">
				<div id="car_image"><img style="width:240px;height:151px;border-radius: 10px 10px 0px 0px ;" src="${pageContext.request.contextPath}${car.image}"></div>
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
				<h4 style="font-size: 15px;font-weight: 600;color: #C4C4C4;margin-top: 5px;margin-left: 10px;">Features :</h4>
				<div id="car_features">
					<div id="features">
						<span>Daily Rate : ${car.PLJ}</span>
						<span>Hourly Rate : ${car.PLH}</span>
					</div>
				</div>
				<div id="deal">
					<img src="${pageContext.request.contextPath}/assets/delete-icon.svg" onclick="confirmDelete('${car.matricule}')">
					<div id="cta" onclick="show_details('${car.matricule}')">
						<button>View Details</button>
					</div>
				</div>
			</div>	
			</c:forEach>					
			</div>
		</div>
	</div>
	<div class="sidebar">
		<p id="tab_header">Car review stats</p>
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
<script src="${pageContext.request.contextPath}/js/GaragisteCars.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
<%@include file="/jsp/AgencyCarDetails.jsp"%>
</body>
</html>