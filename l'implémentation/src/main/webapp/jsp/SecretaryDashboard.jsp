<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/circleProgressBar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SecretaryDashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkbox.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<title>Dashboard</title>
<style>
	.graph:after {
	  transform: rotate(90deg);
	}
	.multigraph:before {
	    border: 30px solid #C5DCFA;
	    border-bottom: none;
	}
	.graph:before, .graph:after{
		border:30px solid #6A0F49;
		border-top:none;
	}
</style>
<c:choose>
	<c:when test="${map.size() == 0}">
	<style type="text/css">
		.main-frame .next_Appointment #tab_content {
	    	filter: blur(4px);
		}
	</style>
	</c:when>
</c:choose>
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
		<div class="menu-tab" style="background: #C5DCFA;" onclick="location.href='${pageContext.request.contextPath}/Dashboard'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/dashboard2-icon-purple.svg">
			<p style="color:#0F56B3;" id="title">Dashboard</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/SecretarySchedule'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/application.svg">
			<p id="title">Schedule</p>
		</div>
	</div>
	<div class="main-frame">
		<div class="next_Appointment">
			<div id="tab_header">
				<div class="left">
					<div id=title>
						<p id="main">Next Appointment</p>
						<p id="subtitle">/ Client Profile</p>
					</div>
				</div>
				<div class="add">
					<button id="add">
						<img src="${pageContext.request.contextPath}/assets/add.svg">
						<p>add</p>
					</button>
					<div class="add_client_booking" style="display:none;">
						<div id="tile" class="New_client">
							<img style="width:20px;" id="icon" src="${pageContext.request.contextPath}/assets/user.svg">
							<p id="title">New Client</p>
						</div>
						<div id="tile" class="New_booking">
							<img style="width: 10px;margin-right: 5px;margin-left: 5Px;" id="icon" src="${pageContext.request.contextPath}/assets/activity.svg">
							<p id="title">New Booking</p>
						</div>
					</div>
			</div>
			</div>
			<c:choose>
				<c:when test="${map.size() > 0}">
					<c:forEach items="${map.keySet()}" var="key">
						<div id="tab_content">
						<div id="main_content">
							<div id="client_image">
							<c:choose>
								<c:when test="${map.get(key).client.image.substring(0,5).equals(\"https\")}">
									<img style="width:185px;" src="${map.get(key).client.image}">
								</c:when>
								<c:otherwise>
									<img style="width:185px;" src="${pageContext.request.contextPath}${map.get(key).client.image}">
								</c:otherwise>
							</c:choose>
							</div>
							<div id="client_main_info">
								<div id="tile">
									<p id="title">N° Reservations :</p>
									<p id="value">${counter}</p>
								</div>
								<div id="tile">
									<p id="title">N° warnings :</p>
									<p id="value">${map.get(key).client.alert}</p>
								</div>
							</div>
						</div>
						<div id="secondary_content">
							<div id="content_header">
								<div id="left">
									<div id="renter_name_status">
										<div id="Renter_name" onclick="showProfile(this)"><p>${map.get(key).client.nom} ${map.get(key).client.prenom}</p><input id="client_email" type="hidden" value="${map.get(key).client.email}"></div>
										<div id="status"><img style="width:20px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="value">Active</p></div>
									</div>
									<div id="renter_age_gender">
										<c:choose>
											<c:when test="${age != 0}">
												<p id="Age">${age} Yrs,</p>
											</c:when>
											<c:otherwise>
												<p id="Age">Age :Not available</p>
											</c:otherwise>
										</c:choose>
										<p id="gender"> ${map.get(key).client.sexe}</p>
									</div>
								</div>
								<div id="right">
									<input type="hidden" id="reservationId" value="${map.get(key).booking_Id}">
									<c:choose>
										<c:when test="${map.get(key).getMeetingType() == 'Booking'}">
											<button id="start_appt" onclick="start_Meeting()"><img style="width:25px;" src="${pageContext.request.contextPath}/assets/open-circle.svg"><p id="title">Start Appointment</p></button>	
										</c:when>
										<c:otherwise>
											<button id="start_appt" onclick="PaymentDisplayManagement(this)"><img style="width:25px;" src="${pageContext.request.contextPath}/assets/open-circle.svg"><p id="title">Confirm Payment</p></button>	
										</c:otherwise>
									</c:choose>
									</div>
							</div>
							<div id="content_middle">
								<div id="left">
									<div id="tile">
										<p id="title">Scheduled Appt</p>
										<p id="value">${key}</p>
									</div>
								</div>
								<div id="middle">
									<div id="tile">
										<p id="title">Expiry Date </p>
										<p id="value">11 Dec 2022</p>
									</div>
								</div>
								<div id="right">
									<div id="tile">
										<p id="title">Referring Booking</p>
										<p id="value" class="booking">Booking N° ${map.get(key).booking_Id}</p>
									</div>
								</div>
							</div>
							<div id="content-bottom">
								<div id="left">
									<div id="tile">
										<p id="title">Customer Phone</p>
										<p id="value">${map.get(key).client.telephone}</p>
									</div>
								</div>
								<div id="right">
									<div id="tile">
										<p id="title">Customer Email</p>
										<p id="value">${map.get(key).client.email}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
						<div id="tab_content">
						<div id="main_content">
							<div id="client_image">
								<img style="width:185px;" src="${pageContext.request.contextPath}/assets/profile_pics/hamzagmail.jpg">
							</div>
							<div id="client_main_info">
								<div id="tile">
									<p id="title">N° Reservations :</p>
									<p id="value">${counter}</p>
								</div>
								<div id="tile">
									<p id="title">N° warnings :</p>
									<p id="value">${map.get(key).client.alert}</p>
								</div>
							</div>
						</div>
						<div id="secondary_content">
							<div id="content_header">
								<div id="left">
									<div id="renter_name_status">
										<div id="Renter_name" onclick="showProfile(this)"><p>${map.get(key).client.nom} ${map.get(key).client.prenom}</p><input id="client_email" type="hidden" value="${map.get(key).client.email}"></div>
										<div id="status"><img style="width:20px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="value">Active</p></div>
									</div>
									<div id="renter_age_gender">
										<p id="Age">${age} Yrs,</p>
										<p id="gender"> ${map.get(key).client.sexe}</p>
									</div>
								</div>
								<div id="right">
									<button id="start_appt"><img style="width:25px;" src="${pageContext.request.contextPath}/assets/open-circle.svg"><p id="title">Start Appointment</p></button>	
								</div>
							</div>
							<div id="content_middle">
								<div id="left">
									<div id="tile">
										<p id="title">Scheduled Appt</p>
										<p id="value">${key}</p>
									</div>
								</div>
								<div id="middle">
									<div id="tile">
										<p id="title">Expiry Date (DD/MM/YY)</p>
										<p id="value">11 Dec 2022</p>
									</div>
								</div>
								<div id="right">
									<div id="tile">
										<p id="title">Referring Booking</p>
										<p id="value" class="booking">Booking N° 203</p>
									</div>
								</div>
							</div>
							<div id="content-bottom">
								<div id="left">
									<div id="tile">
										<p id="title">Customer Phone</p>
										<p id="value">${map.get(key).client.telephone}</p>
									</div>
								</div>
								<div id="right">
									<div id="tile">
										<p id="title">Customer Email</p>
										<p id="value">${map.get(key).client.email}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="no_content">
						<p id="text">No Meetings</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="Summary_Cards">
			<div class="Schedule">
				<div id="card_header">
					<p id="header_title">Upcoming_Schedule</p>
				</div>
				<div id="schedule_list">
					<p id="info_warning">No Upcoming Activities</p>
				</div>
				<button id="View_Details" onclick="location.href='${pageContext.request.contextPath}/SecretarySchedule'">See All Activity</button>
			</div>
			<div class="Review_score">
				<div id="tab_header">
			<p id="title">Review Score History</p>
			</div>
			<div id="stat_history_wrapper">
				<canvas id="score_history"></canvas>
			</div>
			</div>
		</div>
	</div>
	<div class="side_bar">
	<div class="side_bar_content">
		<div id="tab_header">
			<p id="title">Your Reviews Score</p>
		</div>
		<div class="multigraph">
		  	<span class="graph"></span>
		</div>
		<img id="score_status" style="width:40px;" src="${pageContext.request.contextPath}/assets/Hands001.jpg">
		<p id="percentile">50%</p>
		<p id="subtitle">
			You need to make an efforts
			to reach your goal
		</p>
		<div class="reviews">
			<p id="reviews_header">Reviews</p>
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
	</div>
