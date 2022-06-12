<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientRegistrationInfo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkbox.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<title>Sign up 2/3</title>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
   integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
   crossorigin=""/>
</head>
<body>
<div class="logo">
	<a href="${pageContext.request.contextPath}/PageAcueil"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
</div>
<div class="step_slider">
	<div class="Progressline">
		<div class="checkpoint">
			<div class="point active"></div>
			<p>General Informations</p>
		</div>
		<div class="checkpoint">
			<div class="point"></div>
			<p>Detail Informations</p>
		</div>
		<div class="checkpoint">
			<div class="point"></div>
			<p>Video Confirmation</p>
		</div>
	</div>
</div>
<form class="detailnformation" action="SignUp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="required_action" value="clientDetailInformation">
	<input type="hidden" name="email" value="${email}">
	<input type="hidden" name="lat" id="lat">
	<input type="hidden" name="lon" id="lon">
	<div id="row">
		<div id="column">
			<label>Nom</label>
			<input required type="text" name="nom">
		</div>
		<div id="column">
			<label>Prenom</label>
			<input required type="text" name="prenom">
		</div>
	</div>
	<div id="row">
		<div id="column">
			<label>Address</label>
			<div id="address">
				<input required type="text" name="address" class="address">
				<div id="image_wrapper" onclick="showAddMap()">
					<img style="width:10px" src="${pageContext.request.contextPath}/assets/location.svg">
				</div>
			</div>
		</div>
		<div id="column">
			<label>Birth date</label>
			<input required type="Date" name="birth">
		</div>
	</div>
	<div id="row">
		<div id="column">
			<label>Phone Number</label>
			<input required type="Number" name="phone">
		</div>
		<div id="column">
			<label>ID card number</label>
			<input required type="Number" name="IDCard">
		</div>
	</div>
	<div id="row">
		<div id="column">
			<label>Gender</label>
			<select required id="gender" name="gender">
				<option value="male">male</option>
				<option value="female">female</option>
			</select>
		</div>
		<div id="column">
			<label>Profile Photo</label>
			<input required type="file" accept="image/png , image/jpeg" name="ProfileImage">
		</div>
	</div>
	<div id="action">
		<button id="next" type="submit">Next</button>
	</div>
</form>
<div class="view_Location" style="display:none;">
	<div id="select_map_wrapper"></div>
	<div id="inputs">
		<input type="text" id="inputs_wrapper" placeholder="address">
		<div id="right">
			<button onclick="submitSelectedLocation()" id="select_location"><img src="${pageContext.request.contextPath}/assets/check.svg"><p>Select</p></button>
			<img onclick="closeSelectMap()" style="cursor:pointer;" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
		</div>
	</div>
</div>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
   crossorigin=""></script>
<script src="${pageContext.request.contextPath}/js/ClientRegistrationInfo.js"></script>
</body>
</html>