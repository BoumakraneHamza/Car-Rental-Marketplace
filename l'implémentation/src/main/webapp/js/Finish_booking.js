let i = 1;
let card_number = document.querySelector("#card_number");
let ccv = document.querySelector(".ccv");
let ClientName = document.querySelector("#holder_card");
ClientName.addEventListener("input",()=>{
	if(isNaN(ClientName.value.slice(ClientName.value.length-1, ClientName.value.length))==false){
		ClientName.value = ClientName.value.substring(0,ClientName.value.length-1);
	}
});
ccv.addEventListener("input",()=>{
	if(isNaN(ccv.value.slice(ccv.value.length-1, 4))==false){
		if (ccv.value.length > 4){
			ccv.value = ccv.value.slice(0, 4);
		}
	}else{
		ccv.value = ccv.value.substring(0,ccv.value.length-1);
	}
});
card_number.addEventListener("input",()=>{
	console.log(card_number.value.slice(card_number.value.length-1, 25));
	console.log(i);
	if(isNaN(card_number.value.slice(card_number.value.length-1, 25))==false){
		if (card_number.value.length > 25){
			card_number.value = card_number.value.slice(0, 25);
		}else if (i == 4){
			card_number.value = card_number.value + ' - ',
			i=1;
		}else{
			i++;
		} 
	}else{
		card_number.value = card_number.value.substring(0,card_number.value.length-1);
	}
});
function selectTab(element){
	let tabs = document.querySelector("#tabs").querySelectorAll(".tab");
	tabs.forEach((tab)=>{
		if(tab.classList.contains("active")){
			tab.classList.remove("active");
		}
	});
	element.classList.toggle("active");
	if(element.innerHTML == "Pay Now"){
		document.querySelector(".tabs_content").querySelector(".pay_info_form").style.visibility="visible";
		document.querySelector(".tabs_content").querySelector("#createMeeting").style.visibility="hidden";
	}else{
		document.querySelector(".tabs_content").querySelector(".pay_info_form").style.visibility="hidden";
		document.querySelector(".tabs_content").querySelector("#createMeeting").style.visibility="visible";
	}
}