<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewCar.css"/>
<title>Insert title here</title>
</head>
<body>
	<div class="view">
		<div class="view_header">
		<div id="title">
			<img src="${pageContext.request.contextPath}/assets/angle-left-solid.svg">
			<p id="modele">title</p>
		</div>
		<div id="cancel">
			<button>X</button>
		</div>
		</div>
		<div class="view_content">
			<div class="discription">
			<div class="images">
				<div id="main_image">
					<img style="width:100%" src="">
				</div>
				<div id="secondary_image">
					<img style="width:100%" src="">
					<img style="width:100%" src="">
					<img style="width:100%" src="">
					<img style="width:100%" src="">
				</div>
			</div>
			<div class="features"></div>
		</div>
			<div class="bill">
			<form action="initReservation" method="post">
				<div id="details">
					<p>Booking Details</p>
					<div id="line"></div>
					<div id="detail_field">
						<p>Location</p>
						<p>${searchInput.location}</p>
						<input type="hidden" value="${searchInput.location}" name="location">
						<input id="agence" type="hidden" value="" name="agence">
						<input id="matricule_vehicule" type="hidden" name="matricule" value="">
					</div>
					<div id="detail_field">
						<p>Pick up</p>
						<p>${searchInput.pickUp_date}- ${searchInput.pickUp_hour}</p>
						<input type="hidden" value="${searchInput.pickUp_date}" name="pickUp_date">
						<input type="hidden" value="${searchInput.pickUp_hour}" name="pickUp_hour">
					</div>
					<div id="detail_field">
						<p>drop off</p>
						<p>${searchInput.return_date} - ${searchInput.return_hour}</p>
						<input type="hidden" value="${searchInput.return_date}" name="return_date">
						<input type="hidden" value="${searchInput.return_hour}" name="return_hour">
					</div>
					<div id="detail_field">
						<p>daily rate</p>
						<p id="daily_price"></p>
					</div>
					<div id="line"></div>
					<div id="detail_field">
						<p>duration</p>
						<p id="V_duration">${duration}</p>
					</div>
					<div id="detail_field">
						<p>total rate</p>
						<p id="total_rate"></p>
						<input type="hidden" value="" name="total">
					</div>
					</div>
					<div id="cta_book">
						<input id="cta_input" type="submit" value="book now" onclick="">
					</div>
					</form>
			</div>
		</div>
	</div>
</body>
</html>