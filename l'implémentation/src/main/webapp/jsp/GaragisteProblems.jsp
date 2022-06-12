<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/GaragisteProblems.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/circleProgressBar.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/dragula/3.7.3/dragula.min.js" 
	integrity="sha512-NgXVRE+Mxxf647SqmbB9wPS5SEpWiLFp5G7ItUNFi+GVUyQeP+7w4vnKtc2O/Dm74TpTFKXNjakd40pfSKNulg==" 
	crossorigin="anonymous" 
	referrerpolicy="no-referrer">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<title>Problems</title>
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
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/GaragisteBookings'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/ledger.svg">
			<p id="title">Bookings</p>
		</div>
		<div class="menu-tab" onclick="location.href='${pageContext.request.contextPath}/GaragisteCars'">
			<img style="width:24px;" src="${pageContext.request.contextPath}/assets/coffee_cup.svg">
			<p id="title">Reviews</p>
		</div>
		<div class="menu-tab" style="background: #C5DCFA;" onclick="location.href='${pageContext.request.contextPath}/GaragisteProblems'">
			<img style="width:13px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
			<p style="color:#0F56B3;" id="title">Problems</p>
		</div>
	</div>
	<div class="main-frame">
		<div class="main-frame-header">
			<p id="main-frame-title">Reported Problems</p>
			<div id="searchBar">
				<img src="${pageContext.request.contextPath}/assets/search-icon.svg">
				<input type="text" placeholder="Search">
			</div>
		</div>
		<div class="main-content">
			<div class="stats">
				<p id="stats_title">Your Performance</p>
				<div id="stat_wrapper">
					<canvas id="stat"></canvas>
				</div>
			</div>
			<div class="problems_list">
				<div class="Tab">
					<p id="Tab_header">Pending Problems</p>
					<div class="Problem_list" id="pending">
						<c:forEach items = "${problems }" var = "problem">
						<c:if test = "${problem.status eq 'pending' }">
							<div id="${problem.id }" class="problem">
								<p id="title">${problem.description }</p>
								<div id="tags"><p id="tag">${problem.type }</p></div>
							</div>
						</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="Tab">
					<p id="Tab_header">Active Problems</p>
					<div class="Problem_list" id="active">
						<c:forEach items = "${problems }" var = "problem">
						<c:if test = "${problem.status eq 'active' }">
							<div id="${problem.id }" class="problem">
								<p id="title">${problem.description }</p>
								<div id="tags"><p id="tag">${problem.type }</p></div>
							</div>
						</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="Tab">
					<p id="Tab_header">Completed Problems</p>
					<div class="Problem_list" id="completed">
						<c:forEach items = "${problems }" var = "problem">
						<c:if test = "${problem.status eq 'completed' }">
							<div id="${problem.id }" class="problem">
								<p id="title">${problem.description }</p>
								<div id="tags"><p id="tag">${problem.type }</p></div>
							</div>
						</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sidebar">
		<div id="sidebar_header">
			<p id="sidebar_header_title">Your Performance Stats</p>
		</div>
		<div class="multigraph">
			<span class="graph"></span>
		</div>
		<div class="graph_stats">
			<div id="stats">
				<p id="title">Pending</p>
				<div id="stat_value">
					<p id="total">80</p>
					<p id="increase">+17%</p>
				</div>
			</div>
			<div id="stats">
				<p id="title">Active</p>
				<div id="stat_value">
					<p id="total">25</p>
					<p id="increase">+13%</p>
				</div>
			</div>
			<div id="stats">
				<p id="title">Completed</p>
				<div id="stat_value">
					<p id="total">141</p>
					<p id="increase">+28%</p>
				</div>
			</div>
		</div>
		<div class="stat_history">
			<div id="stat_history_header">
				<p id="title">Performance History</p>
			</div>
			<div id="stat_history_wrapper">
				<canvas id="stat_history"></canvas>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var weeklyStat = ${weeklyStat}
	var halfYearStat = ${halfYearStat}
</script>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/GaragisteProblems.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>