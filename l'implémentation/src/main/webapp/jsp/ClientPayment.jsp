<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bills</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientPayment.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
</head>
<body>
<div class="header">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/assets/logoBlack.svg">
		</div>
		<div class="user">
		<img id="notification" src="${pageContext.request.contextPath}/assets/notification.svg">
		<img src="${pageContext.request.contextPath}/assets/user01.png">
			<div id="user-info">
				<p id="full-name">Nathanial Olson</p>
				<p id="user-name">@Olson2022</p>
			</div>
			<div id="dropdownlist">
				<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
			</div>
			
		</div>
	</div>
<div class="content">
		<div class="menu">
			<button class="search"><img src="${pageContext.request.contextPath}/assets/search-icon.svg"></button>
			<button class="dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></button>
			<button class="inbox"><img src="${pageContext.request.contextPath}/assets/inbox.svg"></button>
			<button class="payment" style="background: #F6AA1C;"><img src="${pageContext.request.contextPath}/assets/Wallet-white.svg"></button>
			<button class="exit"><img src="${pageContext.request.contextPath}/assets/exit-icon.svg"></button>
		</div>
		<div class="main-frame">
			<div class="payment-content">
				<div id="payment_details">
					<div id="title"><h4>Payment details</h4></div>
					<div id="card">
						<div id="ClientName">Nathanial Olson</div>
						<div id="Card-Number">9879 2041 7230 1275</div>
						<div id="exp">08/22</div>		
					</div>
				</div>
				<div id="payment_history">
					<div id="title"><h4>Payment History</h4></div>
					<div id="table_header">
						<p>Amount</p>
						<p>Car</p>
						<p>Agency</p>
						<p>Date</p>
						<p>Method</p>
					</div>
					<div class="scroll">
					<div id=table_content>
						<div id="full">
							<div class="transaction">
								<p>$130</p>
								<p>Mini Cooper S</p>
								<p>Agence De constantine</p>
								<p>07 June 2022</p>
								<div class="more" onclick="show_details(this)"><p>Card 7938</p><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></div>
							</div>
							<div class="details">
								<div id="bill">
									<h4>Bill</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
								</div>
								<div id="info">
									<div id="field">
										<h4>Status</h4>
										<p>Completed</p>
									</div>
									<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
									</div>
									<div id="field">
										<h4>Payment ID</h4>
										<p>01231231</p>
									</div>
									<div id="field">
										<h4>Date Paid</h4>
										<p>07 June 2022</p>
									</div>
								</div>
								<div id="amount">
									<h4>Amount Due</h4>
									<p>$130</p>
								</div>
							</div>
						</div>
						<div id="full">
							<div class="transaction">
								<p>$130</p>
								<p>Mini Cooper S</p>
								<p>Agence De constantine</p>
								<p>07 June 2022</p>
								<div class="more" onclick="show_details(this)"><p>Card 7938</p><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></div>
							</div>
							<div class="details">
								<div id="bill">
									<h4>Bill</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
								</div>
								<div id="info">
									<div id="field">
										<h4>Status</h4>
										<p>Completed</p>
									</div>
									<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
									</div>
									<div id="field">
										<h4>Payment ID</h4>
										<p>01231231</p>
									</div>
									<div id="field">
										<h4>Date Paid</h4>
										<p>07 June 2022</p>
									</div>
								</div>
								<div id="amount">
									<h4>Amount Due</h4>
									<p>$130</p>
								</div>
							</div>
						</div>
						<div id="full">
							<div class="transaction">
								<p>$130</p>
								<p>Mini Cooper S</p>
								<p>Agence De constantine</p>
								<p>07 June 2022</p>
								<div class="more" onclick="show_details(this)"><p>Card 7938</p><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></div>
							</div>
							<div class="details">
								<div id="bill">
									<h4>Bill</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
								</div>
								<div id="info">
									<div id="field">
										<h4>Status</h4>
										<p>Completed</p>
									</div>
									<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
									</div>
									<div id="field">
										<h4>Payment ID</h4>
										<p>01231231</p>
									</div>
									<div id="field">
										<h4>Date Paid</h4>
										<p>07 June 2022</p>
									</div>
								</div>
								<div id="amount">
									<h4>Amount Due</h4>
									<p>$130</p>
								</div>
							</div>
						</div>
						<div id="full">
							<div class="transaction">
								<p>$130</p>
								<p>Mini Cooper S</p>
								<p>Agence De constantine</p>
								<p>07 June 2022</p>
								<div class="more" onclick="show_details(this)"><p>Card 7938</p><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></div>
							</div>
							<div class="details">
								<div id="bill">
									<h4>Bill</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
								</div>
								<div id="info">
									<div id="field">
										<h4>Status</h4>
										<p>Completed</p>
									</div>
									<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
									</div>
									<div id="field">
										<h4>Payment ID</h4>
										<p>01231231</p>
									</div>
									<div id="field">
										<h4>Date Paid</h4>
										<p>07 June 2022</p>
									</div>
								</div>
								<div id="amount">
									<h4>Amount Due</h4>
									<p>$130</p>
								</div>
							</div>
						</div>
						<div id="full">
							<div class="transaction">
								<p>$130</p>
								<p>Mini Cooper S</p>
								<p>Agence De constantine</p>
								<p>07 June 2022</p>
								<div class="more" onclick="show_details(this)"><p>Card 7938</p><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></div>
							</div>
							<div class="details">
								<div id="bill">
									<h4>Bill</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
								</div>
								<div id="info">
									<div id="field">
										<h4>Status</h4>
										<p>Completed</p>
									</div>
									<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
									</div>
									<div id="field">
										<h4>Payment ID</h4>
										<p>01231231</p>
									</div>
									<div id="field">
										<h4>Date Paid</h4>
										<p>07 June 2022</p>
									</div>
								</div>
								<div id="amount">
									<h4>Amount Due</h4>
									<p>$130</p>
								</div>
							</div>
						</div>
						<div id="full">
							<div class="transaction">
								<p>$130</p>
								<p>Mini Cooper S</p>
								<p>Agence De constantine</p>
								<p>07 June 2022</p>
								<div class="more" onclick="show_details(this)"><p>Card 7938</p><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></div>
							</div>
							<div class="details">
								<div id="bill">
									<h4>Bill</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
								</div>
								<div id="info">
									<div id="field">
										<h4>Status</h4>
										<p>Completed</p>
									</div>
									<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
									</div>
									<div id="field">
										<h4>Payment ID</h4>
										<p>01231231</p>
									</div>
									<div id="field">
										<h4>Date Paid</h4>
										<p>07 June 2022</p>
									</div>
								</div>
								<div id="amount">
									<h4>Amount Due</h4>
									<p>$130</p>
								</div>
							</div>
						</div>
						<div id="full">
							<div class="transaction">
								<p>$130</p>
								<p>Mini Cooper S</p>
								<p>Agence De constantine</p>
								<p>07 June 2022</p>
								<div class="more" onclick="show_details(this)"><p>Card 7938</p><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></div>
							</div>
							<div class="details">
								<div id="bill">
									<h4>Bill</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
								</div>
								<div id="info">
									<div id="field">
										<h4>Status</h4>
										<p>Completed</p>
									</div>
									<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
									</div>
									<div id="field">
										<h4>Payment ID</h4>
										<p>01231231</p>
									</div>
									<div id="field">
										<h4>Date Paid</h4>
										<p>07 June 2022</p>
									</div>
								</div>
								<div id="amount">
									<h4>Amount Due</h4>
									<p>$130</p>
								</div>
							</div>
						</div>
						<div id="full">
							<div class="transaction">
								<p>$130</p>
								<p>Mini Cooper S</p>
								<p>Agence De constantine</p>
								<p>07 June 2022</p>
								<div class="more" onclick="show_details(this)"><p>Card 7938</p><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></div>
							</div>
							<div class="details">
								<div id="bill">
									<h4>Bill</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
								</div>
								<div id="info">
									<div id="field">
										<h4>Status</h4>
										<p>Completed</p>
									</div>
									<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
									</div>
									<div id="field">
										<h4>Payment ID</h4>
										<p>01231231</p>
									</div>
									<div id="field">
										<h4>Date Paid</h4>
										<p>07 June 2022</p>
									</div>
								</div>
								<div id="amount">
									<h4>Amount Due</h4>
									<p>$130</p>
								</div>
							</div>
						</div>
						<div id="full">
							<div class="transaction">
								<p>$130</p>
								<p>Mini Cooper S</p>
								<p>Agence De constantine</p>
								<p>07 June 2022</p>
								<div class="more" onclick="show_details(this)"><p>Card 7938</p><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></div>
							</div>
							<div class="details">
								<div id="bill">
									<h4>Bill</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
								</div>
								<div id="info">
									<div id="field">
										<h4>Status</h4>
										<p>Completed</p>
									</div>
									<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
									</div>
									<div id="field">
										<h4>Payment ID</h4>
										<p>01231231</p>
									</div>
									<div id="field">
										<h4>Date Paid</h4>
										<p>07 June 2022</p>
									</div>
								</div>
								<div id="amount">
									<h4>Amount Due</h4>
									<p>$130</p>
								</div>
							</div>
						</div>
						<div id="full">
							<div class="transaction">
								<p>$130</p>
								<p>Mini Cooper S</p>
								<p>Agence De constantine</p>
								<p>07 June 2022</p>
								<div class="more" onclick="show_details(this)"><p>Card 7938</p><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></div>
							</div>
							<div class="details">
								<div id="bill">
									<h4>Bill</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
								</div>
								<div id="info">
									<div id="field">
										<h4>Status</h4>
										<p>Completed</p>
									</div>
									<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
									</div>
									<div id="field">
										<h4>Payment ID</h4>
										<p>01231231</p>
									</div>
									<div id="field">
										<h4>Date Paid</h4>
										<p>07 June 2022</p>
									</div>
								</div>
								<div id="amount">
									<h4>Amount Due</h4>
									<p>$130</p>
								</div>
							</div>
						</div>
						<div id="full">
							<div class="transaction">
								<p>$130</p>
								<p>Mini Cooper S</p>
								<p>Agence De constantine</p>
								<p>07 June 2022</p>
								<div class="more" onclick="show_details(this)"><p>Card 7938</p><img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg"></div>
							</div>
							<div class="details">
								<div id="bill">
									<h4>Bill</h4>
									<img src="${pageContext.request.contextPath}/assets/pdfFile.png">
								</div>
								<div id="info">
									<div id="field">
										<h4>Status</h4>
										<p>Completed</p>
									</div>
									<div id="field">
										<h4>Reservation Date</h4>
										<p>10 June 2022</p>
									</div>
									<div id="field">
										<h4>Payment ID</h4>
										<p>01231231</p>
									</div>
									<div id="field">
										<h4>Date Paid</h4>
										<p>07 June 2022</p>
									</div>
								</div>
								<div id="amount">
									<h4>Amount Due</h4>
									<p>$130</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
<script src="${pageContext.request.contextPath}/js/ClientPayment.js"></script>
</body>
</html>