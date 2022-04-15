<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addCard.css">
<title>Add Card</title>
</head>
<body>
<div class="wrapper">
	<div class="add_card_form">
	<div class="card_form" style="background-image:url(https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/25.jpeg);">
		<div class="card_info_wrapper">
			<div class="card-item__top">
				<img src="https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/chip.png" class="card-item__chip">
			 <div class="card-item__type">
			 	<img src="https://raw.githubusercontent.com/muhammederdem/credit-card-form/master/src/assets/images/visa.png" alt="" class="card-item__typeImg">
			 </div>
			</div>
			<div class="card-number">
				<span>Card Number</span>
				<span>#### #### #### ####</span>
			</div>
			<div class="card_item_bottom">
				<div id="card_holder">
					<p>card holder</p>
					<p id="full_name">FULL Name</p>
				</div>
				<div id="Expiry_date">
					<p>Expiry date</p>
					<p id="expiry_date">MM/YY</p>
				</div>
			</div>
		</div>
	</div>
	<div class="inner_card_form">
		<form action="" method="">
			<div class="card-input">
			<label for="cardNumber" class="card-input__label">Card Number</label> 
			<input type="text" id="cardNumber" maxlength="16" autocomplete="off" class="card-input__input">
		</div>
		<div class="card-input">
			<label for="cardName" class="card-input__label">Card Holders</label>
			<input type="text" id="cardName" data-ref="cardName" autocomplete="off" class="card-input__input">
		</div>
		<div class="card-form__row">
		<div class="card-form__col">
		<div class="card-form__group">
		<label for="cardMonth" class="card-input__label">Expiration Date</label>
		<select id="cardMonth" data-ref="cardDate" class="card-input__input -select">
		<option value="" disabled="disabled" selected="selected">Month</option>
			 <option value="01">
                    01
                </option><option value="02">
                    02
                </option><option value="03">
                    03
                </option><option value="04">
                    04
                </option><option value="05">
                    05
                </option><option value="06">
                    06
                </option><option value="07">
                    07
                </option><option value="08">
                    08
                </option><option value="09">
                    09
                </option><option value="10">
                    10
                </option><option value="11">
                    11
                </option><option value="12">
                    12
                </option></select> 
                <select id="cardYear" data-ref="cardDate" class="card-input__input -select">
                <option value="" disabled="disabled" selected="selected">Year</option>
                <option value="2022">
                    2022
                </option><option value="2023">
                    2023
                </option><option value="2024">
                    2024
                </option><option value="2025">
                    2025
                </option><option value="2026">
                    2026
                </option><option value="2027">
                    2027
                </option><option value="2028">
                    2028
                </option><option value="2029">
                    2029
                </option><option value="2030">
                    2030
                </option><option value="2031">
                    2031
                </option><option value="2032">
                    2032
                </option><option value="2033">
                    2033
                </option>
                </select>
                </div>
                </div>
                 <div class="card-form__col -cvv">
                 <div class="card-input">
                 <label for="cardCvv" class="card-input__label">CVV</label>
                  <input type="text" id="cardCvv" maxlength="4" autocomplete="off" class="card-input__input">
                  </div>
                  </div>
                  </div>
                  <div class="card-cta">
                  	<input id="cancel" type="Button" value="Cancel">
                  	<input id="save" type="submit" value="save">
                  </div>
		</form>
	</div>
</div>
</div>
<script src="${pageContext.request.contextPath}/js/addCard.js"></script>
</body>
</html>