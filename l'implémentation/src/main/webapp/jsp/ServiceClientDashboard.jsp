<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ServiceClientDashboard.css">
<title>Dashboard</title>
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
				<p id="full-name">${user.prenom} ${user.nom}</p>
			</div>
			<div id="dropdownlist">
				<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
			</div>
			
		</div>
	</div>
	<div class="content">
		<div class="menu">
			<button class="inbox"><a href="${pageContext.request.contextPath}/Inbox"><img src="${pageContext.request.contextPath}/assets/inbox.svg"></a></button>
		</div>
		<div class="main-frame">
		<div class="requests">
			<div class="tab_header">
				<p id="tab_header_title">Available Requests</p>
				<div id="cta">
					<select name="tag" id="filter">
							<option value="Problem Report">Problem Report</option>
						    <option value="Reclamation">Reclamation</option>
						    <option value="Bug Report">Bug Report</option>
					</select>
					<button>Request more</button>
				</div>
			</div>
		</div>
		<div class="request_content"></div>
		</div>
	</div>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>