<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signUp.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkbox.css">
<title>Sign up</title>
</head>
<body>
	<div class="frame">
		<div class="content">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/PageAcueil"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
			</div>
			<div id="login">
				<h3>Join us</h3>
				<div class="line">
				<div id="line"></div>
				<p>Sign up with</p>
				</div>
				<div class="login-btns">
					<button style="margin-right:15px;"><img src="${pageContext.request.contextPath}/assets/Google__logo.svg">Google</button>
					<button><img id="facebook" src="${pageContext.request.contextPath}/assets/facebook.svg">Facebook</button>
				</div>
				<div class="line">
				<div id="line"></div>
				<p>Sign up with email</p>
				</div>
				<form action="SignUp"  method="post">
					<input type="hidden" name="required_action" value="ClientBassicInformations">
					<div class="row" id="email">		
						<div id="field">
							<label for="fname">Email Address:</label><br>
		  					<input required type="email" id="email" name="email" placeholder="Enter your Email"><br>
						</div>		
						
		  			</div>
		  			<div class="row" id="password">
			  			<div id="field">
			  				<label for="lname">Set Password:</label><br>
							<input required type="password" id="password" name="password" placeholder="Enter your password"><br>
			  			</div>
						<div id="field">
			  				<label for="lname">Confirm Password:</label><br>
							<input required type="password" id="password" class="password_confirmation" name="password" placeholder="Enter your password"><br>
			  			</div>
		  			</div>
					<div class="row" id="checkbox">
					<div id="remember"><input required="required" type="checkbox" name="terms"><label for="terms">I’ve read the terms of service and our Privacy Policy </label></div>
					</div>
					<div id="alt"><label>you have an account ?</label><a href="${pageContext.request.contextPath}/Login"> login </a></div>
	  			    <div id="action">
	  			    	<input type="submit" value="Continue">
	  			    	
	  			    </div>
				</form>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>