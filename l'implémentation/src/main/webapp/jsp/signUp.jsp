<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signUp.css">
<title>login</title>
</head>
<body>
	<div class="frame">
			<div class="content">
			<div id="login">
				<h3>login</h3>
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
				<input type="checkbox"><label>Remember account</label><br>
				</div>
  			    <input type="submit" value="login">
			</form>
			<p>or</p>
			<button><img src="${pageContext.request.contextPath}/assets/Google__logo.svg">login with Google</button>
			</div>
		</div>
		<div class="image">
			<img src="${pageContext.request.contextPath}/assets/Frame 1.svg">
		</div>
	</div>
</body>
</html>