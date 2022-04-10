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
					<div class="tile" id="inbox"><button><img src="${pageContext.request.contextPath}/assets/inbox-min.svg"><p>inbox</p></button><div id="update"><p>1</p></div></div>
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
							<c:when test="${messages[i].status == 'not read'}">
								<div id="email"  style="background:#fff;">
									<div id="image">
										<img style="width:50px;"src="${pageContext.request.contextPath}${messages[i].sourceImage}">
									</div>
									<div id="email-content">
										<div id="header">
											<p id="title">${messages[i].sourceName}</p>
											<p id="time">${messages[i].time}</p>
										</div>
										<div id="content">
											<p>${messages[i].content}</p>
										</div>
										<div id="tags">
											<p id="tag">${messages[i].tags}</p>
											<div id="status"><p>1</p></div>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div id="email">
									<div id="image">
										<img style="width:50px;"src="${pageContext.request.contextPath}${messages[i].sourceImage}">
									</div>
									<div id="email-content">
										<div id="header">
											<p id="title">${messages[i].sourceName}</p>
											<p id="time">${messages[i].time}</p>
										</div>
										<div id="content">
											<p>${messages[i].content}</p>
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
						<div id="tag"><p>Problem Report</p></div>
					</div>
					<div id="cta">
						<img src="${pageContext.request.contextPath}/assets/delete-icon.svg">
					</div>
				</div>
				<div class="email_meta">
					<div id="timer"><p>Today , 07 June 2022 , 10:00</p></div>
					<div id="title">Problem avec la vehicule</div>
				</div>
				<div class="email_replies_list">
					<div class="reply">
						<div id="reply_source">
							<img style="width:50px;" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
							<p id="sender">You</p>
						</div>
						<div id="text_demo"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dapibus sem nec tellus porta, eget venenatis dui gravida. Mauris ornare aliquet ipsum, ut suscipit ipsum interdum nec. Sed tincidunt euismod diam, non volutpat lorem blandit id. Quisque rutrum nisl et nisi euismod, eu scelerisque sem suscipit. Donec et tortor vel magna euismod ullamcorper. Donec id aliquam nisi. </p></div>
						<p id="time">07 June 2022 , 08:00</p>
					</div>
					<div class="reply active">
						<div id="reply_source">
							<img style="width:50px;" src="${pageContext.request.contextPath}/assets/profile_pics/1email.png">
							<p id="sender">You</p>
						</div>
						<div id="text_demo"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam dapibus sem nec tellus porta, eget venenatis dui gravida. Mauris ornare aliquet ipsum, ut suscipit ipsum interdum nec. Sed tincidunt euismod diam, non volutpat lorem blandit id. Quisque rutrum nisl et nisi euismod, eu scelerisque sem suscipit. Donec et tortor vel magna euismod ullamcorper. Donec id aliquam nisi. </p></div>
						<p id="time">07 June 2022 , 08:00</p>
					</div>
					<button><img src="${pageContext.request.contextPath}/assets/sent-icon-white.svg"><p>reply</p></button>
				</div>
			</div>
	</div>
</div>
	<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>