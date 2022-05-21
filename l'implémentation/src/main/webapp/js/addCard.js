const backg = document.querySelector(".wrapper");
const ctaCard = document.querySelector(".card-cta");
const cancelCard = ctaCard.querySelector("#cancel");

cancelCard.addEventListener("click",function(){
	backg.style.display="none";
});
const ccv = document.querySelector(".add_card_form").querySelector("#cardCvv");
const card_number = document.querySelector(".add_card_form").querySelector("#cardNumber");
ccv.addEventListener("input",()=>{
	if (ccv.value.length > 4){
		ccv.value = ccv.value.slice(0, 4);
	}
});
card_number.addEventListener("input",()=>{
	if (card_number.value.length > 16){
			card_number.value = card_number.value.slice(0, 16); 
	}
});