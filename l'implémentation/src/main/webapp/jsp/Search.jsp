<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carSearch.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkbox.css">
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
   integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
   crossorigin=""/>
<title>Result</title>
</head>
<body>
<div class="header">
		<div id="logo">
			<a href="${pageContext.request.contextPath}/PageAcueil"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
		</div>
		<div class="user">
			<a style="color:#B8B08D;font-size: 17px;font-weight: 500;margin-left: 30px;" href="${pageContext.request.contextPath}/SignUp">join us</a>
			<a href="/Atelier/Login" style="color: #000;font-size: 17px;font-weight: 500;margin-left: 30px;">login</a>
		</div>
	</div>
<div class="content">
		<div class="main-frame">
			<div class="dropdownSearch">
				<nav>
					<a href="" class="btn" id="search"><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></a>
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
		  						<input required="required" type="text" name="location">		
		  					</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/date.svg">
		  							<label>Pick-up date</label>
		  						</div>
								<input required="required" type="date" name="pickUp_date">
		  						</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/date.svg">
		  							<label>Return date</label>
		  						</div>
		  						<input required="required" type="date" name="return_date">
		  					</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/hour.svg">
		  							<label>Pick-up Hour</label>
		  						</div>
		  							<input required="required" type="time" name="pickUp_hour">
		  					</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/hour.svg">
		  							<label>Return Hour</label>
		  						</div>
		  							<input required="required" type="time" name="return_hour">
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
						<div id="count"><h4 id="number" style="margin-right:3px;">24</h4><h4> Results in </h4><h4 id="location" style="color:#B8B08D;margin-left:3px">Constantine</h4></div>
						<div id="map-switch">
							<input type="checkbox" id="switch" /><label for="switch">Toggle</label>
						</div>
					</div>
					<div id="result">
						<div id="result-list">
							<c:choose>
								<c:when test="${vehicules.size()>0}">
									<c:forEach items="${vehicules}" var="vehicule">
										<div id="car">
											<div id="car_image"><img style="width:240px;height:151px;border-radius: 10px 10px 0px 0px ;" src="${pageContext.request.contextPath}${vehicule.image}"></div>
											<div id="car_info">
												<div id="names">
													<p id="carName">${vehicule.marque} ${vehicule.modele}</p>
													<p id="AgencyName">${vehicule.agence}</p>
													<input type="hidden" id="matricule" value="${vehicule.matricule}"></input>
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
												<div id="price"><p>$</p><p id="amount">${vehicule.PLJ}</p><p>per day</p></div>
												<div id="cta" onclick="show_details(this)"><button>View Deal</button></div>
											</div>
										</div>
										</c:forEach>
								</c:when>
								<c:otherwise>
									<p id="message">Choose Location and a Date and Book a Car </p>
								</c:otherwise>
							</c:choose>
						</div>
						<div id="map">
						<div class="mapouter">
						<div id="map_canvas" class="gmap_canvas">
						<!--<iframe id="gmap_canvas" src="https://maps.google.com/maps?q=${searchInput.location}&t=&z=14&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0">
						</iframe>  -->
						
						</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<%@include file="/jsp/viewCar.jsp"%>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
   crossorigin=""></script>
<script src="${pageContext.request.contextPath}/js/mapScript.js"></script>
<script type="text/javascript">
	setCoordinates('${searchInput.location}');

	<c:forEach items="${depots}" var="depot">
		L.marker([${depot.lat}, ${depot.lon}]).addTo(theMap).bindPopup('<h1>depot code : ${depot.code}</h1>' + 
																	   '<p>adress : ${depot.adress}</p>' + 
																	   '<p>agence : ${depot.agence_nom}</p>');
	</c:forEach>

</script>
<script src="${pageContext.request.contextPath}/js/carSearch.js"></script>
<script src="${pageContext.request.contextPath}/js/dropdownSearch.js"></script>
</body>
</html>