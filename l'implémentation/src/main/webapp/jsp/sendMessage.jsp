<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SendMessage.css">
<meta charset="UTF-8">
<title>SendMessage</title>
</head>
<body>
	<div class="send-message-form">
		<div class="Send-message-form-header">
		<p id="header-text">New message</p>
		<div id="cta">
			<div id="minimize">
				<img src="${pageContext.request.contextPath}/assets/angle-down-white.svg">
			</div>
			<div id="close">
				<button>X</button>
			</div>
		</div>
	</div>
	<div class="Send-message-form-content">
		<form>
			<c:choose>
				<c:when test="${user.getType().equals('client')}">
					<input id="destination" type="hidden" name="destination" value="serviceClient@email.com">
					<select name="tag" id="filter">
							<option value="Problem Report">Problem Report</option>
						    <option value="Reclamation">Reclamation</option>
						    <option value="Bug Report">Bug Report</option>
					</select>
				</c:when>
				<c:otherwise>
					<input required="required" id="destination" name="destination" placeholder="destination" type="email">
				</c:otherwise>
			</c:choose>
			<input required="required" id="title" name="title" placeholder="subject" type="text">
			<textarea required="required" name="content" id="content"></textarea>
			<input id="send" type="submit" value="send">
		</form>
	</div>
	</div>
<script src="${pageContext.request.contextPath}/js/SendMessage.js"></script>
</body>
</html>