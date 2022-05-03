<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyPersonal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ViewProfile.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<meta charset="UTF-8">
<title>Personal</title>
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
		<button class="Personal" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/ViewAgencyPersonal"><img src="${pageContext.request.contextPath}/assets/personal-icon-white.svg"></a></button>
		<button class="Personal"><a href="${pageContext.request.contextPath}/ViewAgencyDepots"><img src="${pageContext.request.contextPath}/assets/building-icon-grey.svg"></a></button>
	</div>
	<div class="main-frame active">
		<div id="frame_header">
			<p id="title">Agency Team</p>
			<button id="add" onclick="Add()">
				<img src="${pageContext.request.contextPath}/assets/add.svg">
				<p>add</p>
			</button>
		</div>
		<div id="filter_header">
			<div id="left">
				<select class="filter">
					<option>Position</option>
					<option>All</option>
					<option>Depot Manager</option>
					<option>Secretary</option>
				</select>
				<select class="filter">
					<option>Status</option>
					<option>Online</option>
					<option>Offline</option>
				</select>
			</div>
			<div id="right">
				<div id="sort">
					<p id="tite">Sort by :</p>
					<p id="value">All</p>
					<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
				</div>
				<div id="toggle"></div>
			</div>
		</div>
		<div id="main_content">
			<c:choose>
				<c:when test="${not empty employees}">
					<c:forEach items="${employees}" var="employee">
						<div id="employee_card">
							<div id="card_header">
								<div id="image_wrapper"  onclick="showCardOptions(this)">
									<img style="width:15px" src="${pageContext.request.contextPath}/assets/3-point-option.svg">
									<div class="employeeTabOptions" style="display:none;">
										<div id="tile">
											<input id="email" type="hidden">
											<img style="width: 15px;" id="image" src="${pageContext.request.contextPath}/assets/gear-black.svg">
											<p id="title">Edit Member</p>
										</div>
										<div id="tile">
											<input id="email" type="hidden">
											<img style="width: 13px;margin-left: 1px;" id="image" src="${pageContext.request.contextPath}/assets/delete-icon-black.svg">
											<p id="title">Delete Member</p>
										</div>
									</div>
								</div>
							</div>
							<div id="client_image" onclick="showDetails()">
								<div id="client_image_wrapper">
									<img style="width:100Px;object-fit: fill;border-radius: 50%;height: 100px;" src="${pageContext.request.contextPath}${employee.image}">
								</div>
								<div id="status"></div>
							</div>
							<div id="client_info" onclick="showDetails()">
								<div id="client_name">${employee.firstName} ${employee.lastName}</div>
								<div id="client_email">${employee.email}</div>
							</div>
							<div id="score_line">
								<img style="height:20px;" src="${pageContext.request.contextPath}/assets/hour_icon_grey.svg">
								<div class="hor_line" id="line_1">
									<div class="line_value" id="value_1"></div>
								</div>
								<div class="hor_line" id="line_2">
									<div class="line_value" id="value_2"></div>
								</div>
								<div class="hor_line" id="line_3">
									<div class="line_value" id="value_3"></div>
								</div>
								<p id="text_value">80%</p>
							</div>
							<div id="position"><p>${employee.type}</p></div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="side_bar">
		<div id="tab_header">
			<p id="title">Member</p>
			<div id="image_wrapper" onclick="hideDetails()">
				<img style="width:11px" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
			</div>
		</div>
		<div id="member_info">
			<div id="member_image">
				<div id="client_image_wrapper">
					<img style="width:100Px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
				</div>
				<div id="status"></div>
			</div>
			<div id="member_details">
				<p id="member_name">Nathanial Olson</p>
				<div id="sec_info">
					<p id="member_image">NathanialOlson@email.com</p>
					<div id="options">
						<p id="member_location">Depot 01</p>
						<div id="image_wrapper">
							<img style="width:15px" src="${pageContext.request.contextPath}/assets/3-point-option.svg">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="tab_header">
			<p id="title">Member Stats</p>
		</div>
		<div id="stat_wrapper">
			<canvas id="member_stat"></canvas>
		</div>
		<div id="tab_header">
			<p id="title">Reviews</p>
		</div>
		<div id="review_list">
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
				<div id="review">
					<div id="renter">
						<div id="renter_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="verticatl_line"></div>
					</div>
					<div id="content">
						<p id="renter_name">Nathanial</p>
						<p id="review_content">Great Car , Great Team , awsome cutomer service , I recommend</p>
						<p id="date">20 Dec , 10:00AM</p>
					</div>
				</div>
			</div>
	</div>
</div>
<form class="add_employee" style="display: none;">
	<div id="tab_header">
		<div id="left">
			<div id="info">
				<div id="image_wrapper" onclick="hideDetails()">
					<img style="width:22px;cursor:pointer;" src="${pageContext.request.contextPath}/assets/info.svg">
				</div>
			</div>
			<div id="text">
				<p id="title">Invite Team member</p>
				<p id="subtitle">create a team member account with One click</p>
			</div>
		</div>
		<div id="right">
			<div id="image_wrapper" onclick="Add()">
				<img style="width:11px" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
			</div>
		</div>
	</div>
	<div id="error_banner" style="display:none;">
		<img style="width:11px;" src="${pageContext.request.contextPath}/assets/cancel-red.svg">
		<p id="text">Please Make sure that passwords match</p>
	</div>
	<div id="email_role">
		<div id="email_field">
			<div id="at_symbol">
				<img style="width:18px" src="${pageContext.request.contextPath}/assets/at.svg">
			</div>
			<input required="required" name="email" type="email" id="email" placeholder="email address" aria-autocomplete="both" aria-haspopup="false" autocapitalize="off" autocomplete="off" autocorrect="off" autofocus="" role="combobox" spellcheck="false">
		</div>
		<select name="type" id="filter">
			<option value="depot manager">Depot Manager</option>
			<option value="secretary">Secretary</option>
		</select>
	</div>
	<div id="passwords">
		<input required="required" name="password" type="password" class="pass" id="password" placeholder="password">
		<input type="password" class="pass" id="confirmation_password" placeholder="confirm password">
	</div>
	<div id="location_select">
		<input required="required" name="location" type="text" id="title" value="Select Working location" readonly>
		<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
	</div>
	<div id="locations_List" style="display:none;">
	</div>
	<button id="sub_btn" type="submit"><img src="${pageContext.request.contextPath}/assets/check.svg"><p>Send Invite</p></button>
</form>
<script src="${pageContext.request.contextPath}/js/agency_personal.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>