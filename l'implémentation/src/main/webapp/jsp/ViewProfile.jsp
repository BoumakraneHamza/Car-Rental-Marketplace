<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<div class="logo" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
		<img src="${pageContext.request.contextPath}/assets/logoBlack.svg">
		<p id="logo_title">Unique</p>
	</div>
	<div class="user">
		<c:choose>
			<c:when test="${user != null}">
				<img id="notification" src="${pageContext.request.contextPath}/assets/notification.svg">
				<div id="user-image">
					<c:choose>
						<c:when test="${user.image.substring(0,5).equals(\"https\")}">
							<img style="width: 40px;" src="${user.image}">
						</c:when>
						<c:otherwise>
							<img style="width: 40px;" src="${pageContext.request.contextPath}${user.image}">
						</c:otherwise>
					</c:choose>
				</div>
				<div id="user-info">
					<p id="full-name">${user.nom} ${user.prenom}</p>
					<p id="user-name">${user.user_name}</p>
				</div>
				<div id="dropdownlist">
					<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
				</div>
			</c:when>
			<c:otherwise>
				<a style="color:#B8B08D;font-size: 17px;font-weight: 500;margin-left: 30px;" href="${pageContext.request.contextPath}/SignUp">join us</a>
				<a href="/Atelier/Login" style="color: #000;font-size: 17px;font-weight: 500;margin-left: 30px;">login</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<div class="wrapper">
	<div class="main_content">
		<div class="side_bar">
			<div id="profile_image">
				<c:choose>
					<c:when test="${user.image.substring(0,5).equals(\"https\")}">
						<img style="vertical-align:middle;width: -webkit-fill-available;" src="${user.image}">
					</c:when>
					<c:otherwise>
						<img style="vertical-align:middle;width: -webkit-fill-available;" src="${pageContext.request.contextPath}${user.image}">
					</c:otherwise>
				</c:choose>
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
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
	<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>