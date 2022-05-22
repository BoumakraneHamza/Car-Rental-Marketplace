    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
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
				<button class="dashboard"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></a></button>
				<button class="Personal" ><a href="${pageContext.request.contextPath}/ViewAgencyPersonal"><img src="${pageContext.request.contextPath}/assets/personal-icon.svg"></a></button>
				<button class="Depots" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/ViewAgencyDepots"><img src="${pageContext.request.contextPath}/assets/building-icon-white.svg"></a></button>
				
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
							<div id="add" onclick="document.getElementById('tempFormForAddingCars').style.visibility='visible'"><button><img style="margin-right: 11px;" src="${pageContext.request.contextPath}/assets/add.svg"><p>Add Car</p></button></div>
						</div>
					</div>
				</div>
				<div class="content_body">
						<c:forEach items="${cars}" var="car">
						<div id="car">
							<div id="car_image"><img style="width:240px;height:151px;border-radius: 10px 10px 0px 0px ;" src="${pageContext.request.contextPath}${car.image}"></div>
							<div id="car_info">
								<div id="names">
									<p id="carName">${car.marque} ${car.modele}</p>
									<input type="hidden" id="matricule" value="${car.matricule}"></input>
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
								<img src="${pageContext.request.contextPath}/assets/delete-icon.svg" onclick="confirmDelete('${car.matricule}')">
								<div id="cta" onclick="show_details('${car.matricule}')">
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

		<div id="tempFormForAddingCars" style="visibility:hidden;background-color:grey;position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);border: 5px solid #000000;padding: 10px;">
			<div id="addingCarForm"><p>adding Car</p>
				<form id="addingCar" onsubmit="submitCar(event)">
					<div>
						<label>matricule</label><br>
						<input type="text" name="matricule">
					</div>
					<div>
						<label>marque</label><br>
						<input type="text" name="marque">
					</div>
					<div>
						<label>modele</label><br>
						<input type="text" name="modele">
					</div>
					<div>
						<label>PLJ</label><br>
						<input type="number" name="PLJ">
					</div>
					<div>
						<label>PLH</label><br>
						<input type="number" name="PLH">
					</div>
					<div>
						<label>type</label><br>
						<input type="text" name="type">
					</div>
					<div>
						<label>image</label><br>
						<input type="file" name="image">
					</div>
					<div>
						<label>year</label><br>
						<input type="number" name="year">
					</div>
					<div>
						<label>color</label><br>
						<input type="text" name="color">
					</div>
						<input type="hidden" name="depot" value="${depotcode }">
						<input type="hidden" name="agency" value="${agency }">
					<input type="reset"><input type="submit">
				</form>
			</div>
		</div>
		<div id="tempFormForDeletingCars" style="visibility:hidden;background-color:grey;position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);border: 5px solid #000000;padding: 10px;">
			<div id="deleteCarForm"><p>delete car?</p>
				<form id="deletingCar" onsubmit="deleteCar(event)">
					<input type="hidden" name="matricule">
					<input type="hidden" name="depot" value="${depotcode }">
					<button type="button" onclick="document.getElementById('tempFormForDeletingCars').style.visibility='hidden'">Cancel</button><input type="submit">
				</form>
			</div>
		</div>
		
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	
</script>
	<script src="${pageContext.request.contextPath}/js/agency_cars.js"></script>
</body>
</html>