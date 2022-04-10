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
		<div class="signature">
			<div id="signature_tab_header">
				<p id="title">Signature</p>
				<button onclick="hide()">X</button>
			</div>
			<p id="sec_text">Please sign on the pad below to compete the Booking process</p>
			<p id="terms">* By signing below, you are bound by the terms of the contract set forth by</p>
			<form class="signature_form" action="SaveImg" method="post" >
			<input name="reservationId" type="hidden" value="${reservationId}">
    		<canvas id="can" width="700" height="400" style="border:2px solid;border-radius: 10px;margin-top: 20px;"></canvas>
    		<input id="image" type="hidden" name="signature" value="" >
	        <div id="cta">
	        	<input id="clear" type="button" value="clear" onclick="clearPad()">
	        	<input id="submitBTN" type="submit" value="submit">
	        </div>
    	</form>
    	</div>
    </body>
    <script src="${pageContext.request.contextPath}/js/Signature.js"></script>
    </html>
</html>