<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bills</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientPayment.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ClientMain.css">
</head>
<body>
<div class="header">
		<div id="logo">
			<a href="${pageContext.request.contextPath}/PageAcueil"><img src="${pageContext.request.contextPath}/assets/logoBlack.svg"></a>
		</div>
		<div class="user">
		<img id="notification" src="${pageContext.request.contextPath}/assets/notification.svg">
		<img src="${pageContext.request.contextPath}${user.image}">
			<div id="user-info">
				<p id="full-name">${user.nom} ${user.prenom}</p>
				<p id="user-name">${user.user_name}</p>
			</div>
			<div id="dropdownlist">
				<img src="${pageContext.request.contextPath}/assets/angle-down-solid.svg">
			</div>
			
		</div>
	</div>
<div class="content">
		<div class="menu">
			<button class="search"><a href="${pageContext.request.contextPath}/CarSearch"><img src="${pageContext.request.contextPath}/assets/search-icon.svg"></a></button>
			<button class="dashboard"><a href="${pageContext.request.contextPath}/Dashboard"><img src="${pageContext.request.contextPath}/assets/dashboard-icon.svg"></a></button>
			<button class="inbox"><a href="${pageContext.request.contextPath}/Inbox"><img src="${pageContext.request.contextPath}/assets/inbox.svg"></a></button>
			<button class="payment" style="background: #F6AA1C;"><a href="${pageContext.request.contextPath}/ClientPayment"><img src="${pageContext.request.contextPath}/assets/Wallet-white.svg"></a></button>
			<button class="exit"><a href="${pageContext.request.contextPath}/Logout"><img src="${pageContext.request.contextPath}/assets/exit-icon.svg"></a></button>
		</div>
		<div class="main-frame">
			<div class="payment-content">
				<div id="payment_details">
					<div id="title"><h4>Payment details</h4></div>
					<div id="cards">
						<div id="card">
							<div id="ClientName">${user.getNom()} ${user.getPrenom()}</div>
							<div id="Card-Number">${card.getCardNumber()}</div>
							<div id="exp">${card.getExp()}</div>		
						</div>
						<div id="add-card">
							<button>Add Card</button>
						</div>
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