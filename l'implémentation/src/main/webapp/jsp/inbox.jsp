<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
			<a href="${pageContext.request.contextPath}/PageAcueil"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
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
			<button class="exit" ><a href="${pageContext.request.contextPath}/Logout"><img src="${pageContext.request.contextPath}/assets/exit-icon.svg"></a></button>
			
		</div>
		<div class="main-frame">
			<div class="Sec-menu">
				<div id="add"><button><img src="${pageContext.request.contextPath}/assets/add.svg"><p>New email</p></button></div>
				<div id="inbox"><button><img src="${pageContext.request.contextPath}/assets/inbox-min.svg"><p>inbox</p></button></div>
				<div id="sent"><button><img src="${pageContext.request.contextPath}/assets/sent.svg"><p>Sent Message</p></button></div>
			</div>
			<div class="inbox">
				<div class="search">
					<div id="searchBar">
						<img src="${pageContext.request.contextPath}/assets/search-icon.svg">
						<input type="text" placeholder="Search">
					</div>
				</div>
				<div class="inbox-list">
					<div id="email">
						<div id="image">
							<img src="${pageContext.request.contextPath}/assets/customer-service-email.svg">
						</div>
						<div id="email-content">
							<div id="header">
								<p id="title">Customer Service</p>
								<p id="time">10:00 PM</p>
							</div>
							<div id="content">
								<p>Hi , there Nathanial Thank you for you message . 
								we have recieved  your Problem report ...</p>
							</div>
							<div id="tags">
								<p>Problem report</p>
							</div>
						</div>
					</div>
					<div id="email">
						<div id="image">
							<img src="${pageContext.request.contextPath}/assets/customer-service-email.svg">
						</div>
						<div id="email-content">
							<div id="header">
								<p id="title">Customer Service</p>
								<p id="time">10:00 PM</p>
							</div>
							<div id="content">
								<p>Hi , there Nathanial Thank you for you message . 
								we have recieved  your Problem report ...</p>
							</div>
							<div id="tags">
								<p>Problem report</p>
							</div>
						</div>
					</div>
					<div id="email">
						<div id="image">
							<img src="${pageContext.request.contextPath}/assets/customer-service-email.svg">
						</div>
						<div id="email-content">
							<div id="header">
								<p id="title">Customer Service</p>
								<p id="time">10:00 PM</p>
							</div>
							<div id="content">
								<p>Hi , there Nathanial Thank you for you message . 
								we have recieved  your Problem report ...</p>
							</div>
							<div id="tags">
								<p>Problem report</p>
							</div>
						</div>
					</div>
					<div id="email">
						<div id="image">
							<img src="${pageContext.request.contextPath}/assets/customer-service-email.svg">
						</div>
						<div id="email-content">
							<div id="header">
								<p id="title">Customer Service</p>
								<p id="time">10:00 PM</p>
							</div>
							<div id="content">
								<p>Hi , there Nathanial Thank you for you message . 
								we have recieved  your Problem report ...</p>
							</div>
							<div id="tags">
								<p>Problem report</p>
							</div>
						</div>
					</div>
					<div id="email">
						<div id="image">
							<img src="${pageContext.request.contextPath}/assets/customer-service-email.svg">
						</div>
						<div id="email-content">
							<div id="header">
								<p id="title">Customer Service</p>
								<p id="time">10:00 PM</p>
							</div>
							<div id="content">
								<p>Hi , there Nathanial Thank you for you message . 
								we have recieved  your Problem report ...</p>
							</div>
							<div id="tags">
								<p>Problem report</p>
							</div>
						</div>
					</div>
					<div id="email">
						<div id="image">
							<img src="${pageContext.request.contextPath}/assets/customer-service-email.svg">
						</div>
						<div id="email-content">
							<div id="header">
								<p id="title">Customer Service</p>
								<p id="time">10:00 PM</p>
							</div>
							<div id="content">
								<p>Hi , there Nathanial Thank you for you message . 
								we have recieved  your Problem report ...</p>
							</div>
							<div id="tags">
								<p>Problem report</p>
							</div>
						</div>
					</div>
					<div id="email">
						<div id="image">
							<img src="${pageContext.request.contextPath}/assets/customer-service-email.svg">
						</div>
						<div id="email-content">
							<div id="header">
								<p id="title">Customer Service</p>
								<p id="time">10:00 PM</p>
							</div>
							<div id="content">
								<p>Hi , there Nathanial Thank you for you message . 
								we have recieved  your Problem report ...</p>
							</div>
							<div id="tags">
								<p>Problem report</p>
							</div>
						</div>
					</div>
					<div id="email">
						<div id="image">
							<img src="${pageContext.request.contextPath}/assets/customer-service-email.svg">
						</div>
						<div id="email-content">
							<div id="header">
								<p id="title">Customer Service</p>
								<p id="time">10:00 PM</p>
							</div>
							<div id="content">
								<p>Hi , there Nathanial Thank you for you message . 
								we have recieved  your Problem report ...</p>
							</div>
							<div id="tags">
								<p>Problem report</p>
							</div>
						</div>
					</div>
					<div id="email">
						<div id="image">
							<img src="${pageContext.request.contextPath}/assets/customer-service-email.svg">
						</div>
						<div id="email-content">
							<div id="header">
								<p id="title">Customer Service</p>
								<p id="time">10:00 PM</p>
							</div>
							<div id="content">
								<p>Hi , there Nathanial Thank you for you message . 
								we have recieved  your Problem report ...</p>
							</div>
							<div id="tags">
								<p>Problem report</p>
							</div>
						</div>
					</div>
					<div id="email">
						<div id="image">
							<img src="${pageContext.request.contextPath}/assets/customer-service-email.svg">
						</div>
						<div id="email-content">
							<div id="header">
								<p id="title">Customer Service</p>
								<p id="time">10:00 PM</p>
							</div>
							<div id="content">
								<p>Hi , there Nathanial Thank you for you message . 
								we have recieved  your Problem report ...</p>
							</div>
							<div id="tags">
								<p>Problem report</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="email-content">
				<div id="no-messages">
					<img src="${pageContext.request.contextPath}/assets/No_messages.svg">
					<p>No new Messages</p>
				</div>
			</div>
	</div>
</div>

</body>
</html>