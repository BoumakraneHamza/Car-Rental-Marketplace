<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyBuildings.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
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
		<div class="asset_card" id="add_asset">
			<div id="add_square" onclick="showAddMap()">
				<img src="${pageContext.request.contextPath}/assets/add-black.svg">
			</div>
			<div id="text_content">
				<p id="title">New Asset</p>
				<p id="subtitle">Define a new asset easily.</p>
			</div>
			<div id="add_btn" onclick="showAddMap()">Create new</div>
		</div>
		<c:forEach begin="0" end="${Buildings.size()-1}" var="i" step="1">
			<div class="asset_card" onclick="showDetails(this)">
				<input type="hidden" id="code" value="${Buildings.get(i).code}">
				<input type="hidden" id="building_type" value="${Buildings.get(i).type}">
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
				<c:choose>
					<c:when test="${Buildings.get(i).type eq 'depot'}">
						<div id=tag>
							<img style="width: 20px;" src="${pageContext.request.contextPath}/assets/steering-wheel.svg">
							<p id="text">${Buildings.get(i).capacite - Buildings.get(i).capacite_libre}</p>
						</div>
					</c:when>
				</c:choose>
					<div id=tag>
						<img style="width: 10px;" src="${pageContext.request.contextPath}/assets/activity-black.svg">
						<p id="text">${Buildings.get(i).bookings}</p>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class="sidebar">
		<div class="map_banner">
			<div id="map"></div>
		</div>
		<div class="sidebar_header">
			<div class="row" id="first_row">
				<div id="left">
					<div id="image_wrapepr">
						<img src="${pageContext.request.contextPath}/assets/PolyBackground/${random[0]}.svg">
					</div>
					<div id="info">
						<div id="info_header">
							<p id="title">Name :</p>
							<p id="value">Depot 01</p>
						</div>
						<div id="tag_list">
							<c:choose>
								<c:when test="${Buildings.get(0).type eq 'depot'}">
									<div id="tag" class="cars">
										<img style="width: 20px;margin-right:5px;" src="${pageContext.request.contextPath}/assets/steering-wheel.svg">
										<p id="value">${Buildings.get(0).capacite}</p>
										<p id="title">Cars</p>
									</div>
								</c:when>
							</c:choose>
							<div id="tag" class="bookings">
								<img style="width: 10px;margin-right:5px;" src="${pageContext.request.contextPath}/assets/activity-black.svg">
								<p id="value">${Buildings.get(0).bookings}</p>
								<p id="title">Bookings</p>
							</div>
						</div>
					</div>
				</div>
				<div id="right">
					<div id="button_wrapper" onclick="showBuilding_Options(this)">
						<img style="width:16px" src="${pageContext.request.contextPath}/assets/3-point-option.svg">
					</div>
					<div id="option_list" style="display:none">
						<input type="hidden" id="code" value="">
						<input type="hidden" id="type" value="">
						<div id="tile" onclick="EditAsset(this)">
							<img style="width: 15px;margin: 0px 10px;" src="${pageContext.request.contextPath}/assets/pen.svg">
							<p>Edit Asset</p>
						</div>
						<div id="tile" onclick="deletePopUp(this)">
							<img style="width: 15px;margin: 0px 10px;" src="${pageContext.request.contextPath}/assets/delete-icon-black.svg">
							<p>Delete Asset</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="employee">
			<div id="image_wrapper">
				<img style="width:60px;height: 60px;object-fit: cover;border-radius: 50%;" src="${pageContext.request.contextPath}${Buildings.get(i).employee.image}">
			</div>
			<div id="info">
				<div id="profile_name">
					<div id="profile_info">
						<p id="name">Hamza boumakrane</p>
						<p id="email">Hamza@email.com</p>
					</div>
					<div id="button_wrapper">
						<img style="width: 19px;" src="${pageContext.request.contextPath}/assets/account-black.svg">
					</div>
				</div>
				<div id="score_line">
					<img style="height:20px;" src="/Atelier/assets/hour_icon_grey.svg">
					<div class="hor_line">
						<div class="line_value" id="value_1"></div>
					</div>
					<div class="hor_line">
						<div class="line_value" id="value_1"></div>
					</div>
					<div class="hor_line">
						<div class="line_value" id="value_3"></div>
					</div>
					<p id="text_value">80%</p>
				</div>
			</div>
		</div>
		<div class="car_list">
			<div id="tab_header">
				<p id="title">cars</p>
				<div id="filter">
					<p id="text">View : <strong style="color:#000;">All Cars</strong></p>
					<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
				</div>
			</div>
			<div id="add_car">
				<img style="width: 12px;" src="${pageContext.request.contextPath}/assets/add-black.svg">
				<p>Add new car</p>
			</div>
			<div id="cars_list">
			</div>
		</div>
	</div>
