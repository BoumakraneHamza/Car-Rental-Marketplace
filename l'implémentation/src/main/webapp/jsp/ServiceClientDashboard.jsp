<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ServiceClientDashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/InboxSystem.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<title>Dashboard</title>
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
		<div class="menu-tab" style="background: #C5DCFA;" onclick="location.href='${pageContext.request.contextPath}/jsp/ServiceClientDashboard.jsp'">
			<img style="width:12px;" src="${pageContext.request.contextPath}/assets/activity-purple.svg">
			<p style="color:#0F56B3;" id="title">Requests</p>
		</div>
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
					<button onclick="loadMore()">Request more</button>
				</div>
			</div>
			<div class="request_list">
			<c:choose>
				<c:when test="${requests.size()>0}">
				<c:forEach var="i" begin="0" end="${requests.size()-1 < 0 ? 0 : requests.size()-1}" step="1">
					<div id="request"  style="background:#fff;" onclick="read(this)">
						<div id="image">
							<img id="imageSrc" style="width:50px;"src="${pageContext.request.contextPath}${requests[i].conversation.messages[0].sourceImage}">
						</div>
						<div id="email-content">
							<div id="header">
								<input id="request_id" type="hidden" value="${requests[i].id}">
								<input id="conversation_id" type="hidden" value="${requests[i].conversation.id}">
								<input id="title" type="hidden" value="${requests[i].conversation.title}">
								<p id="sender">${requests[i].conversation.messages[0].sourceName}</p>
								<p id="time">${requests[i].conversation.last_updated}</p>
							</div>
							<div id="content">
								<p id="text">${requests[i].conversation.messages[0].content}</p>
							</div>
							<div id="tags">
								<p id="tag">${requests[i].conversation.tags}</p>
								<div id="status"><p>${requests[i].conversation.not_read_count}</p></div>
							</div>
						</div>
					</div>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<p>no more requests</p>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		<div class="email-content">
			<div class="email_content_content">
				<c:choose>
					<c:when test="${requests.size() > 0}">
					<style>
						#no-messages{
							display:none;
						}
					</style>
					</c:when>
					<c:otherwise>
					<style>
						#conversation-content{
							display:none;
						}
					</style>
					</c:otherwise>
				</c:choose>
				<div id="no-messages">
					<img style="width: 140px;" src="${pageContext.request.contextPath}/assets/No_messages.svg">
					<p>No new Messages</p>
				</div>
				<div id="response_done">
					<img style="width:150px;" src="${pageContext.request.contextPath}/assets/response_done.svg">
					<p>Well done</p>
				</div>
				<div id="conversation-content">
				<input id="conversation_id" type="hidden">
				<input id="request_id" type="hidden">
					<div class="email_header">
					<div id="tags">
						<p id="tag">${requests[0].conversation.tags}</p>
					</div>
				</div>
				<div class="email_meta">
					<p id="timer">${requests[0].conversation.messages[0].time}</p>
					<p id="title">${requests[0].conversation.title}</p>
				</div>
				<c:set var="array_size" value="${fn:length(requests[0].conversation.messages)}" />
				<div class="email_replies_list">
				<c:forEach var="i" begin="1" end="${requests[0].conversation.messages.size()-1 < 0 ? 0 : requests[0].conversation.messages.size()-1}" step="1">
						<div class="reply" onclick="expand(this)">
							<div id="reply_source">
								<div id="source_image">
									<img style="width:50px;" src="${pageContext.request.contextPath}${requests[0].conversation.messages[array_size-i].sourceImage}">
								</div>
								<p id="sender">${requests[0].conversation.messages[array_size-i].sourceName}</p>
							</div>
							<div id="text_demo"><p>${requests[0].conversation.messages[array_size-i].content}</p></div>
							<p id="time">${requests[0].conversation.messages[array_size-i].time}</p>
						</div>
				</c:forEach>
					</div>
				
					<div class="main-email-content">
						<div id="main-email-content-header">
							<div id="sender-info">
								<div id="sender-image"><img id="imageSrc" style="width:50px;" src="${pageContext.request.contextPath}${requests[0].conversation.messages[0].sourceImage}"></div>
								<p id="sender-user-name">${requests[0].conversation.messages[0].sourceName}</p>
								<input id="sender-email" type="hidden" value="${requests[0].conversation.messages[0].getSource()}">
							</div>
							<p id="email-time">${requests[0].conversation.messages[0].time}</p>
						</div>
						<div id="main-email-content-text">
							<p id="text">${requests[0].conversation.messages[0].content}</p>
						</div>
					</div>
					<button onclick="reply_message(this)"><img src="${pageContext.request.contextPath}/assets/sent-icon-white.svg"><p>reply</p></button>
				</div>
			</div>
			</div>
		</div>
		</div>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/ServiceClientDashboard.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
<%@include file="/jsp/sendMessage.jsp"%>	
</body>
</html>