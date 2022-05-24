<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ContractConfirmation.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script> 
<title>Contract Confirmation</title>
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
		<div class="main-frame">
		 <div class="step_slider">
			<div class="Progressline">
				<div class="checkpoint">
					<div class="point active"></div>
					<p>Payment</p>
				</div>
				<div class="checkpoint">
					<div class="point active"></div>
					<p>Identity verification</p>
				</div>
				<div class="checkpoint">
					<div class="point active"></div>
					<p>Contract Confirmation</p>
				</div>
				<div class="checkpoint">
					<div class="point"></div>
					<p>Signature</p>
				</div>
			</div>
		</div>
		<div class="contract">
			<div class="view">
				<div id="view_option">
					<p>Booking Contract</p>
					<img src="${pageContext.request.contextPath}/assets/download.svg">
				</div>
				<embed src="${pageContext.request.contextPath}/ContractView?reservationId=${reservation.id}&embedded=true" style="width:670px; height: calc(100% - 45px);"></embed>
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
<script src="${pageContext.request.contextPath}/js/ContractConfirmation.js"></script>
<%@include file="/jsp/Signature.jsp"%>
<%@include file="/jsp/dropdownList.jsp"%>
</body>
</html>