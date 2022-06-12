<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkbox.css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://unpkg.com/jwt-decode/build/jwt-decode.js"></script>
<title>login</title>
</head>
<body>
	<div class="frame">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/PageAcueil"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
			</div>
			<div class="content">
			<div id="login">
				<h3>Welcome Back !</h3>
				<h5>Please login to your account </h5>
				<div class="line">
				<div id="line"></div>
				<p>login with</p>
				</div>
				<div class="login-btns">
					<script src="https://accounts.google.com/gsi/client" async defer></script>
				    <div id="g_id_onload"
				         data-client_id="106464428031-pbhd3l5gbcgedmjei3rl7t01v0b4jovl.apps.googleusercontent.com"
				         data-callback="handleCredentialResponse">
				    </div>
				    <div class="g_id_signin" data-type="standard"></div>
				</div>
				<div class="line">
				<div id="line"></div>
				<p>login with email</p>
				</div>
			<form action="${pageContext.request.contextPath}/Login"  method="post">
				<div class="row" id="email">				
					<label for="fname">Email Address:</label><br>
	  				<input type="email" id="email" name="email" placeholder="Enter your Email"><br>
	  			</div>
	  			<div class="row" id="password">
		  			<label for="lname">Password:</label><br>
					<input type="password" id="password" name="password" placeholder="Enter your password"><br>
	  			</div>
				<div class="row" id="checkbox">
				<div id="remember"><input type="checkbox"><label>Remember account</label></div>
				
				<p>forget password ?</p>
				</div>
  			    <div id="action">
  			    	<input type="submit" value="login">
  			    	<a href="${pageContext.request.contextPath}/SignUp"><button type="button">Create account</button></a>
  			    	
  			    </div>
			</form>
			</div>
		</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>