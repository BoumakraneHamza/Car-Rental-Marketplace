<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AgencyDashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/circleProgressBar.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
	.multigraph {
		width: 155px;
    	height: 78px;
    	margin-top: 10px;
    	padding-top: 2px;
	}
	.graph{
		width: 155px;
    	height: 78px;
    }
	.multigraph:before {
	    border: 30px solid #C5DCFA;
	    border-bottom: none;
		width: 155px;
    	height: 78px;
	}
	.graph:before, .graph:after{
		border:30px solid #6A0F49;
		border-top:none;
		width: 156px;
    	height: 78px;
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
		<button class="dashboard"><a href="${pageContext.request.contextPath}/ViewAgencyPersonal"><img src="${pageContext.request.contextPath}/assets/personal-icon.svg"></a></button>
		<button class="Personal"><a href="${pageContext.request.contextPath}/ViewAgencyDepots"><img src="${pageContext.request.contextPath}/assets/building-icon-grey.svg"></a></button>
	</div>
	<div class="main-frame">
	<div id="main-frame-header">
		<div id="main_header">
			<p id="title">Dashboard</p>
			<p id="subtitle">Here's an overview of your Agency performance</p>
		</div>
	</div>
	<div id="main-frame-content">
		<div id="summary_Cards">
			<div class="card" id="card_1">
				<div id="card_description">
					<p id="card_title">Secretary Score</p>
					<div id="review_count">
						<p id="review_counter_title">38</p>
						<p>Reviews This Week</p>
					</div>
				</div>
				<div id="card_graph">
					<div id="stats"><p id="stat">12.5%</p><p>This Week</p></div>
					<style>
						#card_1 .graph:after {
						  	transform: rotate(150deg);
						}
					</style>
					<div class="multigraph">
					  	<span class="graph"></span>
					</div>
					<p id="percentile">80%</p>
				</div>
			</div>
			<div class="card" id="card_2">
				<div id="card_description">
					<p id="card_title">Depot Manager Score</p>
					<div id="review_count">
						<p id="review_counter_title">58</p>
						<p>Reviews This Week</p>
					</div>
				</div>
				<div id="card_graph">
					<div id="stats"><p id="stat">8.6%</p><p>This Week</p></div>
					<div class="multigraph">
					  	<span class="graph"></span>
					  	<style>
						#card_2 .graph:after {
						  	transform: rotate(90deg);
						}
					</style>
					</div>
					<p id="percentile">50%</p>
				</div>
			</div>
			<div class="Best_selling">
				<p id="card_title">Best selling cars</p>
				<div id="list">
					<div id="tile">
						<p id="car_Name">Mini Cooper S</p>
						<p id="booking_counter">24</p>
					</div>
					<div id="tile">
						<p id="car_Name">Mini Cooper S</p>
						<p id="booking_counter">24</p>
					</div>
					<div id="tile">
						<p id="car_Name">Mini Cooper S</p>
						<p id="booking_counter">24</p>
					</div>
				</div>
			</div>
		</div>
		<div id="Main_content">
			<div id="main_content_frame">
				<div id="frame_header">
					<p id="title">Booking Summary</p>
				</div>
				<div id="chart_wrapper">
					<canvas id="Bookings_chart"></canvas>
				</div>
				<div id="performance_metrics">
					<p id="tab_header">Performance metrics</p>
					<div id="performance_content">
						<div class="col" id="left">
							<div id="tile">
								<p id="title">Most Rented Car</p>
								<p id="value">Peugeot e-208GT </p>
							</div>
							<div id="tile">
								<p id="title">Least Rented Car</p>
								<p id="value">Mini Cooper S</p>
							</div>
							<div id="tile">
								<p id="title">Best Rated Car</p>
								<p id="value">Mini Cooper S</p>
							</div>
							<div id="tile">
								<p id="title">Worst Rated Car </p>
								<p id="value">Porche 911</p>
							</div>
						</div>
						<div class="col" id="right">
							<div id="tile">
								<p id="title">Best Performing Depot</p>
								<p id="value">Depot 01</p>
							</div>
							<div id="tile">
								<p id="title">Worst Performing Depot</p>
								<p id="value">Depot 11</p>
							</div>
							<div id="tile">
								<p id="title">Best Rated Employee</p>
								<p id="value">Nathanial Olson</p>
							</div>
							<div id="tile">
								<p id="title">Least Rated Employee</p>
								<p id="value">Hamza Boumakrane</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="main_content_sidebar">
				<p id="tab_title">Recently rented cars</p>
				<div id="list">
					<div id="deal">
						<div id="deal_info">
							<p id="car_name">Mini Cooper S</p>
							<p id="deal_date">10:00</p>
						</div>
						<p id="price">$180</p>
					</div>
					<div id="deal">
						<div id="deal_info">
							<p id="car_name">Mini Cooper S</p>
							<p id="deal_date">10 Dec</p>
						</div>
						<p id="price">$180</p>
					</div>
					<div id="deal">
						<div id="deal_info">
							<p id="car_name">Mini Cooper S</p>
							<p id="deal_date">10 Dec</p>
						</div>
						<p id="price">$180</p>
					</div>
					<div id="deal">
						<div id="deal_info">
							<p id="car_name">Mini Cooper S</p>
							<p id="deal_date">10 Dec</p>
						</div>
						<p id="price">$180</p>
					</div>
					<div id="deal">
						<div id="deal_info">
							<p id="car_name">Mini Cooper S</p>
							<p id="deal_date">10 Dec</p>
						</div>
						<p id="price">$180</p>
					</div>
					<div id="deal">
						<div id="deal_info">
							<p id="car_name">Mini Cooper S</p>
							<p id="deal_date">10 Dec</p>
						</div>
						<p id="price">$180</p>
					</div>
					<div id="deal">
						<div id="deal_info">
							<p id="car_name">Mini Cooper S</p>
							<p id="deal_date">10 Dec</p>
						</div>
						<p id="price">$180</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="sidebar">
		<div class="activities">
			<div id="tab_header">
				<p id="title">Recent team activities</p>
				<div id="image_wrapper">
					<img style="width:16px;" src="${pageContext.request.contextPath}/assets/3-point-option.svg">
				</div>
			</div>
			<div id="tab_list">
				<div id="activity">
					<div id="team_image">
						<div id="member_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="vertical_line"></div>
					</div>
					<div id="activity_info">
						<div id="info_header">
							<div id="tag">
								<img style="width:20px;margin-right:10px" src="${pageContext.request.contextPath}/assets/check-round-white.svg">
								<p>Problem solved</p>
							</div>
							<p id="date">12:24</p>
						</div>
						<div id="info_text">
							<p><strong>Nathanial Olson </strong> Completed activity</p>
						</div>
						<div id="task">
							<p id="title">Problem with the engine</p>
							<p id="tag">Engine</p>
						</div>
					</div>
				</div>
				<div id="activity">
					<div id="team_image">
						<div id="member_image">
							<img style="width:40px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
						</div>
						<div id="vertical_line"></div>
					</div>
					<div id="activity_info">
						<div id="info_header">
							<div id="tag">
								<img style="width:20px;margin-right:10px" src="${pageContext.request.contextPath}/assets/check-round-white.svg">
								<p>Problem solved</p>
							</div>
							<p id="date">12:24</p>
						</div>
						<div id="info_text">
							<p><strong>Nathanial Olson </strong> Completed activity</p>
						</div>
						<div id="task">
							<p id="title">Problem with the engine</p>
							<p id="tag">Engine</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="team">
			<div id="tab_header">
				<p id="tab_header_title">Team status</p>
				<div id="image_wrapper">
					<img style="width:16px;" src="${pageContext.request.contextPath}/assets/3-point-option.svg">
				</div>
			</div>
			<div id="list_header">
				<p>Member</p>
				<p>Status</p>
			</div>
			<div id="team_list">
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
				<div id="employee">
					<div id="employee_image">
						<img style="width:50px" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
					</div>
					<div id="employee_info">
						<p id="employee_name">Nathanial Olson</p>
						<p id="employement">Depot Manager</p>
					</div>
					<div id="employee_status">
						<img style="width:25px; margin-right:10px;" src="${pageContext.request.contextPath}/assets/check-circle-not-fill.svg"><p id="status">Online</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/AgencyDashboard.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>