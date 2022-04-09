<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dropdownlist</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dropdownList.css">
</head>
<body>
<div class="dropdownList">
	<div class="tile" onclick="location.href='/Atelier/ViewProfile'">
		<div class="viewProfile">
			<div id="profile_image">
				<img style="width:60px;" src="${pageContext.request.contextPath}${user.image}">
			</div>
			<div class="text">
				<div id="full_name">
					<p id="first_name" style="margin-right:4px;">${user.prenom}</p>
					<p id="last_name">${user.nom}</p>
				</div>
				<p id="option">See your profile</p>
			</div>
		</div>
	</div>
	<div class="tile">
		<div class="feedBack">
		<img style="width: 30px;" src="${pageContext.request.contextPath}/assets/feedBack.svg">
			<div class="text">
				<div id="main_text">Give FeedBack</div>
				<div id="sec_text">help us make unique better</div>
			</div>
		</div>
	</div>
	<div class="tile">
		<div class="AccessList">
			<div class="setting" onclick="location.href='/Atelier/Logout'">
				<img style="width: 21px;" src="${pageContext.request.contextPath}/assets/exit-icon.svg">
				<div class="text">
					<p id="main_text">Log Out</p>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/dropdownList.js"></script>
</body>
</html>