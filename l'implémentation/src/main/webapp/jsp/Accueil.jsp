<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Accueil.css">
<meta charset="UTF-8">
<title>Unique</title>
</head>
<body>
<div class="main-frame" id="frame">
	<div class="header">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/assets/Logo.svg">
			<h3>Unique</h3>		
		</div>
		<div id="navbar">
			<a style="color:#B8B08D" href="${pageContext.request.contextPath}/SignUp">join us</a>
			<a href="${pageContext.request.contextPath}/Login">login</a>
		</div>
	</div>
	<div class ="content">
		<div id="text">
			<h1>Never Miss An Apportunity<br> 
			with RENTiGo</h1>
			<p>RENTiGo Provides you with
			The Right Vehicule<br> for every 
			Advanture </p>
		</div>
		<div id="image">
			<img src="${pageContext.request.contextPath}/assets/car1.png">
		</div>
	</div>
	<div class="search">
	<form action="CarSearch" method="post">
		<div class="inputs">
			<div class="search-field" id="location">
				<p>Location</p>
				<input type="text" name="location" placeholder="location">
			</div>
			<div class="search-field" id="pick-date">
				<p>pick-up date</p>
				<input type="text" name="pickUp_date" placeholder="pick-up date">
			</div>
			<div class="search-field" id="return-date">
				<p>return date</p>
				<input type="text" name="return_date" placeholder="return date">
			</div>
			<div id="search_btn">
				<input type="submit" value="search">
			</div>
		</div>
	</form>
	</div>
</div>
<div class="cards" id="frame">
	<div class="title">
		<h3>How it works</h3>
		<div id="subtitle">
		<p>RENTiGo works in 3 simple steps</p>
		</div>
	</div>
	<div class="content">
		<div id="card">
			<div id="icon">
			<img src="${pageContext.request.contextPath}/assets/map-marker-alt-solid 2.svg">
			</div>
			<div id="title">
			<h3>Choose a location</h3></div>
			<div id="subtitle">
				<p>
					Booking Your Vehicule 
					with RentiGo Is a 
					FrictionLess Experience
					that takes minutes  
				</p>
			</div>
		</div>
		<div id="line-top"></div>
		<div id="middleCard">
			<div id="icon">
			<img src="${pageContext.request.contextPath}/assets/calendar-check-solid 1.svg">
			</div>
			<div id="title">
			<h3>pick a date</h3>
			</div>
			<div id="subtitle">
			<p>
				RentiGo Provides you 
				a Vehicule Whenever
				you want any time
				any date
			</p>
			</div>
		</div>
		<div id="line-bottom"></div>
		<div id="card">
			<div id="icon">
			<img src="${pageContext.request.contextPath}/assets/clipboard-check-solid 1.svg">
			</div>
			<div id="title">
			<h3>book your vehicule</h3>
			</div>
			<div id="subtitle">
			<p>
				With RentiGo Rent 
				a vehicule From
				more than 3.000 
				locations around 
				the world
			</p>
			</div>
		</div>
	</div>
</div>
<div class="features" id="frame">
	<div class="feature">
	<div class="image">
	<img src="${pageContext.request.contextPath}/assets/car2.png">
	</div>
	<div class="description">
		<div id="title1">Best Service</div>
		<div id="title2">Feel the Best Experience<br> with our Rental Deals</div>
		<div id="Service1">
		<div id="title">
		<img id="icon" src="${pageContext.request.contextPath}/assets/best car icon.svg">
		<h3>Best tool for every opportunity</h3>
		</div>
		<div id="subtitle">
			<h5>in RentiGo we provide you the mean to take
				advantage <br>of every opportunity 
			</h5>
		</div>
		</div>
		<div id="Service2">
		<div id="title">
		<img id="icon" src="${pageContext.request.contextPath}/assets/Price icon.svg">
		<h3>Best Price guaranteed</h3>
		</div>
		<div id="subtitle">
			<h5>RentiGo provides you the best price as a guarantee <br>
				find a better price and we will pay you the diffrence
			</h5>
		</div>
		</div>
		<div id="Service3">
		<div id="title">
		<img id="icon" src="${pageContext.request.contextPath}/assets/support icon.svg">
		<h3>Support 24 / 7</h3>
		</div>
		<div id="subtitle">
		<h5>with RentiGo your satisfaction is our priority <br> we provide 
		you 24 / 7 support with Premium Experience </h5>
		</div>
		</div>
	</div>
	</div>