</div>
<form class="new_Booking_form" action="CarSearch" method="get" style="display:none;">
	<div id="header">
		<p id="title">Authenticate client</p>
		<button id="cancel"><img src="${pageContext.request.contextPath}/assets/cancel.svg"></button>
	</div>
		<label>Email Address</label>
		<input id="client_email" aria-autocomplete="both" aria-haspopup="false" autocapitalize="off" autocomplete="off" autocorrect="off" autofocus="" role="combobox" spellcheck="false" name="email" type="email" placeholder="Client Email Address">
		<label>Password</label>
		<input id="client_password" name="password" type="password" placeholder="Client password">
		<button type="submit" id="submit_Btn" ><p>authenticate</p><img src="${pageContext.request.contextPath}/assets/arrow-right.svg"></button>
</form>
<c:choose>
	<c:when test="${status.equals('success')}">
		<style>
			.content{
				filter:blur(5px);
			}
		</style>
		<div id="booking_completed">
			<img style="width:100px;" src="${pageContext.request.contextPath}/assets/check-illustration.svg">
			<p id="title">Booking Completed</p>
			<p id="subtitle">Congrats! Your Booking successfully done</p>
			<button id="ok" onclick="deleteUnBlur()"><p>Ok</p></button>
		</div>
	</c:when>
