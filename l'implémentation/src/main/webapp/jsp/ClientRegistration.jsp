<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientRegistration.css">
<title>Sign up 3/3</title>
</head>
<body>
<div class="logo">
	<a href="${pageContext.request.contextPath}/PageAcueil"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
</div>
<input type="hidden" id="email" value="${email}">
<div class="videoPlayer">
	<video style="width:820px" controls></video>
	<p class="counter">5</p>
	<div class="control_btns">
		<button id="btnStart"></button>
		<button id="btnStop"></button>
	</div>
</div>
<form action="Logout" style="display:none;" method="GET" id="Next">
	<button type="submit">Finish</button>
</form>
<script src="${pageContext.request.contextPath}/js/ClientMain.js"></script>
<script src="${pageContext.request.contextPath}/js/ClientRegistration.js"></script>
</body>
</html>