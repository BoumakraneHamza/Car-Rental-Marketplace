<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Inbox</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/inbox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/InboxSystem.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
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
			<button class="search"><a href="${pageContext.request.contextPath}/CarSearch"><img src="${pageContext.request.contextPath}/assets/search-icon.svg"></a></button>
			<button class="dashboard"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></a></button>
			<button class="inbox" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/Inbox"><img src="${pageContext.request.contextPath}/assets/inbox-white.svg"></a></button>
			<button class="payment" ><a href="${pageContext.request.contextPath}/ClientPayment"><img src="${pageContext.request.contextPath}/assets/Wallet.svg"></a></button>
			
		</div>
		<div class="main-frame">
			<div class="Sec-menu">
				<div id="menu_header">
					<p>MailBox</p>
				</div>
				<div id="add" onclick="showMessageField()"><button><img style="margin-right: 11px;" src="${pageContext.request.contextPath}/assets/add.svg"><p>New email</p></button></div>
				<div id="menu_list">
					<div class="tile" id="inbox"><button><img src="${pageContext.request.contextPath}/assets/inbox-min.svg"><p>inbox</p></button>
						<c:choose>
							<c:when test="${counter>0}">
								<div id="update">
									<p>${counter}</p>
								</div>
							</c:when>
						</c:choose>
					</div>
					<div class="tile" id="sent" onclick="getSentMessages()"><button><img src="${pageContext.request.contextPath}/assets/sent.svg"><p>Sent Emails</p></button>
						<div id="update" style="display:none;">
						</div>
					</div>
					<div class="tile" id="draft"><button><img src="${pageContext.request.contextPath}/assets/draft-icon.svg"><p>Draft</p></button></div>
				</div>
			</div>
			<div class="inbox">
				<div class="search">
					<div id="searchBar">
						<img src="${pageContext.request.contextPath}/assets/search-icon.svg">
						<input type="text" placeholder="Search">
					</div>
				</div>
				<div class="inbox-list">
				<c:choose>
					<c:when test="${conversation.size()>0}">
					<c:forEach var="i" begin="0" end="${conversation.size()-1 < 0 ? 0 : conversation.size()-1}" step="1">
						<c:choose>
								<c:when test="${conversation[i].not_read_count > 0 }">
									<div id="email"  style="background:#fff;" onclick="read(this)">
										<div id="image">
											<img id="imageSrc" style="width:50px;"src="${pageContext.request.contextPath}${conversation[i].messages[conversation[i].messages.size()-1].sourceImage}">
										</div>
										<div id="email-content">
											<div id="header">
												<input id="id" type="hidden" value="${conversation[i].id}">
												<input id="title" type="hidden" value="${conversation[i].title}">
												<p id="sender">${conversation[i].messages[conversation[i].messages.size()-1].sourceName}</p>
												<p id="time">${conversation[i].last_updated}</p>
											</div>
											<div id="content">
												<p id="text">${conversation[i].messages[conversation[i].messages.size()-1].content}</p>
											</div>
											<div id="tags">
												<p id="tag">${conversation[i].tags}</p>
												<div id="status"><p>${conversation[i].not_read_count}</p></div>
											</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div id="email" onclick="read(this)">
										<div id="image">
											<img id="imageSrc" style="width:50px;"src="${pageContext.request.contextPath}${conversation[i].messages[conversation[i].messages.size()-1].sourceImage}">
										</div>
										<div id="email-content">
											<div id="header">
												<input id="id" type="hidden" value="${conversation[i].id}">
												<input id="title" type="hidden" value="${conversation[i].title}">
												<p id="sender">${conversation[i].messages[conversation[i].messages.size()-1].sourceName}</p>
												<p id="time">${conversation[i].last_updated}</p>
											</div>
											<div id="content">
												<p id="text">${conversation[i].messages[conversation[i].messages.size()-1].content}</p>
											</div>
											<div id="tags">
												<p id="tag">${conversation[i].tags}</p>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<p>No messages</p>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div class="email-content">
			<c:choose>
				<c:when test="${counter>0}">
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
				<img src="${pageContext.request.contextPath}/assets/No_messages.svg">
				<p>No new Messages</p>
			</div>
			<div id="conversation-content">
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
			<c:forEach var="i" begin="0" end="${conversation[0].messages.size()-2 < 0 ? 0 : conversation[0].messages.size()-2}" step="1">
					<div class="reply" onclick="expand(this)">
						<div id="reply_source">
							<div id="source_image">
								<img style="width:50px;" src="${pageContext.request.contextPath}${conversation[0].messages[i].sourceImage}">
							</div>
							<p id="sender">${conversation[0].messages[i].sourceName}</p>
						</div>
						<div id="text_demo"><p>${conversation[0].messages[i].content}</p></div>
						<p id="time">${conversation[0].messages[i].time}</p>
					</div>
			</c:forEach>
				</div>
			
				<div class="main-email-content">
					<div id="main-email-content-header">
						<div id="sender-info">
							<div id="sender-image"><img id="imageSrc" style="width:50px;" src="${pageContext.request.contextPath}${conversation[0].messages[conversation[0].messages.size()-1].sourceImage}"></div>
							<p id="sender-user-name">${conversation[0].messages[messages.size()-1].sourceName}</p>
						</div>
						<p id="email-time">${conversation[0].messages[conversation[0].messages.size()-1].time}</p>
					</div>
					<div id="main-email-content-text">
						<p id="text">${conversation[0].messages[conversation[0].messages.size()-1].content}</p>
					</div>
				</div>
				<button onclick="reply_message(this)"><img src="${pageContext.request.contextPath}/assets/sent-icon-white.svg"><p>reply</p></button>
			</div>
		</div>
	<script src="${pageContext.request.contextPath}/js/inbox.js"></script>
	<%@include file="/jsp/dropdownList.jsp"%>
	<%@include file="/jsp/sendMessage.jsp"%>
</body>
</html>