</c:choose>
<div class="confirmPayment" style="display:none;">
	<div id="tab_header">
		<p id="title">Confirm Payment</p>
		<img onclick="PaymentDisplayManagement()" style="width: 11px;cursor: pointer;" src="${pageContext.request.contextPath}/assets/cancel.svg">
	</div>
	<div id="tab_content">
		<div id="left_section">
			<div id="secondary_header">
				<p id="booking_id">Booking N° 967</p>
			</div>
			<div id="total_wrapper">
				<div id="price">
					<p>Total Amount</p>
					<div id="amount">
						<p>$</p>
						<p id="total_price">1210</p>
					</div>
				</div>
				<div id="item">
					<p id="car_name">Audit A3</p>
					<div id="detail"><p id="duration">6 days </p>@<p id="plj">$ 120</p></div>
				</div>
			</div>
			<div id="cta">
				<div id="terms">
					<input id="term_confirmation" type="checkbox">
					<p id="terms_text">i do confirm the payment of the client for the booking</p>
				</div>
				<input type="hidden" id="reservation_id">
				<button disabled onclick="FinishPayment(this)" id="confirmationBTN">Confirm Payment</button>
			</div>
		</div>
		<div id="right_section">
			<div id="car_wrapper">
				<img style="width: 400px;height: 248px;object-fit: cover;" src="${pageContext.request.contextPath}/assets/car_pics/auditA3.jpg">
			</div>
			<div id="info_wrapper">
				<div id="section">
					<div id="tile">
						<p>Pick up depot</p>
						<p class="value" id="depot">Depot 01</p>
					</div>
					<div id="tile">
						<p>Depot address</p>
						<p class="value" id="addresse">Constantine - Algeria 20012301</p>
					</div>
					
				</div>
				<div id="section">
					<div id="tile">
						<p>Pick up date</p>
						<p class="value" id="pick_up">10 Dec 2022</p>
					</div>
					<div id="tile">
						<p>Return date</p>
						<p class="value" id="return_date">20 Dec 2022</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/SecretaryDashboard.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
<%@include file="/jsp/UserBanner.jsp"%>
<%@include file="/jsp/ReportClient.jsp"%>
</body>
</html>