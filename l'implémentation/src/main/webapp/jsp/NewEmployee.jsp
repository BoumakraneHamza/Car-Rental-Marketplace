<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NewEmployee.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div class="GettingStarted">
	<div id="tab_header">
		<p id="title">Getting Started</p>
	</div>
	<div id="tab_content">
		<div id="tab_content_header">
			<div id="content_header_title">
				<p id="Welcome">Welcome to Unique !</p>
				<img src="${pageContext.request.contextPath}/assets/party-small.png">
			</div>
			<p id="content_header_subtitle">Let's start creating your account , <strong style="color:#616161;">so you can Join Our team</strong></p>
		</div>
		<div id="content_sec_header">
			<p id="sec_header">You have been a Signed the role of a <strong style="color:#000;">Depot Manager</strong>, here are some of the privileges and responsibilities you have to get you started :</p>
			<p id="section_header">learn your Privileges :</p>
			<p id="section_subtitle">As<strong style="color:#000;"> Depot Manager</strong> You have access to</p>
			<div id="section_list">
				<div id="card">
					<div id="card_image" class="client">
						<img style="width: 25Px;" src="${pageContext.request.contextPath}/assets/account-purple.svg">
					</div>
					<div id="card_info">
						<p id="card_title">Client information</p>
						<p id="card_subtitle">Bookings , Personnel information , ...</p>
					</div>
				</div>
				<div id="card">
					<div id="card_image" class="vehicule">
						<img style="width: 20Px;" src="${pageContext.request.contextPath}/assets/calendar-yellow.svg">
					</div>
					<div id="card_info">
						<p id="card_title">Vehicles Management</p>
						<p id="card_subtitle">vehicles status , informations , ...</p>
					</div>
				</div>
				<div id="card">
					<div id="card_image" class="stats">
						<img style="width: 25Px;" src="${pageContext.request.contextPath}/assets/stats-purple.svg">
					</div>
					<div id="card_info">
						<p id="card_title">Booking Statistics</p>
						<p id="card_subtitle">Booking informations, dates , ...</p>
					</div>
				</div>
			</div>
			<p id="section_header">learn your Responsibilities :</p>
			<p id="section_subtitle">As<strong style="color:#000;"> Depot Manager</strong> You have the following Responsibilities</p>
			<div id="section_list">
				<div id="card">
					<div id="card_image" class="client">
						<img style="width: 25Px;" src="${pageContext.request.contextPath}/assets/account-purple.svg">
					</div>
					<div id="card_info">
						<p id="card_title">Client Reviews</p>
						<p id="card_subtitle">the main score of your performance</p>
					</div>
				</div>
				<div id="card">
					<div id="card_image" class="vehicule">
						<img style="width: 25Px;" src="${pageContext.request.contextPath}/assets/wireframing.svg">
					</div>
					<div id="card_info">
						<p id="card_title">Vehicles maintenance</p>
						<p id="card_subtitle">keep the vehicles in top condition</p>
					</div>
				</div>
				<div id="card">
					<div id="card_image" class="stats">
						<img style="width: 15Px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
					</div>
					<div id="card_info">
						<p id="card_title">Problem reports</p>
						<p id="card_subtitle">take actions to solve them</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button id="next"><img src="${pageContext.request.contextPath}/assets/check.svg"><p>Finish</p></button>
</div>
<form class="complete_registration" action="${pageContext.request.contextPath}/ProfileStateManager" method="Post" enctype="multipart/form-data" style="display:none;">
	<div id="tab_header">
		<div id="left">
			<div id="image_wrapper">
				<img style="width: 24px;" src="${pageContext.request.contextPath}/assets/info.svg">
			</div>
			<div id="text">
				<p id="title">Finish Registration</p>
				<p id="subtitle">Insert your informations to finish creating you account</p>
			</div>
		</div>
		<div id="right">
			<div class="exit_form" id="image_wrapper">
				<img  style="width: 11px;" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
			</div>
		</div>
	</div>
	<div id="tab_content">
		<div id="row">
			<input required type="text" id="Lastname" name="nom" placeholder="Last Name">
			<input required type="text" id="Firstname" name="prenom" placeholder="First Name">
		</div>
		<p id="text_header">Profile image</p>
		<input required type="file" name="file">
		<button type="submit" id="sub_btn"><img src="${pageContext.request.contextPath}/assets/check.svg"><p>Finish</p></button>
	</div>
</form>
<script src="${pageContext.request.contextPath}/js/NewEmployee.js"></script>
</body>
</html>