</div>
<div class="Reviews" id="frame">
	<div class="titles">
	<h3>Reviews</h3>
	<h3>Our Valuable Customers says</h3>
	</div>
	<div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
        <div id="title">
        	<div id="user">
        		<img src="${pageContext.request.contextPath}/assets/user01.png" width="40px">
        		<p style="margin-left:10px">Nathanial Olson</p>
        	</div>
        	<img alt="Quotes" src="${pageContext.request.contextPath}/assets/Quotes.svg">
        </div>
        <div id="content">
        <p>Easy, convenient experience.
			Recommend!</p>
        </div>
        </div>
        <div class="swiper-slide">
        <div id="title">
        	<div id="user">
        		<img src="${pageContext.request.contextPath}/assets/user01.png" width="40px">
        		<p style="margin-left:10px">Nathanial Olson</p>
        	</div>
        	<img alt="Quotes" src="${pageContext.request.contextPath}/assets/Quotes.svg">
        </div>
        <div id="content">
        <p>Easy, convenient experience.
			Recommend!</p>
        </div>
        </div>
        <div class="swiper-slide">
        <div id="title">
        	<div id="user">
        		<img src="${pageContext.request.contextPath}/assets/user01.png" width="40px">
        		<p style="margin-left:10px">Nathanial Olson</p>
        	</div>
        	<img alt="Quotes" src="${pageContext.request.contextPath}/assets/Quotes.svg">
        </div>
        <div id="content">
        <p>Easy, convenient experience.
			Recommend!</p>
        </div>
        </div>
        <div class="swiper-slide">
        <div id="title">
        	<div id="user">
        		<img src="${pageContext.request.contextPath}/assets/user01.png" width="40px">
        		<p style="margin-left:10px">Nathanial Olson</p>
        	</div>
        	<img alt="Quotes" src="${pageContext.request.contextPath}/assets/Quotes.svg">
        </div>
        <div id="content">
        <p>Easy, convenient experience.
			Recommend!</p>
        </div>
        </div>
        <div class="swiper-slide">
        <div id="title">
        	<div id="user">
        		<img src="${pageContext.request.contextPath}/assets/user01.png" width="40px">
        		<p style="margin-left:10px">Nathanial Olson</p>
        	</div>
        	<img alt="Quotes" src="${pageContext.request.contextPath}/assets/Quotes.svg">
        </div>
        <div id="content">
        <p>Easy, convenient experience.
			Recommend!</p>
        </div>
        </div>
        <div class="swiper-slide">
        <div id="title">
        	<div id="user">
        		<img src="${pageContext.request.contextPath}/assets/user01.png" width="40px">
        		<p style="margin-left:10px">Nathanial Olson</p>
        	</div>
        	<img alt="Quotes" src="${pageContext.request.contextPath}/assets/Quotes.svg">
        </div>
        <div id="content">
        <p>Easy, convenient experience.
			Recommend!</p>
        </div>
        </div>
      </div>
     
    </div>
</div>
<div class="links">
	<div class="col-1">
	<h3>Our Products</h3>
		<ul><a>Cars</a></ul>
		<ul><a>Motocycles</a></ul>
		<ul><a>Pricelines</a></ul>
	</div>
	<div class="col-2">
	<h3>About RentiGo</h3>
		<ul><a>Our story</a></ul>
		<ul><a>About Us</a></ul>
		<ul><a>Press Center</a></ul>
		<ul><a>Advertise</a></ul>
	</div>
	<div class="col-3">
	<h3>Ressources</h3>
		<ul><a>Help Center</a></ul>
		<ul><a>Downloads</a></ul>
		<ul><a>Join Our Network</a></ul>
		<ul><a>New Offers</a></ul>
	</div>
	<div class="col-4">
	<h3>Newsletters</h3>
		<input id="Newsletter" type="text"/>
	</div>
</div>
<div class="footer">
	<img  src="${pageContext.request.contextPath}/assets/logoBlack.svg"/>
	<p>Copyright © 2022-2023 RentiGo.com. All rights reserved. | Privacy Policy | Terms and Conditions</p>
</div>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/Accueil.js"></script>
</body>
</html>