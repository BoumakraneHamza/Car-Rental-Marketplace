<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SecretarySchedule.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<title>Schedule</title>
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
		<div id="tab_header">
			<p id="title">Calendar</p>
		</div>
		<div class="calendar_frame">
			<div id="calendar_header">
				
				<div id="left">
					<p id="calendar_month"></p>
				</div>
				<div id="right">
					<button class="nav_btn" id="back"><img style="width:12px;transform: rotate(180deg);" src="${pageContext.request.contextPath}/assets/angle-right-solid.svg"></button>
					<button id="today"><p id="text">Today</p></button>
					<button class="nav_btn" id="next"><img style="width:12px" src="${pageContext.request.contextPath}/assets/angle-right-solid.svg"></button>
				</div>
			</div>
			<div id="calendar_sec_header">
			</div>
			<div id="calendar_content">
				<div id="day">
					<div id="day_calendar">
						<div id="tile">
							<p id="time">08:00 , 09:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">09:00 , 10:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">10:00 , 11:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">11:00 , 12:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">13:00 , 14:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">14:00 , 15:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">15:00 , 16:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">16:00 , 17:00</p>
							<div id="tile_content"></div>
						</div>
					</div>
				</div>
				<div id="day">
					<div id="day_calendar">
						<div id="tile">
							<p id="time">08:00 , 09:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">09:00 , 10:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">10:00 , 11:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">11:00 , 12:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">13:00 , 14:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">14:00 , 15:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">15:00 , 16:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">16:00 , 17:00</p>
							<div id="tile_content"></div>
						</div>
					</div>
				</div>
				<div id="day">
					<div id="day_calendar">
						<div id="tile">
							<p id="time">08:00 , 09:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">09:00 , 10:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">10:00 , 11:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">11:00 , 12:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">13:00 , 14:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">14:00 , 15:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">15:00 , 16:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">16:00 , 17:00</p>
							<div id="tile_content"></div>
						</div>
					</div>
				</div>
				<div id="day">
					<div id="day_calendar">
						<div id="tile">
							<p id="time">08:00 , 09:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">09:00 , 10:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">10:00 , 11:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">11:00 , 12:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">13:00 , 14:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">14:00 , 15:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">15:00 , 16:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">16:00 , 17:00</p>
							<div id="tile_content"></div>
						</div>
					</div>
				</div>
				<div id="day">
					<div id="day_calendar">
						<div id="tile">
							<p id="time">08:00 , 09:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">09:00 , 10:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">10:00 , 11:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">11:00 , 12:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">13:00 , 14:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">14:00 , 15:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">15:00 , 16:00</p>
							<div id="tile_content"></div>
						</div>
						<div id="tile">
							<p id="time">16:00 , 17:00</p>
							<div id="tile_content"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sidebar">
	<div id="tab_header">
		<p id="title">Upcoming activities</p>
		<p id="subtitle">Don't miss scheduled activities</p>
	</div>
	<div id="activities_list">
		<div id="activity_date">
			<p id="date">Wednesday , 27 April</p>
		</div>
		<div id="activity_list">
			<div id="appt">
				<div id="time">
					<p id="start_time">10:00</p>
					<p id="end_time">10:00</p>
				</div>
				<div id="appt_info">
					<p id="title">Meeting</p>
					<p id="subtitle">Hamza Boumakrane</p>
				</div>
				<div id="image_wrapper">
					<div id="client_image">
						<img style="width:50px;" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/SecretarySchedule.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>