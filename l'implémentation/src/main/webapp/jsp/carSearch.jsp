<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carSearch.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkbox.css">
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
					<button class="search" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/CarSearch"><img src="${pageContext.request.contextPath}/assets/search-icon-white.svg"></a></button>
					<button class="dashboard" ><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></a></button>
					<button class="inbox" ><a href="${pageContext.request.contextPath}/Inbox"><img src="${pageContext.request.contextPath}/assets/inbox.svg"></a></button>
					<button class="payment"><a href="${pageContext.request.contextPath}/ClientPayment"><img src="${pageContext.request.contextPath}/assets/Wallet.svg"></a></button>
					<button class="exit" ><a href="${pageContext.request.contextPath}/Logout"><img src="${pageContext.request.contextPath}/assets/exit-icon.svg"></a></button>
		</div>
		<div class="main-frame">
			<div class="dropdownSearch">
				<nav>
					<div id="wrapper">
					<p>Choose a location and a date and Book Your Car</p>
					<a href="" class="btn" id="search"><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></a>
					</div>
					<div class="search_box" id="search_box">
		  				<div id="text">
		  					<h3>Book in 3 Easy Steps</h3>
		  					<p>Unique helps you find the freedom
								to take advantage of any opportunity</p>
		  				</div>
		  				<form action="CarSearch" method="post">
		  				<div id="search_inputs">
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/location.svg">
		  							<label>Location</label>
		  						</div>
		  						<input type="text" name="location">			
		  					</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/date.svg">
		  							<label>Pick-up date</label>
		  						</div>
								<input type="date" name="pickUp_date">
		  						</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/date.svg">
		  							<label>Return date</label>
		  						</div>
		  						<input type="date" name="return_date">
		  					</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/hour.svg">
		  							<label>Pick-up Hour</label>
		  						</div>
		  							<input type="time" name="pickUp_hour">
		  					</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/hour.svg">
		  							<label>Return Hour</label>
		  						</div>
		  							<input type="time" name="return_hour">
		  					</div>
		  					<input type="submit" value="Search">
		  				</div>
		  				</form>
					</div>
				</nav>
			</div>
			<div class="main-content">
				<div class="sec-menu">
					<h3 style="color: #C4C4C4;font-weight: 500;font-size: 20px;">Filters :</h3>
					<div id="car-type"class="checkbox-style">
						<h4 style="margin: 15px 0px;font-size: 17px;font-weight: 600;">Car Type</h4>
						<div id="option">
						<input type="checkbox">
						<label>Compact</label>
						</div>
						<div id="option">
						<input type="checkbox">
						<label>Coupe</label>
						</div>
						<div id="option">
						<input type="checkbox">
						<label>Sedan</label>
						</div>
						<div id="option">
						<input type="checkbox">
						<label>Suv</label>
						</div>
						<div id="option">
						<input type="checkbox">
						<label>Premium</label>
						</div>
					</div>
					<div id="price">
						<h4 style="margin: 15px 0px;font-size: 17px;font-weight: 600;">Car Price</h4>
						<input id="slider" type="range" min="40" max="1000" value="1000">
					</div>
					<div id="rating" class="checkbox-style">
						<h4 style="margin: 15px 0px;font-size: 17px;font-weight: 600;">Car Rating</h4>
						<div id="option">
							<input type="checkbox">
							<label>Above 4</label>
						</div>
						<div id="option">
							<input type="checkbox">
							<label>Above 3</label>
						</div>
						<div id="option">
							<input type="checkbox">
							<label>Above 2</label>
						</div>
					</div>
				</div>
				<div class="search-result">
					<div id="search-header">
						<div id="count"><h4 id="number" style="margin-right:3px;">${vehicules.size()}</h4><h4> Results in </h4><h4 id="location" style="color:#B8B08D;margin-left:3px">${searchInput.location}</h4></div>
						<div id="map-switch">
							<input type="checkbox" id="switch" />
							<label for="switch">Toggle</label>
						</div>
					</div>
					<div id="result">
						<div id="result-list">		
							<c:forEach var="i" begin="0" end="${vehicules.size()-1 < 0 ? 0 : vehicules.size()-1}" step="1">
							<div id="car">
								<div id="car_image"><img style="width:240px;height:151px;border-radius: 10px 10px 0px 0px ;" src="${pageContext.request.contextPath}${vehicules[i].image}"></div>
								<div id="car_info">
									<div id="names">
										<p id="carName">${vehicules[i].marque} ${vehicules[i].modele}</p>
										<p id="AgencyName">Agence De Constantine</p>
									</div>
									<div id="rating">
										<img src="${pageContext.request.contextPath}/assets/star.svg">
										<p id="score">4.2</p>
									</div>
								</div>
								<h4 style="font-size: 15px;font-weight: 600;color: #C4C4C4;margin-top: 5px;">Features :</h4>
								<div id="car_features">
									<div id="features">
										<span><img src="${pageContext.request.contextPath}/assets/mileage-icon.svg">Unlimited mileage</span>
										<span><img src="${pageContext.request.contextPath}/assets/passenger-icon.svg">2</span>
									</div>
									<div id="promotion">
										<p id="promotion-value">-30%</p>
									</div>
								</div>
								<div id="deal">
									<div id="price"><p>$</p><p id="amount">${vehicules[i].PLJ}</p><p>per day</p></div>
									<div id="cta" onclick="show_details(this)"><button>View Deal</button></div>
								</div>
							</div>
							</c:forEach>
						</div>
						<div id="map">
						<div class="mapouter">
						<div class="gmap_canvas">
						<iframe id="gmap_canvas" src="https://maps.google.com/maps?q=constantine&t=&z=14&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0">
						</iframe>
						</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<%@include file="/jsp/viewCar.jsp"%>
<script src="${pageContext.request.contextPath}/js/carSearch.js"></script>
<script src="${pageContext.request.contextPath}/js/dropdownSearch.js"></script>
</body>
</html>