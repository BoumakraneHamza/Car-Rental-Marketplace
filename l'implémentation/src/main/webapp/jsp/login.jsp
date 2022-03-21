<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<title>login</title>
</head>
<body>
	<div class="frame">
			<div class="content">
			<div class="logo">
				<img src="${pageContext.request.contextPath}/assets/logoBlack.svg">
			</div>
			<div id="login">
				<h3>Welcome Back !</h3>
				<h5>Please login to your account </h5>
				<div class="line">
				<div id="line"></div>
				<p>login with</p>
				</div>
				<div class="login-btns">
					<button style="margin-right:15px;"><img src="${pageContext.request.contextPath}/assets/Google__logo.svg">Google</button>
					<button><img id="facebook" src="${pageContext.request.contextPath}/assets/facebook.svg">Facebook</button>
				</div>
				<div class="line">
				<div id="line"></div>
				<p>login with email</p>
				</div>
			<form action="">
				<div class="row" id="email">				
					<label for="fname">Email Address:</label><br>
	  				<input type="text" id="email" name="email" placeholder="Enter your Email"><br>
	  			</div>
	  			<div class="row" id="password">
		  			<label for="lname">Password:</label><br>
					<input type="text" id="password" name="password" placeholder="Enter your password"><br>
	  			</div>
				<div class="row" id="checkbox">
				<div id="remember"><input type="checkbox"><label>Remember account</label></div>
				
				<p>forget password ?</p>
				</div>
  			    <div id="action">
  			    	<input type="submit" value="login">
  			    	<button>Create account</button>
  			    </div>
			</form>
			</div>
		</div>
		<div class="image">
		</div>
	</div>
</body>
</html>