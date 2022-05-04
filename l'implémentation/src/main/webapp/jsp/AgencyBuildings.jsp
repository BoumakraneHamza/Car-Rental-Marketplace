<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyBuildings.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/toggle.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<meta charset="UTF-8">
<title>Buildings</title>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
   integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
   crossorigin=""/>
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
		<div class="tab_header">
			<p id="title">Assets</p>
			<p id="subtitle">Manage your assets or create a new one with one Click !</p>
		</div>
		<div class="filter">
			<div class="filter_tab active" onclick="selectFilter(this)"><p>All</p></div>
			<div class="filter_tab" onclick="selectFilter(this)"><p>Depots</p></div>
			<div class="filter_tab" onclick="selectFilter(this)"><p>Offices</p></div>
		</div>
		<div class="main-content">
		<c:forEach begin="0" end="${Buildings.size()-1}" var="i" step="1">
			<div class="asset_card">
				<div id="card_banner">
					<img src="${pageContext.request.contextPath}/assets/PolyBackground/${random[i]}.svg">
				</div>
				<div id="card_content">
					<div id="tile">
						<div id="left">
							<p id="title">Name :</p>
							<p id="value">${Buildings.get(i).type} ${Buildings.get(i).code}</p>
						</div>
						<c:choose>
							<c:when test="${Buildings.get(i).type eq 'depot'}">
								<div id="right">
									<div class="battery">
										<div class="level" style="width:${Buildings.get(i).getCapacityPercentile()}%;">
										</div>
									</div>
									<p id="percentile">${Buildings.get(i).getCapacityPercentile()}%</p>
								</div>
							</c:when>
						</c:choose>
					</div>
					<div id="tile">
						<div id="left">
							<p id="title">Address :</p>
							<p id="value">${Buildings.get(i).adress}</p>
						</div>
					</div>
				</div>
				<div id="card_tag">
					<div id=tag>
						<img style="width: 20px;" src="${pageContext.request.contextPath}/assets/steering-wheel.svg">
						<p id="text">5</p>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class="sidebar">
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/AgencyBuildings.js"></script>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
   crossorigin=""></script>
</body>
</html>
</body>
</html>