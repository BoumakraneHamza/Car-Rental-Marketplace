<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signature</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Signature.css">
</head>
<body onload="init()">
	<div class="signature" style="visibility:hidden">
		<div id="tab_header">
			<p>Signature</p>
			<img onclick="hide()" style="width: 15px;cursor: pointer;" src="${pageContext.request.contextPath}/assets/cancel.svg">
		</div>
		<div id="tabs">
			<div class="tab active" onclick="selectTab(this)">Draw</div>
			<div class="tab" onclick="selectTab(this)">Upload</div>
		</div>
		<form class="signature_content" action="SaveImg" method="post">
			<div class="signature_form">
				<input name="reservationId" type="hidden" value="${reservationId}">
		   		<canvas id="can" width="600px" height="400" style="background:#eee"></canvas>
		   		<input id="image" type="hidden" name="signature" value="" >
	  		</div>
	  		<div class="upload_form">
	  			<input id="image" type="file" id="signature">
	  		</div>
	  		<div id="cta">
	   			<button id="cancel">Cancel</button>
	   			<button type="submit" id="accept">Accept and sign</button>
   			</div>
		</form>
   	</div>
</body>
<script src="${pageContext.request.contextPath}/js/Signature.js"></script>
</html>