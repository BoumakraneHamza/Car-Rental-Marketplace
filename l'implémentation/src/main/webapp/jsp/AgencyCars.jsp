<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyCars.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/toggle.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<meta charset="UTF-8">
<title>Cars</title>
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
	<div class="content">
			<div class="menu">
				<button class="dashboard"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></a></button>
				<button class="Personal" ><a href="${pageContext.request.contextPath}/jsp/AgencyPersonal.jsp"><img src="${pageContext.request.contextPath}/assets/personal-icon.svg"></a></button>
				<button class="Personal" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/jsp/AgencyBuildings.jsp"><img src="${pageContext.request.contextPath}/assets/building-icon-white.svg"></a></button>
				
			</div>
			<div class="main-frame">
			<div class="main-content">
				<div class="content_header">
					<div id="left">
						<div id="back" onclick="location.href='ViewAgencyDepots'" style="cursor:pointer;">
							<img src="${pageContext.request.contextPath}/assets/angle-left-solid.svg">
						</div>
						<div id="title">
							<p>Depot N° </p>
							<p id="value">${depotcode}</p>
						</div>
					</div>
					<div id="right">
						<select name="Filter" id="filter">
							<option value="all">Show All</option>
						    <option value="depots">Show Rented</option>
						    <option value="offices">Show Available</option>
						</select>
						<div class="cta">
							<div id="searchBar">
								<img src="${pageContext.request.contextPath}/assets/search-icon.svg">
								<input type="text" placeholder="Search">
							</div>
							<div id="add"><button><img style="margin-right: 11px;" src="${pageContext.request.contextPath}/assets/add.svg"><p>Add Car</p></button></div>
						</div>
					</div>
				</div>
				<div class="content_body">
						<c:forEach items="${cars}" var="car">
							<div id="car">
							<div id="car_image"><img style="width:240px;height:151px;border-radius: 10px 10px 0px 0px ;" src="${pageContext.request.contextPath}${car.image}"></div>
							<div id="car_info">
								<div id="names">
									<p id="carName">${car.marque}${car.modele}</p>
									<input type="hidden" id="matricule" value="${matricule.matricule}"></input>
								</div>
								<div id="rating">
									<img style="width: 18px;margin-right: 5Px;" src="${pageContext.request.contextPath}/assets/star.svg">
									<p id="score">${car.getAverageRating()}</p>
								</div>
							</div>
							<h4 style="font-size: 15px;font-weight: 600;color: #C4C4C4;margin-top: 5px;margin-left: 10px;">Features :</h4>
							<div id="car_features">
								<div id="features">
									<span>Daily Rate : ${car.PLJ}</span>
									<span>Hourly Rate : ${car.PLH}</span>
								</div>
							</div>
							<div id="deal">
								<img src="${pageContext.request.contextPath}/assets/delete-icon.svg">
								<div id="cta" onclick="show_details(this)">
									<button>View Details</button>
								</div>
							</div>
						</div>	
						</c:forEach>					
					</div>
				</div>
			</div>
	</div>
<%@include file="/jsp/dropdownList.jsp"%>
<%@include file="/jsp/AgencyCarDetails.jsp"%>
</body>
</html>