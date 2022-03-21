<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carSearch.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkbox.css">
</head>
<body>
<div class="header">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/assets/logoBlack.svg">
		</div>
		<div class="user">
		<img id="notification" src="${pageContext.request.contextPath}/assets/notification.svg">
		<img src="${pageContext.request.contextPath}/assets/user01.png">
			<div id="user-info">
				<p id="full-name">Nathanial Olson</p>
				<p id="user-name">@Olson2022</p>
			</div>
			<div id="dropdownlist">
				<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
			</div>
			
		</div>
	</div>
<div class="content">
		<div class="menu">
			<button class="search"><img src="${pageContext.request.contextPath}/assets/search-icon.svg"></button>
			<button class="dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></button>
			<button class="inbox"><img src="${pageContext.request.contextPath}/assets/inbox.svg"></button>
			<button class="exit"><img src="${pageContext.request.contextPath}/assets/exit-icon.svg"></button>
		</div>
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
		  				<div id="search_inputs">
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/location.svg">
		  							<label>Location</label>
		  						</div>
		  						<input type="text">			
		  					</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/date.svg">
		  							<label>Pick-up date</label>
		  						</div>
								<input type="text">
		  						</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/date.svg">
		  							<label>Return date</label>
		  						</div>
		  						<input type="text">
		  					</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/hour.svg">
		  							<label>Pick-up Hour</label>
		  						</div>
		  							<input type="text">
		  					</div>
		  					
		  					<div id="input_field">
		  						<div id="field">
		  							<img src="${pageContext.request.contextPath}/assets/hour.svg">
		  							<label>Return Hour</label>
		  						</div>
		  							<input type="text">
		  					</div>
		  					<input type="submit" value="Search">
		  				</div>
					</div>
				</nav>
			</div>
			<div class="main-content">
				<div class="sec-menu">
					<h3>Filters :</h3>
					<div id="car-type"class="checkbox-style">
						<h4>Car Type:</h4>
						<input type="checkbox">
						<label>Compact</label><br>
						<input type="checkbox">
						<label>Coupe</label><br>
						<input type="checkbox">
						<label>Sedan</label><br>
						<input type="checkbox">
						<label>Suv</label><br>
						<input type="checkbox">
						<label>Premium</label><br>
					</div>
					<div id="price">
						<h4>Car Price</h4>
						
						<input id="slider" type="range" min="40" max="1000" value="1000">
					</div>
					<div id="rating">
						<h4>Car Rating</h4>
						<input type="checkbox">
						<label>Above 4</label><br>
						<input type="checkbox">
						<label>Above 3</label><br>
						<input type="checkbox">
						<label>Above 2</label><br>
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
							<div id="car">
								<div id="car_info">
									<div id="names">
										<p id="carName">Mini Cooper S</p>
										<p id="AgencyName">Agence De Constantine</p>
									</div>
									<div id="rating">
										<img src="${pageContext.request.contextPath}/assets/star.svg">
										<p id="score">4.2</p>
									</div>
								</div>
								<div id="car_image"><img style="width: 213px;border-radius: 15px;" src="${pageContext.request.contextPath}/assets/compact mini cooper S.jpg"></div>
								<div id="price"><p>Price :</p><p id="amount">$130</p><p>/ Day</p></div>
							</div>
							<div id="car">
								<div id="car_info">
									<div id="names">
										<p id="carName">Mini Cooper S</p>
										<p id="AgencyName">Agence De Constantine</p>
									</div>
									<div id="rating">
										<img src="${pageContext.request.contextPath}/assets/star.svg">
										<p id="score">4.2</p>
									</div>
								</div>
								<div id="car_image"><img style="width: 213px;border-radius: 15px;" src="${pageContext.request.contextPath}/assets/compact mini cooper S.jpg"></div>
								<div id="price"><p>Price :</p><p id="amount">$130</p><p>/ Day</p></div>
							</div>
							<div id="car">
								<div id="car_info">
									<div id="names">
										<p id="carName">Mini Cooper S</p>
										<p id="AgencyName">Agence De Constantine</p>
									</div>
									<div id="rating">
										<img src="${pageContext.request.contextPath}/assets/star.svg">
										<p id="score">4.2</p>
									</div>
								</div>
								<div id="car_image"><img style="width: 213px;border-radius: 15px;" src="${pageContext.request.contextPath}/assets/compact mini cooper S.jpg"></div>
								<div id="price"><p>Price :</p><p id="amount">$130</p><p>/ Day</p></div>
							</div>
							<div id="car">
								<div id="car_info">
									<div id="names">
										<p id="carName">Mini Cooper S</p>
										<p id="AgencyName">Agence De Constantine</p>
									</div>
									<div id="rating">
										<img src="${pageContext.request.contextPath}/assets/star.svg">
										<p id="score">4.2</p>
									</div>
								</div>
								<div id="car_image"><img style="width: 213px;border-radius: 15px;" src="${pageContext.request.contextPath}/assets/compact mini cooper S.jpg"></div>
								<div id="price"><p>Price :</p><p id="amount">$130</p><p>/ Day</p></div>
							</div>
							<div id="car">
								<div id="car_info">
									<div id="names">
										<p id="carName">Mini Cooper S</p>
										<p id="AgencyName">Agence De Constantine</p>
									</div>
									<div id="rating">
										<img src="${pageContext.request.contextPath}/assets/star.svg">
										<p id="score">4.2</p>
									</div>
								</div>
								<div id="car_image"><img style="width: 213px;border-radius: 15px;" src="${pageContext.request.contextPath}/assets/compact mini cooper S.jpg"></div>
								<div id="price"><p>Price :</p><p id="amount">$130</p><p>/ Day</p></div>
							</div>
							<div id="car">
								<div id="car_info">
									<div id="names">
										<p id="carName">Mini Cooper S</p>
										<p id="AgencyName">Agence De Constantine</p>
									</div>
									<div id="rating">
										<img src="${pageContext.request.contextPath}/assets/star.svg">
										<p id="score">4.2</p>
									</div>
								</div>
								<div id="car_image"><img style="width: 213px;border-radius: 15px;" src="${pageContext.request.contextPath}/assets/compact mini cooper S.jpg"></div>
								<div id="price"><p>Price :</p><p id="amount">$130</p><p>/ Day</p></div>
							</div>
							<div id="car">
								<div id="car_info">
									<div id="names">
										<p id="carName">Mini Cooper S</p>
										<p id="AgencyName">Agence De Constantine</p>
									</div>
									<div id="rating">
										<img src="${pageContext.request.contextPath}/assets/star.svg">
										<p id="score">4.2</p>
									</div>
								</div>
								<div id="car_image"><img style="width: 213px;border-radius: 15px;" src="${pageContext.request.contextPath}/assets/compact mini cooper S.jpg"></div>
								<div id="price"><p>Price :</p><p id="amount">$130</p><p>/ Day</p></div>
							</div>
						</div>
						<div id="result-map"></div>
					</div>
				</div>
			</div>
		</div>
</div>
<script src="${pageContext.request.contextPath}/js/dropdownSearch.js"></script>
</body>
</html>