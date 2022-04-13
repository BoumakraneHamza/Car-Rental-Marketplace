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
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="header">
		<div id="logo">
			<a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
		</div>
		<div class="user">
		<img id="notification" src="${pageContext.request.contextPath}/assets/notification.svg">
		<img src="${pageContext.request.contextPath}${user.image}">
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
				<div id="add"><button><img style="margin-right: 11px;" src="${pageContext.request.contextPath}/assets/add.svg"><p>New email</p></button></div>
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
					<div class="tile" id="sent"><button><img src="${pageContext.request.contextPath}/assets/sent.svg"><p>Sent Emails</p></button></div>
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
					<c:forEach var="i" begin="0" end="${messages.size()-1 < 0 ? 0 : messages.size()-1}" step="1">
						<c:choose>
							<c:when test="${messages[i].status == 'not read' && messages[i].source != user.email}">
								<div id="email"  style="background:#fff;" onclick="read(this)">
									<div id="image">
										<img id="imageSrc" style="width:50px;"src="${pageContext.request.contextPath}${messages[i].sourceImage}">
									</div>
									<div id="email-content">
										<div id="header">
											<input id="id" type="hidden" value="${messages[i].id}">
											<input id="title" type="hidden" value="${messages[i].title}">
											<p id="sender">${messages[i].sourceName}</p>
											<p id="time">${messages[i].time}</p>
										</div>
										<div id="content">
											<p id="text">${messages[i].content}</p>
										</div>
										<div id="tags">
											<p id="tag">${messages[i].tags}</p>
											<div id="status"><p>1</p></div>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div id="email" onclick="read(this)">
									<div id="image">
										<img id="imageSrc" style="width:50px;"src="${pageContext.request.contextPath}${messages[i].sourceImage}">
									</div>
									<div id="email-content">
										<div id="header">
											<input id="id" type="hidden" value="${messages[i].id}">
											<input id="title" type="hidden" value="${messages[i].title}">
											<p id="sender">${messages[i].sourceName}</p>
											<p id="time">${messages[i].time}</p>
										</div>
										<div id="content">
											<p id="text">${messages[i].content}</p>
										</div>
										<div id="tags">
											<p id="tag">${messages[i].tags}</p>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
			<div class="email-content">
				<div id="no-messages" style="display:none;">
					<img src="${pageContext.request.contextPath}/assets/No_messages.svg">
					<p>No new Messages</p>
				</div>
				<div class="email_header">
					<div id="tags">
						<p id="tag">Problem Report</p>
					</div>
					<div id="cta">
						<img src="${pageContext.request.contextPath}/assets/delete-icon.svg">
					</div>
				</div>
				<div class="email_meta">
					<p id="timer">Today , 07 June 2022 , 10:00</p>
					<p id="title">Problem avec la vehicule</p>
				</div>
				<div class="email_replies_list">
					<div class="reply" onclick="expand(this)">
						<div id="reply_source">
							<img style="width:50px;" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
							<p id="sender">You</p>
						</div>
						<div id="text_demo"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dapibus sem nec tellus porta, eget venenatis dui gravida. Mauris ornare aliquet ipsum, ut suscipit ipsum interdum nec. Sed tincidunt euismod diam, non volutpat lorem blandit id. Quisque rutrum nisl et nisi euismod, eu scelerisque sem suscipit. Donec et tortor vel magna euismod ullamcorper. Donec id aliquam nisi. </p></div>
						<p id="time">07 June 2022 , 08:00</p>
					</div>
				</div>
				<div class="main-email-content">
					<div id="main-email-content-header">
						<div id="sender-info">
							<div id="sender-image"><img id="imageSrc" style="width:50px;" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png"></div>
							<p id="sender-user-name">@Nathanial</p>
						</div>
						<p id="email-time">20-04-2022</p>
					</div>
					<div id="main-email-content-text">
						<p id="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dapibus sem nec tellus porta, eget venenatis dui gravida. Mauris ornare aliquet ipsum, ut suscipit ipsum interdum nec. Sed tincidunt euismod diam, non volutpat lorem blandit id. Quisque rutrum nisl et nisi euismod, eu scelerisque sem suscipit. Donec et tortor vel magna euismod ullamcorper. Donec id aliquam nisi. </p>
					</div>
				</div>
				<button><img src="${pageContext.request.contextPath}/assets/sent-icon-white.svg"><p>reply</p></button>
			</div>
	<%@include file="/jsp/dropdownList.jsp"%>
	<script src="${pageContext.request.contextPath}/js/inbox.js"></script>
</body>
</html>