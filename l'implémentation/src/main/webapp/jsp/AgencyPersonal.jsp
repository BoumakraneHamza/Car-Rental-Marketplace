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
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Personal</title>
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
		
	</div>
</div>
<div class="content">
	<div class="menu">
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/dashboard2-icon.svg">
			<p id="title">Dashboard</p>
		</div>
		<div class="menu-tab" style="background: #C5DCFA;" onclick="location.href='${pageContext.request.contextPath}/ViewAgencyPersonal'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/account-purple.svg">
			<p style="color:#0F56B3;" id="title">Team Accounts</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/ViewAgencyDepots'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/building-icon-grey.svg">
			<p id="title">Assets</p>
		</div>
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
							<input type="hidden" id="location" value="${employee.workingLocation}">
							<div id="card_header">
								<div id="image_wrapper"  onclick="showCardOptions(this)">
									<img style="width:15px" src="${pageContext.request.contextPath}/assets/3-point-option.svg">
									<div class="employeeTabOptions" style="display:none;">
										<input id="email" type="hidden" value="${employee.email}">
										<div id="tile" onclick="ShowEdit(this)">
											<img style="width: 15px;" id="image" src="${pageContext.request.contextPath}/assets/pen.svg">
											<p id="title">Edit Member</p>
										</div>
										<div id="tile" onclick="DeletePopUp(this)">
											<img style="width: 13px;margin-left: 1px;" id="image" src="${pageContext.request.contextPath}/assets/delete-icon-black.svg">
											<p id="title">Delete Member</p>
										</div>
									</div>
								</div>
							</div>
							<div id="client_image" onclick="showDetails(this)">
								<div id="client_image_wrapper">
									<img id="client_specific_image" style="width:100Px;object-fit: cover;border-radius: 50%;height: 100px;" src="${pageContext.request.contextPath}${employee.image}">
								</div>
								<div id="status"></div>
							</div>
							<div id="client_info" onclick="showDetails(this)">
								<p id="client_name">${employee.prenom} ${employee.nom}</p>
								<p id="client_email">${employee.email}</p>
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
					<img id="sidebar_member_image" style="width:100Px;height: 100px;object-fit: cover;border-radius:50%" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
				</div>
				<div id="status"></div>
			</div>
			<div id="member_details">
				<p id="member_name">Nathanial Olson</p>
				<div id="sec_info">
					<p id="member_email">NathanialOlson@email.com</p>
					<div id="options">
						<p id="member_location">Depot 01</p>
						<!-- 
							<div id="image_wrapper">
							<img style="width:15px" src="${pageContext.request.contextPath}/assets/3-point-option.svg">
						</div>
						<div id="option_list">
							<div id="tile">
								<img src="${pageContext.request.contextPath}/assets/pen.svg">
								<p id="title">Edit Member</p>	
							</div>
							<div id="tile">
								<img src="${pageContext.request.contextPath}/assets/delete-icon-black.svg">
								<p id="title">Delete Member</p>	
							</div>
						</div>
						 -->
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
	<input type="hidden" name="required_action" value="add">
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
<form class="edit_employee" style="display: none;">
	<input type="hidden" id="selected_employee_email">
	<input type="hidden" name="required_action" value="edit">
	<div id="tab_header">
		<div id="left">
			<div id="info">
				<div id="image_wrapper">
					<img style="width:22px;cursor:pointer;" src="${pageContext.request.contextPath}/assets/pen.svg">
				</div>
			</div>
			<div id="text">
				<p id="title">Edit Team member</p>
				<p id="subtitle">Edit a team member account with One click</p>
			</div>
		</div>
		<div id="right">
			<div id="image_wrapper" onclick="cancelEdit()">
				<img style="width:11px" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
			</div>
		</div>
	</div>
	<div id="error_banner" style="display:none;">
		<img style="width:11px;" src="${pageContext.request.contextPath}/assets/cancel-red.svg">
		<p id="text">Please Make sure you entered the correct Password</p>
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
		<input required="required" name="password" type="password" class="pass" id="password" placeholder="Current password">
		<input required type="password" class="pass" id="new_password" placeholder="New password" name="new_password">
	</div>
	<div id="location_select">
		<input required="required" name="location" type="text" id="title" value="Select Working location" readonly>
		<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
	</div>
	<div id="locations_List" style="display:none;">
	</div>
	<button id="sub_btn" type="submit"><img src="${pageContext.request.contextPath}/assets/pen-white.svg" style="width: 14px;"><p>Edit</p></button>
</form>
<div class="edit_confirmation" style="display:none;">
	<input type="hidden" id="agency_email" value="${user.email}">
	<div class="tab_header">
		<img onclick="BackToEditForm()" style="cursor:pointer;" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
	</div>
	<div class="tab_content">
		<p id="header">Confirm Edit ?</p>
		<p id="content">Are you sure you want to Edit the account of <strong style="color:#000;" id="team_member_name">Hamza Boumakrane ?</strong> you can't undo this action</p>
		<input id="password" type="password" placeholder="Your Password">
	</div>
	<div class="tab_footer">
		<button onclick="cancelEdit()" id="cancel">cancel</button>
		<button disabled="disabled" id="sbt_btn"><img src="${pageContext.request.contextPath}/assets/check.svg"><p>Confirm</p></button>
	</div>
</div>
<form class="delete_confirmation" style="display:none;">
	<input type="hidden" name="required_action" value="delete">
	<input id="delete_email" type="hidden" name="email">
	<div id="tab_header">
		<img id="cancel" style="width:13px;cursor:pointer;" src="${pageContext.request.contextPath}/assets/cancel-black.svg">
	</div>
	<div id="sec_header">
		<p id="title">Delete member ?</p>
		<p id="subtitle">Are you sure you want to delete the account of <strong style="color:#000;" id="team_member_name">Hamza Boumakrane ?</strong> you can't undo this action</p>
	</div>
	<div class="warning">
		<img style="width: 35px;margin: 5px;" src="${pageContext.request.contextPath}/assets/info-red.svg">
		<div id="warning_info">
			<p id="title">Warning</p>
			<p id="subtitle">By deleting this account the assets they work on will become available</p>
		</div>
	</div>
	<div id="cta">
		<button id="cancel"><p>cancel</p></button>
		<button type="submit" id="delete"><img style="width:15px;" src="${pageContext.request.contextPath}/assets/delete-icon-white.svg"><p>Delete Account</p></button>
	</div>
</form>
<script src="${pageContext.request.contextPath}/js/agency_personal.js"></script>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<c:choose>
	<c:when test="${redirected eq true}">
		<div id="redirected" style="display:none">
			<input type="hidden" id="redirected_employee_email" value="${SelectedEmployee.email}">
			<input type="hidden" id="redirected_employee_name" value="${SelectedEmployee.prenom} ${SelectedEmployee.nom}">
			<input type="hidden" id="redirected_employee_type" value="${SelectedEmployee.type}">
			<input type="hidden" id="redirected_employee_location" value="${SelectedEmployee.workingLocation}"> 
			<input type="hidden" id="redirected_employee_image" value="${SelectedEmployee.image}">
		</div>
		<script type="text/javascript">showRedirected()</script>
	</c:when>
</c:choose>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>