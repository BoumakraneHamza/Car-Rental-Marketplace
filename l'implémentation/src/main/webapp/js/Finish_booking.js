const by_card = document.querySelector("#card_checkbox").querySelector("input");
const by_cash = document.querySelector("#cash_checkbox").querySelector("input");
const card_form = document.querySelector("#card_info");
const cash_form = document.querySelector("#cash_info");
console.log(by_card);
console.log(by_cash);

function PayBy_card(){
	if(by_card.checked){
		cash_form.style.display="none";
		card_form.style.display="block";
		if(by_cash.checked){
			by_cash.click();
		}
	}else{
		card_form.style.display="none";
	}
}
function PayBy_cash(){
	if(by_cash.checked){
		cash_form.style.display="flex";
		card_form.style.display="none";
		if(by_card.checked){
			by_card.click();
		}
	}else{
		cash_form.style.display="none";
	}
}