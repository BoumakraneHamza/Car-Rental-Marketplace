<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ServiceClientDashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/InboxSystem.css">
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
								<input id="id" type="hidden" value="${requests[i].conversation.id}">
								<input id="title" type="hidden" value="">
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
		<div id="conversation-content" style="display:block">
			<input id="conversation_id" type="hidden">
			<div class="email_header">
				<div id="tags">
					<p id="tag">${conversation[0].tags}</p>
				</div>
				<div id="cta">
					<img src="${pageContext.request.contextPath}/assets/delete-icon.svg">
				</div>
			</div>
			<div class="email_meta">
					<p id="timer">${conversation[0].messages[0].time}</p>
					<p id="title">${conversation[0].title}</</p>
			</div>
			<div class="email_replies_list">
			<input type="hidden" value="${requests[0].conversation.messages.size()-2}">
			<c:forEach items="${requests[0].conversation.messages}" begin="1" var="message">
					<div class="reply" onclick="expand(this)">
						<div id="reply_source">
							<div id="source_image">
								<img style="width:50px;" src="${pageContext.request.contextPath}${message.sourceImage}">
							</div>
							<p id="sender">${message.sourceName}</p>
						</div>
						<div id="text_demo"><p>${message.content}</p></div>
						<p id="time">${message.time}</p>
					</div>
			</c:forEach>
				</div>
			
				<div class="main-email-content">
					<div id="main-email-content-header">
						<div id="sender-info">
							<div id="sender-image"><img id="imageSrc" style="width:50px;" src="${pageContext.request.contextPath}${requests[0].conversation.messages[0].sourceImage}"></div>
							<p id="sender-user-name">${requests[0].conversation.messages[0].sourceName}</p>
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
	<script src="${pageContext.request.contextPath}/js/ServiceClientDashboard.js"></script>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>