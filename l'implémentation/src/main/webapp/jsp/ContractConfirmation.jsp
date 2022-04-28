<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ContractConfirmation.css">
<title>Contract Confirmation</title>
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
			<button class="search" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/CarSearch"><img src="${pageContext.request.contextPath}/assets/search-icon-white.svg"></a></button>
			<button class="dashboard"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></a></button>
			<button class="inbox"><a href="${pageContext.request.contextPath}/Inbox"><img src="${pageContext.request.contextPath}/assets/inbox.svg"></a></button>
			<button class="payment"><a href="${pageContext.request.contextPath}/ClientPayment"><img src="${pageContext.request.contextPath}/assets/Wallet.svg"></a></button>
		</div>
		<div class="main-frame">
		 <div class="sec-header">
		 	<div id="step">
		 	<p style="font-size: 12px;margin: 0px;font-weight: 600; color: #C4C4C4;">Step 03</p>
		 	<h3 style="margin: 0px;font-size: 16px;font-weight: 600;">Contract Confirmation</h3>
		 	</div>
		 </div>
		<div class="contract">
			<div class="view">
				<div id="view_option">
					<p>Booking Contract</p>
					<img src="${pageContext.request.contextPath}/assets/download.svg">
				</div>
				<iframe src="${pageContext.request.contextPath}/contractView?reservationId=${reservationId}#toolbar=0&view=fith" style="width:670px; height:570px;" frameborder="0"></iframe>
			</div>
			<div class="cta">
				<div class="action" id="confirm" onclick="show()">
					<p id="main_text">Confirm Contract</p>
					<p id="sec_text">By confirming this contract you and the company are obligated by the terms specified on this document</p>
				</div>
				<div class="action" id="report">
					<p id="main_text">Report a problem</p>
					<p id="sec_text">By confirming this contract you and the company are obligated by the terms specified on this document</p>
				</div>
			</div>
		</div>
		</div>
</div>
<%@include file="/jsp/Signature.jsp"%>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>