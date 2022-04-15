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
<form id="editingCar" onsubmit="editCar(event)">
	<input type="hidden" name="matricule" value="matricule">
	<input type="hidden" name="depot" value="${depotcode }">
<div class="CarDetail">
<div class="sideBar">
	<div id="car-main-image">
		<img style="width: 90%;border-radius: 10px 10px 10px 10px;z-index: 1;" id="image" src="${pageContext.request.contextPath}/assets/car_pics/default.jpg">
		<div id="edit-image">
			<img style="width:75%;" src="${pageContext.request.contextPath}/assets/draft-icon-white.svg">
		</div>
	</div>
	<div class="car-info">
		<div id="tile">
			<div id="text">
				<p id="title">Marque</p>
				<p class="carTexts" id="marque">#</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg" onclick="editInfo('marque')">
		</div>
		<div id="tile">
			<div id="text">
				<p id="title">Modele</p>
				<p class="carTexts" id="modele">#</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg" onclick="editInfo('modele')">
		</div>
		<div id="tile">
			<div id="text">
				<p id="title">Year</p>
				<p class="carTexts" id="year">#</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg" onclick="editInfo('year')">
		</div>
		<div id="tile">
			<div id="text">
				<p id="title">Color</p>
				<p class="carTexts" id="color">#</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg" onclick="editInfo('color')">
		</div>
		<div id="tile">
			<div id="text">
				<p id="title">PLH</p>
				<p class="carTexts" id="PLH">$#</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg" onclick="editInfo('PLH')">
		</div>
		<div id="tile">
			<div id="text">
				<p id="title">PLJ</p>
				<p class="carTexts" id="PLJ">$#</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/draft-icon-black.svg" onclick="editInfo('PLJ')">
		</div>
	</div>
	<div class="review-stat">
		<p id="header-title">Reviews statistics</p>
		<div id="stats">
			<div id="stat">
				<div id="values">
					<p id="title">Comfort</p>
					<p id="comfort-number-value">#</p>
				</div>
				<div id="bar">
					<div style="width: 63%;"id="value"></div>
				</div>
			</div>
			<div id="stat">
				<div id="values">
					<p id="title">Cleanliness</p>
					<p id="cleanliness-number-value">#</p>
				</div>
				<div id="bar">
					<div style="width: 74%;"id="value"></div>
				</div>
			</div>
			<div id="stat">
				<div id="values">
					<p id="title">Pick-up & Return</p>
					<p id="pickReturn-number-value">#</p>
				</div>
				<div id="bar">
					<div style="width: 52%;"id="value"></div>
				</div>
			</div>
			<div id="stat">
				<div id="values">
					<p id="title">Value for money</p>
					<p id="valueMoney-umber-value">#</p>
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
						<input type="radio" id="seat_value2" name="seats" value="2">
						<label for="value2">2</label>
					</div>
					<div id="value">
						<input type="radio" id="seat_value4" name="seats" value="4">
						<label for="value4">4</label>
					</div>
					<div id="value">
						<input type="radio" id="seat_value5" name="seats" value="5">
						<label for="value5">5</label>
					</div>
				</div>
			</div>
			<div id="tile">
				<p>number of Doors :</p>
				<div id="values">
					<div id="value">
						<input type="radio" id="door_value2" name="doors" value="2">
						<label for="value2">2</label>
					</div>
					<div id="value">
						<input type="radio" id="door_value4" name="doors" value="4">
						<label for="value2">4</label>
					</div>
				</div>
			</div>
			<div id="tile">
				<p>number of Large suit cases :</p>
				<div id="values">
					<div id="value">
						<input type="radio" id="suitcase_value1" name="cases" value="1">
						<label for="value2">1</label>
					</div>
					<div id="value">
						<input type="radio" id="suitcase_value2" name="cases" value="2">
						<label for="value2">2</label>
					</div>
					<div id="value">
						<input type="radio" id="suitcase_value3" name="cases" value="3">
						<label for="value2">3</label>
					</div>
				</div>
			</div>
			<div id="tile">
				<p>Mileage :</p>
				<div id="values">
					<div id="value">
						<input type="radio" id="mileage_value2" name="mileage" value="yes">
						<label for="value2">Yes</label>
					</div>
					<div id="value">
						<input type="radio" id="mileage_value2" name="mileage" value="no">
						<label for="value2">No</label>
					</div>
				</div>
			</div>
			<div id="tile">
				<p>Type :</p>
				<div id="values">
					<div id="value">
						<input type="radio" id="compact" name="type" value="compact">
						<label for="value2">Compact</label>
					</div>
					<div id="value">
						<input type="radio" id="coupe" name="type" value="coupe">
						<label for="value2">Coupe</label>
					</div>
					<div id="value">
						<input type="radio" id="sedan" name="type" value="sedan">
						<label for="value2">Sedan</label>
					</div>
					<div id="value">
						<input type="radio" id="suv" name="type" value="suv">
						<label for="value2">Suv</label>
					</div>
					<div id="value">
						<input type="radio" id="premium" name="type" value="premium">
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
</form>
<script type="text/javascript">
	var contextPath = '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/js/AgencyCarDetails.js"></script>
</body>
</html>