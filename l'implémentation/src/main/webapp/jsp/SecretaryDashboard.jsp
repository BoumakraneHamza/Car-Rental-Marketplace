<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/circleProgressBar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SecretaryDashboard.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<title>Dashboard</title>
<style>
	.graph:after {
	  transform: rotate(90deg);
	}
	.multigraph:before{
		border:30px solid #8fc73e;
		border-bottom:none;
	}
	.graph:before, .graph:after{
		border:30px solid #3d415c;
		border-top:none;
	}
</style>
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
		<button class="dashboard" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon-white.svg"></a></button>	
	</div>
	<div class="main-frame">
		<div class="next_Appointment">
			<div id="tab_header">
				<div id=title>
					<p id="main">Next Appointment</p>
					<p id="subtitle">/ Client Profile</p>
				</div>
			</div>
			<div id="tab_content">
				<div id="main_content">
					<div id="client_image">
						<img style="width:185px;" src="${pageContext.request.contextPath}/assets/profile_pics/hamzagmail.jpg">
					</div>
					<div id="client_main_info">
						<div id="tile">
							<p id="title">N° Reservations :</p>
							<p id="value">24</p>
						</div>
						<div id="tile">
							<p id="title">N° warnings :</p>
							<p id="value">0</p>
						</div>
					</div>
				</div>
				<div id="secondary_content">
					<div id="content_header">
						<div id="left">
							<div id="renter_name_status">
								<p id="Renter_name">Boumakrane Hamza</p>
								<p id="status">Online</p>
							</div>
							<div id="renter_age_gender">
								<p id="Age">22 Yrs,</p>
								<p id="gender"> Male</p>
							</div>
						</div>
						<div id="right">	
						</div>
					</div>
					<div id="content_middle">
						<div id="left">
							<div id="tile">
								<p id="title">Scheduled Appt</p>
								<p id="value">10 Dec 2022 , 10:00 AM</p>
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
								<p id="value">01 23 01 30 10</p>
							</div>
						</div>
						<div id="right">
							<div id="tile">
								<p id="title">Customer Email</p>
								<p id="value">Hamza@email.com</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="Summary_Cards">
			<div class="Schedule">
				<div id="card_header">
					<p id="header_title">Upcoming_Schedule</p>
				</div>
				<div id="schedule_list">
					<div id="task">
						<div id="time">
							<p id="start_time">10:00</p>
							<p id="end_time">10:15</p>
						</div>
						<div id="task_info">
							<p id="title">Meeting</p>
							<p id="subtitle">Hamza Boumakrane</p>
						</div>
						<div id="image_wrapper">
							<div id="client_image">
								<img style="width:50px;" src="${pageContext.request.contextPath}/assets/profile_pics/hamzagmail.jpg">
							</div>
						</div>
					</div>
					<div id="task">
						<div id="time">
							<p id="start_time">10:00</p>
							<p id="end_time">10:15</p>
						</div>
						<div id="task_info">
							<p id="title">Meeting</p>
							<p id="subtitle">Hamza Boumakrane</p>
						</div>
						<div id="image_wrapper">
							<div id="client_image">
								<img style="width:50px;" src="${pageContext.request.contextPath}/assets/profile_pics/hamzagmail.jpg">
							</div>
						</div>
					</div>
					<div id="task">
						<div id="time">
							<p id="start_time">10:00</p>
							<p id="end_time">10:15</p>
						</div>
						<div id="task_info">
							<p id="title">Meeting</p>
							<p id="subtitle">Hamza Boumakrane</p>
						</div>
						<div id="image_wrapper">
							<div id="client_image">
								<img style="width:50px;" src="${pageContext.request.contextPath}/assets/profile_pics/hamzagmail.jpg">
							</div>
						</div>
					</div>
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
<script src="${pageContext.request.contextPath}/js/SecretaryDashboard.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>