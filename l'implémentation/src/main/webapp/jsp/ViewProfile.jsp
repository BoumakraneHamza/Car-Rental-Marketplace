<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ViewProfile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<title>View Profile</title>
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
				<button onclick="location.href='/Atelier/EditProfile'">Edit profile</button>
		 	</div>
		</div>
		<div class="main">
			<div id="main_header">
				<p id="header_title">Profile Information</p>
			</div>
			<div class="info">
				<div id="tile">
					<div id="title">First Name</div>
					<div id="text">${user.prenom}</div>
				</div>
				<div id="tile">
					<div id="title">Last Name</div>
					<div id="text">${user.nom}</div>
				</div>
				<div id="tile">
					<div id="title">Phone Number</div>
					<div id="text">${user.telephone}</div>
				</div>
				<div id="tile">
					<div id="title">birth date</div>
					<div id="text">${user.date_naissance}</div>
				</div>
				<div id="tile">
					<div id="title">Gender</div>
					<div id="text">${user.sexe}</div>
				</div>
				<div id="tile">
					<div id="title">carte number</div>
					<div id="text">${user.num_carte}</div>
				</div>
			</div>
			<div id="sec_header"><p id="sec_header_title">Recent Activities</div>
			<div id="list">
				
			</div>
		</div>
	</div>
</div>
</body>
</html>