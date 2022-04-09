<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ViewProfile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<title>Edit</title>
</head>
<body>
<div class="header">
		<div id="logo">
			<a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
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
<div class="wrapper">
	<div class="main_content">
		<div class="side_bar">
			<div id="profile_image">
				<img style="vertical-align:middle;width: -webkit-fill-available;" src="${pageContext.request.contextPath}${user.image}">
			</div>
			<div class="option">
				<p id="user_name">${user.user_name}</p>
				<div id="cta">
					<button onclick="location.href='/Atelier/jsp/ViewProfile.jsp'" style="width:48%;">Cancel</button>
					<button id="save" style="width:48%;">Save</button>
				</div>
		 	</div>
		</div>
		<div class="main">
			<div id="main_header">
				<p id="header_title">Profile Information</p>
			</div>
			<form class="info" action="EditProfile" method="post">
				<input type="hidden" value="${user.email}" name="email">
				<div id="tile">
					<div id="title">First Name</div>
					<input type="text" value="${user.prenom}" name="prenom" placeholder="first name">
				</div>
				<div id="tile">
					<div id="title">Last Name</div>
					<input type="text" value="${user.nom}" name="nom" placeholder="last name">
				</div>
				<div id="tile">
					<div id="title">Phone Number</div>
					<input type="text" value="${user.telephone}" name="telephone" placeholder="phone number">
				</div>
				<div id="tile">
					<div id="title">birth date</div>
					<input type="date" value="${user.date_naissance}" name="date_naissance" placeholder="Birth date">		
				</div>
				<div id="tile">
					<div id="title">Gender</div>
					<input type="text" value="${user.sexe}" name="sexe" placeholder="Gender">
				</div>
				<div id="tile">
					<div id="title">carte number</div>
					<input type="text" value="${user.num_carte}" name="num_carte" placeholder="cart number">
				</div>
			</form>
			<div id="sec_header"><p id="sec_header_title">Recent Activities</div>
			<div id="list">
				
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/EditProfile.js"></script>
</body>
</html>