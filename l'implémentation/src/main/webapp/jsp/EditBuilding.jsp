<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/EditBuilding.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Edit Depot</title>
</head>
<body>
<div class="header">
	<div class="logo" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
		<img src="${pageContext.request.contextPath}/assets/logoBlack.svg">
		<p id="logo_title">Unique</p>
	</div>
	<div class="user">
	<img id="notification" src="${pageContext.request.contextPath}/assets/notification.svg">
	<div id="user-image">
		<img style="width: 40px;" src="${pageContext.request.contextPath}${user.image}">
	</div>
		<div id="user-info">
			<p id="full-name">${user.nom} ${user.prenom}</p>
			<p id="user-name">${user.user_name}</p>
		</div>
		<div id="dropdownlist">
			<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
		</div>
		
	</div>
</div>
<!-- 









THIS PAGE WILL EVOLVE TO THE UPDATED EDIT PROFILE FOR CLIENTS AND EMPLOYEES























 -->
<div class="content">
	<div class="menu">
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/dashboard2-icon.svg">
			<p id="title">Dashboard</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/ViewAgencyPersonal'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/account-grey.svg">
			<p id="title">Team Accounts</p>
		</div>
		<div class="menu-tab" style="background: #C5DCFA;" onclick="location.href='${pageContext.request.contextPath}/ViewAgencyDepots'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/building-icon-purple.svg">
			<p style="color:#0F56B3;" id="title">Assets</p>
		</div>
	</div>
	<div class="main-frame">
		<div class="frame_header">
			<p id="title">Editing Depot 01</p>
		</div>
		<div class="main_content">
			<div class="map_banner">
				<div id="map"></div>
			</div>
			<div class="profile_header">
				<div id="left">
					<div id="image_wrapper">
						<img src="${pageContext.request.contextPath}/assets/PolyBackground/1.svg">
					</div>
					<div id="text_content">
						<p>Depot 01</p>
						<p>Update and edit building easily !</p>
					</div>
				</div>
				<div id="right">
					<button>Cancel</button>
					<button>Save</button>
				</div>
			</div>
			<div class="profile_content">
				<div class="row">
					<p id="title">address</p>
					<input id="input_field">
				</div>
				<div class="row">
					<p id="title">Total Capacity</p>
					<input id="input_field">
				</div>
				
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
</body>
</html>