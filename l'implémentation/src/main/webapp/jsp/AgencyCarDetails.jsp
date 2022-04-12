<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyCarDetails.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkbox.css">
<meta charset="UTF-8">
<title>CarDetails</title>
</head>
<body>
<div class="CarDetail">
<div class="sideBar">
	<div id="car-main-image">
		<img style="width: 90%;border-radius: 10px 10px 10px 10px;z-index: 1;" src="${pageContext.request.contextPath}/assets/car_pics/default01.jpg">
		<div id="edit-image">
			<img style="width:75%;" src="${pageContext.request.contextPath}/assets/draft-icon-white.svg">
		</div>
	</div>
	<div class="car-info">
		<div id="tile">
			<div id="text">
				<p id="title">Marque</p>
				<p id="value">Mini Cooper</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg">
		</div>
		<div id="tile">
			<div id="text">
				<p id="title">Modele</p>
				<p id="value">Modele S</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg">
		</div>
		<div id="tile">
			<div id="text">
				<p id="title">Year</p>
				<p id="value">2018</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg">
		</div>
		<div id="tile">
			<div id="text">
				<p id="title">Color</p>
				<p id="value">Red</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg">
		</div>
		<div id="tile">
			<div id="text">
				<p id="title">PLH</p>
				<p id="value">$30</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg">
		</div>
		<div id="tile">
			<div id="text">
				<p id="title">PLJ</p>
				<p id="value">$120</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg">
		</div>
	</div>
	<div class="review-stat">
		<p id="header-title">Reviews statistics</p>
		<div id="stats">
			<div id="stat">
				<div id="values">
					<p id="title">Comfort</p>
					<p id="number-value">6.3</p>
				</div>
				<div id="bar">
					<div style="width: 63%;"id="value"></div>
				</div>
			</div>
			<div id="stat">
				<div id="values">
					<p id="title">Cleanliness</p>
					<p id="number-value">7.4</p>
				</div>
				<div id="bar">
					<div style="width: 74%;"id="value"></div>
				</div>
			</div>
			<div id="stat">
				<div id="values">
					<p id="title">Pick-up & Return</p>
					<p id="number-value">5.2</p>
				</div>
				<div id="bar">
					<div style="width: 52%;"id="value"></div>
				</div>
			</div>
			<div id="stat">
				<div id="values">
					<p id="title">Value for money</p>
					<p id="number-value">9.1</p>
				</div>
				<div id="bar">
					<div style="width: 91%;"id="value"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="main">
	<div class="sec-images">
		<div id="header-title">
			<p>Secondary Images</p>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg">
		</div>
		<div id="images">
			<img src="${pageContext.request.contextPath}/assets/car_pics/sec-image01.jpg">
			<img src="${pageContext.request.contextPath}/assets/car_pics/sec-image02.jpg">
			<img src="${pageContext.request.contextPath}/assets/car_pics/sec-image03.jpg">
			<img src="${pageContext.request.contextPath}/assets/car_pics/sec-image04.jpg">
		</div>
	</div>
	<div class="features">
		<p id="title">Car Features</p>
		<div class="features_list">
			<div id="tile">
				<p>number of Seats :</p>
				<div id="values">
					<div id="value">
						<input type="radio" id="value2" checked="true" name="seats">
						<label for="value2">2</label>
					</div>
					<div id="value">
						<input type="radio" id="value4" name="seats">
						<label for="value4">4</label>
					</div>
					<div id="value">
						<input type="radio" id="value5" name="seats">
						<label for="value5">5</label>
					</div>
				</div>
			</div>
			<div id="tile">
				<p>number of Doors :</p>
				<div id="values">
					<div id="value">
						<input type="radio" id="value2" checked="checked" name="doors">
						<label for="value2">2</label>
					</div>
					<div id="value">
						<input type="radio" id="value2" name="doors">
						<label for="value2">4</label>
					</div>
				</div>
			</div>
			<div id="tile">
				<p>number of Large suit cases :</p>
				<div id="values">
					<div id="value">
						<input type="radio" id="value2" checked="checked" name="cases">
						<label for="value2">1</label>
					</div>
					<div id="value">
						<input type="radio" id="value2" name="cases">
						<label for="value2">2</label>
					</div>
					<div id="value">
						<input type="radio" id="value2" name="cases">
						<label for="value2">3</label>
					</div>
				</div>
			</div>
			<div id="tile">
				<p>Mileage :</p>
				<div id="values">
					<div id="value">
						<input type="radio" id="value2" checked="checked" name="mileage">
						<label for="value2">Yes</label>
					</div>
					<div id="value">
						<input type="radio" id="value2" name="mileage">
						<label for="value2">No</label>
					</div>
				</div>
			</div>
			<div id="tile">
				<p>Type :</p>
				<div id="values">
					<div id="value">
						<input type="radio" id="value2" checked="checked" name="type">
						<label for="value2">Compact</label>
					</div>
					<div id="value">
						<input type="radio" id="value2" name="type">
						<label for="value2">Coupe</label>
					</div>
					<div id="value">
						<input type="radio" id="value2" name="type">
						<label for="value2">Sedan</label>
					</div>
					<div id="value">
						<input type="radio" id="value2" name="type">
						<label for="value2">Suv</label>
					</div>
					<div id="value">
						<input type="radio" id="value2" name="type">
						<label for="value2">Premium</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="cta">
		<input id="cancel" type="button" value="cancel">
		<input id="save" type="submit" value="save">
	</div>
</div>
</div>
<script src="${pageContext.request.contextPath}/js/AgencyCarDetails.js"></script>
</body>
</html>