</div>
<form class="delete_confirmation" style="display:none;">
	<input type="hidden" name="required_action" value="delete">
	<input id="delete_code" type="hidden" name="code">
	<input id="delete_type" type="hidden" name="type">
	<input id="delete_agence" type="hidden" name="agence" value="${user.getNom()}">
	<div id="tab_header">
		<img id="cancel" style="width:13px;cursor:pointer;" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
	</div>
	<div id="sec_header">
		<p id="title">Delete Asset ?</p>
		<p id="subtitle">Are you sure you want to delete the Asset :<strong style="color:#000;" id="selected_building">Depot 01 ?</strong> you can't undo this action</p>
	</div>
	<div class="warning">
		<img style="width: 35px;margin: 5px;" src="${pageContext.request.contextPath}/assets/info-red.svg">
		<div id="warning_info">
			<p id="title">Warning</p>
			<p id="subtitle">By deleting this Asset <Strong id="employee_name">Hamza boumakrane</Strong> will lose all collected statistics</p>
		</div>
	</div>
	<div id="cta">
		<button id="cancel"><p>cancel</p></button>
		<button type="submit" id="delete"><img style="width:15px;" src="${pageContext.request.contextPath}/assets/delete-icon-white.svg"><p>Delete Asset</p></button>
	</div>
</form>
<form class="add_asset" style="display:none;">
	<input type="hidden" name="required_action" value="add">
	<div id="map_wrapper"></div>
	<div id="inputs">
		<div id="left">
			<input type="hidden" name="type" id="building_type">
			<input type="hidden" name="lat" id="lat">
			<input type="hidden" name="lon" id="lon">
			<div id="type">
				<p onclick="selectType(this)" id="depot">Depot</p>
				<p onclick="selectType(this)" id="office">Office</p>
			</div>
			<input required="required" type="number" min="0" max="40" id="capacite" placeholder="capacity" name="capacity">
			<input required="required" type="text" id="inputs_wrapper" placeholder="Address" name="address">
			<button id="search_address"><p>Search</p></button>
		</div>
		<div id="right">
			<button id="sb_btn" type="submit"><img src="${pageContext.request.contextPath}/assets/check.svg"><p>Add asset</p></button>
			<img onclick="closeAddMap()" style="cursor:pointer;" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
		</div>
	</div>
</form>
<form class="edit_asset" style="display:none">
	<input type="hidden" id="Building_type" name="type">
	<input type="hidden" id="building_code" name="code">
	<input type="hidden" name="lat" id="lat">
	<input type="hidden" name="lon" id="lon">
	<input type="hidden" name="required_action" value="edit">
	<div class="edit_header">
		<div id="left">
			<img style="width: 24px;cursor:pointer;" src="${pageContext.request.contextPath}/assets/info.svg">
			<div id="text_content">
				<p id="title">Edit Depot 01</p>
				<p id="subtitle">Edit assets easily !</p>
			</div>
		</div>
		<div id="right">
			<img onclick="closeEditAsset()" style="width: 12px;cursor: pointer;" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
		</div>
	</div>
	<div id="edit_content">
		<div id="row">
			<p id="title">Address</p>
			<div id="value">
				<input required style="width: calc(100% - 50px);" type="text" id="input_field" class="address" placeholder="address" name="address">
				<div id="icon_wrapper" onclick="show_select_location()">
					<img src="${pageContext.request.contextPath}/assets/location.svg">
				</div>
			</div>
		</div>
		<div id="row" class="capacity">
			<p id="title">Total Capacity</p>
			<input required min="0" max="40" type="number" id="input_field" placeholder="capacity" name="capacity">
		</div>
		<div id="row">
			<p id="title">Responsible member</p>
			<input type="hidden" name="employeeEmail" id="employee">
			<div class="select_member">
				<div id="select_header" onclick="showAvailableWorkers(this)">
					<p>Select Team Member</p>
				</div>
				<div id="select_list" style="display:none;">
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<button id="cancel">Cancel</button>
		<button id="sbt_btn">Save</button>
	</div>
</form>
<div class="view_Location" style="display:none;">
	<div id="select_map_wrapper"></div>
	<div id="inputs">
		<input type="text" id="inputs_wrapper" placeholder="address">
		<div id="right">
			<button onclick="submitSelectedLocation()" id="select_location"><img src="${pageContext.request.contextPath}/assets/check.svg"><p>Select</p></button>
			<img onclick="closeSelectMap()" style="cursor:pointer;" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
		</div>
	</div>
</div>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
   crossorigin=""></script>
   <script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
var lat = ${Buildings.get(0).lat};
var lon = ${Buildings.get(0).lon};
</script>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/Map.js"></script>
<script src="${pageContext.request.contextPath}/js/AgencyBuildings.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>
</body>
</html>